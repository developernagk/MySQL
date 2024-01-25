# 구매한 제품의 총 가격과 수량을 함께 보여주는 회원 목록(left outer join)
# 총 가격, 총 수량 >> sum 집계함수
select
	M.member_id, M.name, sum(B.amount) as total_amount, sum(B.quantity) total_quantity
from
	member M
left outer join
	buy B
on M.member_id = B.member_id
group by M.member_id;

# 가입한 지 얼마나 오래 되었는지 모든 회원 정보 출력
# datediff(): 날짜의 차이 계산
select
	M.name, M.join_date, B.product_code, datediff(current_date, join_date) as join_days
from
	member M
left outer join buy B
on M.member_id = B.member_id
order by
	join_days;