# Token Word Score and Sentiment Analysis

## Description
This notebook evaluates whether token-level sentiment scores from financial news headlines can predict market risk. The method involves identifying high-risk tokens, assigning sentiment-based weights, and constructing risk scores that are evaluated against stock price movements.

## Steps to Install

1. Install Python dependencies specific to this subfolder using the included `requirements.txt` file.

**Example:**
```bash
pip install -r requirements.txt
```
## Steps to Run

### 0. Create the Database File
If the `.db` file is not already available, first run the `db_creation.ipynb` notebook located in the main [`notebooks/DB_Creation`](https://github.gatech.edu/badams76/OMSAPracticum/tree/main/notebooks/DB_Creation) folder to generate the necessary SQLite database.

### 1. Set Up Environment Variables
Create a `.env` file in the root directory with the following parameters:
- `DB_PATH`
- `DB_FILE`

**Example**
```
DB_PATH="/path/to/your/project"
DB_FILE="financial_news.db"
```

### 2. Notebook Execution
Execute the following notebook:

- `token_word_score_w_sentiment.ipynb`

This notebook:
- Loads headline data from the database
- Tokenizes headlines and filters out stopwords
- Assigns sentiment polarity scores using FinBERT or custom dictionaries
- Constructs a token-weighted risk score
- Evaluates risk scores using regression and classification metrics against stock price movements

---

## Notes

- Make sure `nltk` and its tokenizers (`punkt`, `stopwords`) are downloaded.
- The notebook assumes a precomputed FinBERT sentiment dataset is available in the database.
- XGBoost and related ML packages are used for evaluation — ensure they are installed.
  
---