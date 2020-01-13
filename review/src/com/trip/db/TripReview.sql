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
INSERT INTO TRIPREVIEW VALUES(TRIPREVIEW_ID.NEXTVAL, 1, 'testTitle2', sysdate, null, 0, 'N')
INSERT INTO TRIPREVIEW VALUES(TRIPREVIEW_ID.NEXTVAL, 2, 'testTitle3', sysdate, null, 0, 'N')
INSERT INTO TRIPREVIEW VALUES(TRIPREVIEW_ID.NEXTVAL, 3, 'testTitle4', sysdate, null, 0, 'N')
INSERT INTO TRIPREVIEW VALUES(TRIPREVIEW_ID.NEXTVAL, 4, 'testTitle5', sysdate, null, 0, 'N')


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


-- 카테고리별 리뷰

create table category (
	c_cateNum number primary key,
	c_cateName varchar2(100) not null
);

insert into category values(1,'명소');
insert into category values(2,'숙소');
insert into category values(3,'맛집');

create sequence CATEGORYREVIEW_ID;

create table CATEGORYREVIEW (
	CR_NO number primary key,
	CR_ID varchar2(100) not null,
	CR_TITLE varchar2(100) not null,
	CR_CONTENTS CLOB not null,
	CR_DATE date not null,
	CR_COUNT number not null,
	CR_DELFLAG varchar2(5) not null,
	CR_CATEGORY number not null,
	CR_PLACEID varchar2(100) not null,
	CR_PATH varchar2(300),
	CONSTRAINTS CR_DELFLAG_CHK CHECK(CR_DELFLAG in ('Y', 'N')),
	CONSTRAINTS CR_CATEGORY_FK FOREIGN KEY(CR_CATEGORY) REFERENCES CATEGORY(c_cateNum)
);

create view categoryreview_read as select CR_NO, CR_ID, CR_TITLE, CR_CONTENTS, CR_DATE, CR_COUNT, CR_DELFLAG, c_cateName as CR_CATEGORY, CR_PLACEID, CR_PATH from category c inner join categoryreview cr on (c.c_cateNum = cr.CR_CATEGORY);

-- 테스트 내용

insert into CATEGORYREVIEW values(CATEGORYREVIEW_ID.nextval, 'max025', 'table_dd', 'asdfadsfvvv',sysdate,0,'N',1,'1233','images/231/sdf'); 

-- 여행 후기 메인 읽기

create view TRIPREIVEW_MAIN_VIEW as
select tv.tv_no, tv.TV_TEAMID, tv.tv_title, tv.tv_date, tv.tv_count, tvc.tvc_no, tvc.tvc_path, cr.cr_path
from tripreview tv
left outer join TRIPREVIEW_CONTENTS tvc on ( tv.tv_no = tvc.tvc_tvno )
left outer join categoryreview_read cr on ( tvc.tvc_reviewid = cr.cr_no )

-- 테스트 내용

INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 1, 1, 1, NULL, '으아아악', NULL, SYSDATE, NULL)
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 1, 1, 1, NULL, '으아아악1', NULL, SYSDATE, NULL)
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 1, 1, 1, NULL, '으아아악2', NULL, SYSDATE, NULL)
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 1, 1, 1, NULL, '으아아악3', 'images/1/ddfsfsf', SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 1, 1, 1, NULL, '으아아악4', 'images/1/ddfsfasdsf', SYSDATE, NULL);

INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 3, 1, 1, NULL, '으아아악', NULL, SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 3, 1, 1, NULL, '으아아악1', NULL, SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 3, 1, 1, NULL, '으아아악2', NULL, SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 3, 1, 1, NULL, '으아아악3', 'images/1/ddfsfsf', SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 3, 1, 1, NULL, '으아아악4', 'images/1/ddfsfasdsf', SYSDATE, NULL);

INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 4, 1, 1, 1, '으아아악', 'images/1/ddfsfsf', SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 4, 1, 1, NULL, '으아아악1', NULL, SYSDATE, NULL);
INSERT INTO TRIPREVIEW_CONTENTS VALUES(TRIPREVIEW_CONTENTS_ID.NEXTVAL, 4, 1, 1, NULL, '으아아악2', 'images/1/ddfsfasdsf', SYSDATE, NULL);


-- main view

select tv_no,tv_teamid, tv_title, tv_date, tv_count, tvc_no, tvc_path, cr_path, nvl2(tvc_path,null,nvl2(cr_path,null,'images/default.jpg')) default_path  from TRIPREIVEW_MAIN_VIEW where (tv_no, nvl(tvc_no,0)) in
(select tv_no, max(nvl(tvc_no,0)) from TRIPREIVEW_MAIN_VIEW
where tvc_path is not null or cr_path is not null group by tv_no union 
select tv_no, max(nvl(tvc_no,0)) from TRIPREIVEW_MAIN_VIEW
where tvc_path is null and cr_path is null and tv_no not in (select tv_no from TRIPREIVEW_MAIN_VIEW where tvc_path is not null or cr_path is not null group by tv_no) group by tv_no) and tv_no between 1 and 8 order by tv_no

