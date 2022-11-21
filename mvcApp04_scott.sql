SELECT USER
FROM DUAL;
--==>> SCOTT
--����������������������������������������


DROP TABLE REGION;

--�� �ǽ� ���̺� ����
CREATE TABLE REGION
( REGIONID   NUMBER                             -- ���� ���̵� -- PK
, REGIONNAME VARCHAR2(30)                       -- ���� �̸�
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION��(��) �����Ǿ����ϴ�.

DROP SEQUENCE REGIONSEQ;

--�� ������ ���� (���� : REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(���� ������ �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '��õ');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '�뱸');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '�λ�');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '�泲');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '�泲');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. 16

--�� Ȯ��
SELECT REGIONID, REGIONNAME
FROM REGION;
--==>>
/*
1	����
2	��õ
3	�뱸
4	����
5	����
6	�λ�
7	���
8	���
9	����
10	���
11	�泲
12	����
13	����
14	���
15	�泲
16	����
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--����������������������������������������


--�� �ǽ� ���̺� ���� (���� : POSITION)
CREATE TABLE POSITION
( POSITIONID        NUMBER                          -- ���� ���̵� --PK
, POSITIONNAME     VARCHAR2(30)                     -- ���� �̸�
, MINBASICPAY       NUMBER                          -- �ش� ������ �ּ� �⺻��
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION��(��) �����Ǿ����ϴ�.


--�� ������ ���� (����: POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;

--�� ������ �Է�(���� ������ �Է�)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '���', 1000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '�븮', 2000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '����', 3000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '����', 4000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '��', 5000000);

--�� Ȯ��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
/*
1	���	1000000
2	�븮	2000000
3	����	3000000
4	����	4000000
5	��	5000000
*/

--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.




--����������������������������������������




--�� �ǽ� ���̺� ���� (�μ� : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER
, DEPARTMENTNAME    VARCHAR2(30)
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT��(��) �����Ǿ����ϴ�.


--�� ������ ���� (�μ�)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է� ( �μ� ������ �Է� )
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '���ߺ�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '��ȹ��');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '������');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '�λ��');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '�����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

--�� Ȯ��
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
/*
1	���ߺ�
2	���ߺ�
3	��ȹ��
4	������
5	�λ��
6	�����
*/

-- Ŀ��
COMMIT;
---==>> Ŀ�� �Ϸ�

--����������������������������������������

--�� �ǽ� ���̺� ���� ( ���� : EMPLOYEE)
-- �����ȣ, �����, �ֹι�ȣ, �������, ������, ��ȭ��ȣ, �μ�, ����, ����, �⺻��, ����
CREATE TABLE EMPLOYEE
( EMPLOYEEID        NUMBER              -- �����ȣ --PK    
, NAME              VARCHAR2(30)        -- �����
, SSN               VARCHAR2(20)        -- �ֹι�ȣ --��ȣȭ ��� ����(Ÿ�� CHECK~!!!)
, BIRTHDAY          DATE                -- �������
, LUNAR             NUMBER(1) DEFAULT 0 -- ������   -- ���0, ����1
, TELEPHONE         VARCHAR2(40)        -- ��ȭ��ȣ
, DEPARTMENTID      NUMBER              -- �μ� ���̵� --FK
, POSITIONID        NUMBER              -- ���� ���̵� --FK
, REGIONID          NUMBER              -- ���� ���̵� --FK
, BASICPAY          NUMBER              -- �⺻��
, EXTRAPAY          NUMBER              -- ����
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR = 1)
);
--==>> Table EMPLOYEE��(��) �����Ǿ����ϴ�.

--�� ������ ���� (���� : EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է� (���� ������ �Է�)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR,
                    TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY)
VALUES( EMPLOYEESEQ.NEXTVAL, '���ҿ�', CRYPTPACK.ENCRYPT('9411242234567', '9411242234567')
        , TO_DATE('1994-11-24', 'YYYY-MM-DD'), 0, '010-7193-4562', 1, 1, 1, 1500000, 1500000 );
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM EMPLOYEE;

