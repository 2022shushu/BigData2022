-- 4장. 데이터 제한과 정렬
-- 1. Where절 연습

-- 예제1 : 문자형 값 비교
select EMP_NAME 사원이름, ORG_CD 소속, position 직무, SALARY 연봉
from cslee.tb_emp
where position = '대리';

-- 예제2 : 숫자 비교
select count(*) from cslee.tb_emp;
select emp_name 사원이름, org_cd 소속, position 직무, salary 연봉
from cslee.tb_emp;

select emp_name 사원이름, org_cd 소속, position 직무, salary 연봉
from cslee.tb_emp
where SALARY >= 50000000;

-- 예제3 : 연산자 우선순위
select emp_name 사원이름, org_cd 소속, position 직책, salary 연봉
from cslee.tb_emp
where (org_cd = '08' or org_cd = '09' or org_cd = '10')
and position = '사원'
and salary >= 40000000
and salary <= 50000000;

-- 예제4 : 연산자 우선순위 (Between A and B 구문)
select emp_name 사원이름, org_cd 소속, position 직책, salary 연봉
from cslee.tb_emp
where org_cd in ('08','09','10')
and position = '사원'
and salary between 40000000 and 50000000;

select emp_name 사원이름, salary 연봉
from cslee.tb_emp
where salary between 40000000 and 50000000;

-- 예제5 : where 조건절 -in
select emp_name, org_cd, position 
from cslee.tb_emp
where org_cd  in ('06','07')
and position in ('팀장', '과장');

select emp_name, org_cd, position 
from cslee.tb_emp
where (org_cd, position)
in (('06', '팀장'), ('07', '과장'));

-- 예제6 : where 조건 - like 

--"김"씨 성을 가진 직원들의 정보를 조회하는 where절을 작성한다.
select emp_name 사원이름, org_cd 팀코드, position 직책, ent_date 입사일자
from cslee.tb_emp
where emp_name like '김%';

-- 이름의 두번째가 "승"인 임직원의 정보를 조회하라.
select emp_name 사원이름, org_cd 팀코드, position 직책, ent_date 입사일자
from cslee.tb_emp
where emp_name like '_승%';

-- 예제7 : where 조건 - is null
select emp_name 사원이름, org_cd 소속, position 직책, gender 성별
from cslee.tb_emp
where gender = null;

select emp_name 사원이름, org_cd 소속, position 직책, gender 성별
from cslee.tb_emp
where gender is null;

-- 예제8 : where 조건 - 부정연산자
-- 영업3팀 (10)의 사원중에서 '팀장'을 제외한 나머지 직원들의 자료를 찾는다.
select emp_name 사원이름, org_cd 소속, position 직책
from cslee.tb_emp
where org_cd = '10'
and not position = '팀장';

-- 소속이 NULL이 아닌 직원의 자료를 출력하라
select emp_name 사원이름, org_cd 소속, position 직책
from cslee.tb_emp
where org_cd is not null;


-- 2. Order by 정렬 연습하기
-- 예제9
select org_cd 부서, emp_name 사원이름, ent_date 입사일
from cslee.tb_emp
order by org_cd, ent_date desc;

select emp_name, emp_no, org_cd
from cslee.tb_emp
order by emp_name asc, emp_no asc, emp_no desc;

select emp_name 사원이름, emp_no 사원번호, org_cd 부서코드
from cslee.tb_emp
order by 사원이름, 사원번호, 부서코드 desc;

select emp_name, emp_no, org_cd
from cslee.tb_emp
order by 1 asc, 2 asc, 3 desc;

select emp_name 사원이름, emp_no 사원번호, org_cd 부서코드
from cslee.tb_emp
order by emp_name, 2, 부서코드 desc;

