create table cms_layouts (
	id number generated by default on null as identity   not null,
   	name varchar2(255),
   	content clob,
   	layout_key varchar2(255),


	constraint cms_layouts_pk primary key(id),
    constraint cms_layouts_key_uk unique(layout_key)
);
