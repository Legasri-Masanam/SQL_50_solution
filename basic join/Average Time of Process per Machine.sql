#solution 1
SELECT  a1.machine_id , ROUND(AVG(a2.timestamp - a1.timestamp),3)AS processing_time  
FROM Activity a1 
JOIN Activity a2
ON a1.process_id = a2.process_id
AND a1.machine_id = a2.machine_id
AND a1.timestamp< a2.timestamp
GROUP BY a1.machine_id;



#solution 2
with processing as (select a1.machine_id  ,a1.process_id ,a2.timestamp - a1.timestamp as processing_time 
from  Activity a1
join Activity a2
on a1.machine_id = a2.machine_id
and a1.process_id = a2.process_id
and a1.activity_type = 'start'
and a2.activity_type = 'end')
select machine_id ,round(avg(processing_time),3) as processing_time
from processing
group by machine_id