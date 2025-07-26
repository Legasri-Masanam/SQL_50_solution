
with ccount  as (select s.user_id , count(c.user_id ) as total_request,
sum(case when action = 'confirmed' then 1 else 0 end) as confirmed_msg

from Signups s
left join Confirmations  c
on s.user_id = c.user_id
group by s.user_id)
select user_id ,ifnull(round(confirmed_msg/total_request , 2),0) as confirmation_rate 
from ccount;