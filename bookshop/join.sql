-- ���� : 1�� �̻��� ���̺��� ����
-- ���� ���� �ֹ��� ���� �����͸� ��� �˻��ϼ���
SELECT * 
FROM customer, orders 
WHERE customer.custid = orders.custid;

-- ���� �̸��� ���� �ֹ��� ������ �Ǹ� ������ �˻��ϼ���.
SELECT customer.name, orders.saleprice 
FROM customer, orders 
WHERE customer.custid = orders.custid;

-- '�Ȼ�' ���� �ֹ������� �˻��ϼ���.
SELECT * 
FROM customer, orders 
WHERE customer.custid = orders.custid 
AND customer.name = '�Ȼ�';

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϼ���.
SELECT customer.name, SUM(saleprice) AS ���Ǹž� 
FROM customer, orders 
WHERE customer.custid = orders.custid 
GROUP BY customer.name ORDER BY customer.name;

-- ���� �̸��� �ֹ��� ������ �̸��� �˻��ϼ���.
SELECT customer.name, book.bookname, orders.saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND book.bookid = orders.bookid
ORDER BY customer.name;

-- ������ 20000���� ������ �ֹ��� ���� �̸��� �ֹ��� ������ �̸��� �˻��ϼ���.
SELECT customer.name, book.bookname, orders.saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND book.bookid = orders.bookid
AND book.price = 20000;

-- �ܺ� ����(outer join) : ���� ������ ��Ȯ�� ��ġ���� �ʾƵ� ��� ����� ���
-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �Ǹ� ������ ���ϼ���.
SELECT customer.name, orders.saleprice
FROM customer LEFT OUTER JOIN orders
ON customer.custid = orders.custid;