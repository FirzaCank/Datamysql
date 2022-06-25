/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
but did not realize her keyboard's 0 key was broken until after completing the calculation.
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
*/

SELECT
    CEILING(AVG(Salary)-AVG(REPLACE(Salary,'0','')))
FROM EMPLOYEES;

__________________________________________________________

Example Sample :

ID Name Salary
-- ---- ------
1 Kristeen 1420
2 Ashley 2006
3 Julia 2210
4 Maria 3000

Output : 2061

Sample with broken keyboard:

ID Name Salary
-- ---- ------
1 Kristeen 142
2 Ashley 26
3 Julia 221
4 Maria 3

Samantha computes an average salary of 98.00. The actual average salary is 2159.

The resulting error between the two calculations is 2159-98 = 2061 . Since it is equal to the integer 2061, it does not get rounded up.
