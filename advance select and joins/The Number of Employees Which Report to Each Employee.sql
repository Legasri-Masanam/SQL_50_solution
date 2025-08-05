# Write your MySQL query statement below
select employee_id , name , count(reports_to) as reports_count ,round(avg(age)) as average_age 
from Employees 
where reports_to  = NULL and  count(reports_to) > 1
group by employee_id  ,names