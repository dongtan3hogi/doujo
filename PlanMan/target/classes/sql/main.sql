﻿CREATE TABLE job (
    job VARCHAR2(20) PRIMARY KEY
);

insert into job values('student');
insert into job values('teacher');
insert into job values('lawyer');
insert into job values('salesman');
insert into job values('architect');
insert into job values('nurse');
insert into job values('doctor');
insert into job values('accountant');
insert into job values('nutritionist');
insert into job values('soldier');
insert into job values('marine');
insert into job values('developer');
insert into job values('projectmanager');
insert into job values('fireman');
insert into job values('scientist');
insert into job values('writer');
insert into job values('photographer');
insert into job values('actor');
insert into job values('singer');
insert into job values('journalist');

CREATE TABLE member (
    id VARCHAR2(20) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    nickname VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    gender VARCHAR2(10) CHECK (gender in ('male', 'female')),
    age NUMBER NOT NULL,
    job VARCHAR2(100) REFERENCES job(job),
    hobby VARCHAR2(2000),
    height NUMBER,
    weight NUMBER,
    daykacl NUMBER
);


CREATE TABLE schedule(
    schseq NUMBER NOT NULL,
	id VARCHAR2(20) NOT NULL,
	eventtype VARCHAR2(20) NOT NULL CHECK (eventtype in ('study', 'work', 'health', 'friend', 'etc')),
	eventtitle VARCHAR2(100) NOT NULL,
	eventcontent VARCHAR2(2000),
	startday DATE NOT NULL,
	endday DATE NOT NULL,
    starttime VARCHAR2(20),
    endtime VARCHAR2(20),
    doornot NUMBER CHECK (doornot in (0, 1)),
    
	constraint fk_schdule foreign key (id)
    references member (id)
);

CREATE SEQUENCE schseq;

CREATE TABLE messagecontent(
    giveid VARCHAR2(20) NOT NULL,
    takeid VARCHAR2(20) NOT NULL,
    message VARCHAR2(2000),
    time VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MM:SS'),
    readcheck VARCHAR2(10) check (readcheck in ('old','nor','new')),
    keyword VARCHAR2(2000)
);



CREATE TABLE alerm(
    alermseq NUMBER PRIMARY KEY,
    eventtype VARCHAR2(20) NOT NULL,
    content VARCHAR2(1000),
    sendid VARCHAR2(20) NOT NULL,
    friendid VARCHAR2(20) NOT NULL,
    starttime VARCHAR2(20) NOT NULL,
    endtime VARCHAR2(20) NOT NULL,
    variable1 VARCHAR2(1000),
    variable2 VARCHAR2(1000),
    variable3 VARCHAR2(1000),
    variable4 VARCHAR2(1000),
    variable5 VARCHAR2(1000)

);

CREATE SEQUENCE alermseq;
