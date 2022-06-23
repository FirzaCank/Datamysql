/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.*/

OPTION 1 :

SELECT
    DISTINCT CITY
FROM STATION
WHERE
    LEFT(CITY,1) IN ('A','I','E','U','O')
AND
    RIGHT(CITY,1) IN ('a','i','e','u','o');
    
  
  
OPTION 2 :

SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';


OPTION 3 :

select
  DISTINCT CITY
from station
where
  city regexp '[aeiou]$'
and
  city in (SELECT
              CITY
           FROM STATION
           WHERE CITY REGEXP '^[aeiou]');

/*
WITH EXPLANATION:
^  			    // string's beginning
[aeiou]   		// a SINGLE vowel
$  			    // end of string

Therefore this would match the vowels and only the vowels. Even a string like "aaa" would not match, because it's more than 1 char long.
The correct one is the one you used at the beginning because of the ".*" bit:

^		        // start of string
[aeiou]         // a single vowel
.	            // any characted...
*		        // ...repeated any number of times
[aeiou]		    // another vowel
$	            // end of string
*/
