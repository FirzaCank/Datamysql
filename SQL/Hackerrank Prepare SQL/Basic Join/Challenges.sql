/*
Julia asked her students to create some coding challenges.
Write a query to print the hacker_id, name, and the total number of challenges created by each student.
Sort your results by the total number of challenges in descending order.
If more than one student created the same number of challenges, then sort the result by hacker_id.
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created,
then exclude those students from the result.
*/


SELECT
    c.hacker_id, h.name, COUNT(c.challenge_id) c_count
FROM Hackers h
INNER JOIN Challenges c USING(hacker_id)
GROUP BY c.hacker_id, h.name
HAVING
    c_count = (SELECT MAX(t.cnt)
                FROM (SELECT
                        hacker_id, COUNT(*) cnt
                        FROM Challenges
                        GROUP BY hacker_id)t)
OR
    c_count IN (SELECT x.cnt
              FROM (SELECT
                    hacker_id, COUNT(*) cnt
                    FROM Challenges
                    GROUP BY hacker_id)x
              GROUP BY 1
              HAVING COUNT(1) = 1)

ORDER BY 3 DESC ,1;

OUTPUT SAMPLE DARI CONTOH DI BAWAH:

hacker_id name c_count
--------- ---- -------
12299	Rose	6
34856	Angela	6
79345	Frank	4
80491	Patrick	3
81041	Lisa	1

-----------------------------------------------------

EXPLANATION :

INPUT SAMPLE

TABLE hacker:
hacker_id name
--------- ----
12299	Rose
34856	Angela     
79345	Frank
80491	Patrick
81041	Lisa

TABLE challenge:
challenge_id hacker_id
--------- ---------
63963	81041
63117	79345
28225	34856
21989	12299
4653	12299
70070	79345
36905	34856
61136	80491
17234	12299
80308	79345
40510	34856
79820	80491
22720	12299
21394	12299
36261	34856
15334	12299
71435	79345
23157	34856
54102	34856
69065	80491

-------------------------------------------------------

select
  hacker_id, t.cnt
from (select
      hacker_id,
      count(*) cnt
      from challenge
      group by hacker_id)t
group by t.cnt
having count(t.cnt) = 1;

hacker_id cnt
--------- ---
81041	1
79345	4
80491	3

breakdown subquery :

select
      hacker_id, count(*) cnt
      from challenge
      group by hacker_id
      
hacker_id cnt
--------- ---
81041	1
79345	4
34856	6
12299	6
80491	3

----------------------------------------------

(SELECT
  MAX(temp1.cnt) max_cnt
from (SELECT
      hacker_id, COUNT(hacker_id) as cnt
      from challenge
      group by hacker_id) temp1);

max_cnt
------
6

breakdown subquery :

      SELECT
      hacker_id, COUNT(hacker_id) as cnt
      from challenge
      group by hacker_id;

hacker_id cnt
--------- ---
81041	1
79345	4
34856	6
12299	6
80491	3
