create table cms_pages (
	id number generated by default on null as identity   not null,
   path varchar2(255) not null, 
   content clob, 
   layout_key varchar2(255) not null, 
   
    
   
	constraint cms_pages_pk primary key(id)
);


