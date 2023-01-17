unit aUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit,provider, StdCtrls, Mask, DBCtrlsEh, Grids, DBGridEh,
  ExtCtrls,DBLookupEh,EhLibCDS, OracleData, DB, DBClient,math, PrnDbgeh,
  Menus,DBGridEhImpExp, TeEngine, Series, TeeProcs, Chart, DbChart,
  SpeedForm, ComCtrls;

type
  Taform = class(TSForm)
    Panel1: TPanel;
    DBGrid: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    datafrom: TDBDateTimeEditEh;
    Label2: TLabel;
    datato: TDBDateTimeEditEh;
    ClientDS: TClientDataSet;
    ds: TDataSource;
    query: TOracleDataSet;
    Button1: TButton;
    queryDD: TStringField;
    queryHH: TStringField;
    queryCHEK: TFloatField;
    queryKASSA: TIntegerField;
    querySUM: TFloatField;
    queryCOUNT: TFloatField;
    Panel3: TPanel;
    lpar: TDBNumberEditEh;
    hpar: TDBNumberEditEh;
    Label3: TLabel;
    Label4: TLabel;
    pquery: TOracleDataSet;
    ClientDs1: TClientDataSet;
    ds1: TDataSource;
    DBGridEh1: TDBGridEh;
    pqueryHH: TStringField;
    pqueryLOWC: TFloatField;
    pqueryLOWS: TFloatField;
    pqueryMIDC: TFloatField;
    pqueryMIDS: TFloatField;
    pqueryHIC: TFloatField;
    pqueryHIS: TFloatField;
    pqueryALC: TFloatField;
    pqueryALS: TFloatField;
    sumquery: TOracleDataSet;
    sumquerySUM: TFloatField;
    pquerylowp: TFloatField;
    pquerymidp: TFloatField;
    pqueryhip: TFloatField;
    pqueryalp: TFloatField;
    Button2: TButton;
    PrintDB: TPrintDBGridEh;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    SaveDialog1: TSaveDialog;
    chartform: TSpeedForm;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    chartquery: TOracleDataSet;
    Series2: TBarSeries;
    Series3: TBarSeries;
    DBChart2: TDBChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    Button4: TButton;
    Button5: TButton;
    tabform: TSpeedForm;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Button6: TButton;
    Panel4: TPanel;
    Button7: TButton;
    maxtovarq: TOracleDataSet;
    mintovarq: TOracleDataSet;
    midtovarq: TOracleDataSet;
    maxds: TClientDataSet;
    minds: TClientDataSet;
    midds: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    alltovarq: TOracleDataSet;
    allds: TClientDataSet;
    DataSource4: TDataSource;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    DBGridEh5: TDBGridEh;
    printtovar: TPrintDBGridEh;
    Button8: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lparChange(Sender: TObject);
    procedure hparChange(Sender: TObject);
    procedure pqueryCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure chartformClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
   procedure minQuery;
   procedure midQuery;
   procedure maxQuery;
   procedure allQuery;
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }

  //  procedure midQuery;
  //  procedure maxQuery;
 //   procedure allQuery;


  public
    { Public declarations }
  end;

var
  aform: Taform;

implementation

uses dmunit;

{$R *.dfm}

procedure Taform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure Taform.FormDestroy(Sender: TObject);
begin
 screen.Cursor:=crDefault;
aform:=nil;
end;

procedure Taform.Button1Click(Sender: TObject);
var  TempProvider:TDataSetProvider;

begin
 query.Close;
 query.Filtered:=false;
datafrom.OnChange(nil);
datato.OnChange(nil);
lpar.OnChange(nil);
hpar.OnChange(nil);
 if ClientDS.Active then ClientDS.EmptyDataSet;
Clientds.Close;
if integer(datafrom.Value)>integer(datato.Value)
then
begin
  dm.addmemo('Начальная дата больше конечной');
  exit;
end;
screen.Cursor:=crSQLWait;
sumquery.Open;
query.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;
  query.Close;
  screen.Cursor:=crDefault;
 end;

