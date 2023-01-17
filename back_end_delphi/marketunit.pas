unit marketunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit,provider,math, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh,
  OracleData, DB, DBClient, Grids, DBGridEh, Menus,DBGridEhImpExp, PrnDbgeh,
  DBSumLst;

type
  Tmform = class(TSForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    datafrom: TDBDateTimeEditEh;
    datato: TDBDateTimeEditEh;
    Label3: TLabel;
    katlist: TDBLookupComboboxEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid: TDBGridEh;
    ClientDS: TClientDataSet;
    ds: TDataSource;
    query: TOracleDataSet;
    queryPLU: TFloatField;
    queryNAME: TStringField;
    queryED_IZM: TStringField;
    queryPRICE: TFloatField;
    queryPPRICE: TFloatField;
    queryWES: TIntegerField;
    querySUMKOL: TFloatField;
    querySUMSUM: TFloatField;
    sumquery: TOracleDataSet;
    queryprnaz: TFloatField;
    sumqueryKAT: TFloatField;
    sumquerySUMSUM: TFloatField;
    sumqueryPLUCOUNT: TFloatField;
    queryprkolvo: TFloatField;
    queryprsum: TFloatField;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    PrintDB: TPrintDBGridEh;
    querysumnaz: TCurrencyField;
    queryPDATA: TStringField;
    DBSum: TDBSumList;
    querydohod: TCurrencyField;
    queryprdoh: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure queryCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure queryAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
   allkolvo:double;
   allsum:double;
   allnaz:double;

  public
    { Public declarations }
  end;

var
  mform: Tmform;

implementation

uses dmunit, about, kartunit;

{$R *.dfm}

procedure Tmform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
screen.Cursor:=crDefault;
Action:=caFree;
end;

procedure Tmform.FormDestroy(Sender: TObject);
begin
mform:=nil;
end;

procedure Tmform.FormCreate(Sender: TObject);
begin
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));
//katlist.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'kat'+chr(39));

end;

procedure Tmform.katlistChange(Sender: TObject);
begin
if katlist.KeyValue<>null
then
 begin
    AboutBox.qkat.Close;
    AboutBox.Qkat.SetVariable('name',string(katlist.KeyValue));
    AboutBox.Qkat.Open;

    dm.ExecuteSQL('update tmp.toptions set value='+AboutBox.QkatKAT.AsString+ ' where parametr='+chr(39)+'kat'+chr(39));


    dm.commit;

 end;
end;

procedure Tmform.datafromChange(Sender: TObject);
begin
if integer(datafrom.Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
 dm.commit;
end;
end;

procedure Tmform.datatoChange(Sender: TObject);
begin
if integer(datato.Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datato.Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
dm.commit;
end;
end;




procedure Tmform.Button1Click(Sender: TObject);
var  TempProvider:TDataSetProvider;

begin
if katlist.Text='' then
  begin
  dm.addmemo('выберите категорию.');
  exit;
  end;
 query.Close;
 sumquery.Close;
 query.Filtered:=false;
if ClientDS.Active then ClientDS.EmptyDataSet;
Clientds.Close;
screen.Cursor:=crSQLWait;
datafrom.OnChange(nil);
datato.OnChange(nil);
katlist.OnChange(nil);
if integer(datafrom.Value)>integer(datato.Value)
then
begin
  dm.addmemo('Начальная дата больше конечной');
 screen.Cursor:=crDefault;
  exit;
end;
sumquery.Open;
allkolvo:=0;
allsum:=0;
allnaz:=0;
sumquery.First;
while not sumquery.Eof do
begin
allkolvo:=allkolvo+sumqueryPLUCOUNT.AsFloat;
allsum:=allsum+sumquerySUMSUM.AsFloat;
sumquery.Next;
end;
sumquery.Close;



query.Open;

  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;
screen.Cursor:=crDefault;

end;

procedure Tmform.queryCalcFields(DataSet: TDataSet);
begin
if queryPPRICE.AsCurrency<>0 then
 begin
 queryprnaz.AsFloat:=roundto(((queryPRICE.AsCurrency-queryPPRICE.AsCurrency)/queryPPRICE.AsCurrency*100),0);
  querysumnaz.AsCurrency:=queryPRICE.AsCurrency-queryPPRICE.AsCurrency;
 querydohod.AsCurrency:=querysumnaz.AsCurrency*querySUMKOL.Value;
 if allnaz>0 then queryprdoh.Value:=roundto(querydohod.AsCurrency/allnaz*100,-2);
 end;
if allkolvo<>0 then queryprkolvo.AsFloat:=roundto(querySUMKOL.AsFloat/allkolvo*100,-2);
if  allsum<>0 then queryprsum.AsFloat:=roundto(querySUMSUM.AsFloat/allsum*100,-2);

end;

procedure Tmform.Button2Click(Sender: TObject);
begin
if (ClientDS.FieldValues['plu']<>null) and (ClientDS.Active)

then begin

 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(application,tsform(self).mybar);

         end;

          KartForm.Show;
          dm.nofilter;
      dmunit.BOOKMARK:=ClientDS.FieldValues['plu'];
      dm.tovargetmark;
end;
end;

procedure Tmform.N3Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure Tmform.N2Click(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
begin
  SaveDialog1.FileName := 'file1';
  if (ActiveControl is TDBGrideh) then
    if SaveDialog1.Execute then
    begin
      case SaveDialog1.FilterIndex of
        1: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
        2: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
        3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
        4: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        5: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'xls'; end;
      else
        ExpClass := nil; Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
           UpperCase(Ext) then
          SaveDialog1.FileName := SaveDialog1.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass,TDBGridEh(ActiveControl),
             SaveDialog1.FileName,False);
      end;
    end;


end;

procedure Tmform.N6Click(Sender: TObject);
var temp:string;
begin
 temp:=' по категории  '+katlist.KeyValue;
printdb.Title.Text:=label1.Caption+string(datafrom.Value)+' '+label2.Caption+
string(datato.Value)+temp;
printdb.Preview;
end;

procedure Tmform.queryAfterOpen(DataSet: TDataSet);
begin
DBSum.RecalcAll;
allnaz:=DBSum.SumCollection[0].SumValue;
query.OnCalcFields(query);
end;

end.
