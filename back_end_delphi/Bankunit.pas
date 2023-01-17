unit Bankunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData,dmunit,sunit;

type
  TBankform = class(TSForm)
    Qbank: TOracleDataSet;
    QbankID: TIntegerField;
    QbankNAIMEN: TStringField;
    QbankBIK: TIntegerField;
    QbankKORR_S: TFloatField;
    QbankMESTO: TStringField;
    QbankADRES: TStringField;
    QbankTEL: TStringField;
    Bds: TDataSource;
    DBGridEh1: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure QbankNewRecord(DataSet: TDataSet);
    procedure QbankAfterPost(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  kod:pint;
  Bname:pstr;
   isclose:boolean;
  public
    { Public declarations }
  procedure setRecviz(var kod:Pint;var name:Pstr;const id:integer);

  end;

var
  Bankform: TBankform;


implementation



{$R *.dfm}
procedure TBankform.setRecviz(var kod:Pint;var name:Pstr;const id:integer);
begin
Bankform.kod:=kod;
Bankform.Bname:=name;
qbank.Locate('id',id,[]);
end;

procedure TBankform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if qbank.State<>dsbrowse then qbank.Cancel;
qbank.Close;

isclose:=true;
Action:=caFree;
end;

procedure TBankform.FormDestroy(Sender: TObject);
begin
if not isclose then begin
 if qbank.State<>dsbrowse then qbank.Cancel;
qbank.Close;


end;
BankForm:=nil;
end;

procedure TBankform.QbankNewRecord(DataSet: TDataSet);

begin
qbankid.Value:=dm.newkod('bankseq');

end;

procedure TBankform.QbankAfterPost(DataSet: TDataSet);
begin
qbank.RefreshRecord;
end;

procedure TBankform.DBGridEh1DblClick(Sender: TObject);
begin
if assigned(kod) then
begin
Bankform.kod^:=qbankid.Value;
Bankform.Bname^:=qbanknaimen.Value;
bankform.Close;
end;

end;

procedure TBankform.FormCreate(Sender: TObject);
begin

isclose:=false;
qbank.Open;
end;

end.
