-- Case fatality rate by WHO region

SELECT 
    `WHO Region`,
    SUM(Deaths) / SUM(Confirmed) AS CaseFatalityRate
FROM
    covid_data
WHERE
    `Confirmed` != 0
GROUP BY `WHO Region`;