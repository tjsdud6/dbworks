
-- ��� ���� ������ �˻��ϼ���.
SELECT * FROM customer;

-- �� ��ȣ�� 3���� ���� �̸��� �˻��ϼ���.
SELECT name FROM customer WHERE custid = 3;

-- �ּҰ� ���ѹα��� ���� �̸��� ��ȭ��ȣ�� �˻��ϼ���.
SELECT name, phone FROM customer WHERE address LIKE '%���ѹα�%';

-- ��ȭ��ȣ�� ���� ���� �̸��� �ּҸ� �˻��ϼ���
-- IS NULL ������ : ���� �ڷ�, IS NOT NULL : NULL�� �ƴ� �ڷ� 
SELECT name, address FROM customer WHERE phone IS NULL;

SELECT * 
FROM customer
WHERE phone IS NULL;

-- ���� �� �ο��� ���Ͻÿ�.
SELECT COUNT (*) AS �Ѱ��� FROM customer;
