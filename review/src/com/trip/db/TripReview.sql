DROP SEQUENCE TRIPREVIEW_ID;
DROP SEQUENCE TRIPREVIEW_CONTENTS_ID;

DROP TABLE TRIPREVIEW;
DROP TABLE TRIPREVIEW_CONTENTS;

-- 여행 후기 메인뷰

CREATE SEQUENCE TRIPREVIEW_ID;

create table TRIPREVIEW (
	TV_NO NUMBER PRIMARY KEY,
	TV_TEAMID NUMBER NOT NULL,
	TV_TITLE VARCHAR2(250) NOT NULL,
	TV_DATE DATE NOT NULL,
	TV_MODIFYDATE DATE,
	TV_COUNT NUMBER NOT NULL,
	TV_DELFLAG VARCHAR2(5) NOT NULL,
	CONSTRAINTS TV_DELFLAG_CONSTRANTS CHECK( TV_DELFLAG IN ('Y','N') )
);

-- 내용 테스트
INSERT INTO TRIPREVIEW VALUES(TRIPREVIEW_ID.NEXTVAL, 0, 'testTitle', sysdate, null, 0, 'N')

-- 여행 후기 내용

CREATE SEQUENCE TRIPREVIEW_CONTENTS_ID;

create table TRIPREVIEW_CONTENTS(
	TVC_NO NUMBER PRIMARY KEY,
	TVC_TVNO NUMBER NOT NULL,
	TVC_DAY NUMBER NOT NULL,
	TVC_ROUTEID NUMBER,
	TVC_REVIEWID NUMBER,
	TVC_CONTENTS CLOB,
	TVC_PATH VARCHAR2(300),
	TVC_DATE DATE NOT NULL,
	TVC_MODIFYDATE DATE,
	CONSTRAINTS TVC_TVNO_CONSTRANTS FOREIGN KEY(TVC_TVNO) REFERENCES TRIPREVIEW(TV_NO)
);

INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 1, 1, 1, NULL, '으아아악', NULL, SYSDATE, NULL)

UPDATE TRIPREVIEW_CONTENTS SET TVC_PATH = 'images/TripReviewContents/1/bg.jpg' where tvc_no = 1

