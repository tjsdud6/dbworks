-- 서브쿼리(부속 질의)
SELECT bookname, price FROM book WHERE price = (SELECT  MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하세요.
SELECT name FROM customer WHERE custid IN(SELECT custid FROM orders);

-- 박지성 고객의 주문내역을 검색하세요.
SELECT * FROM orders WHERE custid = (SELECT custid FROM customer WHERE name='박지성');

-- 이상미디어 에서 출판한 도서를 구매한 고객의 이름을 검색하세요.
SELECT name FROM customer WHERE custid IN (SELECT custid FROM orders WHERE bookid IN
(SELECT bookid FROM book WHERE publisher = '이상미디어'));

-- 출판사별로 출판사의 평균도서 가격보다 비싼 도서를 검색하세요.
-- 튜플변수 : 테이블의 이름의 별칭
SELECT b1.bookname FROM book b1 WHERE b1.price > 
(SELECT AVG (b2.price) FROM book b2 WHERE b2.publisher = b1.publisher);

-- 출판사별 평균 금액
SELECT publisher, AVG(price) FROM book GROUP BY publisher;

-- 인라인뷰 : FROM 부속 질의
-- 고객 번호가 2 이하인 고객의 판매액을 검색하세요.
SELECT cs.name, SUM(od.saleprice) AS total FROM (SELECT custid, name FROM customer WHERE custid <= 2) cs, orders od 
WHERE cs.custid = od.custid  GROUP BY cs.name;


