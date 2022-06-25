/*
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
*/

SELECT f1.X, f1.Y
FROM Functions f1
INNER JOIN Functions f2 ON f1.X=f2.Y AND f1.Y=f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X;

SAMPLE INPUT :

X Y
- -
20	20          1
20	20          2
20	21          3
23	22          4
22	23          5
21	20          6

SAMPLE OUTPUT :
X Y
- -
20	20          1 DAN 2 SYMMETRIC PAIRS (SP)
20	21          3 DAN 6 SP
22	23          4 DAN 5 SP

______________________________________________________________
BREAKDOWN EXPLANATION :

1. SELF JOIN

select
	f1.X,
    f1.Y
FROM Functions f1
JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X;

X Y
- -
20	20
20	20
20	20
20	20
21	20
22	23
23	22
20	21




2. GROUP BY

select
	f1.X,
    f1.Y
FROM Functions f1
JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X
GROUP BY f1.X, f1.Y;

x y
- -
20	20
21	20
22	23
23	22
20	21



3. HAVING COUNT f1.X > 1, cari yang punya lebih dari 1 digabungin jadi 1

select
	f1.X,
    f1.Y
FROM Functions f1
INNER JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X) >1;

X Y
- -
20	20



4. HAVING f1.X < f1.Y, cari salah satu aja (sebenernya dibalik juga bisa). kenapa salah satu karena pasangan assymetric.

select
	f1.X,
    f1.Y
FROM Functions f1
INNER JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X
GROUP BY f1.X, f1.Y
HAVING f1.X < f1.Y;

X Y
- -
22 23
20 21
