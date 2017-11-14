create table users (
	id 				number 			not null,
    row_version 	number 			not null,
    created_by 		number 			not null,
    created_on 		timestamp(6) 	not null,
    updated_by 		number 			not null,
    updated_on 		timestamp(6) 	not null,
    email 			varchar2(255)   not null,
    password_hash 	varchar2(255)	not null,
    password_salt 	varchar2(255)	not null,
    user_key 		varchar2(63),

	constraint users_pk 	primary key(id)

);

create sequence users_seq  start with 1000; 
