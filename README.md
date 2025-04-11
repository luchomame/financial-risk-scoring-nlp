# OMSAPracticum - NDR Investment Sentiment

---

## Project Overview

In collaboration with Ned Davis Research (NDR), this project examines the feasibility of forecasting financial market risk through sentiment-based modeling of unstructured textual data. By aggregating sentiment signals derived from financial news articles and SEC filings using advanced Natural Language Processing (NLP) techniques, we aim to construct a data-driven Risk Score for the S&P 500 index and its historical constituents. The study incorporates multiple methodological pipelines, including token-level sentiment weighting, topic modeling using BERTopic, and market volatility forecasting via VIX regression and classification models. This work contributes to the broader field of financial NLP by evaluating the predictive value of linguistically extracted features in anticipating market inflection points.

### Background and Motivation

Investment sentiment, often associated with behavioral finance, reflects the attitude and pulse of the human investor. This sentiment can be influenced by external factors like news articles, which are believed to hold valuable predictive insights into market trends. By analyzing high-risk words (e.g., "bankrupt," "lawsuit") in news headlines and SEC filings, this project seeks to measure market sentiment and its relationship to financial health and volatility.

---

### 🧭 Project Objectives

1. **Develop a Composite Risk Score**  
   - Design a risk prediction metric using aggregated sentiment signals derived from SEC 10-K filings and financial news headlines.  
   - Incorporate **token-level weighting**, **sentiment polarity**, and **contextual risk factors** to improve score granularity.

2. **Integrate Textual and Quantitative Signals**  
   - Merge NLP-derived features with historical pricing and volatility data (daily and weekly) for supervised learning.  
   - Evaluate correlations between sentiment dynamics and market movements using both regression and classification approaches.

3. **Experiment with Multi-Modal Predictive Models**  
   - Compare traditional sentiment-based features with **topic modeling (e.g., BERTopic)** and **volatility forecasting (VIX-based models)**.  
   - Assess model performance across various time horizons and asset types.

---

### 📊 Data Overview

This project integrates a rich set of financial and textual datasets spanning the S&P 500 and broader U.S. equities:

- **SEC Filings**  
  - Historical 10-K filings (Item 1 and 1A) for fundamental business and risk disclosures.
  - Structured metadata linking filings to market cap, sector, and fiscal year.

- **Pricing and Volatility Data**  
  - Daily and weekly stock prices from 2000–2023.  
  - S&P 500 index pricing (cap-weighted and equal-weighted).  
  - VIX data for market volatility analysis.

- **Headline News Corpus**  
  - Company-specific headlines mapped to tickers and timeframes.  
  - Pre-processed for entity recognition, tokenization, and sentiment scoring.

---

### 📦 Project Deliverables

1. A modular codebase for extracting and analyzing textual risk signals from financial documents and headlines.  
2. A comprehensive **Risk Score** integrating sentiment, topic, and price-based indicators.  
3. Comparative analysis of different modeling pipelines (e.g., FinBERT, token score regression, BERTopic, VIX forecasting).  
4. Visualizations of sentiment trends, volatility correlations, and model performance over time.  
5. Clean, reproducible notebooks and documentation for stakeholder and research use.

---

### 🛠️ Tools and Technologies

- **Languages & Libraries**: Python, Pandas, Scikit-learn, XGBoost, BERTopic, FinBERT, DuckDB  
- **Visualization**: Matplotlib, Seaborn, Plotly  
- **Data Management**: SQL, DuckDB, Pandas  
- **Version Control**: GitHub  
- **Compliance**: Work conducted under NDR NDA with strict data governance protocols.

---

Would you like me to patch this into your actual `README.md` file or prepare a Markdown version for you to copy in manually?

### Compliance and Key Contacts

To ensure compliance, all participants are required to:
- Sign a Non-Disclosure Agreement (NDA).
- Use NDR-provided communication channels for project-related correspondence.
  
Primary Contact: [Kiersten Engel](mailto:Kiersten.engel@ndr.com)

For a detailed project description, refer to the [Kick-Off Presentation PDF](https://github.gatech.edu/badams76/OMSAPracticum/blob/main/Ga%20Tech%20Spring%2025%20Kick%20Off.pdf).

---

### 📦 Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.gatech.edu/badams76/OMSAPracticum.git
cd OMSAPracticum
```

2. **Create a virtual environment (recommended)**

```bash
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. **Install the required dependencies**

```bash
pip install -r requirements.txt
```

---

### 🗃️ Create the Database

Follow the instructions listed [here](https://github.gatech.edu/badams76/OMSAPracticum/tree/main/notebooks/DB_Creation) that initializes and populates the database:

Make sure the relevant data files are available as expected by the notebook.

---

### 📂 Notebook Modules Overview

This repository is organized into modular subfolders, each representing a key modeling approach. Below is a summary of each module along with its individual `README` for execution details.

| Module | Description |
|--------|-------------|
| [VIX Time Series Modeling](https://github.gatech.edu/badams76/OMSAPracticum/tree/main/notebooks/VIX%20Time%20Series%20Modeling) | Forecasts market volatility using VIX time series data. Includes regression and classification models. |
| [Topic Modeling](https://github.gatech.edu/badams76/OMSAPracticum/tree/main/notebooks/Topic%20Modeling) | Applies BERTopic to extract themes from financial news and evaluate their predictive power for market movement. |
| [Token Word Score & Sentiment Analysis](https://github.gatech.edu/badams76/OMSAPracticum/tree/main/notebooks/Token%20Word%20Score%20and%20Sentiment%20Analysis) | Computes token-level risk scores using sentiment polarity of headline tokens to predict market direction. |
| [Alternative Risk Score with NER + TA](https://github.gatech.edu/badams76/OMSAPracticum/tree/main/notebooks/Alternative%20Risk%20Score%20Method%20with%20NER%20and%20TA) | Uses Named Entity Recognition and Technical Analysis (TA) features to construct an alternate risk scoring approach. |

Each folder contains:
- A notebook implementing the core method
- A `requirements.txt` file for dependencies
- A dedicated `README.md` with setup and execution instructions

---