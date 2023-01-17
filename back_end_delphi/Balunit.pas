unit Balunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls,db,oracle, Buttons, StdCtrls,sunit;

type
  TBalForm = class(TSForm)
    Panel1: TPanel;
    DBGrid: TDBGridEh;
    Postname: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BalForm: TBalForm;

implementation

uses dmunit, postunit;

{$R *.dfm}

procedure TBalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Tdatasource(dbgrid.DataSource).DataSet.Close;

Action:=caFree;
end;

procedure TBalForm.FormDestroy(Sender: TObject);
begin
BalForm:=nil;
end;

procedure TBalForm.FormCreate(Sender: TObject);
begin

Tdatasource(dbgrid.DataSource).DataSet.Open;
end;

procedure TBalForm.SpeedButton1Click(Sender: TObject);
var post:integer;
begin
   If not assigned(postsprav)  then begin
    postsprav:=Tpostsprav.Create(tform(self),tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Поставщики';
      //postsprav.OnActivate(postsprav);

       post:=postsprav.ShowModal-100;
    if post>0 then begin
    postname.Text:=dmunit.postname;
    Tdatasource(dbgrid.DataSource).DataSet.Filter:='name='+chr(39)+dmunit.postname+chr(39);
    Tdatasource(dbgrid.DataSource).DataSet.Filtered:=true;
   end else
     begin
      postname.Text:='';
      Tdatasource(dbgrid.DataSource).DataSet.Filtered:=false;
     end;
   end;



end;

procedure TBalForm.SpeedButton2Click(Sender: TObject);
begin
 postname.Text:='';
 Tdatasource(dbgrid.DataSource).DataSet.Filtered:=false;
end;

procedure TBalForm.DBGridDblClick(Sender: TObject);
begin
case dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger) of
   1:  dm.openprihod(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,1,0,0);
   2:  dm.openrashod(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,1,0);
   3: dm.openperem(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,1);
 4,5: dm.openkassprih(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger);
 10,11:dm.openbeznal(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger);

 end;

end;

end.
