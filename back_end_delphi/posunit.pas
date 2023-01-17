unit posunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData, Oracle, Buttons, SpeedForm,
  ExtCtrls,sunit,math, PrnDbgeh, StdCtrls, Mask, DBCtrlsEh, Menus;

type
  Tposform = class(TSForm)
    Qsmena: TOracleDataSet;
    smDS: TDataSource;
    DBGrid: TDBGridEh;
    QkassaRep: TOracleDataSet;
    ds: TDataSource;
    kassForm1: TSpeedForm;
    DBGridEh2: TDBGridEh;
    QkassaRepTIP: TStringField;
    QkassaRepDATA: TDateTimeField;
    QkassaRepSUM: TFloatField;
    qCheck: TOracleDataSet;
    qCheckDATA: TDateTimeField;
    qCheckCHEK: TFloatField;
    qCheckSUM: TFloatField;
    ds2: TDataSource;
    chekForm: TSpeedForm;
    DBGridEh3: TDBGridEh;
    SelChek: TOracleDataSet;
    DS3: TDataSource;
    DBGridEh4: TDBGridEh;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    LastSm: TOracleDataSet;
    SelChekID: TFloatField;
    SelChekPLU: TStringField;
    SelChekTOVAR: TStringField;
    SelChekPRICE: TFloatField;
    SelChekQUANTITY: TFloatField;
    SelChekSUM: TFloatField;
    SelChekSTORNOFLAG: TFloatField;
    SelChekNUM: TFloatField;
    Panel2: TPanel;
    kassbut: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton11: TSpeedButton;
    lastbut: TSpeedButton;
    hourbutton: TSpeedButton;
    printitog: TPrintDBGridEh;
    printbutton: TSpeedButton;
    SpeedButton3: TSpeedButton;
    discquery: TOracleDataSet;
    intform: TSpeedForm;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    d1: TDBDateTimeEditEh;
    d2: TDBDateTimeEditEh;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton4: TSpeedButton;
    QsmenaNUM: TFloatField;
    QsmenaDATA: TDateTimeField;
    QsmenaKASSA: TFloatField;
    SpeedButton7: TSpeedButton;
    QsmenaSUMSUM: TFloatField;
    Qsmenakrep: TFloatField;
    krepquery: TOracleQuery;
    knigaquery: TOracleQuery;
    Qsmenakniga: TCurrencyField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton8: TSpeedButton;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure kassbut1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure kassForm1Close(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh3TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton2Click(Sender: TObject);
    procedure printbuttonClick(Sender: TObject);
    procedure diskbuttonClick(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure hourbuttonClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure QsmenaCalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
      mydata:tdatetime;
      mycolor:Tcolor;
    procedure viewcheck(const id:byte);
    function chekdata:boolean;
  public
    { Public declarations }
  end;

var
  posform: Tposform;

implementation

uses dmunit, kartunit, about, kkmUNIT;

{$R *.dfm}

procedure Tposform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
qsmena.Close;
qkassarep.Close;

Action:=caFree;
end;

procedure Tposform.FormDestroy(Sender: TObject);
begin
posform:=nil;
end;

procedure Tposform.FormCreate(Sender: TObject);
begin

qsmena.Open;
end;

procedure Tposform.kassbut1Click(Sender: TObject);
begin
ds.DataSet:=QkassaRep;
if QsmenaNUM.AsInteger<>55 then
begin
LastSm.Close;
lastsm.SetVariable('kassa',qsmenakassa.AsInteger);
lastsm.SetVariable('data',qsmenadata.Value);
lastsm.Open;
end;
//dm.addmemo(qsmenadata.AsString);
qkassarep.Close;
qkassarep.SetVariable('kassa',qsmenakassa.AsInteger);
 if QsmenaNUM.AsInteger<>55 then
begin
qkassarep.SetVariable('data1',lastsm.FieldValues['data']);
end
else qkassarep.SetVariable('data1',int(QsmenaDATA.value));

qkassarep.SetVariable('data2',qsmenadata.Value);
//dm.addmemo(lastsm.FieldValues['data']);
qkassarep.Open;
kassform1.Caption:='отчет по кассе №'+qsmenakassa.AsString;
kassform1.Show;

end;

procedure Tposform.SpeedButton13Click(Sender: TObject);
begin
viewcheck(55);

end;

procedure Tposform.kassForm1Close(Sender: TObject;
  var Action: TCloseAction);
begin
qCheck.Close;
qcheck.sql.Strings[9]:='data';
qkassarep.Close;
selchek.Close;
end;

procedure Tposform.DBGridEh3TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
 var ch:variant;
  begin
case Acol of
0: qcheck.sql.Strings[9]:='data';
2: qcheck.sql.Strings[9]:='sum';
else exit;
end;
ch:=qcheck.FieldValues['chek'];
qcheck.Close;
selchek.Close;
qcheck.Open;
selchek.Open;
qcheck.Locate('chek',ch,[]);
end;

procedure Tposform.SpeedButton2Click(Sender: TObject);
begin
 dm.nofilter;
//if  dm.tovar.Locate('plu',selchekplu.AsInteger,[]) then

 if dm.LocateTovar(selchekplu.AsInteger) then
 if not assigned(KartForm) then

         KartForm:=TKartForm.Create(application,tsform(self).mybar);

         //DM.openkatalog;



          KartForm.Show;


 end;

procedure Tposform.printbuttonClick(Sender: TObject);
begin
printitog.PageHeader.LeftText.Text:=kassform1.caption;
printitog.Preview;
end;

procedure Tposform.diskbuttonClick(Sender: TObject);
begin
qsmena.Last;
end;

 procedure Tposform.viewcheck(const id:byte);
var mdata:tdatetime;

   begin
if QsmenaNUM.AsInteger<>55 then
begin
 lastsm.Close;
lastsm.SetVariable('kassa',qsmenakassa.AsInteger);
lastsm.SetVariable('data',qsmenadata.Value);
lastsm.Open;
mdata:=lastsm.FieldValues['data'];
lastsm.Close;
end  else mdata:=int(qsmenadata.Value);

qcheck.Close;
qcheck.SQL.Strings[5]:='and id='+inttostr(id);
selchek.Close;
qCheck.SetVariable('kassa',qsmenakassa.AsInteger);
qCheck.SetVariable('data1',mdata);
qCheck.SetVariable('data2',qsmenadata.Value);
qCheck.Open;
selchek.SetVariable('kassa',qsmenakassa.AsInteger);
selchek.SetVariable('data1',mdata);
selchek.SetVariable('data2',qsmenadata.Value);
selchek.Open;
chekform.Caption:='Чеки по кассе №'+qsmenakassa.AsString;
//dm.addmemo(qcheck.sql.Strings[9]);
Chekform.ShowModal;


   end;

procedure Tposform.SpeedButton51Click(Sender: TObject);
begin
 viewcheck(56);
end;

procedure Tposform.SpeedButton61Click(Sender: TObject);
begin
viewcheck(12);
end;

procedure Tposform.hourbuttonClick(Sender: TObject);
begin
if not chekdata then exit;

//
AboutBox.hourreport.Close;
AboutBox.hourreport.SetVariable('day',d1.Value);
AboutBox.hourreport.SetVariable('day1',d2.Value);

AboutBox.hourrep2.Close;
AboutBox.hourrep2.SetVariable('day',d1.Value);
AboutBox.hourrep2.SetVariable('day1',d2.Value);


 AboutBox.setreport(AboutBox.hourreport,AboutBox.hourrep2,nil,nil,'\reports\hourreport.frf');

end;

procedure Tposform.SpeedButton11Click(Sender: TObject);
begin
 qsmena.First;
end;

procedure Tposform.SpeedButton3Click(Sender: TObject);
var temp:tdatetime;
begin
if not chekdata then exit;
temp:=roundto(d2.Value,0)+1;

discquery.Close;
discquery.SetVariable('day1',d1.Value);
discquery.SetVariable('day2',temp);
ds.DataSet:=discquery;
discquery.Open;
kassform1.Caption:='Скидки с '+FormatDateTime('dd.mm.yyyy',d1.Value)+' по '+
FormatDateTime('dd.mm.yyyy',d2.Value);
kassform1.ShowModal;

end;

procedure Tposform.SpeedButton4Click(Sender: TObject);
var temp:tdatetime;
begin
//
if not chekdata then exit;
temp:=roundto(d2.Value,0)+1;
//
AboutBox.skidka.Close;
AboutBox.skidka.SetVariable('day1',d1.Value);
AboutBox.skidka.SetVariable('day2',temp);
AboutBox.sumdiscount.Close;
AboutBox.sumdiscount.SetVariable('day1',d1.Value);
AboutBox.sumdiscount.SetVariable('day2',temp);



AboutBox.setreport(AboutBox.skidka,AboutBox.sumdiscount,nil,nil,'\reports\skidka.frf');

end;

procedure Tposform.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
{if  toracledataset(dbgrid.DataSource.DataSet)<>nil then
 begin
 if tposform(self).mydata<>int(toracledataset(dbgrid.DataSource.DataSet).FieldValues['data'])
   then
      begin
       tposform(self).mydata:=int(toracledataset(dbgrid.DataSource.DataSet).FieldValues['data']);
       if tposform(self).mycolor=clwhite then tposform(self).mycolor:=clCream
                                          else  tposform(self).mycolor:=clwhite;

     end;

 end;
  TDBGridEh(Sender).Canvas.Brush.Color:=tposform(self).mycolor;  }

  if abs(QsmenaSUMSUM.Value-Qsmenakrep.Value)>10 then TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF;
  if abs(Qsmenakrep.Value-Qsmenakniga.Value)>10 then TDBGridEh(Sender).Canvas.Brush.Color:=$00e0FFe0;


 IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure Tposform.SpeedButton7Click(Sender: TObject);
var temp:tdatetime;
begin
if not chekdata then exit;
temp:=roundto(d2.Value,0)+1;
//
AboutBox.daydiscount.Close;
AboutBox.daydiscount.SetVariable('day1',d1.Value);
AboutBox.daydiscount.SetVariable('day2',temp);
AboutBox.pensdiscount.Close;
AboutBox.pensdiscount.SetVariable('day1',d1.Value);
AboutBox.pensdiscount.SetVariable('day2',temp);
AboutBox.chekdiscount.Close;
AboutBox.chekdiscount.SetVariable('day1',d1.Value);
AboutBox.chekdiscount.SetVariable('day2',temp);


AboutBox.setreport(AboutBox.daydiscount,AboutBox.pensdiscount,AboutBox.chekdiscount,nil,'\reports\skidkagraf.frf');

end;

procedure Tposform.QsmenaCalcFields(DataSet: TDataSet);
begin
krepquery.SetVariable('kkm',QsmenaKASSA.AsInteger);
krepquery.SetVariable('data',FormatDateTime('dd.mm.yyyy',QsmenaDATA.Value));
krepquery.Execute;
knigaquery.SetVariable('kkm',QsmenaKASSA.AsInteger);
knigaquery.SetVariable('data',FormatDateTime('dd.mm.yyyy',QsmenaDATA.Value));
knigaquery.Execute;


Qsmenakniga.Value:=knigaquery.Field('sum');
Qsmenakrep.Value:=krepquery.Field('sum');
end;

procedure Tposform.N1Click(Sender: TObject);
begin
Qsmena.Refresh;
end;
//----------------------------------------------------
function tposform.chekdata:boolean;
 begin
result:=false;
d1.Value:=QsmenaDATA.Value;
d2.Value:=QsmenaDATA.Value;

if intform.ShowModal<>mrOk then exit;
if integer(d2.Value)-integer(d1.Value)<0 then
begin
dm.addmemo('начальная дата больше конечной');
 exit;
end;
result:=true;
 end;
//---------------------------------------------------
procedure Tposform.SpeedButton8Click(Sender: TObject);
var temp:tdatetime;
begin
if not chekdata then exit;
temp:=roundto(d2.Value,0)+1;
//
AboutBox.Qoplata.Close;
AboutBox.Qoplata.SetVariable('d1',d1.Value);
AboutBox.Qoplata.SetVariable('d2',temp);
AboutBox.Qoplata.Open;
AboutBox.setreport(AboutBox.Qoplata,nil,nil,nil,'\reports\oplata.frf');
AboutBox.Qoplata.Close;


end;

procedure Tposform.N2Click(Sender: TObject);

var child: TKkmForm;
begin
if Qsmenakrep.AsInteger=0 then

begin
child:=TKkmForm.Create(nil,myBar);
child.Caption:='Отчет ККМ';
child.newdoc;
child.Show;
child.OnActivate(child);
child.kassanom.Value:=QsmenaKASSA.AsInteger;
child.datadoc.Value:=QsmenaDATA.Value;
child.BitBtn1.Click;
end else dm.addmemo('отчёт уже создан');

end;

procedure Tposform.PopupMenu1Popup(Sender: TObject);
begin
n2.Enabled:=Qsmenakrep.AsInteger=0;

end;

procedure Tposform.FormActivate(Sender: TObject);
begin
If Qsmena.Active then QsmenaCalcFields(qsmena);
end;

end.
