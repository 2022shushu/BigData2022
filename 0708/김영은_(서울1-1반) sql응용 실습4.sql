
-- Equi Join 실습
-- 예제. 사원 테이블과 조직 테이블의 조인 SQL
select tb_emp.emp_name, tb_emp.org_cd,
tb_org.org_cd, tb_org.org_name
from cslee.tb_emp, cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

-- 예제. 사원이름, 소속부서코드, 부서명 (조직명), 직책 출력
select tb_emp.emp_no,
tb_emp.emp_name,
tb_emp.org_cd,
tb_org.org_name,
tb_emp.position
from cslee.tb_emp,
cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

-- Alias 사용
select e.emp_no,
e.emp_name,
e.org_cd,
o.org_name,
e.position
from cslee.tb_emp as E,
cslee.tb_org as O
where e.org_cd = o.org_cd
and e.position = '팀장'
order by o.org_name;

-- 예제. 계좌번호, 고객명, 상품명, 계약금액, 관리자명 출력
select a.accno,
c.cust_name,
p.prod_name,
a.cont_amt,
e.emp_name
from cslee.tb_accnt A, cslee.tb_cust c, cslee.tb_prod p, cslee.tb_emp e
where a.cust_no = c.cust_no
and a.prod_cd = p.prod_cd
and a.manager = e.emp_no;

-- 예제. 사원별 급여와 어느 등급에 속하는지 알고 싶다는 요구사항에 대한 Non EQUI JOIN
select e.emp_name 사원명,
e.salary 연봉,
s.grade 급여등급
from cslee.tb_emp e, cslee.tb_grade s 
where e.salary 
between s.low_sal and s.high_sal;

-- 표준 조인 (ANSI 표현법)
-- Inner Join
-- 예제. 사원 번호와 사원 이름, 소속부서와 소속부서 이름 찾기
-- (1) WHERE 절 JOIN 조건
select EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
from CSLEE.TB_EMP EMP, CSLEE.TB_ORG ORG
where EMP.ORG_CD = ORG.ORG_CD;

-- (2) FROM 절 JOIN 조건
select emp.emp_no, emp.emp_name, org.org_name
from cslee.tb_emp emp
inner join cslee.tb_org org
on emp.org_cd = org.org_cd;

-- (3) INNER 키워드 생략
select emp.emp_no, emp.emp_name, org.org_name
from cslee.tb_emp emp
join cslee.tb_org org
on emp.org_cd = org.org_cd;

-- FROM 절 JOIN 조건
-- 예제. 계좌 테이블에서 계좌번호와 고객번호, 고객의 명을 고객테이블과 조인하여 찾아보기
select acc.accno, acc.cust_no, cust.cust_name
from cslee.tb_accnt acc
	   inner join cslee.tb_cust cust
on (cust.cust_no = acc.cust_no);

-- 예제. 조직코드 10인 부서의 소속 사원 이름 및 소속 부서 코드, 부서 코드, 부서 이름 찾아보기
select e.emp_name, e.org_cd, o.org_cd, o.org_name
from cslee.tb_emp e
join cslee.tb_org o
  on (e.org_cd = o.org_cd)
where e.org_cd = '10';

-- ON조건절 - 다중조인
-- (1) WHERE절 JOIN 조건
select a.accno 계좌번호, c.cust_name 고객명, p.prod_name 상품명,
a.cont_amt 계약금액, e.emp_name 담당자명
from cslee.tb_accnt a, cslee.tb_cust c, cslee.tb_prod p, cslee.tb_emp e
where a.cust_no  = c.cust_no
and a.prod_cd = p.prod_cd 
and a.manager = e.emp_no;

-- (2) ON절 JOIN 조건
select a.accno 계좌번호, c.cust_name 고객명, p.prod_name 상품명,
a.cont_amt 계약번호, e.emp_name 담당자명
from cslee.tb_accnt a 
inner join cslee.tb_cust c on a.cust_no = c.cust_no
inner join cslee.tb_prod p on a.prod_cd = p.prod_cd
inner join cslee.tb_emp e on a.manager = e.emp_no;

-- CROSS 조인
select count(emp_name) from cslee.tb_emp;
select count(org_name) from cslee.tb_org;

select e.emp_name, o.org_name
from cslee.tb_emp e cross join cslee.tb_org o
order by emp_name;

select count(e.emp_name)
from cslee.tb_emp e cross join cslee.tb_org o;

-- Left Outer Join
-- 예제. 사원과 조직을 JOIN하되 부서배정이 안된 사원 정보도 같이 출력하기
select e.emp_no 사번, e.emp_name 사원명,
e.position 직책, o.org_name 부서명
from cslee.tb_emp e left outer join cslee.tb_org o 
on e.org_cd = o.org_cd 
where e.position = '사원';

-- Right Outer Join
-- 예제. 이전 예제에서 LEFT JOIN을 OUTER JOIN으로 표현
select e.emp_no 사번, e.emp_name 사원명, e.position 직책, o.org_name 부서명
from cslee.tb_org o right outer join cslee.tb_emp e
on e.org_cd = o.org_cd 
where e.position = '사원';

-- Full Outer Join
select a.org_cd, a.org_name, b.org_cd, b.org_name
from cslee.tb_org a full outer join cslee.tb_org b
on a.org_cd = b.org_cd;

select a.org_cd, a.org_name, b.org_cd, b.org_name
from cslee.tb_org a left outer join cslee.tb_org b 
on a.org_cd = b.org_cd 
union 
select a.org_cd, a.org_name, b.org_cd, b.org_name 
from cslee.tb_org a right outer join cslee.tb_org b 
on a.org_cd = b.org_cd

