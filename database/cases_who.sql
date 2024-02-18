-- Total cases by WHO region

SELECT 
    `WHO Region`, SUM(Confirmed) AS TotalConfirmed
FROM
    covid_data_clean
GROUP BY `WHO Region`;