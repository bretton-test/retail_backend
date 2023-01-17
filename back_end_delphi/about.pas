unit about;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, FR_Desgn, FR_Class, FR_DSet, FR_DBSet, DB,
  OracleData, FR_RRect, FR_Shape,sysutils, FR_Chart,math, FR_E_TXT,
  FR_E_CSV, FR_E_RTF, FR_E_HTM, OpModels, OpDbOfc, OpShared, OpXL2K,
  OpExcel;

type
  TAboutBox = class(TForm)
    DS1: TfrDBDataSet;
    frReport1: TfrReport;
    Qkat: TOracleDataSet;
    Qostatok: TOracleDataSet;
    QostatokNAME: TStringField;
    QostatokPRICE: TFloatField;
    QostatokPRIHOD: TFloatField;
    QostatokRASHOD: TFloatField;
    QostatokOSTATOK: TFloatField;
    QostatokBARCODE: TStringField;
    Qostatokean13: TStringField;
    QostatokPLU: TFloatField;
    QostatokED_IZM: TStringField;
    DS2: TfrDBDataSet;
    QkatKAT: TIntegerField;
    QkatNAME: TStringField;
    prihnakl: TOracleDataSet;
    prihnaklNN: TIntegerField;
    prihnaklDATA: TDateTimeField;
    prihnaklNAME: TStringField;
    prihnaklED_IZM: TStringField;
    prihnaklKOL_VO: TFloatField;
    prihnaklCENABNDS: TFloatField;
    prihnaklCENASNDS: TFloatField;
    prihnaklCENAREAL: TFloatField;
    prihnaklTOTAL: TFloatField;
    prihnaklPLU: TFloatField;
    prihnaklNOM: TFloatField;
    frShapeObject1: TfrShapeObject;
    frRoundRectObject1: TfrRoundRectObject;
    prihnaklSKLAD: TStringField;
    prihnaklNAME_1: TStringField;
    prihnaklPOST: TIntegerField;
    prihnaklSELF: TStringField;
    reestr: TOracleDataSet;
    reestrPLU: TFloatField;
    reestrNAME: TStringField;
    reestrPROIZW: TStringField;
    reestrPRICE: TFloatField;
    tov_otch: TOracleDataSet;
    katreport: TOracleDataSet;
    tov_otch_sec: TOracleDataSet;
    journ_sum: TOracleDataSet;
    frChartObject1: TfrChartObject;
    rashnakl: TOracleDataSet;
    QvhCena: TOracleDataSet;
    Summreport: TOracleDataSet;
    rash_otch: TOracleDataSet;
    rash_otch1: TOracleDataSet;
    rash_sum: TOracleDataSet;
    DS3: TfrDBDataSet;
    DS4: TfrDBDataSet;
    rashnaklPLU: TFloatField;
    rashnaklNAME: TStringField;
    rashnaklED_IZM: TStringField;
    rashnaklMEST: TFloatField;
    rashnaklKOL_UP: TFloatField;
    rashnaklKOL_VO: TFloatField;
    rashnaklCENASNDS: TFloatField;
    rashnaklCENABNDS: TFloatField;
    rashnaklTOTAL: TFloatField;
    rashnaklID: TFloatField;
    rashnaklSKLAD: TStringField;
    rashnaklPOKUP: TStringField;
    rashnaklPRIM: TStringField;
    rashnaklNN: TIntegerField;
    rashnaklDATA: TDateTimeField;
    selrashod: TOracleDataSet;
    SelPerem: TOracleDataSet;
    KKMJ: TOracleDataSet;
    Qinvent: TOracleDataSet;
    selAct: TOracleDataSet;
    QpriceJournal: TOracleDataSet;
    kkmreport: TOracleDataSet;
    qprice: TOracleDataSet;
    kkmreportP: TOracleDataSet;
    QselKat: TOracleDataSet;
    QselKatNAME: TStringField;
    QselKatKAT: TIntegerField;
    prihnaklPRIM: TStringField;
    Qpostavki: TOracleDataSet;
    qpostplu: TOracleDataSet;
    Qpostkat: TOracleDataSet;
    Qpostplusum: TOracleDataSet;
    qpostall: TOracleDataSet;
    qpostallkat: TOracleDataSet;
    Qrashnom: TOracleDataSet;
    qrashnakl: TOracleDataSet;
    nal: TOracleDataSet;
    QvhCenaNN: TFloatField;
    QvhCenaDATA: TStringField;
    QvhCenaCENABNDS: TFloatField;
    QvhCenaCENASNDS: TFloatField;
    QvhCenaKOLVO: TFloatField;
    QvhCenaKRASN_ID: TStringField;
    chartreport: TOracleDataSet;
    wisyak: TOracleDataSet;
    sroky: TOracleDataSet;
    nalPLU: TFloatField;
    nalNAME: TStringField;
    nalED_IZM: TStringField;
    nalKOLVO: TFloatField;
    nalsum: TCurrencyField;
    nalprice: TCurrencyField;
    frCSVExport1: TfrCSVExport;
    frTextExport1: TfrTextExport;
    frRTFExport1: TfrRTFExport;
    frHTMExport1: TfrHTMExport;
    prihodrashod: TOracleDataSet;
    hourreport: TOracleDataSet;
    hourrep2: TOracleDataSet;
    cheksummreport: TOracleDataSet;
    topten: TOracleDataSet;
    sumpostprim: TOracleDataSet;
    qposttovar: TOracleDataSet;
    skidka: TOracleDataSet;
    sumdiscount: TOracleDataSet;
    daydiscount: TOracleDataSet;
    pensdiscount: TOracleDataSet;
    chekdiscount: TOracleDataSet;
    qprodtovar: TOracleDataSet;
    rashodF: TOracleDataSet;
    rashodf1: TOracleDataSet;
    kassreport: TOracleDataSet;
    Qoplata: TOracleDataSet;
    sumPost: TOracleDataSet;
    procedure QostatokCalcFields(DataSet: TDataSet);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant); 
    procedure QostatokBeforeOpen(DataSet: TDataSet);
    procedure frReport1UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure nalCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  opexcel:TOpExcel;
  OpDataSet1:TOpDataSetModel;
  OpDataSet2:TOpDataSetModel;
  OpDataSet3:TOpDataSetModel;
  OpDataSet4:TOpDataSetModel;
  procedure printReport(const ds:Toracledataset;
                        const name:string;
                        const nom:integer);
  procedure Startexcel;

  public
    { Public declarations }


   procedure  setreport(        const ds1 :Tdataset;
                                const ds2 :Tdataset;
                                const ds3 :Tdataset;
                                const ds4 :Tdataset;
                                const filerep:string);
   procedure printrashod(const nom:integer);
   procedure print116(const nom:integer);
   procedure print116_1(const nom:integer);
   procedure printperem(const nom:integer);
   procedure printkm6(const nom:integer);
   procedure printko1(const nom:integer);
   procedure printinvent(const nom:integer;const all:boolean=false;const sklad:integer=1);
   procedure printakt(const nom:integer);
   procedure printPriceJournal(const d1,d2:Tdatetime);
   procedure printPereozenka(const nom:integer);
   procedure printTorg13(const nom:integer);
   procedure printtorg12v(const nom:integer;const tip:integer);
  end;

