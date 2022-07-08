
-- p167
select count(*) "전체건수"
	 , count(position) "직책건수"
	 , count(distinct position) "직책종류"
	 , max(salary) "최대"
	 , min(salary) "최소"
	 , avg(salary) "평균"
from cslee.tb_emp;

-- Group by 절
-- p169
SELECT POSITION "직책",
COUNT(*) "인원수",
MIN(SALARY) "최소",
MAX(SALARY) "최대",
AVG(SALARY) "평균"
FROM cslee.TB_EMP
GROUP BY POSITION;

-- Having 절
select org_cd "부서",
count(*) "인원수",
avg(salary) "평균"
from cslee.tb_emp
group by org_cd
having count(*) >= 4;

select org_cd "부서",
max(salary) "최대"
from cslee.tb_emp
group by org_cd 
having min(salary) <= 40000000;

select org_cd, position, avg(salary)
from cslee.tb_emp
where position in ('과장', '대리', '사원')
group by org_cd, position;

select org_cd
, avg(case position when '과장' then salary end) "과장"
, avg(case position when '대리' then salary end) "대리"
, avg(case position when '사원' then salary end) "사원"
from cslee.TB_EMP
group by org_cd;

select org_cd,
sum (coalesce ((case position when '팀장' then 1 end), 0)) "팀장",
sum (coalesce ((case position when '팀장' then 1 end), 0)) "과장",
sum (coalesce ((case position when '팀장' then 1 end), 0)) "대리",
sum (coalesce ((case position when '팀장' then 1 end), 0)) "사원"
from cslee.tb_emp
group by org_cd

select org_cd,
coalesce (sum(case position when '팀장' then 1 end), 0) "팀장",
coalesce (sum(case position when '팀장' then 1 end), 0) "과장",
coalesce (sum(case position when '팀장' then 1 end), 0) "대리",
coalesce (sum(case position when '팀장' then 1 end), 0) "사원"
from cslee.tb_emp
group by org_cd
