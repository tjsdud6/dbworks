-- ex4 ���̺� ����
CREATE TABLE ex4(
   userId      VARCHAR2(10) PRIMARY KEY,  --�⺻Ű ����
   passwd      VARCHAR2(10) NOT NULL
);

-- ���̺� �̸� ����
ALTER TABLE ex4 RENAME TO member;

-- ������ Į�� �߰�
ALTER TABLE member ADD regdate DATE;

-- �Ի����� Į�� �߰�
ALTER TABLE member ADD hireDate VARCHAR2 (20);

-- �޿� Į�� �߰�
ALTER TABLE member ADD salary NUMBER;

-- ������ ����
INSERT INTO member (userId, passwd, regDate, salary, hireDate) 
VALUES ('cloud2022', 'abcd1234', SYSDATE, 1000000, '2022/05/09');

-- ������ ���� (UPDATE ���̺�� SET Į���� = �� WHERE ����)
UPDATE member SET salary = 2000000 WHERE userId = 'smile2022';
UPDATE member SET salary = 1000000 WHERE userId = 'river2022';

-- userId �� sky2022�� ����ϰ� �޿� ������ ����
UPDATE member SET salary = 3000000 ,regdate = SYSDATE WHERE userId = 'sky2022';
UPDATE member SET salary = 1000000 WHERE userId = 'river2022';

-- ������ ����
DELETE FROM member;

-- ������ 1�� ����
DELETE FROM member WHERE userId = 'river2022';

-- �ѹ�?
ROLLBACK;

-- ������ ��ȸ
SELECT * FROM member;

-- ������ ��ȸ(����)
SELECT * FROM member ORDER BY salary DESC; -- �ƹ��͵� �Ⱦ��� �⺻ ��������, DESC �� ��������)

-- Ŀ�� ����
COMMIT;

-- Ư�� ������ ��ȸ (SELECT Į���� FROM ���̺�� WHERE ����)
SELECT regDate FROM member WHERE userId = 'river2022';

-- ���̺� ����
DROP TABLE member2;

-- ���̺� ����
CREATE TABLE member2 AS
SELECT * FROM member

-- ���̺��� ����
DESC member;