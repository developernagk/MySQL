# order by
select mem_id, mem_name, debut_date from member order by debut_date;
select mem_id, mem_name, debut_date from member order by debut_date desc;
-- select mem_id, mem_name, debut_date, height from member order by height desc where height >= 164;
-- > order by 절은 where 절 다음에 나와야 함
select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc;
select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc, debut_date asc;
-- limmit
select * from member limit 3;
select mem_name, debut_date from member order by debut_date limit 3;
select mem_name, height from member order by height desc limit 3, 2; -- 평균 키가 큰 순으로 정렬하되, 3번째부터 2건만 조
-- distinct
select addr from member;
select addr from member order by addr;
select distinct addr from member;

# group by
-- 집계 함수
select mem_id, amount from buy order by mem_id; -- 구매 건이 행 별로 각각 출력
select mem_id, sum(amount) from buy group by mem_id;
select mem_id "회원 아이디", sum(amount) "총 구매 개수" from buy group by mem_id;
select mem_id "회원 아이디", sum(amount * price) "총 구매 금액" from buy group by mem_id;
select avg(amount) "평균 구매 개수" from buy;
select mem_id, avg(amount) "평균 구매 개수" from buy group by mem_id;
select count(*) from member;
select count(phone1) "연락처가 있는 회원" from member;
-- having
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액" from buy group by mem_id;
-- select mem_id "회원 아이디", sum(price * amount) "총 구매 금액" from buy where sum(price * amount) > 1000; group by mem_id;
-- > 집계 함수는 where 절에 나타날 수 없기 때문에 where 대신 having을 사용
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액" from buy group by mem_id having sum(price * amount) > 1000;
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액" from buy group by mem_id having sum(price * amount) > 1000 order by sum(price * amount) desc;