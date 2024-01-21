use market_db;
select * from member;
show index from member;
show table status like 'member';
create index idx_member_addr on member(addr);
show index from member;
show table status like 'member';
analyze table member;
show table status like 'member';
create unique index idx_member_mem_number on member(mem_number); -- 중복된 값이 있기 때문에 고유 보조 인덱스를 생성할 수 없음
create unique index idx_member_mem_name on member(mem_name);
show index from member;
insert into member values('MOO', '마마무', 2, '태국', '001', '12341234', 155, '2020.10.10'); -- 위에서 생성한 고유 보조 인덱스 때문에 이름 중복 불가능
analyze table member;
show index from member;
select * from member;
select mem_id, mem_name, addr from member;
select mem_id, mem_name, addr from member where mem_name = '에이핑크';
create index idx_member_mem_number on member(mem_number);
analyze table member;
select mem_name, mem_number from member where mem_number >= 7;
select mem_name, mem_number from member where mem_number >= 1;
select mem_name, mem_number from member where mem_number * 2 >= 14;
select mem_name, mem_number from member where mem_number >= 14/2;
show index from member;
drop index idx_member_mem_name on member;
drop index idx_member_addr on member;
drop index idx_member_mem_number on member;
alter table member drop primary key; -- 기본 키를 제거하기 전 외래 키 먼저 제거 오류 발생
select table_name, constraint_name from information_schema.referential_constraints where constraint_schema = 'market_db';
alter table buy drop foreign key buy_ibfk_1;
alter table member drop primary key;