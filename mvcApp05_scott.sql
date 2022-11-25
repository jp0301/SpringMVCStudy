SELECT USER
FROM DUAL;
--==>> SCOTT


--�� MEMBERLIST ���̺�����
CREATE TABLE MEMBERLIST
( ID    VARCHAR2(20)
, PW    VARCHAR2(20)
, NAME  VARCHAR2(50)
, TEL   VARCHAR2(50)
, EMAIL VARCHAR2(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� MEMBERLIST ������ �Է�
INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('superman', CRYPTPACK.ENCRYPT('1234567', '1234567'), '���¹�', '010-1111-1111', 'ktm@test.com');
--> �� �� ����
INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('superman', CRYPTPACK.ENCRYPT('1234567', '1234567'), '���¹�', '010-1111-1111', 'ktm@test.com')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('superwoman', CRYPTPACK.ENCRYPT('java002$', 'java002$'), '���̰�', '010-2222-2222', 'jmk@test.com')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� MEMBERRECORD ���̺� ����
CREATE TABLE MEMBERRECORD
( SCOREID   NUMBER
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, ID        VARCHAR2(20)
, CONSTRAINT MEMBERRECORD_SCOREID_PK PRIMARY KEY(ID)
, CONSTRAINT MEMBERRECORD_KOR_CK CHECK(KOR >= 0 AND KOR <= 100)
, CONSTRAINT MEMBERRECORD_ENG_CK CHECK(ENG >= 0 AND ENG <= 100)
, CONSTRAINT MEMBERRECORD_MAT_CK CHECK(MAT >= 0 AND MAT <= 100)
, CONSTRAINT MEMBERRECORD_ID_FK FOREIGN KEY(ID)
            REFERENCES MEMBERLIST(ID)
);
--==>> Table MEMBERRECORD��(��) �����Ǿ����ϴ�.


--�� MEMBERRECORDSEQ ������ ����
CREATE SEQUENCE MEMBERRECORDSEQ
NOCACHE;
--==>> Sequence MEMBERRECORDSEQ��(��) �����Ǿ����ϴ�.


--�� MEMBERRECORD ������ �Է�
INSERT INTO MEMBERRECORD(SCOREID, KOR, ENG, MAT, ID)
VALUES(MEMBERRECORDSEQ.NEXTVAL, 90, 80, 70, 'superman');
--> �� �� ����
INSERT INTO MEMBERRECORD(SCOREID, KOR, ENG, MAT, ID) VALUES(MEMBERRECORDSEQ.NEXTVAL, 90, 80, 70, 'superman')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM MEMBERLIST;
--==>>
/*
superman	=o???	���¹�	010-1111-1111	ktm@test.com
superwoman	??{	���̰�	010-2222-2222	jmk@test.com
*/

SELECT *
FROM MEMBERRECORD;
--==>> 1	90	80	70	superman













