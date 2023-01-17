unit FiltrUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFiltrform = class(TForm)
  Timer1: TTimer;
    Edit1: TEdit;

    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

  public
    { Public declarations }

  function   PutChar(const bukva:char):string;
  procedure  SetKoords(par:TwinControl);

   private
    { Private declarations }
   FTime:integer;
   stroka:string;

  end;

var
  Filtrform: TFiltrform;

implementation

{$R *.dfm}


//-------------------------------------------------------------------------
function     TFiltrform.PutChar(const bukva:char):string;
 begin

  timer1.Enabled:=false;
  if bukva<>' 'then
                stroka:=stroka+bukva
                else stroka:=stroka+'*';

  timer1.Enabled:=true;;
  TFiltrform(self).Visible:=true;
  edit1.Text:=stroka;
  edit1.Visible:=true;
  result:=stroka;
 end;
//-----------------------------------------------------------------------------
procedure TFiltrform.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:=false;
  stroka:='';
  edit1.Visible:=false;
  TFiltrform(self).Visible:=false;
 // timer1.Enabled:=true;
 // TFiltrform(self).Close;
end;
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
 procedure  TFiltrform.SetKoords(par:TwinControl);
begin
TFiltrform(self).Parent:=par;
TFiltrform(self).Top:=0;
TFiltrform(self).Left:=0;
edit1.Width:=TFiltrform(self).Width;
edit1.Height:=TFiltrform(self).Height;
end;
//----------------------------------------------------------------------


//----------------------------------------------------------------------



procedure TFiltrform.FormCreate(Sender: TObject);
begin
  Ftime:=2000;
  stroka:='';
  Timer1.Enabled:=false;
  Timer1.Interval:=Ftime;
end;

procedure TFiltrform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TFiltrform.FormDestroy(Sender: TObject);
begin
 Filtrform:=nil;
end;

end.
