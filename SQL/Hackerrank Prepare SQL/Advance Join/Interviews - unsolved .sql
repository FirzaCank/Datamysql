/*
Samantha interviews many candidates from different colleges using coding challenges and contests.
Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions,
total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.
*/


SELECT * FROM Contests;
SELECT * FROM Colleges;
SELECT * FROM Challenges;
SELECT * FROM View_Stats;
SELECT * FROM Submission_Stats;

select
	c.contest_id as con,
    c.hacker_id as ha,
    c.name as na,
    sum(m.total_submissions),
    sum(m.total_accepted_submissions),
    sum(m.total_views),
    sum(m.total_unique_views)
from Contests c 
join Colleges l on c.contest_id=l.contest_id
join Challenges h on h.college_id=l.college_id
join (select
		challenge_id,
        total_submissions,
        total_accepted_submissions,
        0 as total_views,
        0 as total_unique_views
	from Submission_Stats
    union all 
    select
		challenge_id,
        0,
        0,
        total_views,
        total_unique_views 
	from View_Stats) m 
on h.challenge_id=m.challenge_id
group by c.contest_id,c.hacker_id,c.name
having
	sum(m.total_submissions) !=0 and sum(m.total_accepted_submissions)!=0
    and sum(m.total_views)!=0 and sum(m.total_unique_views)!=0
order by c.contest_id;
