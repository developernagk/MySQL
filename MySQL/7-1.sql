# 스토어드 프로시저
use market_db;
drop procedure if exists user_proc;
delimiter $$
create procedure user_proc() begin select * from member;
end $$
delimiter ;
call user_proc();
drop procedure user_proc;
-- 입력 매개변수
use market_db;
drop procedure if exists user_proc1;
delimiter $$
create procedure user_proc1(in userName varchar(10)) begin select * from member where mem_name = userName;
end $$
delimiter ;
call user_proc1('에이핑크');

drop procedure if exists user_proc2;
delimiter $$
create procedure user_proc2(in userName int, in userHeight int) begin select * from member where mem_number > userName and height > userHeight;
end $$
delimiter ;
call user_proc2(6, 165);
-- 출력 매개변수
drop procedure if exists user_proc3;
delimiter $$
create procedure user_proc3(in txtValue char(10), out outValue int)
begin insert into noTable values(null, txtValue);
select max(id) into outValue from noTable;
end $$
delimiter ;
desc noTable; -- noTable을 만들지 않았기 때문에 없다는 오류 발생
create table if not exists noTable(
    id int auto_increment primary key, 
    txt char(10)
);
call user_proc3('테스트1', @myValue);
select concat('입력된 ID 값 ==> ', @myValue);

-- SQL 프로그래밍의 활용
-- 조건문
drop procedure if exists ifelse_proc;
delimiter $$
create procedure ifelse_proc(in memName varchar(10))
begin declare debutYear int; -- 변수 선언
select year(debut_date) into debutYear from member where mem_name = memName;
if (debutYear >= 2015) then select '신인 가수네요. 화이팅하세요.' as '메시지';
else select '고참 가수네요. 그동안 수고하셨어요.' as '메시지';
end if;
end $$
delimiter ;
call ifelse_proc('오마이걸');
-- 반복문
drop procedure if exists while_proc;
delimiter $$
create procedure while_proc() begin declare hap int; -- 합계
declare num int; -- 1부터 100까지 증가
set hap = 0; -- 합계 초기화
set num = 1;
while (num <= 100) do -- 100까지 반복
set hap = hap + num;
set num = num + 1; -- 숫자 증가
end while;
select hap as '1~100 합계';
end $$
delimiter ;
call while_proc();
-- 동적 SQL
drop procedure if exists dynamic_proc;
delimiter $$
create procedure dynamic_proc(in tableName varchar(20)) begin set @sqlQuery = concat('select * from ', tableName);
prepare myQuery from @sqlQuery;
execute myQuery;
deallocate prepare myQuery;
end $$
delimiter ;
call dynamic_proc('member');