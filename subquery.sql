-- ��������(�μ� ����)
SELECT bookname, price FROM book WHERE price = (SELECT  MAX(price) FROM book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��ϼ���.
SELECT name FROM customer WHERE custid IN(SELECT custid FROM orders);

-- ������ ���� �ֹ������� �˻��ϼ���.
SELECT * FROM orders WHERE custid = (SELECT custid FROM customer WHERE name='������');

-- �̻�̵�� ���� ������ ������ ������ ���� �̸��� �˻��ϼ���.
SELECT name FROM customer WHERE custid IN (SELECT custid FROM orders WHERE bookid IN
(SELECT bookid FROM book WHERE publisher = '�̻�̵��'));

-- ���ǻ纰�� ���ǻ��� ��յ��� ���ݺ��� ��� ������ �˻��ϼ���.
-- Ʃ�ú��� : ���̺��� �̸��� ��Ī
SELECT b1.bookname FROM book b1 WHERE b1.price > 
(SELECT AVG (b2.price) FROM book b2 WHERE b2.publisher = b1.publisher);

-- ���ǻ纰 ��� �ݾ�
SELECT publisher, AVG(price) FROM book GROUP BY publisher;

-- �ζ��κ� : FROM �μ� ����
-- �� ��ȣ�� 2 ������ ���� �Ǹž��� �˻��ϼ���.
SELECT cs.name, SUM(od.saleprice) AS total FROM (SELECT custid, name FROM customer WHERE custid <= 2) cs, orders od 
WHERE cs.custid = od.custid  GROUP BY cs.name;


