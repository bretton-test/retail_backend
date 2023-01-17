unit kassrepUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit,EhLibCDS, ExtCtrls, StdCtrls, Mask, DBCtrlsEh,math, DB,
  OracleData, DBLookupEh, Grids, DBGridEh,provider, DBClient, Menus,
  CheckLst, Buttons, SpeedForm,DBGridEhImpExp, PropStorageEh, PrnDbgeh;

type
  TkassrepForm = class(TSForm)
    Panel1: TPanel;
    Query: TOracleDataSet;
    Label1: TLabel;
    datafrom: TDBDateTimeEditEh;
    datato: TDBDateTimeEditEh;
    Label2: TLabel;
    katlist: TDBLookupComboboxEh;
    Label3: TLabel;
    DBGrid: TDBGridEh;
    Panel2: TPanel;
    ds: TDataSource;
    ClientDS: TClientDataSet;
    Button1: TButton;
    QueryPLU: TFloatField;
    QueryNAME: TStringField;
    QueryEDIZM: TStringField;
    QueryDSDesigner: TIntegerField;
    QueryPROIZW: TStringField;
    QueryMINOST: TFloatField;
    QueryPRIHCENA: TFloatField;
    QueryRASHCENA: TFloatField;
    QueryPOST: TFloatField;
    QueryPROD: TFloatField;
    QueryNAKL: TFloatField;
    QueryPSUM: TFloatField;
    QueryRSUM: TFloatField;
    QueryBOST: TFloatField;
    QueryNOST: TFloatField;
    QueryVAL: TFloatField;
    QueryMAXPROD: TFloatField;
    Querypronac: TFloatField;
    sumquery: TOracleDataSet;
    sumqueryPOST: TFloatField;
    sumqueryPROD: TFloatField;
    sumqueryNAKL: TFloatField;
    sumqueryPSUM: TFloatField;
    sumqueryRSUM: TFloatField;
    sumqueryVAL: TFloatField;
    QueryPROPROD: TIntegerField;
    Queryproval: TIntegerField;
    Button2: TButton;
    Queryzakaz: TFloatField;
    Queryizl: TFloatField;
    optform: TSpeedForm;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tablbox: TCheckListBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    N2: TMenuItem;
    N3: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    PrintDB: TPrintDBGridEh;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    QueryDISCOUNT: TFloatField;
    Querysredprod: TFloatField;
    Querytovzap: TFloatField;
    RegPropStorageManEh1: TRegPropStorageManEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure QueryCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kassrepForm: TkassrepForm;

implementation

uses dmunit, about, kartunit;

{$R *.dfm}

procedure TkassrepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
screen.Cursor:=crDefault;
 Action:=caFree;
end;

procedure TkassrepForm.FormCreate(Sender: TObject);
begin
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));
katlist.KeyValue:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'kat'+chr(39));
PropStorageEh1.LoadProperties;
end;

procedure TkassrepForm.datafromChange(Sender: TObject);
begin
if integer(datafrom.Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
 dm.commit;
end;
 end;

procedure TkassrepForm.datatoChange(Sender: TObject);
begin
if integer(datato.Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datato.Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
dm.commit;
end;

end;


procedure TkassrepForm.katlistChange(Sender: TObject);
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

procedure TkassrepForm.Button1Click(Sender: TObject);
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

SUMQUERY.Open;
query.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;


 //query.Close;
 //sumquery.Close;
screen.Cursor:=crDefault;
edit1.Enabled:=ClientDS.RecordCount>0;
end;

procedure TkassrepForm.QueryCalcFields(DataSet: TDataSet);
var temp:double;
    izl:double;
begin
if (QueryPRIHCENA.Value<>null) and (QueryPRIHCENA.Value<>0)
        then  Querypronac.Value:=round((QueryRASHCENA.AsCurrency-QueryPRIHCENA.AsCurrency)*100/QueryPRIHCENA.AsCurrency);

 IF     sumqueryPROD.Value<>0
       THEN QueryPROPROD.AsInteger:=round((QueryPROD.Value*100/sumqueryPROD.Value));

 if sumqueryVAL.Value<>0
    then Queryproval.Value:=round((QueryVAL.Value*100/sumqueryVAL.Value));

 temp:=QueryPROD.Value+QueryMINOST.Value-QueryNOST.Value;
 //if temp>QueryWES.Value then
 Queryzakaz.Value:=temp;
 //if temp=QueryMINOST.Value then  Queryzakaz.Value:=QueryWES.Value;

 izl:=QueryNOST.Value-QueryPROD.Value+QueryMINOST.Value;
 if (izl>0) and (QueryNOST.Value>0) then Queryizl.Value:=izl;

 temp:=roundto(datato.Value-datafrom.Value,0);
 if temp=0 then Querysredprod.Value:=0
 else Querysredprod.Value:=roundto(QueryPROD.Value/temp,-2);
 if QueryNOST.Value<=0 then Querytovzap.Value:=0
 else
  begin
   if Querysredprod.Value=0 then Querytovzap.AsVariant:=null else
   Querytovzap.Value:=roundto(QueryNOST.Value/Querysredprod.Value,0);
  end;

end;

procedure TkassrepForm.Button2Click(Sender: TObject);
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

procedure TkassrepForm.N1Click(Sender: TObject);
var i:integer;
    k:integer;
begin
tablbox.Items.Clear;
for i:=0 to DBGrid.Columns.Count-1
do begin
  k:= tablbox.Items.Add(dbgrid.Columns.Items[i].Title.Caption);
    tablbox.Checked[k]:=dbgrid.Columns.Items[i].Visible;
   end;

if  optform.ShowModal=mryes
   then
        for i:=0 to DBGrid.Columns.Count-1
        do dbgrid.Columns.Items[i].Visible:=tablbox.Checked[i];

      PropStorageEh1.SaveProperties; 

end;

procedure TkassrepForm.N2Click(Sender: TObject);
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

procedure TkassrepForm.N3Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TkassrepForm.N6Click(Sender: TObject);
var temp:string;
begin
 temp:=' по категории  '+katlist.KeyValue;
printdb.Title.Text:=label1.Caption+string(datafrom.Value)+' '+label2.Caption+
string(datato.Value)+temp;
printdb.Preview;
end;

procedure TkassrepForm.Edit1KeyPress(Sender: TObject; var Key: Char);
var  TempProvider:TDataSetProvider;

begin
if key=' ' then key:='*';
If (ord(key)=13) and (edit1.Text<>'') {and (query.Active)}  then
begin
query.filter:='name='+chr(39)+edit1.Text+'*'+chr(39);
query.Filtered:=true;
if ClientDS.Active then ClientDS.EmptyDataSet;
Clientds.Close;
screen.Cursor:=crSQLWait;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;
 screen.Cursor:=crDefault;
end;

end;

end.
