# 🛒 Superstore Data Cleaning & Analysis

A complete **data analytics project** using the Superstore dataset, covering data cleaning with **Microsoft Excel Power Query** and business analysis using **Microsoft SQL Server**.

The project demonstrates an end-to-end data analysis workflow — from raw and inconsistent data to cleaned datasets, SQL-based analysis, and actionable business insights.

---

## 📌 Project Overview

The objective of this project is to analyze Superstore sales data and uncover insights related to:

* Sales and profitability
* Customers and orders
* Product categories and sub-categories
* Regional performance
* State-wise sales
* Discounts and their impact on profit
* Top-performing products and sub-categories

The project uses:

**Excel Power Query → Data Cleaning → SQL Server → Data Analysis → Business Insights**

---

## 🛠️ Tools & Technologies

| Tool                     | Purpose                                    |
| ------------------------ | ------------------------------------------ |
| **Microsoft Excel**      | Initial data inspection and transformation |
| **Power Query**          | Data cleaning and preprocessing            |
| **Microsoft SQL Server** | Data storage and analysis                  |
| **SQL**                  | Queries, views, aggregations and analysis  |
| **GitHub**               | Project documentation and version control  |

---

## 🔄 Project Workflow

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
SQL Analysis
        ↓
Views & Stored Procedures
        ↓
Business Insights
```

---

# 🧹 1. Data Cleaning Using Excel Power Query

The raw Superstore dataset contained inconsistencies that needed to be addressed before performing analysis.

### Cleaning & Transformation Steps

Using **Excel Power Query**, the following tasks were performed:

* Removed unnecessary columns
* Removed duplicate records
* Handled missing/null values
* Corrected inconsistent data types
* Cleaned text fields
* Standardized categorical values
* Converted date columns into appropriate date formats
* Checked numerical columns for invalid values
* Verified sales, profit and discount fields
* Prepared the final dataset for SQL Server import

### Example Data Quality Checks

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

The Superstore dataset was then loaded into the database.

---

# 📊 3. SQL Analysis

SQL was used to perform exploratory and business-oriented analysis on the cleaned dataset.

The analysis included:

### 📦 Overall Business Metrics

Calculated important KPIs such as:

* Total Orders
* Total Customers
* Total Products
* Total Sales
* Total Profit
* Average Order Value
* Average Discount

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

## 💰 Profitability Analysis

Profitability was analyzed across different product segments and sub-categories.

The analysis focused on identifying:

* Most profitable sub-categories
* Least profitable sub-categories
* Sales vs. profit performance
* Products generating losses
* Impact of discounts on profitability

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

# 🏷️ 4. Discount Analysis

Discount ranges were created to understand how different levels of discount affected sales and profitability.

Example discount bands:

```text
0% – 10%
10% – 20%
20% – 30%
30% – 40%
40%+
```

The analysis helps identify whether higher discounts are associated with lower profitability.

---

# 🌎 5. Regional Analysis

Sales and profitability were analyzed across different regions.

The project identifies:

* Best-performing regions
* Top sub-category by region
* Regional sales contribution
* Regional profitability

---

# 📍 6. State-Level Analysis

State-wise sales performance was analyzed to identify the states generating the highest sales.

Example analysis:

```sql
SELECT 
    State,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC;
```

This helps identify high-value geographic markets.

---

# 🏆 7. Top-Selling Sub-Categories

The project analyzes the highest-selling sub-categories across different regions.

The analysis helps answer questions such as:

* Which sub-category performs best in each region?
* Which products drive regional sales?
* Which regions have the strongest product demand?

---

# 👁️ SQL Views

SQL views were created to organize frequently used analysis results.

Examples include:

```text
Totals
Margin_By_Subcat
Discount_Range
TOP_SELLING_SUBCAT_BY_REGION
TOP_STATE_HIGHEST_SALES
```

These views make the analysis easier to reuse and maintain.

---

# ⚙️ Stored Procedure

A stored procedure was created to execute multiple analysis queries together.

Example structure:

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

The stored procedure provides a consolidated business report from the SQL analysis.

---

# 📈 Key Business Questions

The project attempts to answer the following questions:

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

The analysis can be used to identify:

* High-performing product categories
* Low-margin and loss-making products
* Strong geographic markets
* Potentially excessive discounting
* Regional product preferences
* Opportunities for improving profitability

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
    ├── power_query_cleaning.png
    └── sql_analysis.png
```

---

# 🚀 Skills Demonstrated

### Excel & Power Query

* Data Cleaning
* Data Transformation
* Data Type Management
* Duplicate Removal
* Missing Value Handling
* Date Transformation
* Data Preparation

### SQL Server

* Database Creation
* Table Management
* SELECT Statements
* Aggregate Functions
* `GROUP BY`
* `ORDER BY`
* `CASE`
* Subqueries
* Views
* Stored Procedures
* Business KPI Analysis

### Data Analytics

* Exploratory Data Analysis
* Profitability Analysis
* Sales Analysis
* Regional Analysis
* Customer Analysis
* Discount Analysis
* Business Insight Generation

---

# 🎯 Project Objective

The main objective of this project is to demonstrate an end-to-end **Data Analyst workflow**:

> **Clean → Transform → Store → Analyze → Generate Insights**

The project combines **Excel Power Query** for efficient data preparation with **Microsoft SQL Server** for structured business analysis.

---

# 👨‍💻 Author

**Yash Kumar**

Data Analyst | Excel | Power Query | SQL | Power BI | Python

---

⭐ If you find this project useful, feel free to explore the repository and provide feedback.
