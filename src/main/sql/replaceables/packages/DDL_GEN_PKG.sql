CREATE OR REPLACE PACKAGE DDL_GEN_PKG AS 

  function gen_table(
    name varchar2
  ) return clob;

END DDL_GEN_PKG;
/


CREATE OR REPLACE PACKAGE BODY DDL_GEN_PKG AS

  --   LN varchar2(2) := chr(13)||chr(10); 
     LN varchar2(2) := chr(10); 


  function gen_table(
    name varchar2
  ) return clob AS
    ddl clob; 
  BEGIN
    ddl := ddl || 'CREATE TABLE '||name || LN ; 
    ddl := ddl || '(' || LN; 
    ddl := ddl || '  ID NUMBER NOT NULL' || LN; 
    ddl := ddl || ', ROW_VERSION NUMBER DEFAULT 0 NOT NULL ' || LN; 
    ddl := ddl || ', CREATED_BY NUMBER NOT NULL ' || LN; 
    ddl := ddl || ', CREATED_ON TIMESTAMP NOT NULL' || LN; 
    ddl := ddl || ', UPDATED_BY NUMBER NOT NULL ' || LN; 
    ddl := ddl || ', UPDATED_ON TIMESTAMP NOT NULL ' || LN; 
    ddl := ddl || ', CONSTRAINT  '||name||'_PK PRIMARY KEY (ID) ' || LN; 
    ddl := ddl || ');' || LN; 
    
    ddl := ddl || 'CREATE SEQUENCE '||name || '_SEQ'||' START WITH 1000;'||LN; 
    
    ddl := ddl || 'create or replace trigger '||name||'_BR' || LN; 
    ddl := ddl || 'before insert on '||name || LN; 
    ddl := ddl || 'for each row ' || LN; 
    ddl := ddl || 'begin  ' || LN; 
    ddl := ddl || ' if inserting then ' || LN; 
    ddl := ddl || '   if :NEW.ID is null then ' || LN; 
    ddl := ddl || '      :NEW.ID := '||name||'_SEQ.nextval; ' || LN; 
    ddl := ddl || '   end if; ' || LN; 
    ddl := ddl || '      :NEW.CREATED_BY :=  -1;' || LN; 
    ddl := ddl || '      :NEW.CREATED_ON :=  current_timestamp;' || LN; 
    ddl := ddl || '      :NEW.UPDATED_BY :=  -1;' || LN; 
    ddl := ddl || '      :NEW.UPDATED_ON :=  current_timestamp;' || LN; 

    ddl := ddl || ' end if; ' || LN; 
    ddl := ddl || 'end;' || LN; 
    ddl := ddl || '/'||LN; 


    RETURN ddl;
  END gen_table;

END DDL_GEN_PKG;
/
