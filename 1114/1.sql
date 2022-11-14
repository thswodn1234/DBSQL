CREATE TABLE 학과
(
학과번호 char(2) NOT NULL,
학과명 char(20) NOT NULL,
전화번호 char(20)NOT NULL,
PRIMARY KEY(학과번호)
);

CREATE TABLE 교수
(
사번 char(7) NOT NULL,
이름 char(20) NOT NULL,
학과 char(2) NOT NULL,
전자우편 char(50) NOT NULL,
전화번호 char(20) NULL,
PRIMARY KEY(사번),
FOREIGN KEY (학과) REFERENCES 학과(학과번호)
);

CREATE TABLE 학생
(
학번 char(7) NOT NULL,
학과 char(2) NOT NULL,
이름 char(20) NOT NULL,
학년 ENUM ('1', '2', '3', '4') NOT NULL,
주소 char(200) NULL,
시군구 char(20) NULL,
시도 char(20) NULL,
우편번호 char(20) NULL,
전자우편 char(50) NULL,
PRIMARY KEY(학번),
FOREIGN KEY (학과) REFERENCES 학과(학과번호)
);

CREATE TABLE 과목
(
과목번호 char(6) NOT NULL,
과목명 char(50) NOT NULL,
영문명 char(50) NOT NULL,
담당교수 char(7) NOT NULL,
학점 int NOT NULL,
시수 int NOT NULL,
이수구분 ENUM('교양', '전공') NOT NULL,
학기 ENUM ('1', '여름', '2', '겨울') NOT NULL,
학년 ENUM ('1', '2', '3', '4') NOT NULL,
설명 text,
PRIMARY KEY(과목번호),
FOREIGN KEY (담당교수) REFERENCES 교수(사번)
);

CREATE TABLE 수강신청
(
수강신청번호 char(7) NOT NULL,
학번 char(7) NOT NULL,
날짜 datetime NOT NULL,
연도 char(4) NOT NULL,
학기 ENUM ('1', '여름', '2', '겨울') NOT NULL,
PRIMARY KEY(수강신청번호),
FOREIGN KEY (학번) REFERENCES 학생(학번)
);

CREATE TABLE 수강신청내역
(
수강신청번호 char(7) NOT NULL,
일련번호 int NOT NULL,
과목번호 char(6) NOT NULL,
평점 int NOT NULL DEFAULT -1,
PRIMARY KEY(수강신청번호, 일련번호),
FOREIGN KEY (수강신청번호) REFERENCES 수강신청(수강신청번호),
FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);
