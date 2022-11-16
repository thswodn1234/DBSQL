show databases;
use 1114실습;

-- 하위질의
SELECT 학과, 이름, 학년 FROM 학생 WHERE 학번 in (SELECT 학번 FROM 수강신청 WHERE 수강신청번호 in (select 수강신청번호 from 수강신청내역 where 과목번호 = 'k20002'));

-- 내부조인
SELECT 학번, 이름,
(SELECT COUNT(*)
FROM 수강신청
WHERE 수강신청.학번=학생.학번) AS 수강신청횟수
FROM 학생;

select 학과,이름,학년
from 학생 
inner join 수강신청 on 학생.학번 = 수강신청.학번
inner join 수강신청내역 on  수강신청.수강신청번호 = 수강신청내역.수강신청번호
where 과목번호 = "k20002";

-- 외부조인
-- <교수> 테이블의 모든 교수에 대하여 교수 정보와 그 교수가 담당하고 있는 교과목 이름을 알고자 한다고면…?
SELECT 교수.사번, 교수.이름, 과목.과목명
FROM 교수 INNER JOIN 과목
ON 교수.사번 = 과목. 담당교수;

SELECT 교수.사번, 교수.이름, 과목.과목명
FROM 교수 LEFT OUTER JOIN 과목
ON 교수.사번 = 과목.담당교수;

SELECT 교수.사번, 교수.이름, 과목.과목명
FROM 과목 RIGHT OUTER JOIN 교수
ON 교수.사번 = 과목.담당교수;

SELECT 교수.사번, 교수.이름
FROM 교수 
LEFT OUTER JOIN 과목 ON 교수.사번 = 과목.담당교수
where 과목.과목명 is null;

-- 조인에서 집계함수 사용하기

SELECT 교수.사번, 교수.이름, COUNT(과목.과목번호) AS 담당과목수
FROM 교수 INNER JOIN 과목
ON 교수.사번 = 과목.담당교수
GROUP BY 교수.사번;

SELECT 교수.사번, 교수.이름, COUNT(과목.과목번호) AS 담당과목수
FROM 교수 LEFT OUTER JOIN 과목
ON 교수.사번 = 과목.담당교수
GROUP BY 교수.사번;