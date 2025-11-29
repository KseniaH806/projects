# Mall Customers KPIs & Segmentation Dashboard
## Power BI Project Overview

This Power BI report provides an overview of the Mall Customers dataset and explores how customers differ by gender, age, spending score, and income segments.

All visuals are cross-filtered via the slicer in the top-right corner (Gender and AgeGroup).

### Main KPIs (Top Cards)

200 – Count of CustomerID: total number of customers in the dataset

38.85 – Average of Age: average customer age

50.20 – Average Spending Score (1–100): how much customers typically spend (higher = spends more)

60.56 – Average Annual Income (k$): average annual income in thousands of dollars

### Visuals Included in the Dashboard

#### 1️. Average of Age by Gender (Bar Chart)

Compares average age of Male vs Female customers.

#### 2️. Average of Annual Income (k$) by Customer Segment

Shows differences in income across:

High income – High spending

High income – Low spending

Mid segment

Low income – High spending

#### 3️. Customer Segment Distribution (Tree Map)

Displays how many customers fall into each segment:
Mid segment, High income groups, Low income groups.

#### 4️. Average of Annual Income (k$) by Gender

Comparison of income between Male and Female customers.

#### 5️. Spending Score vs Annual Income — Scatter Plot

Shows the relationship between spending habits and income, color-coded by customer segment.

#### 6️. Correlation Heatmap (Age, Income, Spending)

A manually created matrix showing pairwise correlations:

Age vs Spending: _moderate negative correlation (older = lower spending)_

Income vs Spending: _almost no correlation_

Age vs Income: _no significant relationship_

##### Filtering:

The dashboard includes a slicer that allows filtering all visuals by:

Gender (Male, Female)

AgeGroup (18–25, 26–40, 41–55, 56+)
