create database if not exists school_db;
use school_db;

학생(Students) 테이블: 학생 ID, 이름, 전공, 입학년도를 포함
교수(Professors) 테이블: 교수 ID, 이름, 학과, 사무실 위치를 포함
강의(Courses) 테이블: 강의 ID, 강의명, 담당 교수 ID, 학점 수를 포함
수강(Enrollments) 테이블: 수강 ID, 학생 ID, 강의 ID, 수강년도, 학기를 포함
각 테이블의 ID는 기본 키로 설정
교수 ID는 강의 테이블에서 외래 키로 설정되어야 하며, 교수와 강의 사이의 관계 작성
학생 ID와 강의 ID는 수강 테이블에서 외래 키로 설정되어야 하며, 학생, 강의, 수강 사이의 다대다 관계 작성.

create table students (
	student_id int primary key,
    student_name varchar(20),
    major varchar(15),
    admission_date date
);

create table professors (
	professor_id int primary key,
    professor_name varchar(20),
    department varchar(15),
    location varchar(20)
);

create table courses (
	course_id int,
    course_name varchar(20),
    professor_id int,
    credit double
    foreign key (professor_id) references professors (professor_id)
);