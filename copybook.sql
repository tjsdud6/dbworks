-- book ���̺� ����
CREATE TABLE t_book AS SELECT * FROM book;

-- �ڷ� ��ü ��ȸ
SELECT * FROM t_book;

-- '�౸�� ����'�� 10000������ ����
UPDATE t_book SET price = 10000 WHERE bookid = 1;

-- '����� ����'�� ���ǻ� �̸��� '������'�� �����ϼ���.
UPDATE t_book SET publisher = '������' WHERE bookid = 6;

-- '�߱��� ��Ź��'�� ���ǻ縦 '�Ｚ��'���� �����ϰ�, ������ 15000������ �����ϼ���.
UPDATE t_book SET publisher = '�Ｚ��', price = 15000 WHERE bookid = 8;

-- ������ȣ�� 5���� å�� �����ϼ���.
DELETE FROM t_book WHERE bookid = 5;

-- '���� ���̺�' ������ �����ϼ���
DELETE FROM t_book WHERE bookname = '���� ���̺�';

ROLLBACK;

COMMIT;