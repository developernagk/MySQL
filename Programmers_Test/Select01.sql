CREATE DATABASE programmers_db;
USE programmers_db;

-- SUBSTRING(컬럼, 길이)
-- SUBSTRING(컬럼, 시작위치, 길이)
-- 자를 위치 = FROM 시작위치 FOR 끝위치
-- LEFT (컬럼, 길이)
-- RIGHT(컬럼, 길이)
CREATE TABLE doctor (
	dr_name VARCHAR(20) NOT NULL,
    dr_id VARCHAR(10) NOT NULL,
    lcns_no VARCHAR(30) NOT NULL,
    hire_ymd DATE NOT NULL,
    mcdp_cd VARCHAR(6),
    tlno VARCHAR(50)
);

INSERT INTO doctor VALUES ('루피', 'DR20090029', 'LC00010001', '2009-03-01', 'CS', '01085482011');
INSERT INTO doctor VALUES ('패티', 'DR20090001', 'LC00010901', '2009-07-01', 'CS', '01085220122');
INSERT INTO doctor VALUES ('뽀로로', 'DR20170123', 'LC00091201', '2017-03-01', 'GS', '01034969210');
INSERT INTO doctor VALUES ('티거', 'DR20100011', 'LC00011201', '2010-03-01', 'NP', '01034229818');
INSERT INTO doctor VALUES ('품바', 'DR20090231', 'LC00011302', '2015-11-01', 'OS', '01049840278');
INSERT INTO doctor VALUES ('티몬', 'DR20090112', 'LC00011162', '2010-03-01', 'FM', '01094622190');
INSERT INTO doctor VALUES ('니모', 'DR20200012', 'LC00911162', '2020-03-01', 'CS', '01089483921');
INSERT INTO doctor VALUES ('오로라', 'DR20100031', 'LC00010327', '2010-11-01', 'OS', '01098428957');
INSERT INTO doctor VALUES ('자스민', 'DR20100032', 'LC00010192', '2010-03-01', 'GS', '01023981922');
INSERT INTO doctor VALUES ('벨', 'DR20100039', 'LC00010562', '2010-07-01', 'GS', '01058390758');

SELECT dr_name, dr_id, mcdp_cd, LEFT(hire_ymd, 10) AS hire_ymd FROM doctor WHERE mcdp_cd = 'CS' || mcdp_cd = 'GS' ORDER BY hire_ymd DESC, dr_name ASC;

SELECT dr_name, dr_id, mcdp_cd, LEFT(hire_ymd, 10) AS hire_ymd FROM doctor WHERE mcdp_cd IN('CS', 'GS') ORDER BY hire_ymd DESC, dr_name ASC;
