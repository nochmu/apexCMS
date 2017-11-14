CREATE OR REPLACE PACKAGE DDL_GEN_TEST AS

  -- %suite

  -- %test
  procedure gen_table;

END DDL_GEN_TEST;
/


CREATE OR REPLACE PACKAGE BODY DDL_GEN_TEST AS

  procedure gen_table AS

  BEGIN
--  dbms_output.put_line(ddl_gen_pkg.gen_table('USERS'));

-- ut.expect(ddl_gen_pkg.gen_table('USERS')).to_equal(
-- q'[CREATE TABLE USERS
-- (
--   ID NUMBER NOT NULL
-- , ROW_VERSION NUMBER DEFAULT 0 NOT NULL
-- , CREATED_BY NUMBER NOT NULL
-- , CREATED_ON TIMESTAMP NOT NULL
-- , UPDATED_BY NUMBER NOT NULL
-- , UPDATED_ON TIMESTAMP NOT NULL
-- , CONSTRAINT  USERS_PK PRIMARY KEY (ID)
-- );
-- CREATE SEQUENCE USERS_SEQ;
-- create or replace trigger USERS_BR
-- before insert on USERS
-- for each row
-- begin
--  if inserting then
--    if :NEW.ID is null then
--       select USERS_SEQ.nextval into :NEW.ID from dual;
--    end if;
--  end if;
-- end;
-- /
-- ]');

null;
  END gen_table;

END DDL_GEN_TEST;
/
