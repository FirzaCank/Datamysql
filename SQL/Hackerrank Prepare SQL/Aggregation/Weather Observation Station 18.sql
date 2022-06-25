/*
Consider p1(A,B) and p2(C,D) to be two points on a 2D plane.

1. A happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
2. B happens to equal the minimum value in Western Longitude (LONG_W in STATION).
3. C happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
4. D happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

SELECT
ROUND((MAX(LAT_N)-MIN(LAT_N)) + (MAX(LONG_W)-MIN(LONG_W)),4)
FROM STATION;
