call test_mysql_repeat_loop();
call test_mysql_while_loop();

drop procedure if exists 새수강신청;
delimiter //
create procedure 새수강신청(in 학번 char(7), out 수강신청_번호 int)
begin
	select max(수강신청번호) into 수강신청_번호 from 수강신청;
    set 수강신청_번호 = 수강신청_번호 + 1;
    insert into 수강신청(수강신청번호, 학번, 날짜, 연도, 학기)
    values(수강신청_번호, 학번, curdate(), '2020', '2');
end//
delimiter //;

call 새수강신청('1601001', @수강신청_번호);  -- 없는 학번 하면 안됨
select @수강신청_번호;

-- 저장 프로시저 실습(1) 
-- <학과> 테이블에 새로운 레코드를 삽입하고 삽입한 레코드를 보여주는 '새학과' stored procedure를 만드시오.
drop procedure if exists 새학과;
delimiter $$
create procedure 새학과(out 학생수 int, out 과목수 int)
begin
	select count(학번) into 학생수 from 수강신청;
    select count(distinct 과목번호) into 과목수 from 수강신청내역;
end$$
delimiter ;

-- 저장 프로시저 실습(2)
drop procedure if exists 통계;
delimiter $$
create procedure 통계(out 학생수 int, out 과목수 int)
begin
	select count(학번) into 학생수 from 수강신청;
    select count(distinct 과목번호) into 과목수 from 수강신청내역;
end$$
delimiter ;


-- 저장함수
-- pdf 예제 
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION userFunc(value1 INT, value2 INT)
RETURNS INTEGER
BEGIN
	RETURN value1 + value2;
END $$
DELIMITER ;

select 1114실습.userFunc(100, 200);

-- 1116 실습 40번 if 부분 함수로
select 수강신청번호, 과목번호, 평점, if(평점 = 0, "미취득" ,"취득") as 취득여부 from 수강신청내역 where 평점 <> -1;

DELIMITER $$
CREATE FUNCTION pass(var INT)
RETURNS CHAR
BEGIN
	declare re char(10);
	if var > 0 then set re = '미취득';
    else set re = '취득';
    end if;
    return re;
        

END $$
DELIMITER ;


select 수강신청번호, 과목번호, 평점, pass(평점) as 취득여부 from 수강신청내역 where 평점 <> -1;


-- 뷰(view)
-- 실습(1)
CREATE VIEW 교수정보 AS
SELECT 교수.사번, 교수.이름, 교수.학과 as 학과번호, 학과.학과명
FROM 교수 inner join 학과
on 교수.학과 = 학과.학과번호;

select * from 교수정보 where 학과번호 = '01';


-- 실습(2)
CREATE VIEW 담당교과 AS
SELECT 교수.사번, 교수.이름, 학과.학과명, 과목.과목명, 과목.학점
FROM 교수 inner join 학과
on 교수.학과 = 학과.학과번호
inner join 과목 
on 교수.사번 = 과목.담당교수;

select * from 담당교과 WHERE 사번 = '1000001';

-- 실습(3)
DROP VIEW 교수별담당과목;
CREATE VIEW 교수별담당과목 AS
SELECT 교수.사번, 교수.이름, 학과.학과명, count(과목.과목명) as 과목수, sum(과목.학점) as 학점수
FROM 교수 inner join 학과
on 교수.학과 = 학과.학과번호
inner join 과목 
on 교수.사번 = 과목.담당교수 
group by 교수.사번;

-- 교수님 쿼리
CREATE VIEW 교수별담당과목 AS
SELECT 담당교수 as 사번, 교수.이름, 학과.학과명, count(과목명) as 과목수, sum(학점) as 학점수
FROM 과목, 교수 , 학과
where 교수.학과 = 학과.학과번호 and 교수.사번 = 과목.담당교수 
group by 교수.사번;

select * from 교수별담당과목 WHERE 사번 = '1000001';