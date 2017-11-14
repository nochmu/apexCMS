CREATE OR REPLACE package user_pkg_test as

  -- %suite

  -- %test
  procedure crt_new_user;
  
  -- %test
  procedure check_password;
  
  -- %test
  procedure check_user_exists; 
  
  -- %test
  procedure get_user_id; 
  


end;
/


CREATE OR REPLACE PACKAGE BODY USER_PKG_TEST AS

  procedure crt_new_user AS
    l_username varchar2(63) := 'test@test.org';
    l_user_id number;
    l_count_before number; 
  BEGIN
    select /* APEX79a88f */  count(*) into l_count_before from users where email = l_username ; 
    ut.expect(l_count_before, 'User '||l_username||' should not exists').to_equal(0); 
    
    user_pkg.crt_user(
        p_EMAIL=>'test@test.org',
        p_PASSWORD=>'test',
        p_USER_ID=>l_user_id
    ); 
    select /* APEX0f1d9b */  count(*) into l_count_before from users where email = l_username ; 
    ut.expect(l_count_before,  'User '||l_username||' should exists').to_equal(1); 
    
    
  END crt_new_user;

  procedure check_password AS
  BEGIN
    -- TODO: Implementation required for procedure TEST_USER_PKG.check_password
    NULL;
  END check_password;
  
  procedure check_user_exists AS
  BEGIN
    -- TODO: Implementation required for function USER_PKG_TEST.check_user_exists
    NULL; 
  END check_user_exists;

  procedure get_user_id AS
    user_id number; 
  BEGIN
    -- TODO: Implementation required for procedure USER_PKG_TEST.get_user_id
    NULL;
  END get_user_id;

   

END USER_PKG_TEST;
/
