create or replace function betwnstr( a_string varchar2, a_start_pos integer, a_end_pos integer ) return varchar2
is
begin
  return substr( a_string, a_start_pos, a_end_pos - a_start_pos );
end;
/ 