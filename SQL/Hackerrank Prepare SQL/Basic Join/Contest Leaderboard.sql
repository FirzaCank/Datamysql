/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges.
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.
Exclude all hackers with a total score of 0 from your result.
*/












---------------------------------------------
SAMPLE INPUT :

submission_id hacker_id challenge_id score
------------- --------- ------------ -----
67194	74842	63132	76
64479	74842	19797	98
40742	26071	49593	20
17513	4806	49593	32
69846	80305	19797	19
41002	26071	89343	36
52826	49438	49593	9
31093	26071	19797	2
81614	84072	49593	100
44829	26071	89343	7
75147	80305	49593	48
14115	4806	49593	76
6943	4071	19797	95
12855	4806	25917	13
73343	80305	49593	42
84264	84072	63132	0
9951	4071	49593	43
45104	49438	25917	34
53795	74842	19797	5
26363	26071	19797	29
10063	4071	49593	96

COMPARISON BETWEEN GROUP BY SYNTAX :


CONTOH 1 : (ini bener sebelum di group by untuk lihat expanded view)  ✔ 
SELECT hacker_id, challenge_id, score
FROM Submissions
ORDER BY hacker_id;

hacker_id challenge_id score
--------- ------------ -----
4071	19797	95
4071	49593	43
4071	49593	96
4806	49593	32
4806	49593	76
4806	25917	13
26071	49593	20
26071	89343	36
26071	19797	2
26071	89343	7
26071	19797	29
49438	49593	9
49438	25917	34
74842	63132	76
74842	19797	98
74842	19797	5
80305	19797	19
80305	49593	48
80305	49593	42
84072	49593	100
84072	63132	0



CONTOH 2 : (ini bener)✔
select hacker_id, challenge_id,  max(score) as score
from submissions
group by challenge_id, hacker_id   <-------- group by oleh 2 kolom ✔
ORDER BY hacker_id;

hacker_id challenge_id score
--------- ------------ -----
4071	19797	95
4071	49593	96
4806	49593	76
4806	25917	13
26071	49593	20
26071	89343	36
26071	19797	29
49438	49593	9
49438	25917	34
74842	63132	76
74842	19797	98
80305	19797	19
80305	49593	48
84072	49593	100
84072	63132	0



CONTOH 3:
select hacker_id, challenge_id,  max(score) as score
from submissions
group by challenge_id <-------- group by oleh challenge_ix  X
ORDER BY hacker_id;

hacker_id challenge_id score
--------- ------------ -----
4806	25917	34
26071	49593	100
26071	89343	36
74842	63132	76
74842	19797	98



CONTOH 4 :
select hacker_id, challenge_id,  max(score) as score
from submissions
group by hacker_id
ORDER BY hacker_id;

hacker_id challenge_id score
--------- ------------ -----
4071	19797	96
4806	49593	76
26071	49593	36
49438	49593	34
74842	63132	98
80305	19797	48
84072	49593	100
