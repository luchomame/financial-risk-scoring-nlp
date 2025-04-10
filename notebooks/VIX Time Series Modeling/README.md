# VIX Time Series Modeling

## Description
This notebook coincides with the VIX Time Series Modeling section from the report.

## Steps to Install 
1. Install the requirements.txt in this subfolder. 

**Example:**
```python
pip install -r requirements.txt
```

2. Run `install_packages.r` to install required R packages.

## Steps to Run

### 0. Create the Database File
If the `.db` file is not provided, please run the `db_creation.ipynb` notebook to generate it.

### 1. Set Up Environment Variables
Create a `.env` file in the root directory with the following parameters:
- `DB_PATH`
- `DB_FILE`

**Example**

```
DB_PATH="C:\Users\lucho\OneDrive - Georgia Institute of Technology\Practicum"
DB_FILE="financial_news.db"
```

### 2. Install the R Kernel for Jupyter
Follow the installation guide to add R kernel support for Jupyter Notebooks:  
https://irkernel.github.io/installation/

### 3. Notebook Execution Order
Follow this order for replicating results or running the full analysis:

1. `vix_correlation.ipynb`
2. `vix_r.ipynb`
3. `vix_rolling.ipynb`
4. `vix_price_preds.ipynb`
5. `vix_price_preds_5_class.ipynb`
6. `vix_price_preds_7_class.ipynb`

