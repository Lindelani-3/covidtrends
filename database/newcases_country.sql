-- New cases by date and country

SELECT * FROM (
    SELECT `Country/Region`, Date, Confirmed - LAG(Confirmed) OVER (PARTITION BY `Country/Region` ORDER BY Date) as NewCases
    FROM covid_data_clean ) t
WHERE NewCases IS NOT NULL;