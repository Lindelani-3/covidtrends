-- New cases by date and WHO region

SELECT `WHO Region`, Date, SUM(Confirmed) - LAG(SUM(Confirmed)) OVER (PARTITION BY `WHO Region` ORDER BY Date) as NewCases
FROM covid_data_clean
GROUP BY `WHO Region`, Date