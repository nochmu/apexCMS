CREATE OR REPLACE PACKAGE APEX_AUTH_TEST AS 

 -- %suite

  -- %test
  procedure auth;

END APEX_AUTH_TEST;
/


CREATE OR REPLACE PACKAGE BODY APEX_AUTH_TEST AS

  procedure auth AS
    is_valid boolean; 
  BEGIN

    is_valid := apex_auth_pkg.auth(P_USERNAME=>'test@test.org',P_PASSWORD=>'test'); 
    ut.expect(is_valid).to_be_true; 
    
    is_valid := apex_auth_pkg.auth(P_USERNAME=>'TEST@TEST.ORG',P_PASSWORD=>'test'); 
    ut.expect(is_valid).to_be_true; 
    
     is_valid := apex_auth_pkg.auth(P_USERNAME=>'test@test.org',P_PASSWORD=>'test2'); 
    ut.expect(is_valid).to_be_false; 
    
  END auth;

END APEX_AUTH_TEST;
/ 
