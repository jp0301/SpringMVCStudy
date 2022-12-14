SELECT USER
FROM DUAL;
--==>> SCOTT


--○ MEMBERLIST 테이블생성
CREATE TABLE MEMBERLIST
( ID    VARCHAR2(20)
, PW    VARCHAR2(20)
, NAME  VARCHAR2(50)
, TEL   VARCHAR2(50)
, EMAIL VARCHAR2(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table MEMBERLIST이(가) 생성되었습니다.


--○ MEMBERLIST 데이터 입력
INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('superman', CRYPTPACK.ENCRYPT('1234567', '1234567'), '김태민', '010-1111-1111', 'ktm@test.com');
--> 한 줄 구성
INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('superman', CRYPTPACK.ENCRYPT('1234567', '1234567'), '김태민', '010-1111-1111', 'ktm@test.com')
;
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('superwoman', CRYPTPACK.ENCRYPT('java002$', 'java002$'), '정미경', '010-2222-2222', 'jmk@test.com')
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ MEMBERRECORD 테이블 생성
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
--==>> Table MEMBERRECORD이(가) 생성되었습니다.


--○ MEMBERRECORDSEQ 시퀀스 생성
CREATE SEQUENCE MEMBERRECORDSEQ
NOCACHE;
--==>> Sequence MEMBERRECORDSEQ이(가) 생성되었습니다.


--○ MEMBERRECORD 데이터 입력
INSERT INTO MEMBERRECORD(SCOREID, KOR, ENG, MAT, ID)
VALUES(MEMBERRECORDSEQ.NEXTVAL, 90, 80, 70, 'superman');
--> 한 줄 구성
INSERT INTO MEMBERRECORD(SCOREID, KOR, ENG, MAT, ID) VALUES(MEMBERRECORDSEQ.NEXTVAL, 90, 80, 70, 'superman')
;
--==>> 1 행 이(가) 삽입되었습니다.


SELECT ID, PW, NAME, TEL, EMAIL
FROM MEMBERLIST;
--==>>
/*
superman	=o???	김태민	010-1111-1111	ktm@test.com
superwoman	??{	정미경	010-2222-2222	jmk@test.com
*/

SELECT *
FROM MEMBERRECORD;
--==>> 1	90	80	70	superman


commit;



SELECT *
FROM MEMBERLIST;

COMMIT;

DELETE
FROM MEMBERLIST
where ID = '';

--비밀번호
-- 김태님 1234567
-- 정미경 java002$
-- 박원석 1234
SELECT NAME, CRYPTPACK.DECRYPT(PW,'java002$') AS PW
FROM MEMBERLIST;

SELECT NAME, CRYPTPACK.DECRYPT(PW,'1234567') AS PW
FROM MEMBERLIST;

SELECT NAME, CRYPTPACK.DECRYPT(PW,'1234') AS PW
FROM MEMBERLIST;


SELECT NAME
FROM MEMBERLIST
WHERE ID = 'jp0301'
AND PW=CRYPTPACK.ENCRYPT(1234, 1234)
AND NAME = '박원석';


INSERT INTO MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('jp0301', CRYPTPACK.ENCRYPT('1234', '1234'), '박원석', '010-1111-1111', 'rjswm78@gmail.com');

