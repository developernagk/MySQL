# 제약조건
-- 기본 키
use naver_db;
drop table if exists buy, member;
create table member (
    mem_id char(8) not null primary key,
    mem_name varchar(10) not null, 
    height tinyint unsigned null
);
describe member;

drop table if exists member;
create table member (
    mem_id char(8) not null, 
    mem_name varchar(10) not null, 
    height tinyint unsigned null,
    primary key (mem_id)
);

drop table if exists member;
create table member (
    mem_id char(8) not null, 
    mem_name varchar(10) not null, 
    height tinyint unsigned null
);
alter table member add constraint primary key (mem_id);
-- 외래 키
drop table if exists buy, member;
create table member (
    mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null
);
create table buy (
    num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null,
    foreign key(mem_id) references member(mem_id)
);

drop table if exists buy;
create table buy (
    num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null
);
alter table buy add constraint foreign key(mem_id) references member(mem_id);
insert into member values('BLK', '블랙핑크', 163);
insert into buy values(null, 'BLK', '지갑');
insert into buy values(null, 'BLK', '맥북');
select M.mem_id, M.mem_name, B.prod_name from buy B inner join member M on B.mem_id = M.mem_id;
update member set mem_id = 'PINK' where mem_id='BLK'; -- 기본키-외래키로 맺어진 후에는 열 이름 변경 불가능
delete from member where mem_id='BLK'; -- 삭제 또한 불가능

drop table if exists buy;
create table buy (
    num int auto_increment not null primary key, 
    mem_id char(8) not null, 
    prod_name char(6) not null
);
alter table buy add constraint foreign key(mem_id) references member(mem_id) on update cascade on delete cascade;
insert into buy values(null, 'BLK', '지갑');
insert into buy values(null, 'BLK', '맥북');
update member set mem_id = 'PINK' where mem_id='BLK';
select M.mem_id, M.mem_name, B.prod_name from buy B inner join member M on B.mem_id = M.mem_id;
delete from member where mem_id='PINK';
select * from buy;
-- 기타 제약조건
-- 고유키
drop table if exists buy, member;
create table member (
    mem_id char(8) not null primary key, 
    mem_name varchar(10) not null, 
    height tinyint unsigned null, 
    email char(30) null unique
);
insert into member values('BLK', '블랙핑크', 163, 'pink@gmail.com');
insert into member values('TWC', '트와이스', 167, null);
insert into member values('APN', '에이핑크', 164, 'pink@gmail.com'); -- email는 고유키로 비어 있는 값은 허용하지만 중복은 허용하지 않음
-- 체크
drop table if exists member;
create table member (
    mem_id char(8) not null primary key, 
    mem_name varchar(10) not null, 
    height tinyint unsigned null check(height >= 100), 
    phone1 char(3) null
);
insert into member values('BLK', '블랙핑크', 163, null);
insert into member values('TWC', '트와이스', 99, null); -- 체크 제약조건에서 설정한 값의 범위를 벗어나서 오류 발생
alter table member add constraint check(phone1 in ('02', '031', '032', '054', '055', '061'));
insert into member values('TWC', '트와이스', 167, '02');
insert into member values('OMY', '오마이걸', 167, '010'); -- 체크 제약조건 설정 후 조건에 위배되는 값을 입력하면 오류 발생
-- 기본값 정의
drop table if exists member;
create table member (
    mem_id char(8) not null primary key, 
    mem_name varchar(10) not null, 
    height tinyint unsigned null default 160, 
    phone1 char(3) null
);
alter table member alter column phone1 set default '02';
insert into member values('RED', '레드벨벳', 161, '054');
insert into member values('SPC', '우주소녀', default, default);
select * from member;