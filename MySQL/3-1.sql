# 데이터베이스 & 테이블 생성
drop database if exists market_db;
create database market_db;
use market_db;
create table member -- 회원 테이블(member)
(
mem_id char(8) not null primary key, -- 회원 아이디(PK)
mem_name varchar(10) not null, -- 이름
mem_number int not null, -- 인원수
addr char(2) not null, -- 주소(경기, 서울, 경남 식으로 2글자만 입력)
phone1 char(3), -- 연락처의 국번(02, 031, 055 등)
phone2 char(8), -- 연락처의 나머지 전화번호(하이픈 제외
heigth smallint, -- 평균 키
debut_date DATE -- 데뷔일자
);
create table buy -- 구매 테이블(buy)
(
num int auto_increment not null primary key, -- 순번(PK)
mem_id char(8) not null, -- 아이디(FK)
prod_name char(6) not null, -- 제품 이름
group_name char(4), -- 분류
price int not null, -- 단가
amount smallint not null, -- 수량
foreign key (mem_id) references member(mem_id)
);
insert into member values('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
insert into buy values(null, 'BLK', '지갑', null, 30, 2); -- 참조하는 member 테이블에 'BLK'가 없기 때문에 생성 안 됨

# select ~ from
select * from member;
select * from buy;
use market_db;
select * from market_db.member; -- select * from member; 와 동일한 역할
select mem_name from member;
select addr, debut_date, mem_name from member;

# select ~ from ~ where
select * from member where mem_name = '블랙핑크';
select * from member where mem_number = 4;
select mem_id, mem_name from member where height <= 162;
select mem_name, height, mem_number from member where height >= 165 and mem_number > 6;
select mem_name, height, mem_number from member where height >= 165 or mem_number > 6;
select mem_name, height from member where height >= 163 and height <= 165;
--  = select mem_name, height from member where height between 163 and 165;
select mem_name, addr from member where addr = '경기' or addr = '전남' or addr = '경남';
-- = select mem_name, addr from member where addr in('경기', '전남', '경남')
select * from member where mem_name like '우%';
select * from member where mem_name like '__핑크';

# 서브 쿼리(하위 쿼리)
select height from member where mem_name = '에이핑크';
select mem_name, height from member where height > 164;
select mem_name, height from member where height > (select height from member where mem_name = '에이핑크');