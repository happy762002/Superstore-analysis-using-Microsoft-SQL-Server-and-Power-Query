# 🛒 Superstore Data Cleaning & Analysis

A complete **Data Analytics project** using the Superstore dataset, covering **data cleaning with Microsoft Excel Power Query** and **business analysis using Microsoft SQL Server**.

The project demonstrates an end-to-end data analysis workflow — from raw data cleaning and transformation to SQL-based exploratory analysis, reporting, and business insights.

---

## 📌 Project Overview

The objective of this project is to analyze Superstore sales data and uncover insights related to:

- 📦 Sales and profitability
- 👥 Customers and orders
- 🏷️ Product categories and sub-categories
- 🌎 Regional performance
- 📍 State-wise sales
- 🏷️ Discounts and their impact on profit
- 🏆 Top-performing products and sub-categories

### Project Workflow

**Excel → Power Query → Data Cleaning → SQL Server → SQL Analysis → Report**

---

# 📸 Project Screenshots

### 📊 Excel Dataset

<img width="500" alt="Excel Dataset" src="https://github.com/user-attachments/assets/4f117c95-6e21-43e9-9626-230f544eed75" />

### 🧹 Dataset in Power Query

<img width="500" alt="Power Query Data Cleaning" src="https://github.com/user-attachments/assets/93a853e6-d7f0-4969-a7ec-185bb8cd12ea" />

### 🗄️ Microsoft SQL Analysis

<img width="500" alt="Microsoft SQL Analysis" src="https://github.com/user-attachments/assets/525196e2-7fce-4059-846d-631135066404" />

### ⚙️ Creating Stored Procedure

<img width="500" alt="Creating Stored Procedure" src="https://github.com/user-attachments/assets/2f9571a1-6817-48f7-a887-9bbf9cd3cd36" />

### 📈 Final SQL Report

<img width="500" alt="Final SQL Report" src="https://github.com/user-attachments/assets/20a86cf9-c1ac-4509-b82c-fe055c60933e" />

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Initial data inspection and transformation |
| **Power Query** | Data cleaning and preprocessing |
| **Microsoft SQL Server** | Data storage and analysis |
| **SQL** | Queries, views, aggregations and reporting |
| **GitHub** | Project documentation and version control |

---

# 🔄 Project Workflow

```text
Raw Superstore Dataset
        ↓
Microsoft Excel
        ↓
Power Query
        ↓
Data Cleaning & Transformation
        ↓
Clean Dataset
        ↓
Microsoft SQL Server
        ↓
SQL Exploratory Data Analysis
        ↓
Views & Stored Procedure
        ↓
Final Business Report
```

---

# 🧹 1. Data Cleaning Using Excel Power Query

The raw Superstore dataset was cleaned and transformed using **Excel Power Query** before being imported into SQL Server.

### Cleaning & Transformation

- Removed unnecessary columns
- Removed duplicate records
- Handled missing/null values
- Corrected inconsistent data types
- Cleaned text fields
- Standardized categorical values
- Converted date columns into appropriate date formats
- Checked numerical columns for invalid values
- Verified Sales, Profit and Discount fields
- Prepared the final dataset for SQL Server

### Data Quality Checks

```text
✓ Duplicate records checked
✓ Missing values handled
✓ Date formats standardized
✓ Numerical data types corrected
✓ Text values cleaned
✓ Dataset prepared for SQL Server
```

---

# 🗄️ 2. Microsoft SQL Server

After completing the cleaning process, the transformed dataset was imported into **Microsoft SQL Server** for analysis.

A dedicated database was created:

```sql
CREATE DATABASE store_analysis;
```

The cleaned Superstore dataset was then loaded into the database.

---

# 📊 3. SQL Analysis

SQL was used to perform exploratory and business-oriented analysis on the cleaned dataset.

## 📦 Overall Business Metrics

The analysis calculates important KPIs such as:

- Total Orders
- Total Customers
- Total Products
- Total Sales
- Total Profit
- Average Order Value
- Average Discount

Example:

```sql
SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Product_ID) AS Total_Products,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore;
```

---

# 💰 4. Profitability Analysis

Profitability was analyzed across different product categories and sub-categories.

The analysis focuses on:

- Most profitable sub-categories
- Least profitable sub-categories
- Sales vs. profit performance
- Loss-making products
- Impact of discounts on profitability

Example:

```sql
SELECT 
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;
```

---

# 🏷️ 5. Discount Analysis

