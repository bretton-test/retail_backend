unit postunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids,DB,Oracle,OracleData, OracleNavigator, StdCtrls, Mask,
  DBCtrls, DBCtrlsEh, ComCtrls, Buttons, Menus,filtrunit,sunit;

type
  Tpostsprav = class(TSForm)
    Panel1: TPanel;
    Panel3: TPanel;
    nav: TOracleNavigator;
    DBGrid: TDBGrid;
    Panel5: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    datereg: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   Filtr:TFiltrform;
   isclosed:boolean;
  procedure  spisok;

  public
    { Public declarations }
  procedure setds(const ds:TDataSource;send: Tpostsprav);


  end;

var
  postsprav: Tpostsprav;

implementation

uses dmunit;

{$R *.dfm}
 procedure Tpostsprav.setds(const ds:TDataSource;send: Tpostsprav);
  // var i:byte;
   begin
 {  for i:=1 to 13 do
   TDBEdit(send.FindComponent('DBEdit'+inttostr(i))).DataSource:=ds;
    datereg.DataSource:=ds;
    dbgrid.DataSource:=ds;
    nav.DataSource:=ds;
    dm.Qpostav.Open;  }
  //  Tdatasource(dbgrid.DataSource).DataSet.Open;
   end;
//-----------------------------------------------------------------------
procedure Tpostsprav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Filtr.Close;

Tdatasource(dbgrid.DataSource).DataSet.Filtered:=false;
//Tdatasource(dbgrid.DataSource).DataSet.Close;
isclosed:=true;
Action:=caFree;
end;

procedure Tpostsprav.FormDestroy(Sender: TObject);
begin
if not isclosed then
begin
Filtr.Close;

Tdatasource(dbgrid.DataSource).DataSet.Filtered:=false;
//Tdatasource(dbgrid.DataSource).DataSet.Close;

end;
postsprav:=nil;
end;

procedure Tpostsprav.DBGridDblClick(Sender: TObject);
begin
if assigned(postsprav) then begin
if  Tdatasource(dbgrid.DataSource).DataSet.RecordCount=0 then exit;
dmunit.postname:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['name'];
postsprav.ModalResult:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['cod']+100;
Tdatasource(dbgrid.DataSource).DataSet.Filtered:=false;

end;
end;

procedure Tpostsprav.FormCreate(Sender: TObject);

begin

 dm.Qpostav.Open;
//spisok;
filtr:=TFiltrform.Create(tform(self));
Filtr.SetKoords(panel5);
isclosed:=false;
end;

procedure Tpostsprav.TreeView1DblClick(Sender: TObject);
begin

//dm.addmemo((TreeView1.Selected.Text));
end;



procedure Tpostsprav.spisok ;

begin

end;



procedure Tpostsprav.DBGridKeyPress(Sender: TObject; var Key: Char);
var temp:string;
begin
 if ord(key)>31 then
 begin
  temp:=Filtr.PutChar(Key);
 // dm.Qpostav.Locate('name',(Filtr.PutChar(Key)),[loCaseInsensitive, loPartialKey]);
  dm.Qpostav.Filter:='name='+chr(39)+'*'+temp+'*'+chr(39);
  if temp<>'' then dm.Qpostav.Filtered:=true
                else dm.Qpostav.Filtered:=false;
 end;
 end;

procedure Tpostsprav.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//dm.addmemo(inttostr(key));
if key=13 then dbgrid.OnDblClick(nil);
if key=27 then dm.Qpostav.Filtered:=false;

end;

procedure Tpostsprav.FormShow(Sender: TObject);
begin
dbgrid.SetFocus;
end;

end.
