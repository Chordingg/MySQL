--  ddl (create, drop, alter)   --  auto commit
create table member(
    name VARCHAR2 (20),
    userid VARCHAR2 (10),
    pwd VARCHAR2 (10),
    email VARCHAR2 (20),
    phone char (13),
    admin number(1) DEFAULT 0,  -- 0:�����, 1:������
    PRIMARY KEY (userid)
);

--  dml --  ���� commit
insert into member values ('����','somi','1234','jo@naver.com','010-1111-2222','0');
insert into member values ('����','sang12','1234','gma@naver.com','010-4444-5555','1');
insert into member values ('�ձ�','light','1234','youn@naver.com','010-3333-2222','0');
commit;

select* from mem5