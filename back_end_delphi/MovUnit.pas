unit MovUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Grids, DBGridEh,sunit;

type
  TMovForm = class(TSForm)
    Query: TOracleDataSet;
    DS: TDataSource;
    DBGridEh1: TDBGridEh;
    QueryTIP: TStringField;
    QueryDATA: TStringField;
    QueryNAME: TStringField;
    QueryPRICE: TFloatField;
    QueryPRIHOD: TFloatField;
    QueryRASHOD: TFloatField;
    QueryOSTATOK: TFloatField;
    QuerySKLAD: TStringField;
    QueryNOM: TFloatField;
    QueryPLU: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MovForm: TMovForm;

implementation

uses dmunit, MAIN;

{$R *.dfm}

procedure TMovForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin


query.Close;
Action:=caFree;
end;

procedure TMovForm.FormCreate(Sender: TObject);
begin

Tform(self).Top:=0;
Tform(self).Left:=0;
query.Open;
end;

procedure TMovForm.DBGridEh1DblClick(Sender: TObject);
begin
case dm.TipNakl(querynom.AsInteger) of
   1: dm.openprihod(querynom.AsInteger,1,0,queryplu.AsInteger);
   2: dm.openrashod(querynom.AsInteger,1,queryplu.AsInteger);
   3: dm.openperem(querynom.AsInteger,1);
   7: dm.spisanief(querynom.AsInteger,2);
   8: dm.spisanief(querynom.AsInteger,3);
   9: dm.pereozenkashow(querynom.AsInteger);
   12:main.MainForm.OpenKKmreport(querynom.AsInteger,queryplu.AsInteger);

end;

end;

procedure TMovForm.FormDestroy(Sender: TObject);
begin
if query.Active then begin
 query.Close;

end;
 movform:=nil;

end;

end.
