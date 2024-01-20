# 데이터 형식
-- 정수형: tinyint, smallint, int, bigint
use market_db;
create table hongong4 (
    tinyint_col tinyint, 
    samllint_col smallint, 
    int_col int, 
    bigint_col bigint
);
insert into hongong4 values(127, 32767, 2147483647, 9000000000000000000);
insert into hongong4 values(128, 32768, 2147483648, 90000000000000000000);
-- > outofrange 에러
create table member -- 회원 테이블
(mem_id char(8) not null primary key, -- 회원 아이디(PK)
mem_name varchar(10) not null, -- 이름
mem_number int not null, -- 인원수
addr char(2) not null, -- 주소(서울, 경기, 경남 식으로 2글자만 입력)
phone1 char(3), -- 연락처의 국번(02, 031, 055 등)
phone2 char(8), -- 연락처의 나머지 전화번호(하이픈 제외)
height smallint, -- 평균 키
debut_date date -- 데뷔 일자
);
create table member -- 회원 테이블
(mem_id char(8) not null primary key, -- 회원 아이디(PK)
mem_name varchar(10) not null, -- 이름
mem_number tinyint not null, -- 인원수
addr char(2) not null, -- 주소(서울, 경기, 경남 식으로 2글자만 입력)
phone1 char(3), -- 연락처의 국번(02, 031, 055 등)
phone2 char(8), -- 연락처의 나머지 전화번호(하이픈 제외)
height tinyint unsigned, -- 평균 키
debut_date date -- 데뷔 일자
);
-- 문자형: char, varchar
create table big_table(
    data1 char(256), 
    data2 varchar(16384)
);
-- > column length too big 에러
create database netflix_db;
use netflix_db;
create table movie (
    movie_if int, 
    movie_title varchar(30), 
    movie_director varchar(20), 
    movie_star varchar(20), 
    movie_script longtext, 
    movie_film longblob
);
-- 실수형: float, double
-- 날짜형: date, time, datetime

# 변수 사용
use market_db;
set @myVar1 = 5;
set @myVar2 = 4.25;
select @myVar1;
select @myVar1 + @myVar2;
set @txt = '가수 이름==> ';
set @height = 166;
select @txt, mem_name from member where height > @height;
set @count = 3;
-- select mem_name, height from member order by height limit @count;
-- > limit에서는 변수 사용 불가능
set @count = 3;
prepare mySQL from 'select mem_name, height from member order by height limit ?';
execute mySQL using @count;
-- = select mem_name, height from member order by height limit 3;

# 데이터 형 변환
-- 명시적 변환
select avg(price) as '평균 가격' from buy;
select cast(avg(price) as signed) '평균 가격' from buy;
-- = select convert(avg(price), signed) '평균 가격' from buy;
select cast('2022$12$12' as date);
-- = select cast('2022/12/12' as date);
-- = select cast('2022%12%12' as date);
-- = select cast('2022@12@12' as date);
select num, concat(cast(price as char), 'X', cast(amount as char), '=' ) '가격X수량', price * amount '구매액' from buy;
-- 암시적 변환
select '100' + '200';
select concat('100', '200');
select concat(100, '200');
select 100 + '200';