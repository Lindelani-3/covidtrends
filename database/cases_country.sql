-- Total cases by country

SELECT 
    `Country/Region`, SUM(Confirmed) AS TotalConfirmed
FROM
    covid_data_clean
GROUP BY `Country/Region`;