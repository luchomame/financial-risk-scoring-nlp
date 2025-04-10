# DB Creation

## Description
This folder contains two notebooks that create the DuckDB file used throughout the project. It also includes a link to our OneDrive directory where the prebuilt database file is stored.

## Steps to Install 
1. Install the requirements.txt in this subfolder. 

**Example:**
```python
pip install -r requirements.txt
```

## Steps to Run

### 0. Create the Database File
If the `.db` file is not provided, please run the `db_creation.ipynb` notebook. Note that anything related to FinBERT and VIX will fail at this point.

### 1. Run Order
1. Run `db_creation.ipynb` to load the core items.
2. Run the notebooks inside the `Finbert_Sentiment` folder to generate CSVs needed for DB creation. The output paths must be added to your `.env`.
3. Run the notebooks in the `VIX Time Series Modeling` folder to generate additional CSVs required for DB creation.
4. Return to `db_creation.ipynb` and finish execution.
5. Run `new_data_db_Creation.ipynb` to generate the test schema.

### 2. Set Up Environment Variables
Create a `.env` file in the root directory with the following parameters:

- `DB_PATH` (absolute path to the database folder)
- `DB_FILE` (name of the DuckDB file)

- `company_txt_path`, `company_txt_file`
- `volume_news_path`, `volume_news_file`
- `pricing_news_path`, `pricing_news_file`
- `multicap_headlines`
- `headline_august24_path`

- `sp500_volume_weekly_path`
- `sp500_price_weekly_path`
- `sp500_price_daily_path`
- `sp500_company_path`
- `sp500_price_sp500_path`
- `sp500_item1_path`, `sp500_item1a_path`, `sp500_item7_path`

- `finbert_csv`, `finbert_10k_csv`, `finbert_all_tags`

- `vix_daily_res_path`, `vix_weekly_res_path`, `vix_daily_train_path`, `vix_weekly_train_path`

- `volume_news_path`, `volume_news_file`
- `pricing_news_path`, `pricing_news_file`
- `headline_jan25_path`
- `vix_path`, `vix_file`

### Example `.env` File
```
DB_PATH="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum"
DB_FILE="financial_news.db"

## HEADLINE TRAINING DATA ##
company_txt_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\MultiCap_News"
company_txt_file="company_info_news.txt"
volume_news_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\Headlines_Data"
volume_news_file="volume.csv"
pricing_news_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\Headlines_Data"
pricing_news_file="pricing.csv"
multicap_headlines="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\MultiCap_News\HEADLINES"
headline_august24_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\HEADLINES_August24"

## SP500 TRAINING DATA ##
sp500_volume_weekly_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\volume.csv"
sp500_price_weekly_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\price.csv"
sp500_price_daily_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\price_daily.csv"
sp500_company_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\company_info_sp500.txt"
sp500_price_sp500_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\price_SP500.csv"
sp500_item1_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\sp500_item1_sec_filings_0.txt"
sp500_item1a_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\sp500_item1a_sec_filings_0.txt"
sp500_item7_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\SP500\sp500_item7_sec_filings_0.txt"

## FINBERT ##
finbert_csv="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\articles_with_all_finbert_scores.csv"
finbert_10k_csv="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\sp500_with_all_finbert_scores.csv"
finbert_all_tags="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\articles_with_finbert_scores.csv"

## VIX TRAINING ##
vix_daily_res_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\daily_results.csv"
vix_weekly_res_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\weekly_results.csv"
vix_daily_train_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\daily_train_df.csv"
vix_weekly_train_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\weekly_train_df.csv"

## TEST DATA ##
volume_news_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\new_data"
volume_news_file="volume_Jan25.csv"
pricing_news_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\new_data"
pricing_news_file="pricing_Jan25.csv"
headline_jan25_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\new_data\HEADLINES_Jan25"

vix_path="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum\new_data"
vix_file="vixGaTechSP25.csv"
```

