### Relationships Between Tables in Your Financial News Database

---

### **1. Articles and Articles Trading Day**
- **Tables:** `Articles`, `Articles_Trading_Day`
- **Common Key:** `guid`, `ticker`
- **Description:** 
  - The `Articles` table stores general information about news articles, while `Articles_Trading_Day` links articles to specific trading days.
  - `Articles_Trading_Day` includes an additional column `mapped_trading_date`, which aligns articles with trading days.

**Relationship:**  
One **article (`guid`)** can be associated with **one trading day (`mapped_trading_date`)** in `Articles_Trading_Day`.

---

### **2. Articles & Company Information**
- **Tables:** `Articles`, `Company_Info_News`
- **Common Key:** `ticker`
- **Description:**
  - `Company_Info_News` stores information about companies, including their name and subindustry.
  - `Articles` contains articles related to companies.

**Relationship:**  
One **company (`ticker`)** can have **many articles** in `Articles`.

---

### **3. Trading Calendar & Market Data**
- **Tables:** `Trading_Calendar`, `Market_Data_Daily_Processing`, `Market_Data_Headlines`
- **Common Key:** `trading_date` (or `trading_day_date`)
- **Description:**
  - `Trading_Calendar` stores valid trading days.
  - `Market_Data_Daily_Processing` and `Market_Data_Headlines` contain stock prices and trading volumes for each trading day.

**Relationship:**  
One **trading day (`trading_date`)** can have **multiple price & volume records** in `Market_Data_Daily_Processing` and `Market_Data_Headlines`.

---

### **4. Pricing and Volume Data**
- **Tables:** `Pricing_News`, `Volume_News`, `Market_Data_Daily_Processing`
- **Common Key:** `trading_day_date`, `ticker`
- **Description:**
  - `Pricing_News` records stock prices.
  - `Volume_News` contains trading volume data.
  - `Market_Data_Daily_Processing` holds both price and volume.

**Relationship:**  
One **stock (`ticker`) on a given trading day (`trading_day_date`)** has **one price and volume record**.

---

### **5. Market Summary and Headlines**
- **Tables:** `Market_Article_Summary`, `Market_Data_Headlines`
- **Common Key:** `trading_date`
- **Description:**
  - `Market_Article_Summary` summarizes the number of articles per trading day.
  - `Market_Data_Headlines` tracks the number of headlines associated with each ticker.

**Relationship:**  
One **trading day (`trading_date`)** can have **many headlines** across different tickers.

---

### **6. SEC Filings and Company Data**
- **Tables:** `SEC_Item_Filings`, `item1`, `item1a`, `item7`, `Company_Info`
- **Common Key:** `cik`, `filing_ts`
- **Description:**
  - `SEC_Item_Filings` contains details of company filings (10-K, 10-Q, etc.).
  - `item1`, `item1a`, and `item7` store sections from SEC filings.

**Relationship:**  
One **company (`cik`)** can have **many filings**, and each filing has multiple sections (`item1`, `item1a`, `item7`).

---

### **7. S&P 500 Weekly Data**
- **Tables:** `Price_Weekly_SP500`, `Market_Data_CIK`, `Weekly_Market_Data`
- **Common Key:** `trading_week_date`
- **Description:**
  - `Price_Weekly_SP500` contains S&P 500 index data.
  - `Market_Data_CIK` and `Weekly_Market_Data` provide company-specific weekly data.

**Relationship:**  
One **week (`trading_week_date`)** has **market-wide and company-specific price data**.

---

### **Summary of Key Relationships**
| Table 1                     | Table 2                     | Key(s)        | Relationship Type |
|-----------------------------|-----------------------------|---------------|------------------|
| `Articles`                  | `Articles_Trading_Day`      | `guid`, `ticker` | One-to-One |
| `Articles`                  | `Company_Info_News`         | `ticker`      | One-to-Many |
| `Trading_Calendar`          | `Market_Data_Daily_Processing` | `trading_date` | One-to-Many |
| `Pricing_News`              | `Market_Data_Daily_Processing` | `trading_day_date`, `ticker` | One-to-One |
| `Market_Article_Summary`    | `Market_Data_Headlines`     | `trading_date` | One-to-Many |
| `SEC_Item_Filings`          | `item1`, `item1a`, `item7`  | `cik`, `filing_ts` | One-to-Many |
| `Price_Weekly_SP500`        | `Weekly_Market_Data`        | `trading_week_date` | One-to-One |