-- 4장. 데이터 제한과 정렬
-- 1. Where절 연습

-- 예제1 : 문자형 값 비교
select EMP_NAME 사원이름, ORG_cd 소속, position 직무, SALARY 연봉
from cslee.tb_emp
where position = '대리';

-- 현재 시간 조회하는 방법
select now();

-- 현재 시간보다 하루 전 날짜 구하는 방법
select now(), now()::date -'1 day'::interval;

-- 현재 타임존 조회하는 방법
show timezone;

-- 시스템 일자를 조회하는 방법
select current_date, current_time, timeofday();
select now(), current_timestamp, timestamp 'now';

-- 날짜에서 연도를 추출하는 방법
select date_part('year', timestamp '2020-07-30 20:38:40');
select date_part('year', current_timestamp);

select extract('isoyear' from date '2006-01-01');
select extract('isoyear' from current_timestamp);

select date_trunc('year', timestamp '2020-07-30 20:38:40');
select date_trunc('year', current_timestamp);

-- 날짜에서 월을 추출하는 방법
select date_part('month', timestamp '2020-07-30 20:38:40');
select date_part('month', current_timestamp);

select extract('month' from timestamp '2020-07-20 20:38:40');
select extract('month' from interval '2 years 3 months');
select extract('month' from interval '2 years 13 months');

select date_trunc('month', timestamp '2020-07-30 20:38:40');

-- 날짜에서 일을 추출하는 방법
select date_part('day', timestamp '2020-07-30 20:38:40');
select date_trunc('day', timestamp '2020-07-30 20:38:40');

-- 시간에서 시를 추출하는 방법
select date_part('hour', timestamp '2020-07-30 20:38:40');
select date_part('hour', interval '4 hours 3 minutes');
select date_trunc('hour', timestamp '2020-07-30 20:38:40');

-- 시간에서 분을 추출하는 방법
select date_part('minute', timestamp '2020-07-30 20:38:40');
select date_trunc('minute', timestamp '2020-07-30 20:38:40');

-- 시간에서 초를 추출하는 방법
select date_part('second', timestamp '2020-07-30 20:38:40');
select extract('second' from time '17:12:28.5');
select date_trunc('second', timestamp '2020-07-30 20:38:40');