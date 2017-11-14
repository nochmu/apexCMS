CREATE OR REPLACE PACKAGE USER_PKG AS 

    SUBTYPE t_password IS varchar2(200); 
    SUBTYPE t_salt IS users.password_salt%type;
    

    /**
    
    */
    procedure crt_user(
        p_email USERS.email%type,
        p_password t_password, 
        p_user_id out users.id%type
    );  
    
    /**
      %return SHA256 hash
    */ 
    function calc_password_hash(
        p_password t_password, 
        p_salt t_salt
    ) 
    return users.password_hash%type; 

    /**
    
    */
    function check_password(user_id users.id%type, password t_password) return boolean;  




END USER_PKG;
/


CREATE OR REPLACE PACKAGE BODY USER_PKG AS

  procedure crt_user(
        p_email users.email%type,
        p_password t_password, 
        p_user_id out users.id%type
    ) AS
    l_pwhash users.password_hash%type; 
    l_pwsalt users.password_salt%type := p_email;  
  BEGIN
    l_pwhash := calc_password_hash(p_password, l_pwsalt);
    
    INSERT INTO users(email, password_hash, password_salt)
               VALUES(p_email, l_pwhash, l_pwsalt); 

  END crt_user;
  
  
  
  
  
  function calc_password_hash(p_password t_password, p_salt t_salt) return users.password_hash%type AS
    l_hash users.password_hash%type; 
  BEGIN
    select  standard_hash(p_password||'|'||p_salt, 'SHA256') into l_hash from dual;  
    RETURN l_hash;
  END calc_password_hash;
  


 

  function check_password(user_id users.id%type, password t_password) return boolean AS
  BEGIN
    -- TODO: Implementation required for function USER_PKG.check_password
    RETURN NULL;
  END check_password;
  

  

END USER_PKG;
/
