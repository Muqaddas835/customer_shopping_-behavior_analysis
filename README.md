# Customer Shopping Behavior Analysis

An end-to-end data analysis project exploring customer shopping behavior with **Python (Pandas), MySQL, and a dashboard**.

## Project Overview

This project uses a customer shopping dataset to practice exploratory data analysis, feature engineering, and SQL-based business analysis. The Python notebook focuses on understanding and preparing the data, while the SQL script explores business questions related to revenue, discounts, shipping, subscriptions, repeat purchases, and product rankings.

## Tools & Technologies

- **Python**
- **Pandas**
- **Jupyter Notebook**
- **MySQL**
- **SQL**
- **Power BI / Dashboard** — include Power BI here only if that is the tool used to build the dashboard

## Dataset

The notebook initially inspected **3,900 records and 18 columns**. The dataset includes customer demographics, purchased items, categories, purchase amounts, review ratings, subscription status, shipping type, discounts, previous purchases, payment methods, and purchase frequency.

The source CSV (`customer_shopping_behavior.csv`) was referenced by the notebook but was not included with the two files provided for this README. Add the dataset to the project only if you have permission to share it, and update the notebook path if needed.

## Project Workflow

### 1. Exploratory Data Analysis (Python & Pandas)

- Performed **data profiling** using dataset dimensions, data types, and descriptive statistics.
- Conducted a **data quality assessment** by checking missing values and duplicate records.
- Identified **37 missing values** in `Review Rating`; the notebook applies category-based median replacement.
- Used **quantile-based segmentation** (`pd.qcut`) to create four age groups.
- Applied **feature engineering** by mapping purchase-frequency categories to approximate day intervals.
- Checked whether `Discount Applied` and `Promo Code Used` contained matching values, then removed `Promo Code Used`.
- Explored correlations among numeric variables.
- Exported the prepared dataset to CSV.

### 2. SQL-Based Business Analysis (MySQL)

The SQL script includes queries or query drafts to investigate:

- **Revenue aggregation by gender**
- **Discount-user filtering** for purchases at or above the overall average
- **Comparative analysis** of average purchase amount by Standard and Express shipping
- **Subscriber vs. non-subscriber analysis** using customer count, average spend, and total revenue
- **Product-level discount-rate analysis**
- **Rule-based customer segmentation** into New, Returning, and Loyal customers
- **Within-category product ranking** using `ROW_NUMBER()`
- **Repeat-purchase analysis** among customers with more than five previous purchases
- **Revenue distribution by age group**

Some questions in the SQL file are comments without a completed query. In particular, the question about the top five products by average review rating is not implemented as an executable query in the supplied script.

<CodeBlock language="markdown" editable>
## Power BI Dashboard

An interactive Power BI dashboard was developed to complement the customer shopping behavior analysis and present insights in a clear, visual format.
- Tool: Microsoft Power BI
- File: customer_behaviour_dashboard.pbix
- Purpose: Visualize customer shopping behavior and support data-driven analysis.
How to View
Download the customer_behaviour_dashboard.pbix file from this repository and open it using Power BI Desktop.
</CodeBlock>

## Key SQL Concepts

- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
- Grouping and sorting: `GROUP BY`, `ORDER BY`
- Conditional filtering: `WHERE`
- Scalar subquery
- Conditional logic: `CASE WHEN`
- Common Table Expressions (CTEs)
- Window functions: `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`

## Important Validation Notes

- **Review-rating imputation:** The notebook currently assigns the category median to every `Review Rating` row, not only missing rows. To fill only missing values, use a targeted fill operation and rerun the notebook.
- **Discount and promo fields:** The equality check returned `True` in the notebook. Validate this relationship on the complete dataset before treating the fields as redundant.
- **Age-group labels:** The current labels include spelling mistakes (`middle agged`, `scenior`) and should be corrected before publication.
- **Purchase-frequency intervals:** Day values are approximations: Weekly = 7, Bi-Weekly/Fortnightly = 14, Monthly = 30, Quarterly/Every 3 Months = 90, and Annually = 365.
- **Discount capitalization:** The SQL script uses both `'yes'` and `'Yes'`. Check the actual stored values and MySQL collation behavior.
- **Query output:** The supplied SQL file does not include result tables, so this README describes the questions and methods rather than claiming specific business findings.
- **Customer segments:** The SQL uses project-defined thresholds: one previous purchase = New, 2–10 = Returning, and other values = Loyal. Treat these as assumptions, not universal definitions.

## Repository Structure

```text
customer-shopping-behavior-analysis/
├── README.md
├── notebooks/
│   └── shopping_eda.ipynb
├── sql/
│   └── shopping_analysis.sql
├── dashboard/
│   ├── README.md
│   └── dashboard screenshot or file
└── docs/
    ├── notebook_summary.md
    ├── sql_summary.md
    └── linkedin_post.md
```

## How to Run

### Python notebook

1. Install Python and Jupyter, or use VS Code with the Jupyter extension.
2. Install Pandas:

   ```bash
   python -m pip install pandas
   ```

3. Place `customer_shopping_behavior.csv` in the project root, or update the path in the notebook.
4. Open `notebooks/shopping_eda.ipynb` and run the cells in order.
5. Update the CSV export path to a relative path if you want the notebook to run on another computer.

### MySQL queries

1. Import the dataset into MySQL and create or select the database and `shopping_data` table.
2. Open `sql/shopping_analysis.sql` in MySQL Workbench.
3. Confirm the table and column names match the imported dataset.
4. Run each query and validate its output before writing conclusions.

## Future Improvements

- Correct the review-rating imputation so existing ratings are preserved.
- Fix age-group label spelling.
- Standardize discount-value capitalization in SQL.
- Complete the query for the top five products by average review rating.
- Adjust the discount-rate query to return five products if following the original question.
- Add the dashboard file or screenshots.
- Add verified results and concise business insights after executing and checking the queries.
