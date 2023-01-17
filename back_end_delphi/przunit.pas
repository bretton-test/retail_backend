unit przunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OracleNavigator, StdCtrls, Grids, DBGrids, ExtCtrls,db,sunit;

type
  Tprzform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    OracleNavigator1: TOracleNavigator;
    Panel3: TPanel;
    nameedit: TEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure nameeditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure nameeditKeyPress(Sender: TObject; var Key: Char);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
  private
    { Private declarations }
  isclosed:boolean;
  procedure Scan (Sender:Tobject;Barcode:string);
  public
    { Public declarations }
  end;

var
  przform: Tprzform;

implementation

uses dmunit, messageunit;

{$R *.dfm}

procedure Tprzform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.Qprzwd.Filtered:=false;

 isclosed:=true;
 Action:=caFree;
end;

procedure Tprzform.FormDestroy(Sender: TObject);
begin
if not isclosed then
begin
  dm.Qprzwd.Filtered:=false;

end;
 przform:=nil;
end;

procedure Tprzform.DBGrid1DblClick(Sender: TObject);
begin
if dbgrid1.DataSource.DataSet.State=dsBrowse then
przform.ModalResult:=dm.getkod;
end;

procedure Tprzform.nameeditChange(Sender: TObject);
begin

dm.locname(nameedit.Text);

end;

procedure Tprzform.FormShow(Sender: TObject);
begin
nameedit.SetFocus;
end;

procedure Tprzform.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If key=13  then  dbgrid1.OnDblClick(nil);
end;

procedure Tprzform.FormCreate(Sender: TObject);
begin
 Tprzform(self).OnScanAction:=scan;

isclosed:=false;
end;
procedure Tprzform.Scan (Sender:Tobject;Barcode:string);
begin
    if not dm.locproizw(barcode)
          then begin
                    dm.addmemo(messageunit.m2);
                    dm.createproizw(barcode);
              end;


end;



procedure Tprzform.nameeditKeyPress(Sender: TObject; var Key: Char);
begin
if key=' ' then key:='*';
end;

procedure Tprzform.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
 begin
  dbgrid1.ReadOnly:= not (BUTTON  IN [nbedit,nbinsert]);
 // dbgrid1.ReadOnly:= tOracleNavigator(sender).DataSource.DataSet.State=dsbrowse;
 //if  dbgrid1.ReadOnly then dm.addmemo('нет') else dm.addmemo('да');
end;

end.
