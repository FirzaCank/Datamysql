/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20)!
*/

1. OPTION 1 (MS SQL SERVER):

DECLARE @i INT = 1
WHILE (@i < 21)
BEGIN
    PRINT REPLICATE("* ", @i)
    SET @i = @i + 1
END;


2. OPTION 2 (MYSQL):

SET @NUMBER = 0;
SELECT
    REPEAT("* ", @NUMBER := @NUMBER + 1)
FROM information_schema.tables
LIMIT 20;
