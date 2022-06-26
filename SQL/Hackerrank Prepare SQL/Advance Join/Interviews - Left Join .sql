/*
Samantha interviews many candidates from different colleges using coding challenges and contests.
Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions,
total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.
*/


select
    con.contest_id,
    con.hacker_id, 
    con.name, 
    sum(total_submissions), 
    sum(total_accepted_submissions), 
    sum(total_views), sum(total_unique_views)
from contests con 
join colleges col on con.contest_id = col.contest_id 
join challenges cha on  col.college_id = cha.college_id 
left join view_stats vs on cha.challenge_id = vs.challenge_id 
left join submission_stats ss on cha.challenge_id = ss.challenge_id
group by
    con.contest_id, con.hacker_id, con.name
having
    sum(total_submissions)!=0 and sum(total_accepted_submissions)!=0 and
    sum(total_views)!=0 and sum(total_unique_views)!=0
order by contest_id;
