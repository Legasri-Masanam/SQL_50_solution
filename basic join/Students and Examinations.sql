select s.student_id ,s.student_name ,su.subject_name, count(e.student_id ) as attended_exams  
from Students s
cross join Subjects su
left join Examinations e
on s. student_id  =e.student_id and
su.subject_name = e.subject_name

group by s.student_id ,s.student_name ,su.subject_name
order by s.student_id ,s.student_name ,su.subject_name