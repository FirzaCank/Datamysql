/* MEdiAN
A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/


SELECT COUNT(*) FROM STATION INTO @TOTAL;

SELECT
    ROUND(AVG(A.LAT_N),4)
FROM (SELECT
        ROW_NUMBER() OVER(ORDER BY LAT_N) AS ROW_ID,
        LAT_N
      FROM STATION) A
WHERE
    CASE WHEN MOD(@TOTAL,2) = 0
    THEN A.ROW_ID IN (@TOTAL/2,(@TOTAL/2+1))
    ELSE A.ROW_ID = (@TOTAL+1)/2
END;
