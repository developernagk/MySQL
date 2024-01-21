# 트리거
use market_db;
create table if not exists trigger_table (id int, txt varchar(10));
insert into trigger_table values(1, '레드벨벳');
insert into trigger_table values(2, '잇지');
insert into trigger_table values(3, '블랙핑크');
drop trigger if exists myTrigger;
delimiter $$
create trigger myTrigger after delete on trigger_table for each row
begin set @msg = '가수 그룹이 삭제됨'; -- 트리거 실행 시 작동되는 코드들
end $$
delimiter ;
set @msg = '';
insert into trigger_table values(4, '마마무');
select @msg;
update trigger_table set txt = '블핑' where id = 3;
select @msg;
delete from trigger_table where id = 4;
select @msg;
-- 활용
use market_db;
create table singer(select mem_id, mem_name, mem_number, addr from member);
create table backup_singer (
    mem_id char(8) not null, 
    mem_name varchar(10) not null, 
    mem_number int not null,
    addr char(2) not null, 
    modType char(2), -- 변경된 타입. '수정' 또는 '삭제'
    modDate date, -- 변경된 날짜
    modUser varchar(30) -- 변경한 사용자
);
drop trigger if exists singer_updateTrg;
delimiter $$
create trigger singer_updateTrg -- 트리거 이름
after update -- 변경 후에 작동하도록 지정
on singer -- 트리거를 부착할 테이블
for each row
begin
insert into backup_singer values(OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '수정', curdate(), current_user());
end $$
delimiter ;
drop trigger if exists singer_deleteTrg;
delimiter $$
create trigger singer_deleteTrg -- 트리거 이름
after delete -- 삭제 후에 작동하도록 지정
on singer -- 트리거를 부착할 테이블
for each row
begin
insert into backup_singer values(OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '삭제', curdate(), current_user());
end $$
delimiter ;
update singer set addr = '영국' where mem_id = 'BLK';
delete from singer where mem_number >= 7;
select * from backup_singer;
truncate table singer;
select * from backup_singer;