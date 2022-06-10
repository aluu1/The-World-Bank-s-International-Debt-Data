--1. The World Bank's international debt data
SELECT *
FROM international_debt;

--2. Finding the number of distinct countries
SELECT COUNT(DISTINCT country_name) as Distinct_country_count
FROM international_debt;

--3. Finding out the distinct debt indicators
SELECT
	DISTINCT indicator_code,
	indicator_name
FROM international_debt;

--4. Totaling the amount of debt owed by all countries
SELECT ROUND(SUM(debt)/1000000, 2) as 'Total Debt (in millions)'
FROM international_debt;

--5. Country with the highest debt
SELECT TOP 1
    country_name, 
    SUM(debt) AS Total_Debt
FROM international_debt
GROUP BY country_name
ORDER BY Total_Debt DESC;

--6. Average amount of debt across indicators
SELECT
	indicator_name,
	indicator_code,
	ROUND(AVG(debt), 2) as Average_Debt
FROM international_debt
GROUP BY indicator_name, indicator_code
ORDER BY Average_Debt DESC;

--7. The country with the highest amount of principal repayments
SELECT TOP 1
	country_name,
	indicator_name,
	debt
FROM international_debt
WHERE indicator_code = 'DT.AMT.DLXF.CD'
ORDER BY debt DESC;

--8. The top 15 most common debt indicator
SELECT TOP 15
	indicator_name,
	COUNT(indicator_name) as indicator_count
FROM international_debt
GROUP BY indicator_name
ORDER BY indicator_count DESC;

--9. The maximum amount of debt for an indicator each country has (Top 15 countries)
SELECT TOP 15
	country_name,
	MAX(debt) as Max_Debt
FROM international_debt
GROUP BY country_name
ORDER BY Max_Debt DESC;