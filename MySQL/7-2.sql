# 스토어드 함수
set global log_bin_trust_function_creators = 1;

use market_db;
drop function if exists sumFunc;
delimiter $$
create function sumFunc(number1 int, number2 int) returns int begin return number1 + number2;
end $$
delimiter ;
select sumFunc(100, 200) as '합계';

drop function if exists calcYearFunc;
delimiter $$
create function calcYearFunc(dYear int) returns int begin declare runYear int; -- 활동기간(연도)
set runYear = year(curdate()) - dYear;
return runYear;
end $$
delimiter ;
select calcYearFunc(2010) as '활동 햇수';
select calcYearFunc(2007) into @debut2007;
select calcYearFunc(2013) into @debut2013;
select @debut2007 - @debut2013 as '2007과 2013 차이';
select mem_id, mem_name, calcYearFunc(year(debut_date)) as '활동 햇수' from member;
drop function calcYearFunc;

# 커서
use market_db;
drop procedure if exists cursor_proc;
delimiter $$
create procedure cursor_proc()
begin
-- 사용할 변수 준비
declare memNumber int;
declare cnt int default 0;
declare totNumber int default 0;
-- 행의 끝을 파악하기 위한 변수
declare endOfRow boolean default false;
-- 커서 선언
declare memberCursor cursor for select mem_number from member;
-- 반복 조건 선언
declare continue handler for not found set endOfRow = true;
-- 커서 열기
open memberCursor;
-- 행 반복
cursor_loop: loop
fetch memberCursor into memNumber;
if endOfRow then leave cursor_loop;
end if;
set cnt = cnt + 1;
set totNumber = totNumber + memNumber;
end loop cursor_loop;
select (totNumber/cnt) as '회원의 평균 인원 수';
-- 커서 닫기
close memberCursor;
end $$
delimiter ;
call cursor_proc();