# 1. 데이터베이스 생성
# 야구팀 관리 데이터를 저장하는 데이터베이스: baseball_league;

# 2. 데이터베이스 선택

# 3. 테이블 생성
# >> a. 팀 테이블 생성: team(team_id, name, city, founded_year)
# >> b. 선수 테이블 생성
# : player(player_id, name, position)

# 4. 각 테이블 구조 확인

# 5. 테이블 구조 수정
# : players 테이블에 birth_date 컬럼 추가

# 6. 테이블 삭제
# : 테이블이 존재한다면 테이블 삭제

# 7. 데이터베이스 삭제

create database baseball_league;
use baseball_league;

create table teams (
    team_id int, 
    name varchar(50), 
    city char(10), 
    founded_year year -- 날짜형 중 연도 데이터만 저장하는 타입 'YYYY'
);

create table players (
    player_id int,
    name varchar(50), 
    position enum('타자', '투수', '외야수', '내야수')
);

desc `teams`;
desc `players`;

alter table `players` add birth_date date;
desc `players`;

drop table if exists games;
drop table if exists players;

drop database baseball_league;
