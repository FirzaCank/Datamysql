/*
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:

Founder > Lead manager > Senior manager > manager > employee

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers,
total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric.
For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT l.lead_manager_code),
    COUNT(DISTINCT s.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Company c
INNER JOIN Lead_Manager l USING(company_code)
INNER JOIN Senior_Manager s USING(lead_manager_code)
INNER JOIN Manager m USING(senior_manager_code)
INNER JOIN Employee e USING(manager_code)
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
