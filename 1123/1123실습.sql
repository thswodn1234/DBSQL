

create database 1123실습;
use 1123실습;
CREATE TABLE 상품 (상품코드 VARCHAR(6) NOT NULL PRIMARY KEY, 상품명 VARCHAR(30)  NOT NULL, 제조사 VARCHAR(30) NOT NULL, 소비자가격  INT, 재고수량  INT DEFAULT 0);

-- 입고 테이블 작성
CREATE TABLE 입고 (입고번호 INT PRIMARY KEY, 상품코드 VARCHAR(6) NOT NULL REFERENCES 상품(상품코드), 입고일자 DATE,입고수량 INT,입고단가 INT);

-- 판매 테이블 작성
CREATE TABLE 판매 (판매번호 INT  PRIMARY KEY,상품코드  VARCHAR(6) NOT NULL REFERENCES 상품(상품코드), 판매일자 DATE,판매수량 INT,판매단가 INT);

INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격) VALUES ('AAAAAA', '디카', '삼싱', 100000);
INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격) VALUES ('BBBBBB', '컴퓨터', '엘디', 1500000);
INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격) VALUES ('CCCCCC', '모니터', '삼싱', 600000);
INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격) VALUES ('DDDDDD', '핸드폰', '다우', 500000);
INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격) VALUES ('EEEEEE', '프린터', '삼싱', 200000);

SELECT * FROM 상품;

-- 상품 테이블에 자료 추가 테스트

INSERT INTO 입고 (입고번호, 상품코드, 입고일자, 입고수량, 입고단가) VALUES (1, 'AAAAAA', '2004-10-10', 5,   50000);
INSERT INTO 입고 (입고번호, 상품코드, 입고일자, 입고수량, 입고단가) VALUES (2, 'BBBBBB', '2004-10-10', 15, 700000);
INSERT INTO 입고 (입고번호, 상품코드, 입고일자, 입고수량, 입고단가) VALUES (3, 'AAAAAA', '2004-10-11', 15, 52000);
INSERT INTO 입고 (입고번호, 상품코드, 입고일자, 입고수량, 입고단가) VALUES (4, 'CCCCCC', '2004-10-14', 15,  250000);
INSERT INTO 입고 (입고번호, 상품코드, 입고일자, 입고수량, 입고단가) VALUES (5, 'BBBBBB', '2004-10-16', 25, 700000);

update 입고 set 입고수량 = 30 where 입고번호 = 5;

delete from 입고 where 입고번호 = 5;

SELECT * FROM 상품;

INSERT INTO 판매 (판매번호, 상품코드, 판매일자, 판매수량, 판매단가) VALUES(1, 'AAAAAA', '2004-11-10', 10, 1000000);
INSERT INTO 판매 (판매번호, 상품코드, 판매일자, 판매수량, 판매단가) VALUES(1, 'AAAAAA', '2004-11-10', 25, 1000000);


SELECT @@autocommit;
set autocommit = 0;

SELECT * FROM 1114실습.학과;
commit;
update 학과 set 학과명='컴퓨터공학과' where 학과번호 = '01';
rollback;

create Table new학과 (select * from 학과);
SELECT * FROM 1114실습.new학과;

savepoint t1;
delete from new학과 where 학과번호 = 01;

savepoint t2;
delete from new학과 where 학과번호 = 04;

savepoint t3;
delete from new학과 where 학과번호 = 05;

rollback to t1;
SELECT * FROM 1114실습.new학과;

-- lock 어떻게 하는지 이해 안감
create user 'std01'@'localhost' identified by '1234';
create user 'std02'@'localhost' identified by '1234';

grant all privileges on *.* to 'std01'@'localhost';
grant all privileges on *.* to 'std02'@'localhost';

commit;

flush privileges;
drop table 계좌;

CREATE TABLE 계좌 (
학생이름 CHAR(13) PRIMARY KEY,
계좌번호 CHAR(15) NOT NULL,
잔액 INT NOT NULL DEFAULT 0
);
select * from 계좌;
INSERT INTO 계좌 VALUES ('정용민', '123435-333333', 450000);
INSERT INTO 계좌 VALUES ('안중근', '123434-666666', 100000);

lock tables 계좌 write;
insert 계좌 values(1);

-- index 이해 X

 -- SELECT 과목.과목번호, 과목.과목명, 과목.이수구분, 교수.이름FROM 과목 INNER JOIN 교수ON 과목.담당교수=교수.사번WHERE 과목.영문명 LIKE 'COM%’order by 교수.이름;