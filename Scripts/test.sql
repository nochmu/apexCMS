DECLARE
	l_user_id users.id%type;
	l_dataj clob := '[
	{
	"email" : "cmu@dev.loc", 
	"password" : "cmu", 
	},{
		"email" : "admin@dev.loc", 
		"password" : "admin", 
	}
	]'; 
	cursor d1 is 
		select u.email, u.pw
		from JSON_TABLE(l_dataj, '$[*]'
			COLUMNS(
				email varchar2(200) path '$.email',
			    pw varchar2(200)  path '$.password')
		) as u
		; 
	cursor d2 is 
		with x(email, pw) as (
			select 'cmu@dev.loc', 'cmu' from dual
			union all
			select 'admin@dev.loc', 'admin'  from dual
		)
		select * from x; 
		
begin
	
	for c in d1
	loop
		dbms_output.put_line(c.email ||'/'|| c.pw); 
	end loop; 

	

END;

