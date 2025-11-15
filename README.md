Mall Customers — SQL Analysis Project
Tools: SQL Server, T-SQL
Dataset size: 200 records
Project Overview

This repository contains 10 analytical SQL tasks based on the Mall Customers dataset.
The goal is to demonstrate practical SQL skills used in data analytics, including filtering, aggregation, segmentation, and insight generation.

All SQL queries are included in:
mall_customers_analysis.sql

Dataset Description

The dataset contains basic demographic and behavioral information about mall customers:

Column	Description
CustomerID	Unique identifier
Genre	Gender (Male/Female)
Age	Customer age
AnnualIncome	Income in thousands (k$)
SpendingScore	Score from 1–100 — higher = more spending

Project Structure
MallCustomers/

mall_customers_analysis.sql   => SQL tasks and solutions (Task 0–10)=>
README.md                       => Project documentation

SQL Tasks Overview:

Task 1 — Total customer count

Basic dataset size check.

Task 2 — Average customer age

Task 3 — Customers aged 18–25

Task 4 — Average income and spending by gender

Using GROUP BY.

Task 5 — Spending-to-income ratio

AVG(CAST(SpendingScore AS FLOAT) / AnnualIncome).

Task 6.1 — Customer segmentation

Based on income and spending thresholds:

High income · High spending

High income · Low spending

Low income · High spending

Mid segment

Task 6.2 — Segment summary

Count of customers + average income + average spending.

Task 7 — Age group segmentation

Age buckets:
18–25, 26–40, 41–55, 56+.

Task 8 — High-income, low-spending customers

Potential marketing targets.

Task 9 — Top spenders by gender

Task 10 — Top 10 spenders

Sorted by spending score, then income.

Key Insights:

Women have a slightly higher spending-to-income ratio than men.

The 26–40 age group is the largest, with strong spending potential.

The most promising marketing segment is:
High income · Low spending (37 customers).

The top spender in the entire dataset is Customer 12 (Female, SpendingScore 99).

Skills Demonstrated

Analytical SQL (SELECT, WHERE, ORDER BY)

Aggregate functions (AVG, COUNT, MAX, MIN)

CASE segmentation logic

GROUP BY analytics

Subqueries

Data profiling and customer insights

How to Run:

Open SQL Server Management Studio

Create the table and load data 

Run tasks 1–10 from the SQL file
