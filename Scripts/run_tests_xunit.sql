set serveroutput on; 
begin
	dbms_output.enable(null); 
	ut.run(ut_xunit_reporter());
END; 
/
EXIT
/