var
  AboutBox: TAboutBox;
  nds10,nds20,vhsum,prsum:double;
  n,k,temp:string;
  katvisible:boolean;
  tempdata:tdatetime;
  implementation

uses dmunit, BARCODEunit, messageunit, invunit;

{$R *.dfm}
 procedure  TAboutBox.setreport(const ds1 :Tdataset;
                                const ds2 :Tdataset;
                                const ds3 :Tdataset;
                                const ds4 :Tdataset;
                                const filerep:string);

begin
Aboutbox.DS1.DataSet:=ds1;
ds1.Open;

If ds1.RecordCount=0  then begin

 dm.addmemo('нет данных');
  exit;
end;
  If (ds1.RecordCount=0) and (not dmunit.repedit)  then exit;
If ds2<>nil   then
               begin
                aboutbox.DS2.DataSet:=ds2;
                ds2.Open;
               end;

 If ds3<>nil   then
               begin
                aboutbox.DS3.DataSet:=ds3;
                ds3.Open;
               end;
  If ds4<>nil   then
               begin
                aboutbox.DS4.DataSet:=ds4;
                ds4.Open;
               end;




 If filerep<>''  then frreport1.LoadFromFile(ExtractFilePath(Application.ExeName)+filerep);

If dmunit.repedit  then about.AboutBox.frReport1.DesignReport
                   else frreport1.ShowReport;

