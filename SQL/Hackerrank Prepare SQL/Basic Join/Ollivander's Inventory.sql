/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power.
If more than one wand has same power, sort the result in order of descending age.
*/

select 
    w.id,
    p.age,
    w.coins_needed,
    w.power
from Wands as w 
join Wands_Property as p on (w.code = p.code)
where 
    p.is_evil = 0 
and 
    w.coins_needed = 
                (select min(coins_needed)
                 from Wands as w1
                 join Wands_Property as p1 on (w1.code = p1.code)
                 where w1.power = w.power and p1.age = p.age)
order by w.power desc, p.age desc
