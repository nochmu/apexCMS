CREATE OR REPLACE PACKAGE CMS_TEMPL_PKG AUTHID definer
AS 

    SUBTYPE t_template IS CLOB; 
    SUBTYPE t_key IS varchar2(255); 
    SUBTYPE t_val is varchar2(32767); 

    TYPE t_args IS TABLE OF t_val INDEX BY t_key;
        
        
    /**
    
    */
    FUNCTION render (
        p_templ  t_template, 
        p_args   t_args 
    ) RETURN t_template;

END CMS_TEMPL_PKG;
/


CREATE OR REPLACE PACKAGE BODY CMS_TEMPL_PKG AS


  FUNCTION render (
        p_templ  t_template, 
        p_args   t_args
    ) RETURN t_template AS
  BEGIN
    -- TODO: Implementation required for FUNCTION CMS_TEMPL_PKG.render
    RETURN NULL;
  END render;

END CMS_TEMPL_PKG;
/
