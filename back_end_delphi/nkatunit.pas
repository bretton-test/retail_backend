unit nkatunit;

interface
  uses sysutils;
 function newkat(const name:string):integer;



 implementation

 function newkat(const name:string):integer;
  var temp:string;
  begin
   result:=-1;
   temp:=ansiuppercase(name);

  end;
end.
