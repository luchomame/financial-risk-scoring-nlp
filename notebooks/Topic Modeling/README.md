# Topic Modeling

## Description
This notebook explores the use of topic modeling to extract latent themes from financial news articles. The goal is to determine whether topic-based features improve the predictive performance of market risk models, compared to traditional sentiment-based features.

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
Execute the notebook in the following location:

- `topic_modeling.ipynb`

This notebook:
- Queries article and price movement data from the DuckDB database
- Applies BERTopic to extract dominant topics across articles
- Constructs topic-based feature vectors
- Trains regression models (e.g., XGBoost) to predict market risk indicators
- Evaluates predictive performance using metrics like MAE and R²

---

## Notes

- Ensure `nltk`, `spacy`, and `BERTopic` dependencies are installed prior to running the notebook.
- Some steps require downloading NLTK and spaCy resources (e.g., stopwords, language models).
- Execution time will vary depending on the number of articles and topic modeling configuration.

---