Discount ranges were created to understand the relationship between **discounting and profitability**.

Example discount bands:

```text
0% – 10%
10% – 20%
20% – 30%
30% – 40%
40%+
```

This analysis helps identify whether higher discount levels are associated with lower profitability.

---

# 🌎 6. Regional Analysis

Sales and profitability were analyzed across different regions.

The analysis identifies:

- Best-performing regions
- Top sub-category by region
- Regional sales contribution
- Regional profitability

---

# 📍 7. State-Level Analysis

State-wise sales performance was analyzed to identify the highest-performing markets.

Example:

```sql
SELECT 
    State,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC;
```

This analysis helps identify high-value geographic markets.

---

# 🏆 8. Top-Selling Sub-Categories

The project analyzes the highest-performing sub-categories across different regions.

Key questions include:

- Which sub-category performs best in each region?
- Which products drive regional sales?
- Which regions have the strongest product demand?

---

# 👁️ 9. SQL Views

SQL views were created to organize frequently used analysis results.

### Views Created

```text
Totals
Margin_By_Subcat
Discount_Range
TOP_SELLING_SUBCAT_BY_REGION
TOP_STATE_HIGHEST_SALES
```

These views make the analysis easier to reuse and maintain.

---

# ⚙️ 10. Stored Procedure

A stored procedure was created to execute multiple analysis queries together and generate a consolidated report.

```sql
CREATE PROCEDURE reports
AS
BEGIN

    SELECT * 
    FROM Totals;

    SELECT * 
    FROM Margin_By_Subcat
    ORDER BY Total_Profit DESC;

    SELECT * 
    FROM Discount_Range
    ORDER BY Discount_Band;

    SELECT * 
    FROM TOP_SELLING_SUBCAT_BY_REGION;

    SELECT * 
    FROM TOP_STATE_HIGHEST_SALES;

END;
```

The stored procedure provides a consolidated view of the key analysis results.

---

# 📈 Key Business Questions

This project attempts to answer:

1. How many orders and customers does the business have?
2. What are the total sales and total profit?
3. Which sub-categories generate the highest profit?
4. Which sub-categories generate the lowest profit?
5. How does discount affect profitability?
6. Which region generates the highest sales?
7. Which state has the highest sales?
8. What is the top-selling sub-category in each region?
9. Which areas of the business require improvement?
10. Where are opportunities for increasing profitability?

---

# 💡 Business Insights

The analysis helps identify:

- High-performing product categories
- Low-margin and loss-making products
- Strong geographic markets
- Potentially excessive discounting
- Regional product preferences
- Opportunities for improving profitability

These insights can support better decisions around **pricing, discounts, product strategy, and regional sales planning**.

---

# 📁 Project Structure

```text
Superstore-Data-Analysis/
│
├── README.md
│
├── data/
│   └── superstore_cleaned.xlsx
│
├── excel/
│   └── Superstore_Data_Cleaning.xlsx
│
├── sql/
│   ├── database_setup.sql
│   ├── data_analysis.sql
│   ├── views.sql
│   └── stored_procedure.sql
│
└── screenshots/
    ├── excel_dataset.png
    ├── power_query_cleaning.png
    ├── sql_analysis.png
    ├── stored_procedure.png
    └── final_report.png
```

---

# 🚀 Skills Demonstrated

### Excel & Power Query

- Data Cleaning
- Data Transformation
- Data Type Management
- Duplicate Removal
- Missing Value Handling
- Date Transformation
- Data Preparation

### SQL Server

- Database Creation
- Table Management
- Aggregate Functions
- `GROUP BY`
- `ORDER BY`
- `CASE`
- Subqueries
- Views
- Stored Procedures
- KPI Analysis

### Data Analytics

- Exploratory Data Analysis
- Profitability Analysis
- Sales Analysis
- Regional Analysis
- Customer Analysis
- Discount Analysis
- Business Insight Generation

---

# 🎯 Project Objective

The main objective of this project is to demonstrate an end-to-end **Data Analyst workflow**:

> **Clean → Transform → Store → Analyze → Generate Insights**

The project combines **Excel Power Query** for efficient data preparation with **Microsoft SQL Server** for structured business analysis and reporting.

---

# 👨‍💻 Author

**Yash Kumar**

**Data Analyst | Excel | Power Query | SQL | Power BI | Python**

---

⭐ If you find this project useful, feel free to explore the repository and provide feedback.
