create or replace trigger USERS_BR
before insert on USERS
for each row 
begin  
 if inserting then 
   if :new.id is null then 
      select USERS_SEQ.nextval into :NEW.ID from dual; 
   end if;   
   if :new.row_version is null then 
      :new.row_version := 0; 
   end if;   
   if :new.created_by is null then 
      :new.created_by := 0; 
   end if; 
   if :new.created_on is null then 
      :new.created_on := CURRENT_TIMESTAMP; 
   end if; 
   if :new.updated_by is null then 
      :new.updated_by := 0; 
   end if; 
   if :new.updated_on is null then 
      :new.updated_on := CURRENT_TIMESTAMP; 
   end if; 

 end if; 

end;
/