/*
EMPLOYEEID NAME       SSN       BIRTHDAY   LUNAR  TELEPHONE       
---------- ---------- --------- ---------- ------ --------------- 
         1 ���ҿ�     ?`??$?   1994-11-24 0      010-7193-4562  
         
         
DEPARTMENTID POSITIONID REGIONID   BASICPAY   EXTRAPAY
------------ ---------- ---------- ---------- ----------
1            1          1          1500000    1500000
*/


--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ���� ���� ��ȸ ������ ����
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID = E.REGIONID ) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;



--�ۺ� ����(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID = E.REGIONID ) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM EMPLOYEEVIEW;




--�� ���� ���� ��ȸ ������ ����
--   (Ư�� ���� ������ ���� ���ɿ��� Ȯ��)
SELECT R.REGIONID AS REGIONID
     , R.REGIONNAME AS REGIONNAME
     , (SELECT COUNT(*) 
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
--==>>
/*
1	����	1
2	��õ	0
3	�뱸	0
    :
14	���	0
15	�泲	0
16	����	0
*/
--==> ������� ���� ������ ������ �Ұ����� �������̸�,
-- �� �� ������ ���� ������ ������ ������ ���������� �Ǻ��� �� �ֵ��� ������ ������.


--�� �� ����(���� ���� : REGIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID AS REGIONID
     , R.REGIONNAME AS REGIONNAME
     , (SELECT COUNT(*) 
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW��(��) �����Ǿ����ϴ�.


--�� ���� ���� ������
SELECT P.POSITIONID AS POSITIONID
     , P.POSITIONNAME AS POSITIONNAME
     , P.MINBASICPAY AS MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
/*
1	���	1000000	1
2	�븮	2000000	0
3	����	3000000	0
4	����	4000000	0
5	��	5000000	0
*/

--�� �� ����(���� ���� POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID AS POSITIONID
     , P.POSITIONNAME AS POSITIONNAME
     , P.MINBASICPAY AS MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM POSITIONVIEW;




--�� �μ� ���� ������
SELECT D.DEPARTMENTID AS DEPARTMENTID
     , D.DEPARTMENTNAME AS DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
/*
1	���ߺ�	1
2	���ߺ�	0
3	��ȹ��	0
4	������	0
5	�λ��	0
6	�����	0
*/

--�� �� ���� (�μ� ���� : DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID AS DEPARTMENTID
     , D.DEPARTMENTNAME AS DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM DEPARTMENTVIEW;
--==>> ����� ��¿Ϸ�.

-- 0 �̸� ���� ����, 0�� �ƴϸ� EMPLOYEE���� �����ǰ������� �����Ұ�.



-- ��������������������������������������

-- �μ� ��ü ������ ��ȸ ������ ����
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID;
--> �� �� ����
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;
/*
1	���ߺ�	1
2	���ߺ�	0
3	��ȹ��	0
4	������	0
5	�λ��	0
6	�����	0
*/


-- �μ� ������ ���� ������ ����
-- (�μ���ȣ�� �μ� ������ ����)
DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID = 1;
--> �� �� ����
DELETE FROM DEPARTMENT WHERE DEPARTMENTID = 1
;



-- �μ� ������ ���� ������ ����(�μ���ȣ�� �μ� �̸� ����)
UPDATE DEPARTMENT
SET DEPARTMENTNAME ='�ѹ���'
WHERE DEPARTMENTID = 1;
--> �� �� ����
UPDATE DEPARTMENT SET DEPARTMENTNAME ='�ѹ���' WHERE DEPARTMENTID = 1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.


-- ��������������������������������������

-- ���� ��ü ������ ��ȸ ������ ����
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;
--> �� �� ����
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID
;
/*
1	����	1
2	��õ	0
3	�뱸	0
4	����	0
5	����	0
6	�λ�	0
7	���	0
8	���	0
9	����	0
10	���	0
11	�泲	0
*/


-- ���� ������ ���� ������ ����
-- (������ȣ�� �μ� ������ ����)
DELETE
FROM REGION
WHERE REGIONID = 1;
-->
DELETE FROM REGION WHERE REGIONID = 1
;



-- ���� ������ ���� ������ ����(������ȣ�� �μ� �̸� ����)
UPDATE REGION
SET REGIONNAME ='������'
WHERE REGIONID = 1;
--> �� �� ����
UPDATE REGION SET REGIONNAME ='������' WHERE REGIONID = 1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.


-- ��������������������������������������

-- ���� ��ü ������ ��ȸ ������ ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
-->
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;


-- ���� ������ ���� ������ ����
-- (������ȣ�� ���� ������ ����)
DELETE
FROM POSITION
WHERE POSITIONID = 1;
-->
DELETE FROM POSITION WHERE POSITIONID = 1
;



-- ���� ������ ���� ������ ����(������ȣ�� ���� �̸� ����)
UPDATE POSITION
SET POSITIONNAME ='������'
  , MINBASICPAY = 3000000
WHERE POSITIONID = 1;
--> �� �� ����
UPDATE POSITION SET POSITIONNAME ='������', MINBASICPAY = 3000000 WHERE POSITIONID = 1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.



-- ��������������������������������������
-- ��������������������������������������
-- ���� �α��� / �α׾ƿ� ��� ���� ���� �߰� ����

-- ���� �츮�� ������ ���̺� ������ ID �� PW �÷� ������ ����ִ� ���̺���
-- ������ �������� �ʴ� ��Ȳ�̴�.
-- �̿� �����Ͽ� EMPLOYEEID(������̵�)�� SSN(�ֹι�ȣ) ���ڸ� 7�ڸ��� ���ڸ���
-- Ȱ���Ͽ� ����� ������ �� �ֵ��� ó���Ѵ�.

--�� ���� ���̺� ���� ����
--��
-- EMPLOYEE (���� ������ ���̺�)�� SSN(�ֹι�ȣ) �÷��� �и��Ѵ�.
-- SSN --------------> SSN1, SSN2
-- SSN1 -------------> �ֹι�ȣ �� 6�ڸ�
-- SSN2 -------------> �ֹι�ȣ �� 7�ڸ� �� ��ȣȭ ����

--��
-- EMPLOYEE (���� ������ ���̺�)�� GRADE(���) �÷��� �߰��Ѵ�.
-- GRADE ------------> ������0, �Ϲݻ��1


--�� ���� ���̺� ���� ���� ����
--��-1. �÷� �߰�
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.

SELECT *
FROM EMPLOYEE;
/*
... SSN1   SSN2
... (null) (null)
*/

--��-2. ���� �����Ϳ� ���� �÷��� ���� ����
-- '9411242234567'

-- �� Ǯ��
UPDATE EMPLOYEE 
SET SSN1 = SUBSTR((SELECT CRYPTPACK.DECRYPT(SSN, '9411242234567') FROM EMPLOYEE), 1, 6)
  , SSN2 = CRYPTPACK.ENCRYPT(SUBSTR((SELECT CRYPTPACK.DECRYPT(SSN, '9411242234567') FROM EMPLOYEE), 7, 7)
                           , SUBSTR((SELECT CRYPTPACK.DECRYPT(SSN, '9411242234567') FROM EMPLOYEE), 1, 6))
WHERE EMPLOYEEID = 1;
-- �� EMPLOYEE�� ��������...


-- �Բ��� Ǯ��
SELECT CRYPTPACK.DECRYPT(SSN, '9411242234567')
FROM EMPLOYEE;

/*
UPDATE EMPLOYEE
SET SSN1 = SUBSTR(�Է³���, 1, 6)
  , SSN2 = CRYPTPACK.ENCRYPT(SUBSTR(�Է³���, 7, 7), SUBSTR(�Է³���, 7, 7));
*/

UPDATE EMPLOYEE
SET SSN1 = SUBSTR(CRYPTPACK.DECRYPT(SSN, '9411242234567'), 1, 6)
  , SSN2 = CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN, '9411242234567'), 7, 7)
                           , SUBSTR(CRYPTPACK.DECRYPT(SSN, '9411242234567'), 7, 7));

SELECT *
FROM EMPLOYEE;
--==>>
/*
... SSN1    SSN2
... 941124	/???
*/


ROLLBACK;
--==>> �ѹ� �Ϸ�.

--��-3. ���� SSN(�ֹι�ȣ) �÷� ����
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.



--��-1. GRADE �÷� �߰� �� �⺻���� 1(�Ϲ� ���)�� ����
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM EMPLOYEE;


--��-2. ���ҿ� ����� �����ڷ� �Ӹ�(����)
UPDATE EMPLOYEE
SET GRADE='0'
WHERE EMPLOYEEID=1;

-- Ȯ��
SELECT *
FROM EMPLOYEE;


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���̺��� ������ �����߱� ������
--   �� ���̺�(EMPLOYEE)�� ������� ������ ���� ������ ����
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID = E.REGIONID ) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
     , E.GRADE AS GRADE
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.

-- Ȯ��

SELECT *
FROM EMPLOYEEVIEW;

--�� ������ �Է�(���� ������ �Է�) - �÷��� ������ ����� ������ ������� �ٽ� ����~!!!
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR,
                    TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY)
