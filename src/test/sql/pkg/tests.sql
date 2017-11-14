create or replace package demo_pkg as

  function get_val return number;

end;
/

create or replace package body demo_pkg as

  function get_val return number is
  begin
    return 2;  
  end;

end;
/


create or replace package demo_test as

  -- %suite

  -- %test
  procedure success;

end;
/

create or replace package body demo_test as

  procedure success is
  begin
    ut.expect( demo_pkg.get_val ).to_equal( 3 ); 
  end;

end;
/