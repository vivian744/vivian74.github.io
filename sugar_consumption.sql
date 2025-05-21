USE [VIVIAN_COHORT_DATA]
GO

SELECT [Country]
      ,[Year]
      ,[Country_Code]
      ,[Continent]
      ,[Region]
      ,[Population]
      ,[GDP_Per_Capita]
      ,[Per_Capita_Sugar_Consumption]
      ,[Total_Sugar_Consumption]
      ,[Sugar_From_Sugarcane]
      ,[Sugar_From_Beet]
      ,[Sugar_From_HFCS]
      ,[Sugar_From_Other]
      ,[Processed_Food_Consumption]
      ,[Avg_Daily_Sugar_Intake]
      ,[Diabetes_Prevalence]
      ,[Obesity_Rate]
      ,[Sugar_Imports]
      ,[Sugar_Exports]
      ,[Avg_Retail_Price_Per_Kg]
      ,[Gov_Tax]
      ,[Gov_Subsidies]
      ,[Education_Campaign]
      ,[Urbanization_Rate]
      ,[Climate_Conditions]
      ,[Sugarcane_Production_Yield]
  FROM [dbo].[sugar_consumption_dataset$]

GO
can I see all the unique items that have been ordered? 
 SELECT DISTINCT(country)
 FROM [dbo].[sugar_consumption_dataset$]

 What is the total quantity of sugar consumption in Africa ?  
 SELECT SUM (Total_Sugar_Consumption) AS TOTAL_SUGAR
 FROM[dbo].[sugar_consumption_dataset$] 
 WHERE CONTINENT = 'AFRICA'

 list all years ordered, with the most recent first
  SELECT [Year]
  FROM [dbo].[sugar_consumption_dataset$]
  ORDER BY YEAR DESC

    1.	which country had the highest sugar consumption in 2018
	select [Total_Sugar_Consumption],[Country]
	from[dbo].[sugar_consumption_dataset$]
	 ORDER BY [Country] DESC

2.	what was the average GDP per capita for European countries 
select AVG(GDP_Per_Capita) AS AVG_GDP
FROM[dbo].[sugar_consumption_dataset$]
WHERE CONTINENT = 'EUROPE'

3.	list the countries and their sugar consumption 
SELECT [Country],SUM(Total_Sugar_Consumption) AS TOTAL_SUGAR
FROM [dbo].[sugar_consumption_dataset$]
GROUP BY COUNTRY


4.	which year had the highest average daily sugar consumption across all countries 
select [Year], sum(Avg_Daily_Sugar_Intake) AS TOTAL_AVG_SUGAR
from[dbo].[sugar_consumption_dataset$]
GROUP BY [Year]
ORDER BY TOTAL_AVG_SUGAR DESC;

5.	show the total sugar consumption for each continent
select[Continent], sum(Total_Sugar_Consumption)
from [dbo].[sugar_consumption_dataset$]
group by [Continent]

6.	which country had the lowest GDP per capit+a in 1990
select TOP 1 COUNTRY, (Per_Capita_Sugar_Consumption) 
from[dbo].[sugar_consumption_dataset$]
WHERE YEAR = 1990 
ORDER BY [Per_Capita_Sugar_Consumption] ASC;

7.	list the countries where sugar consumption decreased from 2017 to 2018
SELECT C1. COUNTRY
FROM[dbo].[sugar_consumption_dataset$]
C1
JOIN [dbo].[sugar_consumption_dataset$]
C2 ON C1.COUNTRY=C2.COUNTRY
WHERE C1.YEAR=2017
AND C2. YEAR = 2018
AND C2. [Total_Sugar_Consumption] < C1.[Total_Sugar_Consumption];

8.	what is the average sugar consumption for countries with a GDP per capita above 20,000
select AVG(Total_Sugar_Consumption)
from [dbo].[sugar_consumption_dataset$]
WHERE [GDP_Per_Capita]>20000

9.	show the top five countries with the highest total sugar consumption
select TOP 5 COUNTRY, SUM(Total_Sugar_Consumption) AS TOTAL_CONSUMPTION
from [dbo].[sugar_consumption_dataset$]
GROUP BY COUNTRY
ORDER BY TOTAL_CONSUMPTION DESC

10.	list the countries in North America and their sugar consumption in 2010 
select Country, Total_Sugar_Consumption
from [dbo].[sugar_consumption_dataset$]
WHERE Continent='North_America' AND YEAR ='2010'


11.	what is the total GDP for each continent in the year 2018
select Continent, SUM (GDP_Per_Capita) AS TOTAL_GDP
from [dbo].[sugar_consumption_dataset$]
WHERE  YEAR ='2018'
GROUP BY Continent

12.	show the countries where the sugar consumption is above the average for their respective continent
SELECT sc.Country
FROM [dbo].[sugar_consumption_dataset$] sc
JOIN (
    SELECT Continent, AVG(Total_Sugar_Consumption) AS AvgContinentConsumption
    FROM [dbo].[sugar_consumption_dataset$]
    GROUP BY Continent
) AS avg_consumption ON sc.Continent = avg_consumption.Continent
WHERE sc.Total_Sugar_Consumption > avg_consumption.AvgContinentConsumption;

13.	list the countries in their GDP per capita for years where it was below 10,0
SELECT Country, AVG(Total_Sugar_Consumption) AS AverageConsumption
FROM [dbo].[sugar_consumption_dataset$]
GROUP BY Country;
14.	what is the average sugar consumption for each country across all years 
SELECT Country, AVG(Total_Sugar_Consumption) AS AverageConsumption
FROM [dbo].[sugar_consumption_dataset$]
GROUP BY Country;
15.	show the countries with a population greater than 100 million and their sugar consumption in 2018 thank you
SELECT Country, Total_Sugar_Consumption
FROM [dbo].[sugar_consumption_dataset$]
WHERE Population > 100000000
  AND Year = 2018;



