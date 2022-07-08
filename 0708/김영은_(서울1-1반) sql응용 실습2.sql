-- 교재 p154
-- 주수 구하기
select emp_name, to_char((current_timestamp - ent_date), 'w') weeks
from cslee.tb_emp
where org_cd = '10';

-- 교재 p156
-- to_Char 구문
select emp_name, ent_date,
	to_char(ent_date, 'yyyy') 입사년,
	to_char(ent_date, 'MM') 입사월,
	to_char(ent_date, 'DD') 입사일
from cslee.tb_emp;

-- Extract 구문
select emp_name, ent_date,
extract('year' from ent_date) 입사년,
extract('month' from ent_date) 입사월,
extract('day' from ent_date) 입사일
from cslee.tb_emp;

-- 변환함수 (명시적 데이터 유형 변환)
select to_date('05 Dec 2000', 'DD Mon YYYY');
select to_number('12,454.8-', '99G999D9S');
select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

-- 변환함수 전체 (예) 교재 p158
select emp_name,
	case when salary > 50000000
	then salary
	else 50000000
	end as revised_salary
from cslee.tb_emp;

-- 교재 p159 실습
select org_name,
case org_name
when '영업1팀' then '지사'
when '영업2팀' then '지사'
when '영업3팀' then '지사'
when '경영관리팀' then '본사'
else '지점'
end as AREA
from cslee.tb_org;

-- 교재 p160
-- case문
select emp_name,
		case when salary >= 90000000 then 'high'
			 when salary >= 60000000 then 'mid'
			 else 'low'
		end  as salary_grade
from cslee.tb_emp;

-- 중첩 Case문
select emp_name, salary,
	   case when salary >= 50000000
	             then 20000000
	        else (case when salary >= 20000000
	        				then 10000000
	        		   else salary * 0.5
	        	  end)
	   end as bonus
from cslee.tb_emp;

-- Null관련 함수 p162
-- coalesce 함수
select emp_name, position,
-- 		NVL(POSITION, '없음'), -- oracle null 체크함수
	   coalesce(position, '없음')
from cslee.tb_emp;

-- case 함수
select emp_name, position,
	   case when position is null
	then '없음'
		  else position
	 end as 직책
from cslee.tb_emp

-- null과 공집합 p163
select coalesce(salary, 0) SAL
from cslee.tb_emp
where emp_name = '김태진';

select max(salary) SAL
from cslee.tb_emp
where emp_name = '김태진';

select coalesce(max(salary), 9999) SAL
from cslee.tb_emp
where emp_name = '김태진';