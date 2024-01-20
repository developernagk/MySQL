# 조인
-- 내부 조인
use market_db;
select * from buy inner join member on buy.mem_id = member.mem_id where buy.mem_id = 'GRL';
select * from buy inner join member on buy.mem_id = member.mem_id;
select mem_id, mem_name, prod_name, addr, cancat(phone1, phone2) '연락처' from buy inner join member on buy.mem_id = member.mem_id;
-- > mem_id가 불확실하다는 에러
select buy.mem_id, mem_name, prod_name, addr, concat(phone1, phone2) '연락처' from buy inner join member on buy.mem_id = member.mem_id;
select buy.mem_id, member.mem_name, buy.prod_name, member.addr, concat(member.phone1, member.phone2) '연락처' from buy inner join member on buy.mem_id = member.mem_id;
select B.mem_id, M.mem_name, B.prod_name, M.addr, concat(M.phone1, M.phone2) '연락처' from buy B inner join member M on B.mem_id = M.mem_id;
select M.mem_id, M.mem_name, B.prod_name, M.addr from buy B inner join member M on B.mem_id = M.mem_id order by M.mem_id;
-- 중복된 결과 1개만 출력
select distinct M.mem_id, M.mem_name, M.addr from buy B inner join member M on B.mem_id = M.mem_id order by M.mem_id;
-- 외부 조인
select M.mem_id, M.mem_name, B.prod_name, M.addr from member M left outer join buy B on M.mem_id = B.mem_id order by M.mem_id;
select M.mem_id, M.mem_name, B.prod_name, M.addr from buy B right outer join member M on M.mem_id = B.mem_id order by M.mem_id;
select distinct M.mem_id, B.prod_name, M.mem_name, M.addr from member M left outer join buy B on M.mem_id = B.mem_id where B.prod_name is null order by M.mem_id;
-- 상호 조인
select * from buy cross join member;
select count(*) "데이터 개수" from sakila.inventory cross join world.city;
create table cross_table select * from sakila.actor -- 200건
cross join world.country; -- 239건
select * from cross_table limit 5;
-- 자체 조인
use market_db;
create table emp_table (emp char(4), manager char(4), phone varchar(8));
insert into emp_table values('대표', null, '0000');
insert into emp_table values('영업이사', '대표', '1111');
insert into emp_table values('관리이사', '대표', '2222');
insert into emp_table values('정보이사', '대표', '3333');
insert into emp_table values('영업과장', '영업이사', '1111-1');
insert into emp_table values('경리부장', '관리이사', '2222-1');
insert into emp_table values('인사부장', '관리이사', '2222-2');
insert into emp_table values('개발팀장', '정보이사', '3333-1');
insert into emp_table values('개발주임', '정보이사', '3333-1-1');
select A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처" from emp_table A inner join emp_table B on A.manager = B.emp where A.emp = "경리부장";