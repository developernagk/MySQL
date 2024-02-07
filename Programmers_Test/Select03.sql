# https://school.programmers.co.kr/learn/courses/30/lessons/131535

# 풀었음
# SELECT COUNT(*)
# FROM USER_INFO
# WHERE AGE >= 20 AND AGE <= 29
# AND JOINED
# LIKE '2021-__-__';

# 강사님 풀이
# SELECT COUNT(*) AS USERS
# FROM  USER_INFO
# WHERE JOINED LIKE '2021%'
# AND AGE BETWEEN 20 AND 29;