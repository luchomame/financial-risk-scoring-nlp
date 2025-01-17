# OMSAPracticum - NDR Investment Sentiment

---

## Project Overview

This project, conducted in collaboration with **Ned Davis Research (NDR)**, explores the predictive power of aggregated sentiment indicators derived from financial data and SEC filings to identify potential market inflection points. By leveraging **Natural Language Processing (NLP)** and financial analytics, we aim to create a comprehensive "Risk Score" for the S&P 500 index and its historical constituents.

### Background and Motivation

Investment sentiment, often associated with behavioral finance, reflects the attitude and pulse of the human investor. This sentiment can be influenced by external factors like news articles, which are believed to hold valuable predictive insights into market trends. By analyzing high-risk words (e.g., "bankrupt," "lawsuit") in news headlines and SEC filings, this project seeks to measure market sentiment and its relationship to financial health and volatility.

### Project Objectives

1. **Create a Risk Score**:
   - Aggregate high-risk word occurrences across news headlines and SEC filings (10-K, Items 1 and 1A).
   - Identify and evaluate predictive signals for potential market movements.

2. **Integrate Financial Data**:
   - Combine textual data with historical pricing information (weekly and daily) to assess sentiment impact.

3. **Deliver a Scalable Framework**:
   - Provide a replicable methodology to evaluate market sentiment across various indices.

### Data Overview

The project utilizes multiple datasets covering the S&P 500 and a broader U.S. multi-cap universe, including:

- **SEC Filings**:
  - Item 1 and Item 1A from 10-K filings.
  - Historical company data files with detailed business and risk disclosures.

- **Pricing Data**:
  - Weekly and daily pricing data for S&P 500 constituents from 2000 to April 2023.
  - Cap-weighted and equal-weighted index pricing.

- **Headlines Data**:
  - News headlines spanning multiple years, categorized by company ticker.

### Project Deliverables

1. Develop a methodology to process and analyze SEC filings and news headlines.
2. Generate a comprehensive Risk Score based on textual and financial data.
3. Visualize key insights and trends across time and indices.
4. Provide clear documentation and reproducible results for stakeholders.

### Tools and Technologies

- **Programming and Analysis**: Python, NLP libraries, financial data analysis packages.
- **Version Control**: GitHub integration for collaborative development.
- **Compliance Requirements**: Students must sign NDAs and follow NDR's strict data handling policies.

### Compliance and Key Contacts

To ensure compliance, all participants are required to:
- Sign a Non-Disclosure Agreement (NDA).
- Use NDR-provided communication channels for project-related correspondence.
  
Primary Contact: [Kiersten Engel](mailto:Kiersten.engel@ndr.com)

For a detailed project description, refer to the [Kick-Off Presentation PDF](https://github.com/PandaPool85/OMSAPracticum/blob/main/Ga%20Tech%20Spring%2025%20Kick%20Off.pdf)).

---

# Managing Changes in Colab with GitHub

## Step 1: Clone Your GitHub Repository
Use the following command to clone your repository. Replace `<your_token>` with your GitHub personal access token (PAT):

```bash
!git clone https://<your_token>@github.com/PandaPool85/OMSAPracticum.git
```
---

## Step 2: Navigate to the Repository Directory
After cloning, navigate to the repository directory:
```bash
%cd /drive/MyDrive/<repository_name>
```
---

## Step 3: Configure Git User Information
Set your username and email for Git (only needs to be done once):
```bash
!git config --global user.name "Your Name"
!git config --global user.email "your_email@example.com"
```

---

## Step 4: Make Changes and Save Files
Make changes/edits in Colab or upload your updated files to the repository folder.

---

## Step 5: Stage Changes
Stage the changes you made:
```bash
!git add .
```

---

## Step 6: Commit Changes
Commit your changes with a message:
```bash
!git commit -m "Your commit message"
```

---

## Step 7: Push Changes to GitHub
Push your changes back to the repository:
```bash
!git push origin main
```
---
_*NOTE: you need a personal access token due to this repo being private, here is how to get one._

## Generating a GitHub Personal Access Token (PAT)

1. Go to [GitHub Developer Settings](https://github.com/settings/tokens).
2. Click **Generate new token**.
3. Select the appropriate **Scopes**:
   - `repo` (for full repository control).
4. Set an expiration date for the token (optional).
5. Click **Generate token** and copy the token. 

### Important:
Store your token securely as it will not be shown again. Use this token in place of your password for Git operations.

---

Follow these steps to manage your changes in Colab with your GitHub repository efficiently!
