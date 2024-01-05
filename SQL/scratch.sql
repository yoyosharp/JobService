use prj321_asm02;
select * from role;
select * from category;
select * from type;

select * from cv;

select user.id as uid, user.email as email, role_name as role
from user join authorities on user.id = authorities.user_id
join role on role.id = authorities.role_id; 
select * from user;
select * from company;
select * from recruitment;
select * from applied_job;

select distinct c.id, c.name, count(r.id) as recruitment_count, sum(r.quantity) as total_job_count, count(aj.id) as total_applied
from company c left join recruitment r on c.id = r.company_id
join applied_job aj on aj.recruitment_id = r.id
group by c.id
order by count(r.id) desc, sum(r.quantity) desc, count(aj.id) desc;


