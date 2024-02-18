select * from covid_data;

select * from covid_data_clean;

-- Total cases by country and who region
SELECT 
    `Country/Region`, `WHO Region`, Confirmed
FROM
    covid_data_clean;
    
-- New cases by date, who region and country
SELECT * FROM (
    SELECT `Country/Region`, `WHO Region`, Date, Confirmed - LAG(Confirmed) OVER (PARTITION BY `Country/Region` ORDER BY Date) as NewCases
    FROM covid_data_clean ) t
WHERE NewCases IS NOT NULL;

-- Case fatality rate by WHO region and Country
SELECT 
    `Country/Region`,
    `WHO Region`,
    SUM(Deaths) / SUM(Confirmed) AS CaseFatalityRate
FROM
    covid_data
WHERE
    `Confirmed` != 0
GROUP BY `Country/Region` , `WHO Region`;

-- New cases against fatality
SELECT t1.`Country/Region`, t1.NewCases, t2.CaseFatalityRate
FROM (
    SELECT `Country/Region`, SUM(Confirmed) - MIN(Confirmed) as NewCases
    FROM covid_data_clean
    GROUP BY `Country/Region`
) t1
JOIN (
    SELECT `Country/Region`, SUM(Deaths) / SUM(Confirmed) as CaseFatalityRate
    FROM covid_data_clean
    WHERE `Confirmed` != 0
    GROUP BY `Country/Region`
) t2
ON t1.`Country/Region` = t2.`Country/Region`;


-- Full table with new cases and fatalities
SELECT * FROM (
    SELECT *, Confirmed - LAG(Confirmed) OVER (PARTITION BY `Country/Region` ORDER BY Date) as NewCases, Deaths / Confirmed AS CaseFatalityRate
    FROM covid_data_clean 
    ) t
WHERE NewCases IS NOT NULL
AND `Confirmed` != 0;

select * from full_data;