if (ds1<>nil) and (ds1<>dm.qaltost) then ds1.Close;
if ds2<>nil then ds2.Close;
if ds3<>nil then ds3.Close;
if ds4<>nil then ds4.Close;
if OpExcel.Connected then OpExcel.Connected:=false;
end;

procedure TAboutBox.QostatokCalcFields(DataSet: TDataSet);
begin
If length(QostatokBARCODE.AsString)<>13  then
Qostatokean13.Value:=' '
else
 Qostatokean13.Value:=barcodeunit.codebar(QostatokBARCODE.AsString);

end;

procedure TAboutBox.frReport1GetValue(const ParName: String;
  var ParValue: Variant);




  begin

 if  parname='prim' then parvalue:=temp;




  If parname='ndata'  then parvalue:=n;
 If parname='kdata'  then parvalue:=k;
if (parname='katshow') then
                 begin
                  if temp<>QselKatNAME.AsString then katvisible:=true;
                  temp:=QselKatNAME.AsString;

                  if katvisible then
                  begin
                  parvalue:=1;
                  katvisible:=false;
                 end else parvalue:=0;
                 end;


If parname='name'  then parvalue:=dm.qskladSKLAD.AsString ;
If parname='nds10' then parvalue:=nds10;
If parname='nds20' then parvalue:=nds20;

If parname='vis' then  begin
if AboutBox.QvhCena.RecordCount<=1 then parvalue:=1 else parvalue:=2;

end;
If parname='vhcena' then
begin

  if  AboutBox.QvhCena.Active then
  if AboutBox.QvhCena.RecordCount=1 then  parvalue:=aboutbox.QvhCenaCENASNDS.AsCurrency
                                    else parvalue:='';

  end;
If parname='vhcenabnds' then
begin

  if  AboutBox.QvhCena.Active then
  if AboutBox.QvhCena.RecordCount=1 then  parvalue:=aboutbox.QvhCenaCENABNDS.AsCurrency
                                    else parvalue:='';

  end;





If parname='vhkolvo' then
begin

  if  AboutBox.QvhCena.Active then
  if AboutBox.QvhCena.RecordCount>0 then
                        begin
                         qvhcena.First;

                         while not QvhCena.Eof do
                           begin

                          parvalue:=parvalue+aboutbox.QvhCenaKOLVO.AsFloat;
                          qvhcena.Next;
                          end;
                        qvhcena.First;
                        end;

end;
If parname='vhsumma' then
begin

  if  AboutBox.QvhCena.Active then
  if AboutBox.QvhCena.RecordCount>0 then
                        begin
                         qvhcena.First;

                         while not QvhCena.Eof do
                           begin

                          parvalue:=parvalue+roundto((aboutbox.QvhCenaKOLVO.AsFloat*QvhCenaCENASNDS.AsCurrency),-2);
                          qvhcena.Next;
                          end;
                        qvhcena.First;
                        end;

vhsum:=vhsum+double(parvalue);
end;
If parname='fvh' then parvalue:=vhsum;
If parname='fpr' then parvalue:=prsum;

  If parname='per_viz' then
