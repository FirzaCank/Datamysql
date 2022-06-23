/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard!
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
Order your output in descending order by the total number of challenges in which the hacker earned a full score.
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/

/*
SQL Solution, hope it helps. The main thing is using having

1. join tables together, to make a master table which contains all the info

2. Filter logic, to eliminate submissions that did not earn full score */ where dif.score = sub.score

3. further eliminate hackers who only had one full-score submission */ group by sub.hacker_id, hak.name having count(sub.score) > 1

4. display by the order stated in the proble, */ order by count(sub.score) desc, sub.hacker_id
*/

SELECT
    h.hacker_id,
    h.name
FROM Submissions s
INNER JOIN Challenges c ON s.challenge_id = c.challenge_id
INNER JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
INNER JOIN Hackers h ON s.hacker_id = h.hacker_id
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1 
ORDER BY
  COUNT(s.challenge_id) DESC,
  h.hacker_id ASC;
