# 뷰
use market_db;
create view v_member as select mem_id, mem_name, addr from member;
select * from v_member;
select mem_name, addr from v_member where addr in ('서울', '경기');
select B.mem_id, M.mem_name, B.prod_name, M.addr, concat(M.phone1, M.phone2) '연락처' from buy B inner join member M on B.mem_id = M.mem_id;
create view v_memberbuy as select B.mem_id, M.mem_name, B.prod_name, M.addr, concat(M.phone1, M.phone2) '연락처' from buy B inner join member M on B.mem_id = M.mem_id;
select * from v_memberbuy where mem_name = '블랙핑크';

use market_db;
create view v_viewtest1 as select B.mem_id 'Member ID', M.mem_name as 'Member Name', B.prod_name "Product Name", concat(M.phone1, M.phone2) as "Office Phone" from buy B inner join member M on B.mem_id = M.mem_id;
select distinct `Member ID`, `Member Name` from v_viewtest1;
alter view v_viewtest1 as select B.mem_id '회원 아이디', M.mem_name as '회원 이름', B.prod_name "제품 이름", concat(M.phone1, M.phone2) as "연락처" from buy B inner join member M on B.mem_id = M.mem_id;
select distinct `회원 아이디`, `회원 이름` from v_viewtest1;
drop view v_viewtest1;

use market_db;
create or replace view v_viewtest2 as select mem_id, mem_name, addr from member;
describe v_viewtest2;
describe member;
show create view v_viewtest2;
update v_member set addr = '부산' where mem_id='BLK';
insert into v_member(mem_id, mem_name, addr) values('BTS', '방탄소년단', '경기');
-- > v_member가 member 테이블에서 mem_member 열을 참조하고 있지 않기 때문에 값을 입력할 방법이 없음
create view v_height167 as select * from member where height >= 167;
select * from v_height167;
delete from v_height167 where height < 167;
insert into v_height167 values('TRA', '티아라', 6, '서울', null, null, 159, '2005-01-01');
select * from v_height167;
alter view v_height167 as select * from member where height >= 167 with check option;
insert into v_height167 values('TOB', '텔레토비', 4, '영국', null, null, 140, '1995-01-01');
-- > with check option을 통해 뷰에 설정된 값의 범위가 벗어나는 값은 입력되지 않음
drop table if exists buy, member;
select * from v_height167; -- 참조하는 테이블이 없기 때문에 조회할 수 없음
check table v_height167;