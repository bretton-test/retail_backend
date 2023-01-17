unit yearunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit,provider,DBGridEhImpExp,EhLibCDS, StdCtrls, Grids, DBGridEh, Mask, DBCtrlsEh, ExtCtrls,
  DBLookupEh, DB, DBClient, OracleData, Menus, PrnDbgeh;

type
  TYform = class(TSForm)
    Panel1: TPanel;
    Label1: TLabel;
    datafrom: TDBDateTimeEditEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Query: TOracleDataSet;
    QueryPLU: TFloatField;
    QueryNAME: TStringField;
    QueryED_IZM: TStringField;
    QueryMON: TStringField;
    ClientDS: TClientDataSet;
    ds: TDataSource;
    Label3: TLabel;
    katlist: TDBLookupComboboxEh;
    DBGrid: TDBGridEh;
    QueryPRIHOD: TFloatField;
    QueryRASHOD: TFloatField;
    QueryPTOT: TFloatField;
    QueryRTOT: TFloatField;
    PrintDB: TPrintDBGridEh;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Yform: TYform;

implementation
uses dmunit, kartunit, about;
{$R *.dfm}

procedure TYform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
screen.Cursor:=crDefault;
Action:=caFree;
end;

procedure TYform.FormDestroy(Sender: TObject);
begin
yform:=nil;
end;

procedure TYform.datafromChange(Sender: TObject);
begin
if varisnull(datafrom.Value) then exit;
if integer(datafrom.Value)>0 then
begin
 try
 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
  dm.commit;
   except
        dm.OraBase.Rollback;
   end;

  end;
end;

procedure TYform.katlistChange(Sender: TObject);
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

procedure TYform.Button1Click(Sender: TObject);
var  TempProvider:TDataSetProvider;

begin
 query.Close;
 query.Filtered:=false;
 if ClientDS.Active then ClientDS.EmptyDataSet;
Clientds.Close;
screen.Cursor:=crSQLWait;
datafrom.OnChange(nil);
katlist.OnChange(nil);
query.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;

screen.Cursor:=crDefault;
end;

procedure TYform.Button2Click(Sender: TObject);
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

procedure TYform.N3Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TYform.N2Click(Sender: TObject);
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

procedure TYform.N6Click(Sender: TObject);
var temp:string;
begin
temp:=' по категории  '+katlist.KeyValue;
printdb.Title.Text:=label1.Caption+string(datafrom.Value)+' '+temp;
printdb.Preview;
end;

end.
