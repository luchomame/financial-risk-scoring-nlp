# Thematic Clustering

## Description
This folder has the implementation for thematic clustering from the report.

The `.env` file has the default file names. It's not recommended to modify those, but the code uses the environment file names so in theory changing them could work.

The path variables in the `.env` are for you to fill in based on where you are storing the data. The original setup had the data in `/np`, `/csv`, and `/model` directories. However, you can add all of them to the same directory if you prefer.

The `.env` file should contain:

```env
## DEFAULT FILE NAMES
CLEANED_ARTICLES_FILENAME=articles_cleaned_spacy_with_numbers.csv
EMBEDDED_ARTICLES_FILENAME=word2vec_financial_news_400_4.npy
MODEL_FILENAME=word2vec_best_model_400_4
GROUPED_RISK_TAGS_CSV=articles_with_risk_tags_grouped.csv
ARTICLES_WITH_RISK_TAGS_CSV=articles_with_risk_tags.csv
LM_LEXICON_FILENAME=Loughran-McDonald_MasterDictionary_1993-2023.csv
STOCK_RISK_EXPOSURE_CSV=stock_risk_exposure.csv
HDBSCAN_SUBCLUSTER_LABELS=hdbscan_cluster_subcluster_labels_full.npy
HDBSCAN_RISK_TAGS=hdbscan_articles_with_risk_tags.csv
HDBSCAN_GROUPED_RISK_TAGS=hdbscan_articles_with_risk_tags_grouped.csv
EMBEDDED_FINBERT=finbert_embeddings.npy
CLUSTER_FINBERT=finbert_hdbscan_cluster_labels.npy
## DEFAULT FILE NAMES

MODEL_OUTPUT_PATH=
NP_OUTPUT_PATH=
CSV_OUTPUT_PATH=

DB_PATH=
DB_FILE="financial_news.db"
```

## Order of Implementation
1. `data_clearner.ipynb`
2. `word2vec_restart.ipynb`
3. DBSCAN
   - 3.1 `gpu_dbscan.ipynb`
   - 3.2 `tagging_clusters.ipynb`
4. HDBSCAN
   - 4.1 `hdbscan.ipynb`
   - 4.2 `tagging_clusters_hdbscan.ipynb`
5. `dbscan_vs_hdbscan.ipynb`
6. `bert_embedding.ipynb`
7. `hdbscan_finbert.ipynb`
8. `tagging_clusters_hdbscan_finbert.ipynb`

