DROP TABLE KEYSEARCH;

DROP SEQUENCE KEYSEQ;

CREATE SEQUENCE KEYSEQ;

CREATE TABLE KEYSEARCH(
	MYNO NUMBER PRIMARY KEY,
	MYID VARCHAR(1000),
	MYSEARCH VARCHAR(4000),
	CONSTRAINTS MYID_FK FOREIGN KEY(MYID) REFERENCES MYMEMBER(MYID) 
);

SELECT * FROM KEYSEARCH;

	

