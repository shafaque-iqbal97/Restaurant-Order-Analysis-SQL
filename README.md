# Restaurant-Order-Analysis-SQL

Project Overview

This project performs SQL-based data analysis on restaurant order data to extract meaningful business insights. The analysis involves joining multiple tables, performing aggregations, and using subqueries to evaluate pricing patterns and menu characteristics.

The objective is to analyze item pricing and ordering behavior to support data-driven decision-making.

🗂️ Dataset Description

The project uses two main tables:

Orders Table – Contains order details including order details, order ID, order date, order time and item IDs.

Items Table – Contains menu details such as item ID, item name, category classification, and price.

These tables were joined using LEFT JOIN to perform comprehensive analysis.

📊 Analysis Performed

The following analyses were conducted:

🔗 Joined Orders and Items tables using LEFT JOIN

💰 Identified the Top 5 most expensive items

🥗 Counted the number of Italian dishes on the menu

🌱 Listed the most and least expensive ordered items

📈 Calculated the average dish price

📅 Analyzed the order date range

📌 Used filtering and conditional aggregation with HAVING

🛠️ SQL Concepts Used

LEFT JOIN

WHERE

GROUP BY

ORDER BY

HAVING

Aggregate functions (SUM, AVG, COUNT, MAX, MIN)

Subqueries

Date functions

📈 Key Insights

Identified premium-priced menu items.

Evaluated pricing distribution across different menu categories.

Identified frequently ordered items.

Determined overall average pricing strategy.

Analyzed time coverage of orders using date range.

📁 Repository Contents

SQL Query File

Dataset files

README.md

🚀 Tools Used

SQL

PostgreSQL
