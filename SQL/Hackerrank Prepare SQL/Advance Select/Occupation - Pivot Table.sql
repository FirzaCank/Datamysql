/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation.
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT
  MIN(Doctor) DOCTOR,
  MIN(Professor) PROFESSOR,
  MIN(Singer) SINGER,
  MIN(Actor) ACTOR
FROM (SELECT 
        CASE
            WHEN Occupation = 'Doctor' THEN (@r1:=@r1+1)
            WHEN Occupation = 'Professor' THEN (@r2:=@r2+1)
            WHEN Occupation = 'Singer' THEN (@r3:=@r3+1)
            WHEN Occupation = 'Actor' THEN (@r4:=@r4+1)
        END AS rownumber,
        CASE
            WHEN Occupation = 'Doctor' THEN Name END AS 'Doctor',
        CASE
            WHEN Occupation = 'Professor' THEN Name END AS 'Professor',
        CASE
            WHEN Occupation = 'Singer' THEN Name END AS 'Singer',
        CASE
            WHEN Occupation = 'Actor' THEN Name END AS 'Actor'
    FROM OCCUPATIONS
    ORDER BY Name) temp
GROUP BY rownumber;


SAMPLE OUTPUT :

DOCTOR    PROFESSOR SINGER ACTOR
------    --------- ------ -----
Jenny	    Ashely	  Meera	Jane
Samantha	Christeen	Priya	Julia
NULL	    Ketty		  NULL  Maria
______________________________________________________________________________

BREAKDOWN SYNTAX

INPUT SAMPLE :

Name  Occupation
----  ----------
Samantha	Doctor
Julia	Actor
Maria	Actor
Meera	Singer
Ashely	Professor
Ketty	Professor
Christeen	Professor
Jane	Actor
Jenny	Doctor
Priya	Singer

1. WITHOUT SELECT-MIN, ORDER BY, AND GROUP BY

SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT
    CASE
        WHEN Occupation = 'Doctor' THEN (@r1:=@r1+1)
        WHEN Occupation = 'Professor' THEN (@r2:=@r2+1)
        WHEN Occupation = 'Singer' THEN (@r3:=@r3+1)
        WHEN Occupation = 'Actor' THEN (@r4:=@r4+1)
    END AS rownumber,
    CASE
        WHEN Occupation = 'Doctor' THEN Name END AS 'Doctor',
    CASE
        WHEN Occupation = 'Professor' THEN Name END AS 'Professor',
    CASE
        WHEN Occupation = 'Singer' THEN Name END AS 'Singer',
    CASE
        WHEN Occupation = 'Actor' THEN Name END AS 'Actor'
FROM OCCUPATIONS;

rownumber Doctor Professor Singer Actor
--------  -----  --------- ------ -----
1         Samantha  NULL   NULL   NULL
1         NULL   NULL      NULL   Julia
2         NULL   NULL      NULL   Maria
1	        NULL   NULL      Merra  NULL
1				  NULL   Ashely    NULL   NULL
2				  NULL   Ketty     NULL   NULL
3			    NULL   Christeen NULL   NULL	
3				  NULL   NULL      NULL   Jane
2				  Jenny  NULL      NULL   NULL				
2         NULL   NULL      Priya  NULL


2. WITH ORDER BY BUT WITHOUT SELECT-MIN AND GROUP BY

rownumber Doctor Professor Singer Actor
--------  -----  --------- ------ -----
1		      NULL   Ashely    NULL   NULL		
2		      NULL   Christeen NULL   NULL	
1				  NULL   NULL      NULL   Jane 
1	        Jenny  NULL      NULL   NULL			
2				  NULL   NULL      NULL   Julia
3		      NULL   Ketty     NULL   NULL		
3				  NULL   NULL      NULL   Maria
1			    NULL   NULL      Merra  NULL	
2			    NULL   NULL      Priya  NULL	
2	        Samantha  NULL   NULL   NULL

3. WITH ORDER BY AND SELECT-MIN BUT WITHOUT GROUP BY

DOCTOR    PROFESSOR SINGER ACTOR
------    --------- ------ -----
Jenny	    Ashely	  Meera	  Jane


4. WITH GROUP BY = SAMPLE OUTPUT DI ATAS

DOCTOR    PROFESSOR SINGER ACTOR
------    --------- ------ -----
Jenny	    Ashely	  Meera	Jane
Samantha	Christeen	Priya	Julia
NULL	    Ketty		  NULL  Maria
