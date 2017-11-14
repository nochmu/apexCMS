DECLARE
	l_user_id users.id%type; 
BEGIN

	user_pkg.crt_user(
		p_email => 'cmu@dev.loc',
		p_password => 'cmu',
		p_user_id => l_user_id
	);

	user_pkg.crt_user(
		p_email => 'admin@dev.loc',
		p_password => 'admin',
		p_user_id => l_user_id
	);

END;
/