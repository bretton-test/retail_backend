unit abcunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit,provider, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Grids, DBGridEh,
  OracleData, DB, DBClient,DBGridEhImpExp, Menus, PrnDbgeh,math,
  PropStorageEh, CheckLst, Buttons, SpeedForm;

type
  Tabcform = class(TSForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    datafrom: TDBDateTimeEditEh;
    datato: TDBDateTimeEditEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid: TDBGridEh;
    ClientDS: TClientDataSet;
    ds: TDataSource;
    Query: TOracleDataSet;
    QueryPLU: TFloatField;
    QueryNAME: TStringField;
    QueryKAT: TIntegerField;
    QueryKATNAME: TStringField;
    QueryPROIZW: TStringField;
    QueryED_IZM: TStringField;
    QueryPRICE: TFloatField;
    QuerySUMKOL: TFloatField;
    QuerySUMSUM: TFloatField;
    sumquery: TOracleDataSet;
    sumqueryKAT: TIntegerField;
    sumquerySUMSUM: TFloatField;
    Queryabc: TStringField;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    PrintDB: TPrintDBGridEh;
    Queryprocplu: TFloatField;
    Queryprocsum: TFloatField;
    Querysumtovar: TFloatField;
    QueryPOSTAV: TStringField;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    optform: TSpeedForm;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tablbox: TCheckListBox;
    N1: TMenuItem;
    N4: TMenuItem;
    QueryWES: TIntegerField;
    SpeedButton1: TSpeedButton;
    helpform: TSpeedForm;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Memo1: TMemo;
    sumqueryPLUCOUNT: TFloatField;
    N7: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure QueryCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
   kat_num,tovar_count,plu_count:integer;
    sum_prod,sum_kat,allsum,allplu:double;
   a,b,c:boolean;

  public
    { Public declarations }
  end;

var
  abcform: Tabcform;

implementation

uses dmunit, kartunit;

{$R *.dfm}

procedure Tabcform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
screen.Cursor:=crDefault;
Action:=caFree;
end;

procedure Tabcform.FormDestroy(Sender: TObject);
begin
abcform:=nil;
end;

procedure Tabcform.FormCreate(Sender: TObject);
begin
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));

end;

procedure Tabcform.Button1Click(Sender: TObject);
var  TempProvider:TDataSetProvider;

begin
 kat_num:=-1;
 sum_prod:=0;
 a:=true;
 b:=false;
 c:=false;
 
 query.Close;
 sumquery.Close;
 query.Filtered:=false;
 if ClientDS.Active then ClientDS.EmptyDataSet;
Clientds.Close;
screen.Cursor:=crSQLWait;
datafrom.OnChange(nil);
datato.OnChange(nil);
if integer(datafrom.Value)>integer(datato.Value)
then
begin
  dm.addmemo('Начальная дата больше конечной');
 screen.Cursor:=crDefault;
  exit;
end;
sumquery.Open;
query.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Query;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
 ClientDS.Open;
screen.Cursor:=crDefault;

 end;
