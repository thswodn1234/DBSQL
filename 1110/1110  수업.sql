show databases;
use pnusw02db;

create TABLE 계좌 (
	학생이름 CHAR(13) NOT NULL PRIMARY KEY,
    계좌번호 CHAR(15) NOT NULL,
    잔액 INT NOT NULL DEFAULT 0
    );
    
    INSERT INTO 계좌 VALUES ('정용민','123435-333333', 450000);
    INSERT INTO 계좌 VALUES ('안중근','123434-666666', 100000);
    
    -- 정용민 계좌에서 안중근 계좌로 50000원 송금
    UPDATE 계좌