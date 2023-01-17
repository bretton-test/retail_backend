unit rfindunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit, StdCtrls, DB, OracleData, Grids, DBGridEh, ExtCtrls,strutils,
  Buttons;

type
  Trfindform = class(TSForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Query: TOracleDataSet;
    DataSource1: TDataSource;
    NameEdit: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NameEditChange(Sender: TObject);
    procedure NameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rfindform: Trfindform;

implementation

uses dmunit;

{$R *.dfm}

procedure Trfindform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=caFree;
end;

procedure Trfindform.NameEditChange(Sender: TObject);
var temp:string;
begin
temp:=Tedit(sender).Text;
while pos('*',temp)>0 do temp:=StuffString(temp,pos('*',temp),1,'%');//temp[pos('*',temp)]:='%';
//Tedit(sender).Text:=temp;
Query.SetVariable('tovar',temp);

end;

procedure Trfindform.NameEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If key=13  then
begin
Query.Close;

Query.Open;
end;
end;

procedure Trfindform.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
if key=' ' then key:='*';
end;

procedure Trfindform.BitBtn3Click(Sender: TObject);
begin
with Query do
begin
 if active then last;
end;
end;

procedure Trfindform.BitBtn2Click(Sender: TObject);
begin
with Query do
begin
 if active then first;
end;
end;

end.
