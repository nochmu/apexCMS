CREATE OR REPLACE PACKAGE CMS_TEMPL_TEST AS 

 -- %suite

  -- %test
  procedure simple;

END CMS_TEMPL_TEST;
/


CREATE OR REPLACE PACKAGE BODY CMS_TEMPL_TEST AS

  procedure simple AS
    l_args CMS_TEMPL_PKG.t_args; 
  BEGIN
    -- TODO: Implementation required for procedure CMS_TEMPL_TEST.test1
    NULL;
  END simple;

END CMS_TEMPL_TEST;
/
