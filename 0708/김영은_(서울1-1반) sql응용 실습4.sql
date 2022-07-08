
-- Equi Join �ǽ�
-- ����. ��� ���̺�� ���� ���̺��� ���� SQL
select tb_emp.emp_name, tb_emp.org_cd,
tb_org.org_cd, tb_org.org_name
from cslee.tb_emp, cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

-- ����. ����̸�, �ҼӺμ��ڵ�, �μ��� (������), ��å ���
select tb_emp.emp_no,
tb_emp.emp_name,
tb_emp.org_cd,
tb_org.org_name,
tb_emp.position
from cslee.tb_emp,
cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

-- Alias ���
select e.emp_no,
e.emp_name,
e.org_cd,
o.org_name,
e.position
from cslee.tb_emp as E,
cslee.tb_org as O
where e.org_cd = o.org_cd
and e.position = '����'
order by o.org_name;

-- ����. ���¹�ȣ, ����, ��ǰ��, ���ݾ�, �����ڸ� ���
select a.accno,
c.cust_name,
p.prod_name,
a.cont_amt,
e.emp_name
from cslee.tb_accnt A, cslee.tb_cust c, cslee.tb_prod p, cslee.tb_emp e
where a.cust_no = c.cust_no
and a.prod_cd = p.prod_cd
and a.manager = e.emp_no;

-- ����. ����� �޿��� ��� ��޿� ���ϴ��� �˰� �ʹٴ� �䱸���׿� ���� Non EQUI JOIN
select e.emp_name �����,
e.salary ����,
s.grade �޿����
from cslee.tb_emp e, cslee.tb_grade s 
where e.salary 
between s.low_sal and s.high_sal;

-- ǥ�� ���� (ANSI ǥ����)
-- Inner Join
-- ����. ��� ��ȣ�� ��� �̸�, �ҼӺμ��� �ҼӺμ� �̸� ã��
-- (1) WHERE �� JOIN ����
select EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
from CSLEE.TB_EMP EMP, CSLEE.TB_ORG ORG
where EMP.ORG_CD = ORG.ORG_CD;

-- (2) FROM �� JOIN ����
select emp.emp_no, emp.emp_name, org.org_name
from cslee.tb_emp emp
inner join cslee.tb_org org
on emp.org_cd = org.org_cd;

-- (3) INNER Ű���� ����
select emp.emp_no, emp.emp_name, org.org_name
from cslee.tb_emp emp
join cslee.tb_org org
on emp.org_cd = org.org_cd;

-- FROM �� JOIN ����
-- ����. ���� ���̺��� ���¹�ȣ�� ����ȣ, ���� ���� �����̺�� �����Ͽ� ã�ƺ���
select acc.accno, acc.cust_no, cust.cust_name
from cslee.tb_accnt acc
	   inner join cslee.tb_cust cust
on (cust.cust_no = acc.cust_no);

-- ����. �����ڵ� 10�� �μ��� �Ҽ� ��� �̸� �� �Ҽ� �μ� �ڵ�, �μ� �ڵ�, �μ� �̸� ã�ƺ���
select e.emp_name, e.org_cd, o.org_cd, o.org_name
from cslee.tb_emp e
join cslee.tb_org o
  on (e.org_cd = o.org_cd)
where e.org_cd = '10';

-- ON������ - ��������
-- (1) WHERE�� JOIN ����
select a.accno ���¹�ȣ, c.cust_name ����, p.prod_name ��ǰ��,
a.cont_amt ���ݾ�, e.emp_name ����ڸ�
from cslee.tb_accnt a, cslee.tb_cust c, cslee.tb_prod p, cslee.tb_emp e
where a.cust_no  = c.cust_no
and a.prod_cd = p.prod_cd 
and a.manager = e.emp_no;

-- (2) ON�� JOIN ����
select a.accno ���¹�ȣ, c.cust_name ����, p.prod_name ��ǰ��,
a.cont_amt ����ȣ, e.emp_name ����ڸ�
from cslee.tb_accnt a 
inner join cslee.tb_cust c on a.cust_no = c.cust_no
inner join cslee.tb_prod p on a.prod_cd = p.prod_cd
inner join cslee.tb_emp e on a.manager = e.emp_no;

-- CROSS ����
select count(emp_name) from cslee.tb_emp;
select count(org_name) from cslee.tb_org;

select e.emp_name, o.org_name
from cslee.tb_emp e cross join cslee.tb_org o
order by emp_name;

select count(e.emp_name)
from cslee.tb_emp e cross join cslee.tb_org o;

-- Left Outer Join
-- ����. ����� ������ JOIN�ϵ� �μ������� �ȵ� ��� ������ ���� ����ϱ�
select e.emp_no ���, e.emp_name �����,
e.position ��å, o.org_name �μ���
from cslee.tb_emp e left outer join cslee.tb_org o 
on e.org_cd = o.org_cd 
where e.position = '���';

-- Right Outer Join
-- ����. ���� �������� LEFT JOIN�� OUTER JOIN���� ǥ��
select e.emp_no ���, e.emp_name �����, e.position ��å, o.org_name �μ���
from cslee.tb_org o right outer join cslee.tb_emp e
on e.org_cd = o.org_cd 
where e.position = '���';

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

