unit TermUnit;

interface
 uses    Windows,Sysutils,forms;
function LoadFromTerminal(const myfile:string):boolean;
function ReadDataFile(nCommPort:integer;
                      nCommType:integer;
                      nCommSpeed:integer;
                      nWarning:integer;
                      strFileName:LPCSTR):integer;stdcall;

implementation
function ReadDataFile;stdcall; external 'EXCH7XX.DLL';
const port:integer=2;
const portSpeed:integer=115200;



function LoadFromTerminal(const myfile:string):boolean;
 begin
  result:=false;
  if not FileExists(ExtractFilePath(Application.ExeName)+'EXCH7XX.DLL')  then exit;
  try
  result:=true;
  ReadDataFile(port,0,portSpeed,1,pchar(myfile));

  except
  //result:=true;
  end;



 end;

end.
