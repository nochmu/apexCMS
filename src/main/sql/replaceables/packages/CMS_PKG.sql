CREATE OR REPLACE PACKAGE cms_pkg IS
   /*  

      Created: 10-Apr-17 5:32:17 PM  <br />
      %version 1
      %author  CMUEHLHAUS

      %note 
   */
   SUBTYPE response_t IS cms_rsp_pkg.response_t;
   TYPE request_t IS RECORD(
       path varchar2(200)
   );
   SUBTYPE url_t IS varchar2(200);

   PROCEDURE page(p_path varchar2, p_resp OUT response_t);


   PROCEDURE request(p_req request_t, p_resp OUT response_t);
   
   FUNCTION get_page_url(p_page_id  cms_pages.id%type) return url_t;

END cms_pkg;
/


CREATE OR REPLACE PACKAGE BODY cms_pkg IS

   PROCEDURE error_404(p_page varchar2) IS
   BEGIN
      cms_rsp_pkg.set_status(404);
      cms_rsp_pkg.set_content_type('text/plain'); 
      htp.p('Page ' || p_page || ' not found!');
   END;

   PROCEDURE render_page(p_page cms_pages.id%TYPE) IS
      l_content clob;
      l_layout  clob;
   BEGIN
      SELECT /* APEX2b7808 */  p.content, l.content
        INTO l_content, l_layout
        FROM cms_pages p
        JOIN cms_layouts l
          ON (p.layout_key = l.layout_key)
       WHERE p.id = p_page;

      l_content := REPLACE(l_layout, '${content}', l_content);

      htp.p(l_content);
   END;

   FUNCTION get_page(p_path varchar2) RETURN cms_pages.id%TYPE IS
      l_page cms_pages.id%TYPE; 
   BEGIN
      SELECT /* APEX41490f */  p.id INTO l_page FROM cms_routes r JOIN cms_pages p ON (r.to_path = p.path) WHERE r.from_path = p_path;
      RETURN l_page;
   EXCEPTION
      WHEN no_data_found THEN
         SELECT /* APEX9af33b */  p.id INTO l_page FROM cms_pages p WHERE p.path = p_path;
         RETURN l_page;

   END;

   PROCEDURE page(p_path varchar2, p_resp OUT response_t) IS
      l_content clob;
      l_resp    response_t;
      l_page    cms_pages.id%TYPE;
   BEGIN
      BEGIN
         l_page := get_page(p_path);
         render_page(l_page);
         /*   EXCEPTION
         WHEN OTHERS THEN
            error_404(p_path);   
            */
      END;

      p_resp := cms_rsp_pkg.g_response;

   END;

   PROCEDURE request(p_req request_t, p_resp OUT response_t) IS
   BEGIN
      page(p_req.path, p_resp);
   END;
   
   FUNCTION get_page_url(p_page_id  cms_pages.id%type) return url_t
   IS
        l_url url_t; 
   BEGIN
       select /* APEXa7b975 */   'http://oradev:8080/ords/'||'cmu'||'/' ||'cms'||'/'||'page'|| path into l_url from cms_pages where id = p_page_id  ; 
       return l_url; 
   END; 


END cms_pkg;
/