procedure Tabcform.datafromChange(Sender: TObject);
begin
if integer(datafrom.Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datafrom.Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
 dm.commit;
end;
end;

procedure Tabcform.datatoChange(Sender: TObject);
begin
if integer(datato.Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(datato.Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
dm.commit;
end;

end;

procedure Tabcform.QueryCalcFields(DataSet: TDataSet);
var temp:double;
begin
if QueryKAT.AsInteger<>kat_num then
  begin
   sum_prod:=0;
   tovar_count:=0;
   a:=true;
   b:=false;
   c:=false;
   sumquery.Locate('kat',QueryKAT.AsInteger,[]);
    kat_num:=QueryKAT.AsInteger;
    sum_kat:=sumquerySUMSUM.AsFloat;
    allsum:=sum_kat;
    plu_count:= sumqueryPLUCOUNT.AsInteger;
    allplu:=plu_count;
   // a:=(sumquerySUMSUM.AsFloat*(aval.Value/100));
  // b:=(sumquerySUMSUM.AsFloat*(bval.Value/100));
  end;
  sum_prod:=QuerySUMSUM.AsFloat+sum_prod;
  inc(tovar_count);
  temp:=(tovar_count/plu_count*100)+(sum_prod/sum_kat*100);
  Queryprocplu.Value:=roundto(tovar_count/allplu*100,-2);
  Queryprocsum.Value:=roundto(sum_prod/allsum*100,-2);
  Querysumtovar.Value:=roundto(sum_prod,-2);
  if temp<=100  then
    begin
     if a then Queryabc.Value:='A'
     else if b then Queryabc.Value:='B'
     else if c then Queryabc.Value:='C';
    END;
   if temp>100 then
      begin
        if a then
             begin
              a:=false;
              b:=true;
              plu_count:=plu_count-tovar_count;
              tovar_count:=0;
              sum_kat:=sum_kat-sum_prod;
              sum_prod:=0;
              Queryabc.Value:='A';
              exit;
             end; //a
         if b then
             begin
              b:=false;
              c:=true;
              plu_count:=plu_count-tovar_count;
              tovar_count:=0;
              sum_kat:=sum_kat-sum_prod;
              sum_prod:=0;
              Queryabc.Value:='B';
             exit;
             end;//b

        if c then Queryabc.Value:='C';


      end;

 //if sum_prod<=a then Queryabc.Value:='A' else
 //if (sum_prod>a) and (sum_prod<=b) then Queryabc.Value:='B'
 //else Queryabc.Value:='C';


//
end;

procedure Tabcform.Button2Click(Sender: TObject);
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

procedure Tabcform.N3Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure Tabcform.N2Click(Sender: TObject);
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

procedure Tabcform.N6Click(Sender: TObject);
begin
printdb.Preview;
end;

procedure Tabcform.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
if ClientDS.FieldByName('abc').Value='A' then
        TDBGrideh(Sender).Canvas.Brush.Color:= $00e0FFe0 ;
if ClientDS.FieldByName('abc').Value='C' then
        TDBGrideh(Sender).Canvas.Brush.Color:= $00e0e0FF;


IF  gdSelected   IN State
        Then Begin
                TDBGrideh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGrideh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGrideh(Sender).Canvas.Brush.Color:=TDBGrideh(Sender).Canvas.Brush.Color;
    TDBGrideh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure Tabcform.N4Click(Sender: TObject);
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

procedure Tabcform.SpeedButton1Click(Sender: TObject);
begin
helpform.Show;
end;

procedure Tabcform.SpeedButton2Click(Sender: TObject);
begin
helpform.Close;
end;

procedure Tabcform.N7Click(Sender: TObject);
var i:integer;
begin
for i:=0 to DBGrid.Columns.Count-1
do begin

if  dbgrid.Columns.Items[i].FieldName='plu' then
       dbgrid.Columns.Items[i].Title.Caption:='код товара';
if  dbgrid.Columns.Items[i].FieldName='name' then
       dbgrid.Columns.Items[i].Title.Caption:='Товар';
if  dbgrid.Columns.Items[i].FieldName='katname' then
       dbgrid.Columns.Items[i].Title.Caption:='категория' ;
if  dbgrid.Columns.Items[i].FieldName='proizw' then
       dbgrid.Columns.Items[i].Title.Caption:='производитель' ;
if  dbgrid.Columns.Items[i].FieldName='postav' then
       dbgrid.Columns.Items[i].Title.Caption:='поставщик' ;
if  dbgrid.Columns.Items[i].FieldName='price' then
       dbgrid.Columns.Items[i].Title.Caption:='цена= сумма/ кол-во' ;
if  dbgrid.Columns.Items[i].FieldName='ed_izm' then
       dbgrid.Columns.Items[i].Title.Caption:='ед.изм.' ;
if  dbgrid.Columns.Items[i].FieldName='wes' then
       dbgrid.Columns.Items[i].Title.Caption:='шт/кг' ;
if  dbgrid.Columns.Items[i].FieldName='sumkol' then
       dbgrid.Columns.Items[i].Title.Caption:='кол-во продаж' ;
if  dbgrid.Columns.Items[i].FieldName='sumsum' then
       dbgrid.Columns.Items[i].Title.Caption:='сумма продаж со скидкой' ;
if  dbgrid.Columns.Items[i].FieldName='abc' then
       dbgrid.Columns.Items[i].Title.Caption:='abc' ;
if  dbgrid.Columns.Items[i].FieldName='procplu' then
       dbgrid.Columns.Items[i].Title.Caption:='нарастающий %товара в категории и группе' ;
if  dbgrid.Columns.Items[i].FieldName='procsum' then
       dbgrid.Columns.Items[i].Title.Caption:='нарастающий %продаж в категории и группе' ;
if  dbgrid.Columns.Items[i].FieldName='sumtovar' then
       dbgrid.Columns.Items[i].Title.Caption:='нарастающая сумма продаж в категории и группе' ;

   end;
end;

end.
