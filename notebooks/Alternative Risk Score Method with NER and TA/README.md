# Alternative Risk Score Method

## Description
This notebook coincides with the Alternative Risk Score Method section.

## Steps to Install 
1. Install the requirements.txt in this subfolder. 

**Example:**
```python
pip install -r requirements.txt
```

## Steps to Run

### 0. Create the Database File
If the `.db` file is not provided, please run the `db_creation.ipynb` notebook to generate it.

### 1. Set Up Environment Variables
Create a `.env` file in the root directory with the following parameters:
- `DB_PATH`
- `DB_FILE`
- 'VIX_FILE'

**Example**

```
DB_PATH="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum"
DB_FILE="financial_news.db"
VIX_FIlE="vixGaTechSP25.csv"
```

### 3. Notebook Execution Order
Follow this order for replicating results or running the full analysis:

1. Run `Alternative Method.ipynb`
2. CSV result file will be saved in local folder named: "result_data_words_stock_score.csv"


