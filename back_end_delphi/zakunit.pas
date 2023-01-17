unit zakunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit, StdCtrls, DBLookupEh, Mask, DBCtrlsEh, ExtCtrls,DBGridEhImpExp,
   PropStorageEh, PrnDbgeh,provider,math, DB, OracleData, Grids, DBGridEh,
  DBClient, Menus;

type
  Tzakform = class(TSForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    datafrom: TDBDateTimeEditEh;
    datato: TDBDateTimeEditEh;
    katlist: TDBLookupComboboxEh;
    query: TOracleDataSet;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ClientDS: TClientDataSet;
    ds: TDataSource;
    DBGrid: TDBGridEh;
    queryPLU: TFloatField;
    queryNAME: TStringField;
    queryEDIZM: TStringField;
    queryKATEGORY: TIntegerField;
    queryPROIZW: TStringField;
    queryMINOST: TFloatField;
    queryPRICE: TFloatField;
    queryRASHCENA: TFloatField;
    queryPOST: TFloatField;
    queryPROD: TFloatField;
    queryPSUM: TFloatField;
    queryRSUM: TFloatField;
    queryBOST: TFloatField;
    queryNOST: TFloatField;
    queryNSUM: TFloatField;
    querytovzap: TFloatField;
    querymin: TFloatField;
    querymax: TFloatField;
    queryWES: TIntegerField;
    queryminrub: TFloatField;
    querymaxrub: TFloatField;
    queryZAYAVKA: TFloatField;
    queryZAKRUB: TFloatField;
    PrintDB: TPrintDBGridEh;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    queryPOSTAV: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure queryCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure ClientDSBeforePost(DataSet: TDataSet);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zakform: Tzakform;

implementation

uses dmunit, about, kartunit;

{$R *.dfm}

procedure Tzakform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
screen.Cursor:=crDefault;
Action:=caFree;
end;

procedure Tzakform.FormCreate(Sender: TObject);
begin
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));
katlist.KeyValue:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'kat'+chr(39));

end;

procedure Tzakform.datafromChange(Sender: TObject);
begin
if integer(datafrom.Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
 dm.commit;
end;
end;

procedure Tzakform.datatoChange(Sender: TObject);
begin
if integer(datato.Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datato.Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
dm.commit;
end;
end;

procedure Tzakform.katlistChange(Sender: TObject);
begin
if katlist.KeyValue<>null
then
 begin
    AboutBox.qkat.Close;
    AboutBox.Qkat.SetVariable('name',string(katlist.keyValue));
    AboutBox.Qkat.Open;

    dm.ExecuteSQL('update tmp.toptions set value='+AboutBox.QkatKAT.AsString+ ' where parametr='+chr(39)+'kat'+chr(39));


    dm.commit;

 end;
end;

procedure Tzakform.Button1Click(Sender: TObject);
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

query.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;
screen.Cursor:=crDefault;

end;

procedure Tzakform.queryCalcFields(DataSet: TDataSet);
var temp,sredprod:double;
begin
temp:=roundto(datato.Value-datafrom.Value,0);
 if temp=0 then sredprod:=0
 else sredprod:=roundto(QueryPROD.Value/temp,-2);
 if QueryNOST.Value<=0 then Querytovzap.Value:=0
 else
  begin
   if sredprod=0 then Querytovzap.AsVariant:=null else
   Querytovzap.Value:=roundto(QueryNOST.Value/sredprod,0);
  end;
//
 if  QueryNOST.Value<queryMINOST.Value then
    querymin.Value:=queryMINOST.Value-QueryNOST.Value;
if QueryNOST.Value<0 then querymin.Value:=queryMINOST.Value;
if  QueryNOST.Value>=queryMINOST.Value then querymin.AsVariant:=null;
//
if  QueryNOST.Value>queryWES.Value then
    querymax.Value:=QueryNOST.Value-queryWES.Value;
if  QueryNOST.Value<=queryWES.Value then querymax.AsVariant:=null;
//

if (querymin.AsVariant<>null) or (querymin.Value>0) then
queryminrub.value:=querymin.Value*queryPRICE.Value;
//
if (querymax.AsVariant<>null) or (querymax.Value>0) then
querymaxrub.value:=querymax.Value*queryPRICE.Value;



 end;




procedure Tzakform.Button2Click(Sender: TObject);
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

procedure Tzakform.ClientDSBeforePost(DataSet: TDataSet);
begin
if (ClientDS.FieldByName('zayavka').AsVariant<>null) and
    (ClientDS.FieldByName('zayavka').AsInteger>0) then
     ClientDS.FieldByName('zakrub').AsFloat:=
     ClientDS.FieldByName('zayavka').AsCurrency*
     ClientDS.FieldByName('price').AsCurrency;

end;

procedure Tzakform.N3Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure Tzakform.N2Click(Sender: TObject);
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

procedure Tzakform.N6Click(Sender: TObject);
var temp:string;
begin
 temp:=' по категории  '+katlist.KeyValue;
printdb.Title.Text:=label1.Caption+string(datafrom.Value)+' '+label2.Caption+
string(datato.Value)+temp;
printdb.Preview;
end;

end.
