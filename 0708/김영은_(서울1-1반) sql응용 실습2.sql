-- ���� p154
-- �ּ� ���ϱ�
select emp_name, to_char((current_timestamp - ent_date), 'w') weeks
from cslee.tb_emp
where org_cd = '10';

-- ���� p156
-- to_Char ����
select emp_name, ent_date,
	to_char(ent_date, 'yyyy') �Ի��,
	to_char(ent_date, 'MM') �Ի��,
	to_char(ent_date, 'DD') �Ի���
from cslee.tb_emp;

-- Extract ����
select emp_name, ent_date,
extract('year' from ent_date) �Ի��,
extract('month' from ent_date) �Ի��,
extract('day' from ent_date) �Ի���
from cslee.tb_emp;

-- ��ȯ�Լ� (����� ������ ���� ��ȯ)
select to_date('05 Dec 2000', 'DD Mon YYYY');
select to_number('12,454.8-', '99G999D9S');
select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

-- ��ȯ�Լ� ��ü (��) ���� p158
select emp_name,
	case when salary > 50000000
	then salary
	else 50000000
	end as revised_salary
from cslee.tb_emp;

-- ���� p159 �ǽ�
select org_name,
case org_name
when '����1��' then '����'
when '����2��' then '����'
when '����3��' then '����'
when '�濵������' then '����'
else '����'
end as AREA
from cslee.tb_org;

-- ���� p160
-- case��
select emp_name,
		case when salary >= 90000000 then 'high'
			 when salary >= 60000000 then 'mid'
			 else 'low'
		end  as salary_grade
from cslee.tb_emp;

-- ��ø Case��
select emp_name, salary,
	   case when salary >= 50000000
	             then 20000000
	        else (case when salary >= 20000000
	        				then 10000000
	        		   else salary * 0.5
	        	  end)
	   end as bonus
from cslee.tb_emp;

-- Null���� �Լ� p162
-- coalesce �Լ�
select emp_name, position,
-- 		NVL(POSITION, '����'), -- oracle null üũ�Լ�
	   coalesce(position, '����')
from cslee.tb_emp;

-- case �Լ�
select emp_name, position,
	   case when position is null
	then '����'
		  else position
	 end as ��å
from cslee.tb_emp

-- null�� ������ p163
select coalesce(salary, 0) SAL
from cslee.tb_emp
where emp_name = '������';

select max(salary) SAL
from cslee.tb_emp
where emp_name = '������';

select coalesce(max(salary), 9999) SAL
from cslee.tb_emp
where emp_name = '������';