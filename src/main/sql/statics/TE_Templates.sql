create table te_templates
(
    name varchar2(300), 
    template clob,
    description varchar2(300),
    created_by varchar2(100)  not null ,
    CREATED_DATE date  not null , 
    modified_by varchar2(100)  not null, 
    modified_date date  not null
    
); 