begin
 if selrashod.RecordCount>1 then parvalue:=1 else  parvalue:=0


end;

  If parname='per_total' then
begin
if (selrashod.Active) and (selrashod.RecordCount>0) then
  begin
         selrashod.First;

                         while not selrashod.Eof do
                           begin

                          parvalue:=parvalue+roundto((selrashod.FieldValues['kolvo']*selrashod.FieldValues['cena']),-2);
                          selrashod.Next;
                          end;
                        selrashod.First;

  end;

end;
 If parname='rash_total' then
       begin
          rash_sum.First;
           while not rash_sum.Eof do
            begin
              
              parvalue:=parvalue+rash_sum.FieldValues['sum'];
              rash_sum.Next;
            end;
       end;
  If parname='discount_total' then
       begin
          rash_sum.First;
           while not rash_sum.Eof do
            begin
              
              parvalue:=parvalue+rash_sum.FieldValues['skidka'];
              rash_sum.Next;
            end;
       end;
 


end;

procedure TAboutBox.QostatokBeforeOpen(DataSet: TDataSet);
begin
//TOracleDataSet(dataset).SetVariable('begin',strtodate('01.01.2000'));
//TOracleDataSet(dataset).SetVariable('end',dmunit.pend);

end;
procedure TAboutBox.printrashod(const nom:integer);
var temp:boolean;
    plu:integer;

begin
aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;
aboutbox.rashnakl.SetVariable('nom',nom);
aboutbox.rashnakl.Open;
//aboutbox.QvhCena.Open;
if aboutbox.rashnakl.RecordCount=0 then
 begin
    dm.addmemo(messageunit.m33);
    rashnakl.Close;
    exit;
 end;


nds10:=0;
nds20:=0;
temp:=dm.tovar.Filtered;
plu:=dm.tovarPLU.AsInteger;
dm.tovar.Filtered:=false;
while not rashnakl.Eof do
begin
 if (rashnaklcenasnds.AsCurrency<>0) and  (rashnaklcenabnds.AsCurrency<>0) then
 begin
 if (rashnaklcenasnds.AsCurrency/rashnaklcenabnds.AsCurrency)>1.11 then
     nds20:=nds20+((rashnaklcenasnds.AsCurrency-rashnaklcenabnds.AsCurrency)*rashnaklkol_vo.AsFloat );
 if ((rashnaklcenasnds.AsCurrency/rashnaklcenabnds.AsCurrency)>1.01)
     and ((rashnaklcenasnds.AsCurrency/rashnaklcenabnds.AsCurrency)<1.12) then
     nds10:=nds10+((rashnaklcenasnds.AsCurrency-rashnaklcenabnds.AsCurrency)*rashnaklkol_vo.AsFloat );
 end;
 rashnakl.Next;

end;
dm.tovar.Filtered:=temp;
dm.LocateTovar(plu);


 aboutbox.setreport(aboutbox.rashnakl,nil,nil,nil,'\reports\frTorg-12.frf');

 aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;

 end;
//---------------------------------------------------------------------------
 procedure TAboutBox.print116(const nom:integer);


begin
vhsum:=0;
prsum:=0;
aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;
aboutbox.rashnakl.SetVariable('nom',nom);
aboutbox.rashnakl.Open;

if aboutbox.rashnakl.RecordCount=0 then
 begin
    dm.addmemo(messageunit.m33);
    rashnakl.Close;
    aboutbox.QvhCena.Close;
    exit;
 end;
  while not  rashnakl.Eof do
  begin
   prsum:=prsum+rashnakl.FieldValues['total'];
   rashnakl.Next;
  end;
  rashnakl.First;
  aboutbox.QvhCena.SetVariable('nom',nom);
aboutbox.QvhCena.Open;

 aboutbox.setreport(aboutbox.rashnakl,aboutbox.QvhCena,nil,nil,'\reports\116.frf');
 aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;

 end;

