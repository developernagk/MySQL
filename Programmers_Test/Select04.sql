# https://school.programmers.co.kr/learn/courses/30/lessons/131112

# address로 조회
# SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
# FROM FOOD_FACTORY
# WHERE ADDRESS
# LIKE '강원도%'
# ORDER BY FACTORY_ID ASC;

# tlno로 조회
# 조회는 가능하지만 실제로 데이터베이스를 다룰 경우 TLNO는 null 값을 허용하기 때문에 안 될 수도 있음
# SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
# FROM FOOD_FACTORY
# WHERE TLNO
# LIKE '033%'
# ORDER BY FACTORY_ID ASC;