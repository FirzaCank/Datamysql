/*P(R) represents a pattern drawn by Julia in R rows.
The following pattern represents P(5):
*/

* * * * * 
* * * * 
* * * 
* * 
*

*/Write a query to print the pattern P(20)! /*

1. OPTION 1 (MySQL) :

SELECT
    REPEAT('* ', @NUMBER := @NUMBER - 1)
FROM information_schema.tables, (SELECT @NUMBER:=21) t LIMIT 20;



2. OPTION 2 (MySQL) :

SET @NUMBER = 21;
SELECT
    REPEAT("* ", @NUMBER := @NUMBER -1)
FROM information_schema.tables;



3. OPTION 3 (MS SQL SERVER) :

DECLARE @i INT = 20
WHILE (@i > 0)
BEGIN
    PRINT REPLICATE('* ', @i)
    SET @i = @i -1
END;
