/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/



SELECT
    SUM(c.POPULATION) population
FROM CITY c
INNER JOIN COUNTRY y on c.COUNTRYCODE = y.CODE
WHERE y.CONTINENT LIKE '%Asia%';
