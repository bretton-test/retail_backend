unit CHEKUNIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, DB, OracleData, Buttons, PrnDbgeh,
   StdCtrls, DBSumLst, Oracle,main,sunit;

type
  TCHEKFORM = class(TSForm)
    SaleReport: TOracleDataSet;
    chDs: TDataSource;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    PrintDB: TPrintDBGridEh;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    postReport: TOracleDataSet;
    postReportTO_CHARDATADDMMYYYY: TStringField;
    postReportCENA: TFloatField;
    postReportKOL_VO: TFloatField;
    postReportPARTOST: TFloatField;
    postReportNOM: TFloatField;
    SaleReportDATA: TStringField;
    SaleReportPRICE: TFloatField;
    SaleReportCOUNT: TFloatField;
    SaleReportSUMKOLVO: TFloatField;
    SaleReportSUMALL: TFloatField;
    DBSum: TDBSumList;
    Label1: TLabel;
    rashreport: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    rashreportNOM: TFloatField;
    priceRep: TOracleDataSet;
    priceRepOWNER: TStringField;
    priceRepDATA: TDateTimeField;
    priceRepOLDPRICE: TFloatField;
    priceRepNEWPRICE: TFloatField;
    priceRepNOM: TFloatField;
    partq: TOracleQuery;
    movbut: TSpeedButton;
    postReportSKLAD: TStringField;
    rashreportNN: TFloatField;
    rashreportDATA1: TDateTimeField;
    knigarashod: TOracleDataSet;
    knigarashodDATA: TStringField;
    knigarashodCENA: TFloatField;
    knigarashodKOL_VO: TFloatField;
    knigarashodNOM: TFloatField;
    knigarashodSKLAD: TStringField;
    postReportNN: TStringField;
    invreport: TOracleDataSet;
    invreportDATA: TStringField;
    invreportREG: TIntegerField;
    invreportOWNER: TStringField;
    invreportNOM: TFloatField;
    invreportKOL_SKLAD: TFloatField;
    invreportKOL_FAKT: TFloatField;
    invreportPRICE: TFloatField;
    knigarashodSUMKDISCOUNT: TFloatField;
    movreport: TOracleDataSet;
    movreportDATA: TStringField;
    movreportCENA: TFloatField;
    movreportKOL_VO: TFloatField;
    movreportNOM: TFloatField;
    movreportSKLAD: TStringField;
    movreportPRIHOD: TFloatField;
    movreportRASHOD: TFloatField;
    naklreport: TOracleDataSet;
    naklreportNN: TStringField;
    naklreportTO_CHARJDATADDMMYYYY: TStringField;
    naklreportCENASNDS: TFloatField;
    naklreportCENAREAL: TFloatField;
    naklreportKOL_VO: TFloatField;
    naklreportNOM: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SaleReportAfterOpen(DataSet: TDataSet);
    procedure SaleReportBeforeOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBSumAfterRecalcAll(Sender: TObject);
    procedure movbutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    KOL_UP: TFloatField;
     ROSSIP: TFloatField;
    { Private declarations }
  procedure insertvybor;
  public
   
    plu:integer;
    postavka:boolean;
    { Public declarations }
  procedure setvybor (var KOL_UP: TFloatField;var ROSSIP: TFloatField);

  end;

var
  CHEKFORM: TCHEKFORM;

implementation

uses dmunit, MovUnit;

{$R *.dfm}
 procedure TCHEKFORM.insertvybor;
  begin
  if naklreport.Active then
   begin
     if TCHEKFORM(self).KOL_UP<>nil then TCHEKFORM(self).KOL_UP.AsInteger:=naklreportNN.AsInteger;
     if TCHEKFORM(self).ROSSIP<>nil then TCHEKFORM(self).ROSSIP.AsInteger:=naklreportNOM.AsInteger;
   end;
  end;


 procedure TCHEKFORM.setvybor (var KOL_UP: TFloatField;var ROSSIP: TFloatField);
 begin
  TCHEKFORM(self).KOL_UP:=KOL_UP;
  TCHEKFORM(self).ROSSIP:=rossip;

 end;

procedure TCHEKFORM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
salereport.Close;
postreport.Close;
pricerep.Close;
rashreport.Close;

ACTION:=caFree;
end;

procedure TCHEKFORM.FormDestroy(Sender: TObject);
begin
ChekForm:=nil;
end;

procedure TCHEKFORM.SaleReportAfterOpen(DataSet: TDataSet);
begin
screen.Cursor:=crDefault;

end;

procedure TCHEKFORM.SaleReportBeforeOpen(DataSet: TDataSet);
begin
screen.Cursor:=crSqlWait;

end;

procedure TCHEKFORM.SpeedButton1Click(Sender: TObject);
begin
dm.nofilter;
if dm.LocateTovar(plu) then
begin
printdb.PageHeader.LeftText.Clear;
printdb.PageHeader.LeftText.Add(tform(self).Caption);
printdb.PageHeader.LeftText.Add('Товар: '+dm.tovarNAME.Value);
printdb.PageHeader.LeftText.Add('ед.изм: '+dm.tovarED_IZM.Value);
printdb.PageHeader.LeftText.Add('тек.цена: '+dm.tovarPRICE.AsString);
printdb.PageHeader.LeftText.Add(Label1.Caption);
printdb.Preview;
end;
end;

procedure TCHEKFORM.DBGridEh1DblClick(Sender: TObject);
var
nom:integer;
begin
nom:=0;
if priceRep.Active then
begin
 dm.pereozenkashow(pricerepnom.AsInteger);
 exit;
end;

if invreport.Active then
nom:=invreportNOM.AsInteger;
if knigarashod.Active then
nom:=knigarashodNOM.AsInteger;
if postreport.Active then
nom:=postreportnom.AsInteger;
if rashreport.Active then
nom:=rashreport.FieldValues['nom'];
if movreport.Active then
nom:=movreport.FieldValues['nom'];

if not postavka then
begin
case dm.TipNakl(nom) of
   1:  dm.openprihod(nom,1,0,plu);
   2:  dm.openrashod(nom,1,plu);
   3: dm.openperem(nom,1);
   6:dm.inventf(nom,plu);
   7: dm.spisanief(nom,2);
   8: dm.spisanief(nom,3);
   12: main.MainForm.OpenKKmreport(nom,plu);

  end;
end else
   begin
     insertvybor;
    tform(Self).Close;
   end;
end;

procedure TCHEKFORM.DBSumAfterRecalcAll(Sender: TObject);
begin
label1.Visible:=true;
label1.caption:='Всего кол-во:'+floattostr(DBSum.SumCollection.Items[0].SumValue)+'  Сумма:'+floattostr(DBSum.SumCollection.Items[1].SumValue);
end;

procedure TCHEKFORM.movbutClick(Sender: TObject);
var Child:TMovForm;
begin
if postReport.Active
then
    begin
    dm.ExecuteSQL('update tmp.toptions set value='+inttostr(plu)+  ' where parametr='+chr(39)+'plu'+chr(39));
    partq.SetVariable('plu',plu);
    partq.SetVariable('nom',postReportNOM.AsInteger);
    partq.Execute;
    dm.OraBase.Commit;
    child:=tmovform.Create(tform(self),tsform(self).mybar);
    child.Caption:='движение товара '+copy(tform(self).Caption,9,50);
    child.Show;
    child.OnActivate(child);

    end;

end;

procedure TCHEKFORM.FormCreate(Sender: TObject);
begin
postavka:=false;
end;

end.