//---------------------------------------------------------------------------
 procedure TAboutBox.print116_1(const nom:integer);


begin
vhsum:=0;
prsum:=0;
aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;
aboutbox.rashnakl.SetVariable('nom',nom);
aboutbox.rashnakl.Open;

if aboutbox.rashnakl.RecordCount=0 then
 begin
    dm.addmemo(messageunit.m33);
    rashnakl.Close;
    exit;
 end;
 while not  rashnakl.Eof do
  begin
   prsum:=prsum+rashnakl.FieldValues['total'];
   rashnakl.Next;
  end;
  rashnakl.First;


 aboutbox.setreport(aboutbox.rashnakl,nil,nil,nil,'\reports\116_1.frf');
 aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;

 end;











 procedure TAboutBox.frReport1UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
begin
if AnsiCompareText('SummaProp', Name) = 0 then
    val := messageunit.SummaPropis(frParser.Calc(p1),frParser.Calc(p2));

end;

  procedure TAboutBox.printperem(const nom:integer);
   begin
    SelPerem.Close;
    selrashod.Close;
    SelPerem.SetVariable('nom',nom);
    selrashod.SetVariable('rash',nom);
    selperem.Open;
    if selperem.RecordCount=0 then
    begin
      dm.addmemo(messageunit.m33);
      selperem.Close;
      exit;


    end;

    if SelPerem.FieldByName('reg').AsInteger=0 then
      begin
      dm.addmemo(messageunit.m17);
      selperem.Close;
      exit;


    end;
    selrashod.Open;

   aboutbox.setreport(selperem,selrashod,nil,nil,'\reports\13.frf');
     SelPerem.Close;
    selrashod.Close;


   end;
{-----------------------------------------------------------------}
   procedure TAboutBox.printkm6(const nom:integer);

    begin

  PrintReport(AboutBox.kkmj,'\reports\KO-1.frf',nom);
    end;
{-----------------------------------------------------------------}
      procedure TAboutBox.printko1(const nom:integer);

    begin

   PrintReport(AboutBox.kkmj,'\reports\KM-6.frf',nom);
    end;
{-----------------------------------------------------------------}
   procedure TAboutBox.printinvent(const nom:integer;const all:boolean=false;const sklad:integer=1);
    var temp:Tdatetime;
    begin
      temp:=dm.ExecuteSQL('select data from tmp.tskladj where nom='+inttostr(nom));
      aboutbox.Qinvent.Close;
      aboutbox.Qinvent.SetVariable('data',temp);
      aboutbox.Qinvent.SetVariable('sklad',sklad);

      if all then
      begin
          aboutbox.Qinvent.SQL.Strings[aboutbox.Qinvent.SQL.Count-1]:='order by k.name';
          Qinvent.SetVariable('nom','%')
          end   else
          begin
            Qinvent.SetVariable('nom',inttostr(nom));
             aboutbox.Qinvent.SQL.Strings[aboutbox.Qinvent.SQL.Count-1]:=',i.id order by i.id';

          end;
      aboutbox.Qinvent.Open;
      setreport(aboutbox.Qinvent,nil,nil,nil,'\reports\inventory.frf');
      //PrintReport(AboutBox.Qinvent,'\reports\inventory.frf',nom);
      aboutbox.Qinvent.Close;
    end;
{-----------------------------------------------------------------}
  procedure TAboutBox.printakt(const nom:integer);
   begin
   PrintReport(Aboutbox.selAct,'\reports\frTorg-15.frf',nom);
   end;

