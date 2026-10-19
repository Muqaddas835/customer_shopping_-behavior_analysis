# Customer Shopping Behavior Analysis

An end-to-end data analysis project exploring customer shopping behavior using **Python, Pandas, MySQL, and Microsoft Power BI**. The project combines exploratory data analysis, data preparation, SQL-based business questions, and dashboard visualization.

## Project Overview

This project examines a customer shopping dataset to explore purchasing patterns and business-related questions. The Python notebook focuses on understanding and preparing the data, while the SQL script investigates revenue, discounts, shipping preferences, subscriptions, repeat purchases, and product rankings. A Power BI dashboard is included to present the analysis visually.

## Tools & Technologies

- **Python** — data analysis and preparation
- **Pandas** — data profiling, cleaning, and feature engineering
- **Jupyter Notebook** — interactive analysis workflow
- **MySQL / SQL** — business-question analysis and aggregations
- **Microsoft Power BI** — dashboard visualization

## Dataset

The notebook initially inspected **3,900 records and 18 columns**. The dataset includes customer demographics, purchased items, product categories, purchase amounts, review ratings, subscription status, shipping type, discounts, previous purchases, payment methods, and purchase frequency.

The notebook references a source CSV named `customer_shopping_behavior.csv`. If you run the notebook, make sure this file is available locally and update the file path if necessary. Only share the dataset publicly if you have permission to distribute it.

## Project Workflow

### 1. Exploratory Data Analysis & Data Preparation

- Performed **data profiling** using dataset dimensions, data types, and descriptive statistics.
- Conducted a **data quality assessment** by checking missing values and duplicate records.
- Identified **37 missing values** in `Review Rating`; the notebook uses category-based median replacement.
- Created four age groups using **quantile-based segmentation** with `pd.qcut`.
- Applied **feature engineering** by mapping purchase-frequency categories to approximate day intervals.
- Checked whether `Discount Applied` and `Promo Code Used` contained matching values, then removed `Promo Code Used`.
- Explored correlations among numeric variables.
- Exported the prepared dataset to CSV.

### 2. SQL Business Analysis

The SQL script contains queries or query drafts for exploring these business questions:

- **Revenue aggregation by gender**
- **Discount-user analysis** for purchases at or above the overall average purchase amount
- **Shipping comparison** of average purchase amount for Standard and Express shipping
- **Subscriber vs. non-subscriber analysis** using customer counts, average spending, and total revenue
- **Product-level discount-rate analysis**
- **Rule-based customer segmentation** into New, Returning, and Loyal customers
- **Within-category product ranking** using `ROW_NUMBER()`
- **Repeat-purchase analysis** for customers with more than five previous purchases
- **Revenue distribution by age group**

Some questions are present only as comments rather than completed executable queries. In particular, the supplied SQL script does not implement the question about the top five products by average review rating. Query outputs were not supplied, so this README describes the analysis performed or planned rather than claiming numerical findings.

## Power BI Dashboard

An interactive dashboard was created in Microsoft Power BI to complement the customer shopping behavior analysis and present the analysis visually.

- **Tool:** Microsoft Power BI
- **File:** [`customer_behaviour_dashboard.pbix`](dashboard/customer_behaviour_dashboard.pbix)
- **Purpose:** Visualize customer shopping behavior and support exploration of the project’s business questions.

### How to View the Dashboard

1. Open the `dashboard/` folder in this repository.
2. Download `customer_behaviour_dashboard.pbix`.
3. Open the file in **Power BI Desktop**.

## Key SQL Concepts

- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
- Grouping and sorting: `GROUP BY`, `ORDER BY`
- Conditional filtering: `WHERE`
- Scalar subqueries
- Conditional logic: `CASE WHEN`
- Common Table Expressions (CTEs)
- Window functions: `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`

## Data Quality & Validation Notes

- **Review-rating imputation:** The current notebook assigns the category median to every `Review Rating` row, rather than filling only missing rows. For a more reliable result, change the operation to fill only missing ratings, then rerun the notebook.
- **Discount and promo fields:** The notebook's equality check returned `True`. Validate this relationship on the full dataset before treating the fields as redundant.
- **Age-group labels:** The current notebook includes spelling errors in labels such as `middle agged` and `scenior`; correct these before publishing final results.
- **Purchase-frequency intervals:** The mapped day values are approximations: Weekly = 7, Bi-Weekly/Fortnightly = 14, Monthly = 30, Quarterly/Every 3 Months = 90, and Annually = 365.
- **Discount capitalization:** The SQL script uses both `'yes'` and `'Yes'`. Check the stored values and MySQL collation behavior.
- **Customer segments:** The SQL script uses project-defined thresholds: one previous purchase = New, 2–10 = Returning, and other values = Loyal. These are assumptions for this analysis, not universal definitions.
- **Business findings:** Add numerical results and conclusions only after running the SQL queries and validating the outputs.

## Repository Structure

```text
customer_shopping_behavior_analysis/
├── README.md
├── notebooks/
│   └── shopping_eda.ipynb
├── sql/
│   └── shopping_analysis.sql
├── dashboard/
│   └── customer_behaviour_dashboard.pbix
└── docs/
    ├── notebook_summary.md
    ├── sql_summary.md
    └── linkedin_post.md
```

## How to Run

### Python Notebook

1. Install Python and Jupyter, or use VS Code with the Jupyter extension.
2. Install Pandas:

   ```bash
   python -m pip install pandas
   ```

3. Make sure `customer_shopping_behavior.csv` is available locally.
4. Open `notebooks/shopping_eda.ipynb`.
5. Update the CSV input/output paths if needed, then run the notebook cells in order.

### MySQL Queries

1. Import the dataset into MySQL and select the correct database.
2. Confirm that the table name (for example, `shopping_data`) and column names match those used in the SQL script.
3. Open `sql/shopping_analysis.sql` in MySQL Workbench.
4. Run the queries and review the results before drawing business conclusions.

## Future Improvements

- Fix review-rating imputation so existing ratings are preserved.
- Correct age-group label spelling.
- Standardize discount-value capitalization in SQL.
- Complete the query for the top five products by average review rating.
- Return five products in the discount-rate query if following the original question.
- Add validated query results and concise business insights.
