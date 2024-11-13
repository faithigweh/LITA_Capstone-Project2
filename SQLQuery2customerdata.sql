-----total number of customers from each region---
SELECT Region, COUNT(CustomerID) AS NumberOfCustomers
FROM [dbo].[Customerdata2]
GROUP BY Region;

----most popular subscription type by number of customers---
SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS CustomerCount
FROM [dbo].[Customerdata2]
GROUP BY SubscriptionType
ORDER BY CustomerCount DESC;

----customers who canceled their subscription within 6months--
SELECT CustomerName
FROM [dbo].[CustomerData2]
WHERE Canceled = 1
AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6;

----Average subscription duration for all customers----
SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM [dbo].[CustomerData]

----Customers with subscription longer than 12 months---
SELECT CustomerName
FROM [dbo].[CustomerData2]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12;

---Total Revenue by subscription type---
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[Customerdata2]
GROUP BY SubscriptionType;

----Top 3 regions by subscription cancellation---
SELECT TOP 3 Region, COUNT(CustomerID) AS Cancellations
FROM [dbo].[Customerdata2]
WHERE Canceled = 'false'
GROUP BY Region
ORDER BY Cancellations DESC;

---total number of active and cancelled subscription---
SELECT 
��� SUM(CASE WHEN Canceled =' false' THEN 0 ELSE 1 END) AS ActiveSubscriptions,
��� SUM(CASE WHEN Canceled = 'true' THEN 1 ELSE 0 END) AS CanceledSubscriptions
FROM [dbo].[Customerdata2]