{-----------------------------------------------------------------}
  procedure TAboutBox.printReport(const ds:Toracledataset;
                                  const name:string;
                                  const nom:integer);

   begin
     with ds do
     begin
     Close;
     SetVariable('nom',nom);
     Open;
       if RecordCount=0 then
                           begin
                             dm.addmemo(messageunit.m33);
                             Close;
                             exit;
                           end;
      end;
      aboutbox.setreport(ds,nil,nil,nil,name);
      ds.Close;


   end;
{-----------------------------------------------------------------}
procedure TAboutBox.printPriceJournal(const d1,d2:Tdatetime);
 begin
  with QpriceJournal do
   begin
      close;
      SetVariable('d1',d1);
       SetVariable('d2',d2);
       Open;

   end;
  aboutbox.setreport(QpriceJournal,nil,nil,nil,'\reports\PriceJournal.frf');

 QpriceJournal.Close;
 end;
 {-----------------------------------------------------------------}
 procedure TAboutBox.printPereozenka(const nom:integer);
  begin
    with Qprice do
    begin
     close;
     SetVariable('nom',nom);
     Open;
    end;
   aboutbox.setreport(Qprice,nil,nil,nil,'\reports\frTorg15m.frf');


    Qprice.Close;
  end;
{--------------------------------------------------------------------}
  procedure TAboutBox.printTorg13(const nom:integer);
  begin
   aboutbox.rashnakl.Close;
aboutbox.rashnakl.SetVariable('nom',nom);
aboutbox.rashnakl.Open;
 aboutbox.setreport(aboutbox.rashnakl,nil,nil,nil,'\reports\Torg-13.frf');


  aboutbox.rashnakl.Close;
  end;

 procedure TAboutBox.nalCalcFields(DataSet: TDataSet);
 var price:currency;
 begin
// temp:=(select to_date(('23:59 '||value) ,'hh24:mi dd.mm.yyyy') from tmp.toptions where parametr='end')
//dm.addmemo(nalplu.AsString);
price:=dm.PriceFromDate(nalplu.AsInteger,about.tempdata);
nalsum.AsCurrency:=nalKOLVO.AsFloat*price;
nalprice.AsCurrency:=price;
end;
{-------------------------------------------------------------------}
procedure Taboutbox.printtorg12v(const nom:integer;const tip:integer);
var temp:boolean;
    plu:integer;
begin
vhsum:=0;
prsum:=0;
aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;
aboutbox.rashnakl.SetVariable('nom',nom);
aboutbox.rashnakl.Open;

if aboutbox.rashnakl.RecordCount=0 then
 begin
    dm.addmemo(messageunit.m33);
    rashnakl.Close;
    exit;
 end;
  while not  rashnakl.Eof do
  begin
   prsum:=prsum+rashnakl.FieldValues['total'];
   rashnakl.Next;
  end;
  rashnakl.First;

nds10:=0;
nds20:=0;
temp:=dm.tovar.Filtered;
plu:=dm.tovarPLU.AsInteger;
dm.tovar.Filtered:=false;
while not rashnakl.Eof do
begin
 if (rashnaklcenasnds.AsCurrency<>0) and  (rashnaklcenabnds.AsCurrency<>0) then
 begin
 if (rashnaklcenasnds.AsCurrency/rashnaklcenabnds.AsCurrency)>1.11 then
     nds20:=nds20+((rashnaklcenasnds.AsCurrency-rashnaklcenabnds.AsCurrency)*rashnaklkol_vo.AsFloat );
 if ((rashnaklcenasnds.AsCurrency/rashnaklcenabnds.AsCurrency)>1.01)
     and ((rashnaklcenasnds.AsCurrency/rashnaklcenabnds.AsCurrency)<1.12) then
     nds10:=nds10+((rashnaklcenasnds.AsCurrency-rashnaklcenabnds.AsCurrency)*rashnaklkol_vo.AsFloat );
 end;
 rashnakl.Next;

end;
dm.tovar.Filtered:=temp;
dm.LocateTovar(plu);

 aboutbox.QvhCena.SetVariable('nom',nom);
aboutbox.QvhCena.Open;

