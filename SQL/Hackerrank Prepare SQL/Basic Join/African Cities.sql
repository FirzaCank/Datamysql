/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/


SELECT
    c.NAME
FROM CITY c
INNER JOIN COUNTRY y ON c.COUNTRYCODE = y.CODE
WHERE y.CONTINENT LIKE '%Africa%';
