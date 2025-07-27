# Write your MySQL query statement below

select round(count(distinct a1.player_id )/(select count(distinct player_id ) from Activity ),2 ) as fraction 
from Activity a1
join (
    select player_id , min(event_date) as firstlogin
    from Activity
    group by player_id
) as a2
on a1.player_id = a2.player_id
and datediff(a1.event_date ,a2.firstlogin) = 1