/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date.
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project.
Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order.
If there is more than one project that have the same number of completion days, then order by the start date of the project.
*/


SELECT Start_Date, MIN(End_Date)
FROM 
/* Choose start dates that are not end dates of other projects (if a start date is an end date, it is part of the samee project) */
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
/* Choose end dates that are not end dates of other projects */
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b
/* At this point, we should have a list of start dates and end dates that don't necessarily correspond with each other */
/* This makes sure we only choose end dates that fall after the start date, and choosing the MIN means for the particular start_date, we get the closest end date that does not coincide with the start of another task */
where start_date < end_date
GROUP BY start_date
ORDER BY datediff(start_date, MIN(end_date)) DESC, start_date

SAMPLE INPUT :

Task_ID Start_Date End_Date
1	2015-10-01	2015-10-02
2	2015-10-02	2015-10-03
3	2015-10-03	2015-10-04
4	2015-10-13	2015-10-14
5	2015-10-14	2015-10-15
6	2015-10-28	2015-10-29
7	2015-10-30	2015-10-31


SAMPLE OUTPUT :
Start_Date End_Date
---------- --------
2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04
_______________________________________

EXPLANATION :

1. Find Start_Date that not in End_Date, because if start date is in end date, then it still the same project

(SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a

Start_Date
----------
2015-10-01
2015-10-13
2015-10-28
2015-10-30



2. Find End_Date

(SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b

End_Date
--------
2015-10-04
2015-10-15
2015-10-29
2015-10-31



3. WITHOUT GROUP BY AND ORDER BY

SELECT Start_Date, MIN(End_Date)
FROM 
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b
where start_date < end_date;

Start_Date End_Date
---------- --------
1 2015-10-01	2015-10-31
1 2015-10-01	2015-10-29
1 2015-10-01	2015-10-15
1 2015-10-01	2015-10-04
4 2015-10-13	2015-10-31
4 2015-10-13	2015-10-29
4 2015-10-13	2015-10-15
6 2015-10-28	2015-10-31
6 2015-10-28	2015-10-29
7 2015-10-30	2015-10-31
