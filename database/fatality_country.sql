-- Case fatality rate by country

SELECT 
    `Country/Region`,
    SUM(Deaths) / SUM(Confirmed) AS CaseFatalityRate
FROM
    covid_data
WHERE
    `Confirmed` != 0
GROUP BY `Country/Region`;