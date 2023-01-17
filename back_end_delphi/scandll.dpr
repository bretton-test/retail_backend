library scandll;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  wintypes,
   AdPort,

  winprocs;
 // forms,
// scunit in 'scunit.pas' {Form1};

{$R *.res}
//var oldapp: Tapplication;
type Tscan = procedure (kod: Pchar);StdCall;
     Tmyport  = class(TApdComPort)

   procedure ApdComPortTriggerAvail(CP: TObject; Count: Word);
  end;


 var
  result,bufer :string;
  point: TFarProc=nil;
   ApdComPort: Tmyport;



 procedure Tmyport.ApdComPortTriggerAvail(CP: TObject; Count: Word);
 var
  I : Word;
  C : Char;
  S: String;

begin
 S := '';
  for I := 1 to Count do begin
    C := ApdComPort.GetChar;
      S := S + C;
   end;

  bufer:=bufer+s;

 if (bufer[length(bufer)]=chr(10)) and (bufer[length(bufer)-1]=chr(13)) then
  begin
  delete(bufer,(length(bufer)-1),2);
 // if length(bufer)>10 then
 //begin

  result:=bufer;
  bufer:='';
    if ord(result[1])<48 then result:=copy(result,2,length(result));
  If point<>nil  then Tscan(point)(Pchar(result)) ;
  exit;
  end ;

   if bufer[length(bufer)]=chr(13) then
  begin
  delete(bufer,(length(bufer)),1);
 // if length(bufer)>10 then
 //begin

  result:=bufer;
  bufer:='';
  if ord(result[1])<48 then result:=copy(result,2,length(result));


  If point<>nil  then Tscan(point)(Pchar(result)) ;

  end

  else
  begin
    if length(bufer)>26 then bufer:='';

  end;
 end;

function  Load(const port:byte=1):byte;StdCall;
 begin
  result:=0;
  try

  ApdComPort:=tmyport.Create(nil);
  ApdComPort.Baud:=9600;
  ApdComPort.ComNumber:=port;
  ApdComPort.OnTriggerAvail:=ApdComPort.ApdComPortTriggerAvail;
  ApdComPort.Open:=true;
  result:=1;
 except
  if assigned(ApdComPort) then ApdComPort.Free;
 end;
 end;

procedure  Unload;StdCall;
begin
 if assigned(ApdComPort) then
 begin
 ApdComPort.Open:=FALSE;
 ApdComPort.Free;

 end;
 point:=nil;
end;

 procedure initproc(Aproc: Tfarproc);StdCall;
 begin
   point:=Aproc;

 end;




exports initproc;
exports load;
exports Unload;
begin


end.





