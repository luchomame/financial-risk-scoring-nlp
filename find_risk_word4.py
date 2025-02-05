import duckdb
import pandas as pd
from collections import Counter
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import nltk

# Ensure stopwords and tokenizer are available
nltk.download('stopwords')
nltk.download('punkt')

# Database connection
db_file_path = r'C:\Users\hilun\OneDrive\Desktop\OMS\Practitam\financial_news.db'
conn = duckdb.connect(database=db_file_path, read_only=False)

# Step 1: Retrieve List of All Tickers in the Dataset
tickers_query = """
    SELECT DISTINCT ticker FROM "Headlines"."Market_Data_Daily_Processing";
"""
tickers_df = conn.execute(tickers_query).fetchdf()
tickers = tickers_df['ticker'].tolist()  # Convert to list
print(f"Processing {len(tickers)} tickers: {tickers}")

# Load pre-identified valid words from CSV file
csv_file_path = r'C:\Users\hilun\OneDrive\Desktop\OMS\Practitam\Negative_words.csv'
valid_words_df = pd.read_csv(csv_file_path)  # CSV has a single column with words
valid_words_set = set(valid_words_df.iloc[:, 0].str.lower())  # Convert to set for fast lookup

# Define stopwords
stop_words = set(stopwords.words('english'))

# Initialize Counter to store total word frequencies for all tickers
total_word_counts = Counter()

# Step 2: Iterate Over Each Ticker
for ticker in tickers:
    print(f"Processing {ticker}...")

    # Step 3: Identify Trading Dates with 5%+ Drop for the Current Ticker
    drop_dates_query = f"""
        WITH price_changes AS (
            SELECT trading_day_date, ticker, price, 
                   LAG(price) OVER (PARTITION BY ticker ORDER BY trading_day_date) AS prev_price,
                   ((price - LAG(price) OVER (PARTITION BY ticker ORDER BY trading_day_date)) / 
                    LAG(price) OVER (PARTITION BY ticker ORDER BY trading_day_date)) * 100 AS price_change_percentage
            FROM "Headlines"."Market_Data_Daily_Processing"
            WHERE ticker = '{ticker}'
        )
        SELECT trading_day_date FROM price_changes
        WHERE price_change_percentage <= -5;
    """
    
    # Execute query and get drop dates
    drop_dates_df = conn.execute(drop_dates_query).fetchdf()
    drop_dates = drop_dates_df['trading_day_date'].astype(str).tolist()

    if not drop_dates:
        print(f"No significant drop dates found for {ticker}. Skipping...")
        continue  # Skip to the next ticker if no drop dates are found

    print(f"Drop dates for {ticker}: {drop_dates}")

    # Step 4: Iterate Over Each Drop Date and Aggregate Word Frequencies
    for drop_date in drop_dates:
        print(f"Processing news for {ticker} on {drop_date}...")

        # Fetch relevant articles for the drop date
        news_query = f"""
            SELECT description, article_title
            FROM "Headlines"."Articles_Trading_Day"
            WHERE mapped_trading_date = '{drop_date}'
            AND ticker = '{ticker}';
        """
        news_df = conn.execute(news_query).fetchdf()

        if news_df.empty:
            print(f"No news found for {ticker} on {drop_date}. Skipping...")
            continue

        # Combine all text fields
        all_text = " ".join(news_df['description'].astype(str) + " " + news_df['article_title'].astype(str))

        # Tokenize words
        words = word_tokenize(all_text.lower())  # Convert to lowercase and tokenize

        # Remove non-alphabetic tokens and short words (e.g., single letters)
        words = [word for word in words if word.isalpha() and len(word) > 2]

        # Filter words: Remove stopwords & keep only valid words from CSV
        filtered_words = [word for word in words if word not in stop_words and word in valid_words_set]

        # Count word frequency and update the total counter
        total_word_counts.update(filtered_words)

# Close the database connection
conn.close()

# Convert total word frequency to a DataFrame
word_freq_df = pd.DataFrame(total_word_counts.items(), columns=["Word", "Frequency"])
word_freq_df = word_freq_df.sort_values(by="Frequency", ascending=False)


#word_freq_df.to_csv("all_tickers_drop_days_word_frequency.csv", index=False)