procedure Taform.datafromChange(Sender: TObject);
begin
if integer(datafrom.Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
 dm.commit;
end;
end;

procedure Taform.datatoChange(Sender: TObject);
begin
if integer(datato.Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datato.Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
dm.commit;
end;

end;

procedure Taform.FormCreate(Sender: TObject);
begin
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));
try
lpar.Value:=dm.ExecuteSQL('select to_number(value) from tmp.toptions where parametr='+chr(39)+'low'+chr(39));
hpar.Value:=dm.ExecuteSQL('select to_number(value) from tmp.toptions where parametr='+chr(39)+'high'+chr(39));
except
dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+'100'+chr(39)+' where parametr='+chr(39)+'low'+chr(39));
dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+'350'+chr(39)+' where parametr='+chr(39)+'high'+chr(39));
DM.commit;
lpar.Value:=dm.ExecuteSQL('select to_number(value) from tmp.toptions where parametr='+chr(39)+'low'+chr(39));
hpar.Value:=dm.ExecuteSQL('select to_number(value) from tmp.toptions where parametr='+chr(39)+'high'+chr(39));
end;
end;

procedure Taform.lparChange(Sender: TObject);
begin
if lpar.Value<>NULL then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(lpar.Value)+chr(39)+' where parametr='+chr(39)+'low'+chr(39)) ;
dm.commit;
end;
end;

procedure Taform.hparChange(Sender: TObject);
begin
if hpar.Value<>null then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(hpar.Value)+chr(39)+' where parametr='+chr(39)+'high'+chr(39)) ;
dm.commit;
end;
end;

procedure Taform.pqueryCalcFields(DataSet: TDataSet);
var temp:double;
begin
if sumquerySUM.AsInteger<>0
then
 begin
    temp:=sumquerySUM.AsFloat/100;
     pquerylowp.Value:=roundto(pqueryLOWS.Value/temp,-2);
     pquerymidp.Value:=roundto(pqueryMIDS.Value/temp,-2);
     pqueryhip.Value:=roundto(pqueryHIS.Value/temp,-2);
     pqueryalp.Value:=roundto(pqueryALS.Value/temp,-2);

 end;
end;

procedure Taform.Button2Click(Sender: TObject);
var  TempProvider:TDataSetProvider;

begin
 sumquery.Close;
 pquery.Close;
 pquery.Filtered:=false;
datafrom.OnChange(nil);
datato.OnChange(nil);
lpar.OnChange(nil);
hpar.OnChange(nil);
 if ClientDS1.Active then ClientDS1.EmptyDataSet;
Clientds1.Close;
if integer(datafrom.Value)>integer(datato.Value)
then
begin
  dm.addmemo('Начальная дата больше конечной');
  exit;
end;
screen.Cursor:=crSQLWait;
sumquery.Open;
 pquery.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=pQuery;
  ClientDS1.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS1.Open;
  sumquery.Close;
 pquery.Close;

  screen.Cursor:=crDefault;
end;

procedure Taform.Button3Click(Sender: TObject);
begin
printdb.Title.Text:=label1.Caption+string(datafrom.Value)+' '+label2.Caption+
string(datato.Value)+' параметры '+floattostr(lpar.Value)+' - '+floattostr(hpar.Value) ;
printdb.Preview;
end;

procedure Taform.N3Click(Sender: TObject);
var mygrid:TDBGrideh;
begin
  if (ActiveControl is TDBGridEh) then mygrid:=TDBGridEh(ActiveControl);
     if ActiveControl.Name='Button6'
  then begin
        case PageControl1.ActivePageIndex of
            0:mygrid:=DBGridEh2;
            1:mygrid:=DBGridEh3;
            2:mygrid:=DBGridEh4;
            3:mygrid:=DBGridEh5;
        end;
       end;


   if mygrid <> nil then
  begin

    with mygrid do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
  end;
 end;

