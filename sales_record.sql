USE [VIVIAN_COHORT_DATA]
GO

SELECT [InvoiceNo]
      ,[InvoiceDate]
      ,[CustomerID]
      ,[StockCode]
      ,[ITEMS]
      ,[Quantity]
      ,[UnitPrice]
      ,[Country]
  FROM [dbo].['Dataset_ecommerce csv$']

GO
Write a query to find all the electronics in Egypt country		

SELECT * 
FROM  [dbo].['Dataset_ecommerce csv$']
WHERE [ITEMS] = 'Electronics' 
AND country = 'Egypt';

Write a query to find all the toys 		
SELECT*
FROM[dbo].['Dataset_ecommerce csv$']
WHERE [ITEMS] = 'TOYS'

Write a query to list all the items with customer id “13047”.		
SELECT*
FROM[dbo].['Dataset_ecommerce csv$']
WHERE [CustomerID] = '13047'

Write a query to find all the items with price greater than 63.20		
SELECT*
FROM[dbo].['Dataset_ecommerce csv$']
WHERE  [UnitPrice] > '63.20'

Write a query to list items whose quantity is greater than 20.		
SELECT*
FROM [dbo].['Dataset_ecommerce csv$']
WHERE [Quantity]  > '20'

Write a query to find all items with no quantity		
SELECT*
FROM[dbo].['Dataset_ecommerce csv$'] 
WHERE [Quantity]  = '0'

Write a query to find items that are clothes and toys only.		
SELECT * 
FROM  [dbo].['Dataset_ecommerce csv$']
WHERE [ITEMS] IN ('CLOTHES', 'TOYS')

Write a query to find the item with the highest quantity in Tunisia.		
SELECT  top 1 *
FROM  [dbo].['Dataset_ecommerce csv$']
WHERE COUNTRY = 'Tunisia'

Write a query to find items with invoice id “536367”	
SELECT*
FROM  [dbo].['Dataset_ecommerce csv$']
WHERe [InvoiceNo]  = '536367'

Write a query to calculate the average quantity of item in each country.		
SELECT country, AVG([Quantity]) AS avg_quantity
FROM [dbo].['Dataset_ecommerce csv$']
GROUP BY country;

WRITE a query to find the item with the highest quantity
SELECT TOP 1 *
FROM [dbo].['Dataset_ecommerce csv$']

Write a query to calculate the average price  for all the items in sudan.	
SELECT  top 1 *
FROM  [dbo].['Dataset_ecommerce csv$']
WHERE COUNTRY = 'SUDAN'

Write a query to rank items by quantity. If two items have the same quantity, rank them by their price.		
