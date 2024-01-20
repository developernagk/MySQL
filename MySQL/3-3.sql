# 데이터 입력: insert
use market_db;
create table hongong1 (toy_id int, toy_name char(4), age int);
insert into hongong1 values (1, '우디', 25);
insert into hongong1 (toy_id, toy_name) values (2, '버즈');
insert into hongong1 (toy_name, age, toy_id) values ('제시', 20, 3);
-- auto_increment
create table hongong2 (
    toy_id int auto_increment primary key, 
    toy_name char(4), 
    age int
);
insert into hongong2 values (null, '보핍', 25);
insert into hongong2 values (null, '슬링키', 22);
insert into hongong2 values (null, '렉스', 21);
select * from hongong2;
select last_insert_id();
alter table hongong2 auto_increment=100;
insert into hongong2 values (null, '재남', 35);
select * from hongong2;
create table hongong3 (
    toy_id int auto_increment primary key, 
    toy_name char(4), 
    age int
);
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment=3;
insert into hongong3 values (null, '토마스', 20);
insert into hongong3 values (null, '제임스', 23);
insert into hongong3 values (null, '고든', 25);
select * from hongong3;
-- insert into ~ select
select count(*) from world.city;
desc world.city;
select * from world.city limit 5;
create table city_popul (city_name char(35), population int);
insert into city_popul select Name, Population from world.city;

# 데이터 수정: update
use world;
update city_popul set city_name = '서울' where city_name = 'Seoul';
select * from city_popul where city_name = '서울';
update city_popul set city_name = '뉴욕', population = 0 where city_name = 'New York';
select * from city_popul where city_name = '뉴욕';
update city_popul set city_name = '서울';
update city_popul set population = population / 10000;
select * from city_popul limit 5;

# 데이터 삭제: delete
delete from city_popul where city_name like 'New%';
delete from city_popul where city_name like 'New%' limit 5;

# 대용량 테이블의 삭제
create table big_table1 (select * from world.city, sakila.country);
create table big_table2 (select * from world.city, sakila.country);
create table big_table3 (select * from world.city, sakila.country);

delete from big_table1;
drop table big_table2;
truncate table big_table3;