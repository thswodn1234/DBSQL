

use pnusw02db;
select * from 계좌;

drop table 계좌;
create TABLE 계좌 (
	학생이름 CHAR(13) NOT NULL PRIMARY KEY,
    계좌번호 CHAR(15) NOT NULL,
    잔액 INT NOT NULL DEFAULT 0
    );
    
    INSERT INTO 계좌 VALUES ('정용민','123435-333333', 450000);
    INSERT INTO 계좌 VALUES ('안중근','123434-666666', 100000);
    


START TRANSACTION;
UPDATE 계좌 SET 잔액 = 잔액-500000 WHERE 학생이름 = '정용민';
UPDATE 계좌 SET 잔액 = 잔액+500000 WHERE 학생이름 = '안중근';
select * from 계좌;
ROLLBACK;
select * from 계좌;

call pnusw02db.WIRE_TRANSFER('정용민', '안중근', 100000);
call pnusw02db.WIRE_TRANSFER('안중근','정용민' , 100000);