if tip=12 then aboutbox.setreport(aboutbox.rashnakl,aboutbox.QvhCena,nil,nil,'\reports\frTorg-12_1.frf')
          ELSE aboutbox.setreport(aboutbox.rashnakl,aboutbox.QvhCena,nil,nil,'\reports\Torg-13.frf');

 aboutbox.QvhCena.Close;
aboutbox.rashnakl.Close;

end;

 procedure TAboutBox.Startexcel;
 var
Rng : TOpExcelRange;
// count:integer;
 begin
  if OpExcel.Connected = False
  then OpExcel.Connected:=true
  else begin
       OpExcel.Connected:=false;
       OpExcel.Connected:=true;
       end;

// count:= OpExcel.Workbooks[0].Worksheets.Count;
 // Rng := OpExcel.Workbooks[0].Worksheets[0].Ranges.Add;
 // Rng.Name := 'temp';
 // Rng.Address := 'A1';
//  Rng.OfficeModel :=OpDataSet1;
     OpDataSet1.Dataset:=ds1.DataSet;
   if (ds2.DataSet<>nil) and (ds2.DataSet.Active) then
   begin
    OpDataSet1.DetailModel:=OpDataSet2;
    OpDataSet2.Dataset:=ds2.DataSet;
   end
   else  OpDataSet1.DetailModel:=nil;

   if (ds3.DataSet<>nil) and (ds3.DataSet.Active) then
   begin
    OpDataSet2.DetailModel:=OpDataSet3;
    OpDataSet3.Dataset:=ds3.DataSet;
   end
   else  OpDataSet2.DetailModel:=nil;

    if (ds4.DataSet<>nil) and (ds4.DataSet.Active) then
   begin
    OpDataSet3.DetailModel:=OpDataSet4;
    OpDataSet4.Dataset:=ds4.DataSet;
   end
   else  OpDataSet3.DetailModel:=nil;

  try




   OpExcel.RangeByName['temp'].Populate;
   OpExcel.Workbooks[0].Worksheets[0].Activate;
   OpExcel.RangeByName['temp'].AsRange.Columns.AutoFit;
 except
 OpExcel.Visible:=true;
 OpExcel.Connected:=false;
OpExcel.Free;
OpExcel:=TOpExcel.Create(self);
 OpExcel.Workbooks.Clear;
 OpExcel.Workbooks.Add;
 OpExcel.Workbooks[0].Worksheets.Clear;
 OpExcel.Workbooks[0].Worksheets.Add;
  Rng := OpExcel.Workbooks[0].Worksheets[0].Ranges.Add;
  Rng.Name := 'temp';
  Rng.Address := 'A1';
  Rng.OfficeModel :=OpDataSet1;
   OpExcel.Connected:=true;
   OpExcel.Visible:=true;
   OpExcel.RangeByName['temp'].Populate;
   OpExcel.Workbooks[0].Worksheets[0].Activate;
   OpExcel.RangeByName['temp'].AsRange.Columns.AutoFit;
 end;

 end;

procedure TAboutBox.FormCreate(Sender: TObject);
 var
Rng : TOpExcelRange;
begin
frReport1.Excelsave:=Startexcel;
OpDataSet1:=TOpDataSetModel.Create(self);
OpDataSet2:=TOpDataSetModel.Create(self);
OpDataSet3:=TOpDataSetModel.Create(self);
OpDataSet4:=TOpDataSetModel.Create(self);



OpExcel:=TOpExcel.Create(self);
 OpExcel.Workbooks.Clear;
 OpExcel.Workbooks.Add;
 OpExcel.Workbooks[0].Worksheets.Clear;
 OpExcel.Workbooks[0].Worksheets.Add;
 opexcel.Connected:=false;
 opexcel.Visible:=true;
  Rng := OpExcel.Workbooks[0].Worksheets[0].Ranges.Add;
  Rng.Name := 'temp';
  Rng.Address := 'A1';
  Rng.OfficeModel :=OpDataSet1;



end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if OpExcel.Connected then OpExcel.Connected := false;
end;

end.

