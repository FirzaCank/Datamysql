/*
We define an employee's total earnings to be their monthly SALARY X MONTHS worked,
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.
Then print these values as 2 space-separated integers.
*/

SELECT
    MAX(months*salary),
    COUNT(employee_id)
FROM Employee
WHERE employee_id IN (SELECT
                      employee_id
                      FROM Employee
                      WHERE months*salary IN (SELECT
                                              MAX(months*salary) earning
                                              FROM Employee));
                                         
 OR ANTOHER OPTION
 


SELECT
    months*salary,
    COUNT(*)
FROM Employee
GROUP BY 1
ORDER BY 1 desc
LIMIT 1;
