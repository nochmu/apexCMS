CREATE OR REPLACE PACKAGE APEX_AUTH_PKG AS 

  function auth(p_username varchar2, p_password varchar2) return boolean; 
  

END APEX_AUTH_PKG;
/


CREATE OR REPLACE PACKAGE BODY APEX_AUTH_PKG AS

  function auth(p_username varchar2, p_password varchar2) return boolean AS
  BEGIN
    RETURN false;
  END auth;

END APEX_AUTH_PKG;
/
 