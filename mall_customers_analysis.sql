/* 
   Project: Mall Customers – SQL Analysis (Task 0–10)
   Description:
     Analytical SQL tasks based on the Mall Customers dataset.
     Tasks 1–10 = analysis queries that can be run repeatedly.
*/


BULK INSERT dbo.mall_customers
FROM 'C:\Data\Mall_Customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO



/* 
   TASK 1: Total number of customers
   Purpose:
     Get the total number of records in the dataset.
*/

SELECT COUNT(*) AS TotalCustomers
FROM dbo.mall_customers;



/*
   TASK 2: Average age of customers
   Purpose:
     Understand the typical age of mall customers.
*/

SELECT AVG(Age) AS AverageAge
FROM dbo.mall_customers;



/*
   TASK 3: Customers aged 18–25
   Purpose:
     Extract the youngest adult customer segment.
*/

SELECT *
FROM dbo.mall_customers
WHERE Age BETWEEN 18 AND 25;



/* 
   TASK 4: Income and spending by gender
   Purpose:
     Compare average annual income and spending behavior
     between male and female customers.
*/

SELECT
    Genre,
    AVG(AnnualIncome)  AS AvgIncome,
    AVG(SpendingScore) AS AvgSpendingScore
FROM dbo.mall_customers
GROUP BY Genre;



/*
   TASK 5: Spending-to-income ratio by gender
   Purpose:
     Measure how much customers spend relative to their income
     for each gender.
*/

SELECT
    Genre,
    AVG(CAST(SpendingScore AS FLOAT) / AnnualIncome) AS SpendingToIncomeRatio
FROM dbo.mall_customers
GROUP BY Genre;



/* 
   TASK 6.1: Customer-level segmentation
   Purpose:
     Assign each customer to one of four segments based on
     income and spending score:
       - High income · High spending
       - High income · Low spending
       - Low income · High spending
       - Mid segment (everyone else)
*/

SELECT
    CustomerID,
    Genre,
    Age,
    AnnualIncome,
    SpendingScore,
    CASE
        WHEN AnnualIncome >= 70 AND SpendingScore >= 70 THEN 'High income · High spending'
        WHEN AnnualIncome >= 70 AND SpendingScore < 40  THEN 'High income · Low spending'
        WHEN AnnualIncome <  40 AND SpendingScore >= 70 THEN 'Low income · High spending'
        ELSE 'Mid segment'
    END AS CustomerSegment
FROM dbo.mall_customers;



/*
   TASK 6.2: Segment summary (size, avg income, avg spending)
   Purpose:
     Summarize the four customer segments by:
       - number of customers
       - average income
       - average spending score
*/

SELECT
    CustomerSegment,
    COUNT(*)             AS CustomersCount,
    AVG(AnnualIncome)    AS AvgIncome,
    AVG(SpendingScore)   AS AvgSpendingScore
FROM (
    SELECT
        CASE
            WHEN AnnualIncome >= 70 AND SpendingScore >= 70 THEN 'High income · High spending'
            WHEN AnnualIncome >= 70 AND SpendingScore < 40  THEN 'High income · Low spending'
            WHEN AnnualIncome <  40 AND SpendingScore >= 70 THEN 'Low income · High spending'
            ELSE 'Mid segment'
        END AS CustomerSegment,
        AnnualIncome,
        SpendingScore
    FROM dbo.mall_customers
) AS Seg
GROUP BY CustomerSegment
ORDER BY CustomersCount DESC;



/*
   TASK 7: Age group segmentation
   Purpose:
     Group customers into age buckets and calculate the
     number of customers and average spending score per group.
     Age groups:
       - 18–25
       - 26–40
       - 41–55
       - 56+
*/

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18–25'
        WHEN Age BETWEEN 26 AND 40 THEN '26–40'
        WHEN Age BETWEEN 41 AND 55 THEN '41–55'
        ELSE '56+'
    END AS AgeGroup,
    COUNT(*)             AS CustomersCount,
    AVG(SpendingScore)   AS AvgSpendingScore
FROM dbo.mall_customers
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18–25'
        WHEN Age BETWEEN 26 AND 40 THEN '26–40'
        WHEN Age BETWEEN 41 AND 55 THEN '41–55'
        ELSE '56+'
    END
ORDER BY CustomersCount DESC;



/* 
   TASK 8: High-income, low-spending customers
   Purpose:
     Identify wealthy customers who currently spend little
     (potential targets for marketing campaigns).
*/

SELECT *
FROM dbo.mall_customers
WHERE AnnualIncome >= 70
  AND SpendingScore < 40;



/* 
   TASK 9: Top spender by gender
   Purpose:
     Find the male and female customers with the highest
     spending score in their gender group.
*/

SELECT
    Genre,
    CustomerID,
    Age,
    AnnualIncome,
    SpendingScore
FROM dbo.mall_customers
WHERE (Genre = 'Male'
       AND SpendingScore = (
            SELECT MAX(SpendingScore)
            FROM dbo.mall_customers
            WHERE Genre = 'Male'
       ))
   OR (Genre = 'Female'
       AND SpendingScore = (
            SELECT MAX(SpendingScore)
            FROM dbo.mall_customers
            WHERE Genre = 'Female'
       ));

/*
   TASK 10: Top 10 spenders overall
   Purpose:
     List the top 10 customers with the highest spending
     scores. For ties in spending score, higher income
     customers appear first.
*/

SELECT TOP 10
    CustomerID,
    Genre,
    Age,
    AnnualIncome,
    SpendingScore
FROM dbo.mall_customers
ORDER BY
    SpendingScore DESC,
    AnnualIncome  DESC;