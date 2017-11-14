create or replace trigger CMS_FILES_BR
before insert on CMS_FILES
for each row 
begin  
 if inserting then 
   if :NEW.ID is null then 
      :NEW.ID := CMS_FILES_SEQ.nextval; 
   end if; 
      :NEW.CREATED_BY :=  -1;
      :NEW.CREATED_ON :=  current_timestamp;
      :NEW.UPDATED_BY :=  -1;
      :NEW.UPDATED_ON :=  current_timestamp;
 end if; 
end; 
/