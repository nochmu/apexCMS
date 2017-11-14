CREATE OR REPLACE PACKAGE cms_rsp_pkg IS
   /*  

      Created: 10-Apr-17 7:32:21 PM  <br />
      %version 1
      %author  CMUEHLHAUS

      %note 
   */

   TYPE response_t IS RECORD(
       ords_status  number DEFAULT 200 -- HTTP Status line   
      ,ords_forward varchar2(200) DEFAULT null -- internal forwarding by ORDS           
      ,location     varchar2(200) DEFAULT null
      ,content_type varchar2(200) DEFAULT null);

   g_response response_t;

   PROCEDURE set_status(p_status number);
 
   PROCEDURE set_content_type(p_mime varchar2, p_charset varchar2 DEFAULT 'UTF-8');

END cms_rsp_pkg;
/


CREATE OR REPLACE PACKAGE BODY cms_rsp_pkg IS

   PROCEDURE set_status(p_status number) IS
   BEGIN
      g_response.ords_status := p_status;
   END;

   PROCEDURE set_content_type(p_mime varchar2, p_charset varchar2 DEFAULT 'UTF-8') IS
   BEGIN
      -- owa_util.mime_header(p_mime, false, 'UTF-8');
      g_response.content_type := p_mime || '; charset=' || p_charset;
   END;

END cms_rsp_pkg;
/
