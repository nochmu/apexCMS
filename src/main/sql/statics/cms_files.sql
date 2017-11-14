create table cms_files (
	id number not null,
    row_version number not null, 
    created_by number not null, 
    created_on timestamp(6) not null, 
    updated_by number not null, 
    updated_on timestamp(6) not null, 
    
    path varchar2(128) not null, 
    filename varchar2(128) not null, 
    file_mimetype varchar2(128) not null, 
    file_charset varchar2(64), 
    file_blob blob, 
    file_updated_on timestamp, 

    
	constraint cms_files_pk primary key(id)
);

create sequence cms_files_seq  start with 1000; 