VALUES( EMPLOYEESEQ.NEXTVAL, '���̰�', '981009', CRYPTPACK.ENCRYPT('2345678', '2345678')
        , TO_DATE('1998-10-09', 'YYYY-MM-DD'), 0, '010-3098-3091', 1, 1, 8, 1500000, 1500000 );

SELECT *
FROM EMPLOYEE;


SELECT *
FROM EMPLOYEEVIEW;

UPDATE EMPLOYEE 
SET SSN2 = CRYPTPACK.ENCRYPT('2345678', '2345678')
WHERE EMPLOYEEID = 2;
--==>> ���������� �ٽ� ������� 1���� SSN2��

COMMIT;
-- Ŀ��


-- ��������������������������������������

-- �Ϲ� ��� �α��� ������ ����(���̵�, �н�����)
-- �����ȣ, �ֹι�ȣ���ڸ�
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID = ���̵�
  AND SSN2=�н�����;
  
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID = 2
  AND SSN2 = CRYPTPACK.ENCRYPT('2345678', '2345678');
--==>> ���̰�
--> �Ϲݻ�� �α��� ����~!!!
  
-- �Ϲݻ�� �α��� ������ �� �� ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID = 2 AND SSN2 = CRYPTPACK.ENCRYPT('2345678', '2345678')
;
  

-- ������ �α��� ������ ����(���̵�, �н�����, ���)
-- �����ȣ, �ֹι�ȣ���ڸ�, ���

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID = 2
  AND SSN2 = CRYPTPACK.ENCRYPT('2345678', '2345678')
  AND GRADE=0;
--==>> ��ȸ ��� ����
--> �����ڷα��� ����
  
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID = 1
  AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567')
  AND GRADE=0;
--==>> ���ҿ�
--> �����ڷα��� ����

--������ �α��� �� �� ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID = 1 AND SSN2 = CRYPTPACK.ENCRYPT('2234567', '2234567') AND GRADE=0
;


------------------------------------------------------------------------

desc EMPLOYEEVIEW;
desc departmentview;
desc regionview;
desc position;



select ssn2
from employee;

select CRYPTPACK.DECRYPT(ssn2, '1111') as ssn2
from employee;



select CRYPTPACK.DECRYPT(ssn2, '1212123') as ssn2
from employee;


