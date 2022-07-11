-- 테이블 ex2 생성
CREATE TABLE ex2(
    col_date      DATE,        --년, 월, 일
    col_timestamp TIMESTAMP    --년, 월, 일, 시, 분, 초
);

-- 테이블 ex3 생성
CREATE TABLE ex3(
    col_null    VARCHAR2(10),
    col_not_null  VARCHAR2(10) NOT NULL
);
-- ex3에 데이터 입력
INSERT INTO ex3 VALUES('Hello', ''); -- NOT NULL 제약조건 위배
INSERT INTO ex3 VALUES('', 'Hello');

-- 데이터 입력(현재 날짜 - SYSDATE 입력)
INSERT INTO ex2 VALUES  (SYSDATE, SYSTIMESTAMP);

COMMIT;

-- 데이터 조회
SELECT * FROM ex3;
SELECT col_date FROM ex2;