procedure Taform.N2Click(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
    mygrid:TDBGrideh;
    begin
  SaveDialog1.FileName := 'file1';
//dm.addmemo(ActiveControl.Name);

  if (ActiveControl is TDBGrideh) then
  begin
   mygrid:= TDBGridEh(ActiveControl);
  end;
  if ActiveControl.Name='Button6'
  then begin
        case PageControl1.ActivePageIndex of
            0:mygrid:=DBGridEh2;
            1:mygrid:=DBGridEh3;
            2:mygrid:=DBGridEh4;
            3:mygrid:=DBGridEh5;
        end;
       end;
  if mygrid <> nil then
  begin
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
        SaveDBGridEhToExportFile(ExpClass,mygrid,SaveDialog1.FileName,False);
      end;
    end;
 end;
end;

procedure Taform.Button4Click(Sender: TObject);
begin
chartquery.Close;
chartquery.Open;
chartform.ShowModal;
end;

procedure Taform.chartformClose(Sender: TObject; var Action: TCloseAction);
begin
chartquery.Close;
end;

procedure Taform.Button5Click(Sender: TObject);
begin
DBChart1.print;
DBChart2.Print;
end;

procedure Taform.Button6Click(Sender: TObject);
begin
tabform.Show;
end;

procedure Taform.Button7Click(Sender: TObject);
begin
case PageControl1.ActivePageIndex of
0:minQuery;
1:midQuery;
2:maxQuery;
3:allQuery;
end;
end;


procedure taform.minquery;
var  TempProvider:TDataSetProvider;

begin
 if not minDS.Active then
 begin
 mintovarq.Filtered:=false;
 minDS.Close;

screen.Cursor:=crSQLWait;
mintovarq.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=mintovarq;
  minDS.Data := TempProvider.Data;
  TempProvider.Free;
 minDS.Open;
  mintovarq.Close;
  screen.Cursor:=crDefault;
 end;
 end;
 {------------------------------------------------------}
 procedure taform.midquery;
var  TempProvider:TDataSetProvider;

begin
 if not midDs.Active then
 begin
 midtovarq.Filtered:=false;
 midDS.Close;

screen.Cursor:=crSQLWait;
midtovarq.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=midtovarq;
  midDS.Data := TempProvider.Data;
  TempProvider.Free;
 midDS.Open;
  midtovarq.Close;
  screen.Cursor:=crDefault;
 end;
 end;
{----------------------------------------------------------}
 procedure taform.maxquery;
var  TempProvider:TDataSetProvider;

begin
 if not maxds.Active then
 begin
  maxtovarq.Filtered:=false;
 maxDS.Close;

screen.Cursor:=crSQLWait;
maxtovarq.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=maxtovarq;
  maxDS.Data := TempProvider.Data;
  TempProvider.Free;
 maxDS.Open;
  maxtovarq.Close;
  screen.Cursor:=crDefault;
 end;
 end;
{----------------------------------------------------------}
 procedure taform.allquery;
var  TempProvider:TDataSetProvider;

begin
 if not allds.Active then
 begin
  alltovarq.Filtered:=false;
 allDS.Close;

screen.Cursor:=crSQLWait;
alltovarq.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=alltovarq;
  allDS.Data := TempProvider.Data;
  TempProvider.Free;
 allDS.Open;
  alltovarq.Close;
  screen.Cursor:=crDefault;
 end;
 end;
{----------------------------------------------------------}

procedure Taform.Button8Click(Sender: TObject);
begin
case PageControl1.ActivePageIndex of
0:printtovar.DBGridEh:=DBGridEh2;
1:printtovar.DBGridEh:=DBGridEh3;
2:printtovar.DBGridEh:=DBGridEh4;
3:printtovar.DBGridEh:=DBGridEh5;
end;
case PageControl1.ActivePageIndex of
0:printtovar.Title.Text:='продажи в нижней группе';
1:printtovar.Title.Text:='продажи в средней группе';
2:printtovar.Title.Text:='продажи в вверхней группе';
3:printtovar.Title.Text:='все продажи';
end;

printtovar.Preview;
end;

end.
