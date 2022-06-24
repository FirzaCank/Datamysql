/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent)
and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT
    y.CONTINENT,
    FLOOR(AVG(c.POPULATION)) population
FROM CITY c
INNER JOIN COUNTRY y ON c.COUNTRYCODE = y.CODE
GROUP BY y.CONTINENT;
