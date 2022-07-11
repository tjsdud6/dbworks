-- book 테이블 만들기
CREATE TABLE book(
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(40),
    publisher   VARCHAR2(40),
    price       NUMBER
);

--coustomer 테이블 생성
CREATE TABLE customer(
    custid  NUMBER PRIMARY KEY,
    name    VARCHAR2(40),
    address VARCHAR2(40),
    phone   VARCHAR2(40)
);

-- orders 테이블
CREATE TABLE orders(
    orderid     NUMBER PRIMARY KEY,
    custid      NUMBER,
    bookid      NUMBER,
    saleprice   NUMBER,
    orderdate   DATE,
    FOREIGN KEY(custid) REFERENCES customer(custid),    -- 외래키
    FOREIGN KEY(bookid) REFERENCES book(bookid)         -- 외래키
);

-- book 자료 삽입
INSERT INTO book VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO book VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES (5, '피겨교본', '굿스포츠', 8000);
INSERT INTO book VALUES (6, '양궁의 실제', '굿스포츠', 6000);
INSERT INTO book VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES (10, 'Olympic Campions', 'Pearson', 13000);


-- customer 자료 삽입
INSERT INTO customer VALUES (1, '박지성', '영국 맨체스터', '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO customer VALUES (3, '안산', '대한민국 광주광역시', '000-7000-0001');
INSERT INTO customer VALUES (4, '류현진', '미국 토론토', 'NULL');
INSERT INTO customer VALUES (5, '손흥민', '영국 토트넘', '000-8000-0001');

-- orders 자료 삽입
INSERT INTO orders VALUES(1, 1, 1, 6000, TO_DATE('2018-07-01', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(2, 1, 3, 21000, TO_DATE('2018-07-03', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(3, 2, 5, 8000, TO_DATE('2018-07-03', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(4, 3, 1, 6000, TO_DATE('2018-07-04', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(5, 4, 1, 20000, TO_DATE('2018-07-05', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(6, 1, 2, 12000, TO_DATE('2018-07-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(7, 4, 8, 13000, TO_DATE('2018-07-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(8, 3, 10, 12000, TO_DATE('2018-07-08', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(9, 2, 10, 7000, TO_DATE('2018-07-09', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(10, 3, 8, 13000, TO_DATE('2018-07-10', 'YYYY-MM-DD'));

-- 주문테이블의 주문번호 1번의 책 가격을 7000원으로 변경
UPDATE orders SET saleprice = 7000 WHERE orderid = 1;

SELECT * FROM orders;

SELECT TO_CHAR(orderdate, 'yyyy-mm-dd') AS orderdate
FROM orders;

SELECT * FROM customer;

--====================================================
-- 모든 도서의 이름과 가격을 검색하세요
SELECT bookname, price FROM book;
--====================================================
-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하세요
SELECT bookid, bookname, publisher, price FROM book;

--====================================================
-- 모든 출판사를 검색하세요 (DISTINCT = 중복제거)
SELECT DISTINCT publisher FROM book;

--====================================================
-- 조건절 WHERE 사용
-- 가격이 20,000원 미만인 도서를 검색
SELECT *
FROM book
WHERE price < 20000;

--====================================================
-- 범위 BETWEEN ~ AND 사용, 논리연산자도 사용
-- 범위 : 가격이 10,000원 이상 20,000원 이하인 도서 검색
SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM book
WHERE price >= 10000 AND price <= 20000;

--====================================================
-- IN(A, B) : A 또는 B
-- 출판사가 '굿스포츠' 혹은 '대한미디어' 인 도서를 검색하세요.
SELECT *
FROM book
WHERE publisher IN('굿스포츠' , '대한미디어');

SELECT *
FROM book
WHERE publisher = '굿스포츠' OR  publisher = '대한미디어';

--====================================================
-- NO TIN(A, B) : A 또는 B 가 아닌
-- 출판사가 '굿스포츠' 혹은 '대한미디어' 가 아닌 도서를 검색하세요.
SELECT *
FROM book
WHERE publisher NOT IN('굿스포츠' , '대한미디어');

--====================================================
-- LIKE 연산자 : %기호 사용
-- 시작하는 문장 : %단어, 끝나는 문장: 단어% 포함: %단어%
-- '축구의 역사' 를 출간한 출판사를 검색하세요.
SELECT *
FROM book
WHERE bookname LIKE '축구의 역사';

-- 도서 이름에 '축구'가 포함 된 출판사를 검색하세요
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%축구%';

--====================================================
-- '축구'에 관한 도서 중 가격이 20,000원 이상인 도서 검색
-- LIKE, AND 사용 
SELECT bookname, publisher, price
FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

--====================================================
-- ORDER BY 
-- 도서를 이름순으로 정렬하세요.
SELECT *
FROM book
ORDER BY bookname;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하세요
SELECT *
FROM book
ORDER BY price, bookname;

--====================================================
-- ORDER BY 객체 DESC(내림차순) , ORDER BY 객체 ACS(오름차순)
-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하세요
SELECT *
FROM book
ORDER BY price DESC, bookname ASC;

-- 도서를 가격의 내림차순으로 검색하고, 가격이 같으면 출판사를 오름차순으로 검색
SELECT *
FROM book
ORDER BY price DESC, publisher ASC;







