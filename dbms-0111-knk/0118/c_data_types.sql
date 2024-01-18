# MySQL의 데이터 형식

# 정수형, 문자형, 논리형, 날짜형

# 1. 정수형
# : 숫자 데이터를 저장하는데 사용
# : 데이터 타입에 따라 메모리 사용 공간이 상이

# a. tinyint
# 크기 : 1byte(8bit)
# 범위 : -128 ~ 127
# ex) 나이, 성별코드 등
# b. smallint
# 크기 : 2byte(16bit)
# 범위 : -32768 ~ 32767
# ex) 우편번호, 사원번호 등
# c. int
# 크기 : 4byte(32bit)
# 범위 : 약 -21억 ~ 약 21억
# ex) 일반적인 용도로 가장 많이 사용되는 정수형 타입
# , 고객 ID, 주문번호 등
# d. bigint
# 크기 : 8byte(64bit)
# 범위 : 약 -900경 ~ 약 900경
# ex) 금융권에서 주로 사용
create table `integer` (
    tinyint_col tinyint,
    smallint_col smallint,
    int_col int,
    bigint_col bigint
);

# insert 데이터 삽입
# Out of range: 해당 데이터 타입의 범위를 벗어났다
insert into `integer` 
values (127, 32767, 2000000000, 90000000000000000);

# unsigned(부호가 없는 정수)
# : 정수의 시작을 0부터 설정
# : 범위는 그대로 인식
# ex) 키, 나이를 설정할 때(음수 값이 없는 경우) 등

# 2. 문자형
# : 텍스트 데이터를 저장
# char(개수), varchar(개수)

# a. char(개수) - 1~255바이트
# : 고정 길이 문자형
# : char(10)의 10자리 중에서 3자리만 사용하는 경우 7자리는 비워진 채로 메모리 낭비
# : , 데이터의 길이가 항상 일정하거나 짧은 문자열을 저장
# : 고정 길이 때문에 검색 속도가 빠름
# ex) 성별, 국가코드 등
# b. varchar(개수) - 1~16383바이트
# : 가변 길이 문자열
# : 선언된 길이 내에서 필요한 만큼만 공간을 사용하여 데이터를 저장
# : varchar(10)에서 3자리만 사용하는 경우 7자리는 사라짐
# : 길이가 일정하지 않아 검색 속도가 느림
# ex) 주소, 상품명 등

# 문자 수와 바이트 수의 차이
# 영어: 1바이트-1개의 알파벳
# 한글: utf-8 기준 한 글자 당 3바이트를 사용
# ex) varchar(255): 255 / 3 = 85글자

# 대량의 데이터 형식
# text 형식
# text: 1~약 65000바이트
# longtext: 1~ 42억 바이트
# blob 형식(binary long object)
# : 이미지, 동영상 등의 데이터
# blob: 1~약 65000바이트
# longblob: 1~ 42억 바이트

# 3. 실수형
# : 소수점이 있는 숫자를 저장할 때 사용

# a. float
# : 소수점 아래 7자리까지 표현
# ex) 시력, 가격 등
# b. double
# : 소수점 아래 15자리까지 표현
# ex) 기상청 등

# 4. 날짜형
# : 날짜 및 시간을 저장할 때 사용

# a. date(3byte)
# : 날짜만 저장 / YYYY-MM-DD 형식
# ex) 기념일, 생일 등
# b. time(3byte)
# : 시간만 저장 / HH:MM:SS 형식
# c. datetime(8byte)
# : 날짜와 시간을 저장 / YYYY-MM-DD HH:MM:SS 형식
# ex) 구매일시 등

# 5. enum 데이터 타입
# : 열거형, 사전에 정의된 값의 집합 중에서 하나의 값을 저장
# : 제한된 값 목록 중에서 선택

use example;
create table shirts(
    size enum('small', 'medium', 'large'), 
    color enum('red', 'green', 'blue', 'yellow')
);