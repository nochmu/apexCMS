create table cms_routes (
    from_path varchar2(200) not null, 
    to_path varchar2(200) not null

    constraint cms_routes_pk primary key(from_path)
); 
