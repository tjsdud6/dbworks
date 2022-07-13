-- ������ ����
CREATE SEQUENCE mySeq 
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
MAXVALUE 1000 
NOCYCLE 
NOCACHE;
-- 1���� ������ 1�� �����ϸ�, �ּҰ� 1���� �ִ밪 1000���� ������ �ڵ� �����Ѵ�.

-- �������� board ���̺� ���

CREATE TABLE board(
    bno         NUMBER(4)       PRIMARY KEY,    --�۹�ȣ
    title       VARCHAR2(50)    NOT NULL,       --������
    content     VARCHAR2(2000)  NOT NULL,       --�۳���
    regDate     DATE DEFAULT SYSDATE            --�����
);

-- �Խñ� �߰�
INSERT INTO board (bno, title, content, regDate) VALUES (mySeq.NEXTVAL, '����1', '����1 �����Դϴ�.', SYSDATE);
INSERT INTO board (bno, title, content, regDate) VALUES (mySeq.NEXTVAL, '����2', '����2 �����Դϴ�.', SYSDATE);
INSERT INTO board (bno, title, content, regDate) VALUES (mySeq.NEXTVAL, '����3', '����3 �����Դϴ�.', SYSDATE);

SELECT * FROM board;

-- title1 ����2�� ���� �˻��ϼ���.
SELECT * FROM board WHERE bno = 2;

-- �Խñ� ��ȣ�� �������� �������� �����ϼ���.
SELECT * FROM board ORDER BY bno DESC;

-- �Խñ� 3���� �� ������ '�����մϴ�' �� �����ϼ���
UPDATE board SET title = 'hello', content = '�����մϴ�' WHERE bno = 8;


ROLLBACK;

COMMIT;

