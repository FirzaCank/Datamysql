/*Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/

OPSI 1:

(SELECT
    CITY,
    LENGTH(CITY) AS length
FROM STATION 
WHERE 1 ORDER BY length ASC,
CITY ASC
LIMIT 1)
UNION
(SELECT
    CITY,
    LENGTH(CITY) AS length
 FROM STATION
 WHERE 1 ORDER BY length DESC,
 CITY ASC
 LIMIT 1);



OPSI 2:

(SELECT
    CITY,
    LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) =(SELECT
                     MIN(LENGTH(CITY))
                    FROM STATION)
ORDER BY CITY
LIMIT 1)
UNION
(SELECT
    CITY,
    LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) =(SELECT
                    MAX(LENGTH(CITY))
                    FROM STATION)
ORDER BY CITY
LIMIT 1);
