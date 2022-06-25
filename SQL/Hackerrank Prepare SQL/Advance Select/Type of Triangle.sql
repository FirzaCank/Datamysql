/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
Output one of the following statements for each record in the table:

1. Equilateral: It's a triangle with 3 sides of equal length.
2. Isosceles: It's a triangle with 2 sides of equal length.
3. Scalene: It's a triangle with 3 sides of differing lengths.
4. Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

SELECT
    CASE
        WHEN A+B>C AND A+C>B AND B+C>A THEN
        CASE
            WHEN A=B AND B=C AND A=C THEN 'Equilateral'
            WHEN A=B OR B=C OR A=C THEN 'Isosceles'
            ELSE 'Scalene' 
        END
        ELSE 'Not A Triangle'
    END    
FROM TRIANGLES;
