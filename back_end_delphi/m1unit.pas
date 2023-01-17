unit m1unit;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit,provider,math, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh,
  OracleData, DB, DBClient, Grids, DBGridEh, Menus,DBGridEhImpExp, PrnDbgeh,
  DBSumLst;


type
  Tm1form = class(TSForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    datafrom: TDBDateTimeEditEh;
    datato: TDBDateTimeEditEh;
    katlist: TDBLookupComboboxEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    query: TOracleDataSet;
    DBGrid: TDBGridEh;
    ClientDS: TClientDataSet;
    ds: TDataSource;
    queryPLU: TFloatField;
    queryNAME: TStringField;
    queryED_IZM: TStringField;
    queryWES: TIntegerField;
    queryPROIZW: TStringField;
    queryPOSTAV: TStringField;
    queryPPRICE: TFloatField;
    queryRPRICE: TFloatField;
    queryPOST: TFloatField;
    queryPPOST: TFloatField;
    queryPROD: TFloatField;
    queryOST: TFloatField;
    queryprnaz: TFloatField;
    PrintDB: TPrintDBGridEh;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    querysumnaz: TCurrencyField;
    queryPDATA: TStringField;
    querydohod: TCurrencyField;
    DBSum: TDBSumList;
    queryprdoh: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure queryCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure queryAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  allnaz:currency;

  public
    { Public declarations }
  end;

var
  m1form: Tm1form;

implementation
 uses dmunit, about, kartunit;
{$R *.dfm}

procedure Tm1form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
screen.Cursor:=crDefault;
Action:=caFree;
end;

procedure Tm1form.FormDestroy(Sender: TObject);
begin
m1form:=nil;
end;

procedure Tm1form.katlistChange(Sender: TObject);
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

procedure Tm1form.datafromChange(Sender: TObject);
begin
if integer(datafrom.Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
 dm.commit;
end;
end;

procedure Tm1form.datatoChange(Sender: TObject);
begin
if integer(datato.Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datato.Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
dm.commit;
end;
end;

procedure Tm1form.FormCreate(Sender: TObject);
begin
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));

end;

procedure Tm1form.Button1Click(Sender: TObject);
var  TempProvider:TDataSetProvider;

begin
if katlist.Text='' then
  begin
  dm.addmemo('выберите категорию.');
  exit;
  end;
 query.Close;
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

 allnaz:=0;
query.Open;

  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;
screen.Cursor:=crDefault;
query.Close;

end;

procedure Tm1form.queryCalcFields(DataSet: TDataSet);
begin
if queryPPRICE.AsCurrency<>0 then
begin
 queryprnaz.AsFloat:=roundto(((queryRPRICE.AsCurrency-queryPPRICE.AsCurrency)/queryPPRICE.AsCurrency*100),0);
  querysumnaz.AsCurrency:=queryRPRICE.AsCurrency-queryPPRICE.AsCurrency;
  querydohod.AsCurrency:=querysumnaz.AsCurrency*queryPROD.Value;
 if allnaz>0 then queryprdoh.Value:=roundto(querydohod.AsCurrency/allnaz*100,-2);

 end;
end;

procedure Tm1form.Button2Click(Sender: TObject);
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

procedure Tm1form.N3Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure Tm1form.N2Click(Sender: TObject);
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

procedure Tm1form.N6Click(Sender: TObject);
var temp:string;
begin
 temp:=' по категории  '+katlist.KeyValue;
printdb.Title.Text:=label1.Caption+string(datafrom.Value)+' '+label2.Caption+
string(datato.Value)+temp;
printdb.Preview;
end;

procedure Tm1form.queryAfterOpen(DataSet: TDataSet);
begin
DBSum.RecalcAll;
allnaz:=DBSum.SumCollection[0].SumValue;
query.OnCalcFields(query);
end;

end.
