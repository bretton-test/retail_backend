unit ViewUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, Mask, DBCtrlsEh, DBLookupEh,
  ComCtrls, ExtCtrls, DB, OracleData, DBClient, Provider,main, Menus,cennik,sunit,
  Oracle,strutils,math;

type
  TViewForm = class(TsForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    datanakl: TDateTimePicker;
    osnedit: TEdit;
    sklad: TDBLookupComboboxEh;
    postname: TEdit;
    numbered: TEdit;
    wesbox: TCheckBox;
    dbgrid: TDBGridEh;
    Panel3: TPanel;
    cancel: TSpeedButton;
    PrintB: TBitBtn;
    BitBtn1: TBitBtn;
    CenButton: TBitBtn;
    BarBtn: TBitBtn;
    BitBtn3: TBitBtn;
    Qnakl: TOracleDataSet;
    QnaklNN: TIntegerField;
    QnaklPOST: TIntegerField;
    QnaklPOKUP: TIntegerField;
    QnaklDATA: TDateTimeField;
    QnaklNAME: TStringField;
    QnaklED_IZM: TStringField;
    QnaklKOL_VO: TFloatField;
    QnaklCENABNDS: TFloatField;
    QnaklCENASNDS: TFloatField;
    QnaklCENAREAL: TFloatField;
    QnaklTOTAL: TFloatField;
    QnaklSKLADID: TIntegerField;
    QnaklPLU: TFloatField;
    QnaklCENAWZALE: TFloatField;
    QnaklWESY: TFloatField;
    QnaklNAL: TFloatField;
    QnaklID: TFloatField;
    QnaklNDS: TStringField;
    QnaklKRASN_ID: TStringField;
    DataSource1: TDataSource;
    ClientDS: TClientDataSet;
    QgetOld: TOracleDataSet;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn4: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    strihmenu: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    Qprint: TOracleQuery;
    QnaklPTOTAL: TCurrencyField;
    BitBtn5: TBitBtn;
    pmr: TPopupMenu;
    N10: TMenuItem;
    expmenu: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    QnaklLIFE: TDateTimeField;
    Label8: TLabel;
    ppostname: TEdit;
    N14: TMenuItem;
    qwesprint: TOracleQuery;
    N3: TMenuItem;
    BitBtn6: TBitBtn;
    UpPrihod: TOracleQuery;
    UpKniga: TOracleQuery;
    QSelDoc: TOracleDataSet;
    UpRashod: TOracleQuery;
    ok: TSpeedButton;
    oldQuery: TOracleQuery;
    SpeedButton2: TSpeedButton;
    upJurnal: TOracleQuery;
  
   
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure wesboxClick(Sender: TObject);
    procedure dbgridCellClick(Column: TColumnEh);
    procedure cancelClick(Sender: TObject);
    procedure CenButtonClick(Sender: TObject);
    
    procedure BitBtn3Click(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BarBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BarClick(Sender: TObject);
    procedure QnaklCalcFields(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ClientDSBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure numberedKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    inscennik: array of integer;
    nom:integer;
    nakledit:boolean;
    rekvedit:boolean;
    ppost:integer;
    procedure printCennik(const tip:integer);
    function TestForm:boolean;
    function updateprice:boolean;
    function updaterekv:boolean;
  public
    { Public declarations }
   procedure LoadData(const nom:integer;const plu:integer);


  end;

var
  ViewForm: TViewForm;

implementation

uses dmunit, messageunit, kartunit, priceunit, naklunit, peremunit,
  rashunit, about, textunit,BARCODEunit, postunit;

{$R *.dfm}

function TViewForm.TestForm:boolean;
  begin
   result:=false;
    If  assigned(rashform) then
        begin
          rashform.Show;
          dm.addmemo(messageunit.m31);
          exit;

        end;
     If  assigned(naklform) then
        begin
          naklform.Show ;
          dm.addmemo(messageunit.m31);
          exit;

        end;
    If  assigned(peremform) then
        begin
          peremform.Show ;
          dm.addmemo(messageunit.m31);
          exit;

        end;


   result:=true;

 end;
//----------------------------------------------------------
procedure TViewForm.printCennik(const tip:integer);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j,sklad:integer;
    org,podr:string;
    //rec1,rec2:Pstr;
procedure  fill(const j:integer);
 begin
  table[0,j]:=dm.tovarPlu.AsString;
  table[1,j]:=floattostr(int(dm.TovarPRICE.AsCurrency))+'-'+copy(formatfloat('0.00',frac(dm.TovarPRICE.AsCurrency)),3,2);
  table[2,j]:=dm.tovarED_IZM.AsString;
  table[3,j]:=dm.barcodeBARCODE.AsString;
  table[4,j]:=dm.tovarCENNIK1.AsString;
  table[5,j]:=dm.tovarCENNIK2.AsString;
  table[6,j]:=dm.tovarCENNIK3.AsString;
  table[7,j]:=dm.tovarCENNIK4.AsString;
  table[8,j]:=dm.QprzwdSTRANA.AsString;
  table[9,j]:=dm.QprzwdNAME.AsString;

 end;

begin

If Tdatasource(dbgrid.DataSource).DataSet.RecordCount=0  then exit;
CenForm:=TCenForm.Create(tform(self));

  try
   dm.nofilter;
   org:='';
   podr:='';
   If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);
   sklad:=clientds.FieldValues['skladid'];
  if  dm.qsklad.Locate('skladid',sklad,[]) then org:=dm.qskladNAME.Value;
   cenform.setRecvizit(org,podr);
  If not wesbox.Checked  then
  begin
   i:=Tdatasource(dbgrid.DataSource).DataSet.RecordCount;
   for j := Low(table) to High(table) do   SetLength(table[j], i);
   Tdatasource(dbgrid.DataSource).DataSet.First;
   for j:=0 to i-1 do
      begin
      dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['plu'];
      dm.tovargetmark;
     if dm.tovarPROIZW.AsInteger<>1 then
      dm.Qprzwd.Locate('proizw',dm.tovarPROIZW.AsInteger,[])
     else if not dm.Qprzwd.Locate('proizw',dm.barcodeKODPR.AsInteger,[])
         then  dm.Qprzwd.Locate('proizw',1,[]);
      fill(j);
      Tdatasource(dbgrid.DataSource).DataSet.Next;
    end;
  end else
  begin
  i:=0;
  for j:=1 to Tdatasource(dbgrid.DataSource).DataSet.RecordCount do
  if inscennik[j]<>0 then inc(i);
  If i=0  then exit;

   for j := Low(table) to High(table) do   SetLength(table[j], i);
    i:=0;
    for j:=0 to Tdatasource(dbgrid.DataSource).DataSet.RecordCount-1 do
      begin
      If inscennik[j+1]<>0  then
      begin
      dmunit.BOOKMARK:=inscennik[j+1];
      dm.tovargetmark;
     if dm.tovarPROIZW.AsInteger<>1 then
      dm.Qprzwd.Locate('proizw',dm.tovarPROIZW.AsInteger,[])
      else if not dm.Qprzwd.Locate('proizw',dm.barcodeKODPR.AsInteger,[])
         then  dm.Qprzwd.Locate('proizw',1,[]);
      fill(i);
      inc(i);
      end;
      end;
  end;
  cenform.Showreport(tip,dmunit.repedit,table);


  finally
  CenForm.close;
 // dispose(rec1);
 // dispose(rec2);
  end;



  end;
 //---------------------------------------------------------



procedure TviewForm.LoadData(const nom:integer;const plu:integer);
var  TempProvider:TDataSetProvider;
begin
  dm.Qpostav.Open;
  dm.Qpostav.Filtered:=false;
  TviewForm(self).nom:=nom;
  Qnakl.SetVariable('nom',nom);
  Qnakl.Open;
  qgetOld.SetVariable('nom',nom);
  qgetOld.Open;
  if QgetOld.RecordCount>0 then
    begin
       if dm.Qpostav.Locate('cod',QgetOld.FieldValues['ppost'],[])
       then ppostname.Text:=dm.QpostavNAME.Value
       else ppostname.Text:='не указан';
        ppostname.ReadOnly:=true;
       ppost:=QgetOld.FieldValues['ppost'];
       datanakl.Date:=QgetOld.FieldValues['data'];
        numbered.Text:=QgetOld.FieldValues['nn'];
        postname.Text:=QgetOld.FieldValues['post_name'];
        sklad.KeyValue:=QgetOld.FieldValues['skladid'];
        osnedit.Text:=QgetOld.FieldValues['prim'];
        Label7.Caption:='Автор: '+ QgetOld.FieldValues['owner'];
        // osnedit.ReadOnly:=true;
         datanakl.Enabled:=false;
        //numbered.ReadOnly:=true;
        postname.ReadOnly:=true;
        sklad.ReadOnly:=true;
       // Labelread.Visible:=true;
       tform(self).Caption:='Накладная №'+numbered.Text;
       tform(self).OnActivate(self);
    end;
  QgetOld.Close;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Qnakl;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
  ClientDS.Open;
  ClientDS.Locate('plu',plu,[]);
  Qnakl.Close;



 end;



//-------------------------------------------------------------------

//-------------------------------------------------------------------

//-------------------------------------------------------------------
procedure TViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
QgetOld.Close;

action:=caFree;
end;
//-------------------------------------------------------------------
procedure TViewForm.dbgridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
try
if not wesbox.Checked then
begin



if QnaklPLU.AsString='0' then begin  TDBGridEh(Sender).Canvas.Brush.Color:=clYellow;exit;end;

If (Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('nal').AsString='0'
) or  (Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('nal').AsString=''
)
then   begin
 TDBGridEh(Sender).Canvas.Brush.Color:=clSkyBlue;
 exit;
 end;


  If (Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('cenareal').AsCurrency>
   Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('cenawzale').AsCurrency)
   and (Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('cenawzale').AsCurrency>0)
    then begin TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF;exit;end;
  If (Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('cenareal').AsCurrency<
   Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('cenawzale').AsCurrency)
   and (Tdatasource(TDBGridEh(Sender).DataSource).DataSet.FieldByName('cenawzale').AsCurrency>0)

    then begin TDBGridEh(Sender).Canvas.Brush.Color:=$00e0FFe0;exit;end;




end;
//end;
 if wesbox.Checked then
       begin
        if inscennik[ClientDS.RecNo]=ClientDS.FieldValues['plu']
        then     TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF
         else TDBGridEh(Sender).Canvas.Brush.Color:=clCream;

        end;

 finally

IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end;
//------------------------------------------------------------------
procedure TViewForm.wesboxClick(Sender: TObject);
var i,n:integer;
begin
if wesbox.Checked then
begin
DBGrid.Canvas.Brush.Color:=clCream;
i:=(ClientDS.RecordCount);
 setlength(inscennik,i+1);
 for n:=low(inscennik) to high(inscennik) do inscennik[n]:=0;

 end;
dbgrid.SetFocus;
dbgrid.Repaint;


end;
 //-----------------------------------------------------------------
procedure TViewForm.dbgridCellClick(Column: TColumnEh);
begin
if wesbox.Checked
then
 begin
  if  inscennik[ClientDS.RecNo]=0 then
  inscennik[ClientDS.RecNo]:=ClientDS.FieldValues['plu']
  else  inscennik[ClientDS.RecNo]:=0;
  dbgrid.Repaint;

 end;

end;
//------------------------------------------------------------------
procedure TViewForm.cancelClick(Sender: TObject);
begin
Tform(self).Close;
end;
//----------------------------------------------------------------
procedure TViewForm.CenButtonClick(Sender: TObject);

begin
printcennik(1);

end;

procedure TViewForm.BitBtn3Click(Sender: TObject);
begin
 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(application,tsform(self).mybar);
         //DM.openkatalog;
         end;

          KartForm.Show;
          dm.nofilter;
      dmunit.BOOKMARK:=ClientDS.FieldValues['plu'];
      dm.tovargetmark;

end;

procedure TViewForm.PrintBClick(Sender: TObject);
begin
dm.PrintPrihod(nom);
end;

procedure TViewForm.BitBtn1Click(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  expmenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do expmenu.Popup(x,y);

end;

procedure TViewForm.BarBtnClick(Sender: TObject);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j:integer;
    org,podr:string;
 procedure  fill(const j:integer);
 begin
  table[0,j]:=dm.tovarNAME.AsString;
  table[1,j]:=floattostr(int(dm.TovarPRICE.AsCurrency))+'-'+copy(formatfloat('0.00',frac(dm.TovarPRICE.AsCurrency)),3,2);
  table[2,j]:=dm.tovarED_IZM.AsString;
  table[3,j]:=dm.barcodeBARCODE.AsString;
  table[4,j]:='';
  table[5,j]:='';
  table[6,j]:='';
  table[7,j]:='';
 end;

begin

if Tdatasource(dbgrid.DataSource).DataSet.FieldByName('plu').AsInteger =0 then  begin dm.addmemo('не присвоен код');exit; end;
If Tdatasource(dbgrid.DataSource).DataSet.RecordCount=0  then exit;

CenForm:=TCenForm.Create(nil);

  try
   dm.nofilter;
   org:='';
   podr:='';
   If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);

   cenform.setRecvizit(org,podr);
  I:=strtoint( InputBox('Сколько печатать ?', 'количество',inttostr(Tdatasource(dbgrid.DataSource).DataSet.FieldByName('kol_vo').AsInteger)));
  if i=0 then exit;
  if i>3 then i:=round(i-(i/4));

   for j := Low(table) to High(table) do   SetLength(table[j], i);
   for j:=0 to i-1 do
      begin
      dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['plu'];
      dm.tovargetmark;
      if dm.tovarSHTUKA.AsInteger=1 then begin dm.addmemo('Весовой товар');exit; end;
      fill(j);

    end;

   cenform.Showreport(3,dmunit.repedit,table);


  finally
  CenForm.close;
  end;


end;

procedure TViewForm.BitBtn2Click(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  pm1.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do pm1.Popup(x,y);
end;


procedure TViewForm.N1Click(Sender: TObject);
var nom:integer;
begin


if MessageDlg(messageunit.m23,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    If not assigned(Priceform)   then
      begin
      Priceform:=tPriceform.Create(application,tsform(self).mybar);
      nom:=dm.newkod('PRIHSEQ');
      Priceform.Setnom(nom,{dmunit.datadok}now);
      Priceform.dataed.Value:=datanakl.DateTime;
     end;
  Priceform.Show;
  Priceform.primed.Text:='На Основ. Накл № '+numbered.Text;
  dm.InsertPereozenka(TviewForm(self).nom);

  end;
end;

procedure TViewForm.N2Click(Sender: TObject);
var temp:boolean;
begin

   if not TestForm then exit;




    if MessageDlg(messageunit.m26,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
  main.MainForm.prihedExecute(nil);



   dm.nofilter;
   temp:=dm.Qnakltemp.ReadOnly;
   dm.Qnakltemp.ReadOnly:=false;
   ClientDS.First;
  naklform.dbgrid.DataSource:=nil;
   while not ClientDS.Eof do
   begin

    dm.Qnakltemp.Insert;
    dm.QnakltempPOST.Value:=ClientDS.FieldValues['post'];
    dm.QnakltempPOKUP.Value:=ClientDS.FieldValues['pokup'];
    dm.QnakltempNAME.Value:=ClientDS.FieldValues['name'];
    dm.QnakltempDATA.Value:=now;
    dm.QnakltempED_IZM.Value:=ClientDS.FieldValues['ED_IZM'];
    dm.QnakltempPLU.Value:=ClientDS.FieldValues['plu'];
    dm.QnakltempMEST.Value:=0;
    dm.QnakltempKOL_UP.Value:=0;
    dm.QnakltempROSSIP.Value:=0;
    dm.QnakltempKOL_VO.Value:=0;
    dm.QnakltempCENABNDS.Value:=ClientDS.FieldValues['cenabnds'];
    dm.QnakltempCENASNDS.Value:=ClientDS.FieldValues['cenasnds'];
    dm.QnakltempCENAREAL.Value:=0;
    dm.QnakltempSKLADID.Value:=sklad.KeyValue;
  //  if dm.tovar.Locate('plu',ClientDS.FieldValues['plu'],[]) then
     if dm.locatetovar(integer(ClientDS.FieldValues['plu'])) then
        dm.QnakltempCENAWZALE.Value:=dm.tovarPRICE.Value;


    dm.Qnakltemp.Post;
    ClientDS.Next;
   end;
   dm.Qnakltemp.ReadOnly:=temp;
   end;
   dmunit.post:=ClientDS.FieldValues['post'];
   with naklform do
   begin
    datanakl.Enabled:=true;;
    numbered.ReadOnly:=false;
    postname.ReadOnly:=false;
    postname.Text:=Tviewform(self).postname.Text;
    dbgrid.DataSource:=dm.tempds;
    sklad.ReadOnly:=false;
    sklad.KeyValue:=Tviewform(self).sklad.KeyValue;
    dmunit.nomerdok:=0;
    dmunit.reg:=0;
    dmunit.tipdok:=1;
    datanakl.DateTime:=now;
    dmunit.datadok:=now;
    numbered.Text:='0';
    osnedit.Text:='';
  bitbtn4.Click;
 end;

end;

procedure TViewForm.BitBtn4Click(Sender: TObject);
var  TempProvider:TDataSetProvider;
      temp:integer;
begin
  temp:=Clientds.FieldValues['plu'];
  Qnakl.SetVariable('nom',nom);
  Qnakl.Open;


  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Qnakl;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
  ClientDS.Open;
  ClientDS.Locate('plu',temp,[]);
  Qnakl.Close;

end;

procedure TViewForm.N7Click(Sender: TObject);
var temp:boolean;
begin

   if not TestForm then exit;
   if MessageDlg(messageunit.m26,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      mainform.peremExecute(nil);
           peremform.skladout.KeyValue:=sklad.KeyValue;
            temp:=dm.Qnakltemp.ReadOnly;
            dm.Qnakltemp.ReadOnly:=false;
             ClientDS.First;
              peremform.dbgrid.DataSource:=nil;
               dm.nofilter;

   while not ClientDS.Eof do
   begin

    dm.Qnakltemp.Insert;
    dm.QnakltempPOST.Value:=ClientDS.FieldValues['post'];
    dm.QnakltempPOKUP.Value:=ClientDS.FieldValues['pokup'];
    dm.QnakltempNAME.Value:=ClientDS.FieldValues['name'];
    dm.QnakltempDATA.Value:=now;
    dm.QnakltempED_IZM.Value:=ClientDS.FieldValues['ED_IZM'];
    dm.QnakltempPLU.Value:=ClientDS.FieldValues['plu'];
    dm.QnakltempMEST.Value:=0;
    dm.QnakltempKOL_UP.Value:=1;
    dm.QnakltempROSSIP.Value:=ClientDS.FieldValues['kol_vo'];
    //if dm.tovar.Locate('plu',ClientDS.FieldValues['plu'],[]) then
        if dm.locatetovar(integer(ClientDS.FieldValues['plu'])) then
          begin

           dm.QnakltempCENAREAL.Value:=dm.tovarPRICE.AsCurrency;
          // dm.QnakltempTOTAL.AsCurrency:=dm.QnakltempCENAREAL.AsCurrency*dm.QnakltempROSSIP.Value;
         end;
    dm.Qnakltemp.Post;
    ClientDS.Next;
   end;
   dm.Qnakltemp.ReadOnly:=temp;
   peremform.dbgrid.DataSource:=dm.tempds;
    dm.Qnakltemp.Refresh;

    end;
end;
procedure TViewForm.BarClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  strihmenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do strihmenu.Popup(x,y);


end;
procedure TViewForm.N8Click(Sender: TObject);
begin
BarBtnClick(nil);
end;

procedure TViewForm.N9Click(Sender: TObject);
var i:integer;
    plu:integer;
begin
 dm.nofilter;
 I:=strtoint( InputBox('Сколько печатать ?', 'количество',{inttostr(Tdatasource(dbgrid.DataSource).DataSet.FieldByName('kol_vo').AsInteger)}'0'));
  if i<=0 then exit;
  if i>100 then begin
                   dm.addmemo('Больше ста не печатаю.');
                 exit;
                end;
  plu:=Clientds.FieldValues['plu'];
  if plu=0 then exit;
  if dm.LocateTovar(plu) then
   begin
     if dm.tovarSHTUKA.AsInteger<>0 then
                                  begin
                                   dm.addmemo(messageunit.m25);
                                  exit;
                                  end;
     try
     qprint.SetVariable('plu',plu);
     qprint.SetVariable('kolvo',i);
     Qprint.Execute;
     dm.OraBase.Commit;
     except
      dm.OraBase.Rollback;
      raise;
     end;

   end else  dm.addmemo('Товар не найден');


end;

procedure TViewForm.QnaklCalcFields(DataSet: TDataSet);
begin
QnaklPTOTAL.AsCurrency:=QnaklKOL_VO.AsFloat*QnaklCENAREAL.AsCurrency;

end;

procedure TViewForm.BitBtn5Click(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  pmr.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do pmr.Popup(x,y);

end;

procedure TViewForm.N10Click(Sender: TObject);
begin
AboutBox.Qrashnom.Close;
AboutBox.Qrashnom.SetVariable('nom',nom);
about.n:=DateTimeToStr(dmunit.pbegin);
about.k:=DateTimeToStr(dmunit.pend);
 aboutbox.setreport(AboutBox.Qrashnom,Aboutbox.qrashnakl,nil,nil,'\reports\kkmnakl.frf');

end;

procedure TViewForm.N11Click(Sender: TObject);
var i,j:integer;
    n:string;
const s:string='строк';
begin

i:=dm.ExportNakl(nom);
j:=i;
n:=copy(inttostr(i),length(inttostr(i)),1);
i:=strtoint(n);
case i of
1: n:=s+'а';
2,3,4 :n:=s+'и';
else n:=s;
end;
dm.addmemo('Экспортировано: '+inttostr(j)+' '+n);

end;

procedure TViewForm.N12Click(Sender: TObject);
var temp:Tsavestring;
var pluarray: array of integer;
i:integer;
begin
 temp:=Tsavestring.Create;
   SetLength(pluarray,ClientDS.RecordCount);
  ClientDS.First;
  for i:=low(pluarray) to high(pluarray)
   do begin
     if ClientDS.FieldValues['plu']<>0 then   pluarray[i]:=ClientDS.FieldValues['plu'];

    ClientDS.Next;
     end;
 if  temp.savespisok(pluarray,'a:\pos.spr',nil,false) then dm.addmemo('файл записан.');


 temp.Free;
end;

procedure TViewForm.N13Click(Sender: TObject);
var temp :tdatetime;
begin
AboutBox.Qrashnom.Close;
AboutBox.Qrashnom.SetVariable('nom',nom);
AboutBox.qrashnakl.Close;
AboutBox.prihodrashod.Close;
AboutBox.prihodrashod.SetVariable('nom',nom);
temp:=dm.ExecuteSQL('select data from tmp.kniga where nom='+inttostr(nom));
AboutBox.prihodrashod.SetVariable('data',temp);

aboutbox.setreport(AboutBox.Qrashnom,AboutBox.prihodrashod,nil,nil,'\reports\naklpr.frf');

end;

procedure TViewForm.N14Click(Sender: TObject);
var i:integer;
    quantity:double;
    temp,kod:string;
begin
  dm.nofilter;
  if not dm.LocateTovar(Clientds.FieldValues['plu'])
  then begin
             dm.addmemo('Товар не найден.');
         exit;
     end;

    if (dm.tovarplu.AsInteger=0)
        or (dm.tovarSHTUKA.AsInteger<>1) then exit;


      I:=strtoint( InputBox('Сколько печатать ?', 'количество','1'));
      if i<1 then exit;
       if i>100 then begin
                   dm.addmemo(messageunit.m35);
                 exit;
                end;
     temp:=InputBox('Вес товара ?', 'Вес в килограммах.','1');
     while pos('.',temp)>0 do temp:=StuffString(temp,pos('.',temp),1,',');
     quantity:=strtofloat(temp);
     if quantity<0.05 then
                begin
                  dm.addmemo('имеет смысл печатать меньше 50 грамм ?');
                  exit;
                end;
   if quantity>99.999 then
                      begin
                      dm.addmemo('вес в килограммах.Не больше 99.999');
                      exit;
                      end;


   kod:='21';
   case length(dm.tovarPLU.AsString) of
      1:kod:=kod+'0000'+dm.tovarPLU.AsString;
      2:kod:=kod+'000'+dm.tovarPLU.AsString;
      3:kod:=kod+'00'+dm.tovarPLU.AsString;
      4:kod:=kod+'0'+dm.tovarPLU.AsString;
      5:kod:=kod+dm.tovarPLU.AsString;
     else  exit;

    end;
    temp:=floattostr(quantity*1000);
     case length(temp) of
      1:temp:='0000'+temp;
      2:temp:='000'+temp;
      3:temp:='00'+temp;
      4:temp:='0'+temp;
      5:;
     else  exit;

    end;



    if length(kod)=7 then kod:=kod+temp;

   temp:=barcodeunit.CalcBar(kod);
   if temp='error' then exit;

     try
     qprint.SetVariable('plu',dm.tovarplu.AsInteger);
     qprint.SetVariable('kolvo',i);
    // qwesprint.SetVariable('barcode',temp);
     Qprint.Execute;

     qwesprint.SetVariable('plu',dm.tovarplu.AsInteger);
     qwesprint.SetVariable('barcode',temp);
     Qwesprint.Execute;
      
     dm.OraBase.Commit;
     except
      dm.OraBase.Rollback;
      raise;
     end;


end;

procedure TViewForm.N3Click(Sender: TObject);
var CenForm:TCenForm;
    table:TCenArray;
    i,j,oi,k,kol_vo:integer;


procedure  fill(const j:integer);
 begin
  table[0,j]:=dm.tovarNAME.AsString;
  table[1,j]:=floattostr(int(dm.TovarPRICE.AsCurrency))+'-'+copy(formatfloat('0.00',frac(dm.TovarPRICE.AsCurrency)),3,2);
  table[2,j]:=dm.tovarED_IZM.AsString;
  table[3,j]:=dm.barcodeBARCODE.AsString;
  table[4,j]:='';
  table[5,j]:='';
  table[6,j]:='';
  table[7,j]:='';
 end;


begin


  i:=0;
   if wesbox.Checked  then
     begin
       for j:=1 to Tdatasource(dbgrid.DataSource).DataSet.RecordCount do
        if inscennik[j]<>0 then inc(i);
          If i=0  then exit;
       end;
  CenForm:=TCenForm.Create(kartform);

  try
  i:=0;
  dm.nofilter;
  Tdatasource(dbgrid.DataSource).DataSet.First;
   for j:=0 to Tdatasource(dbgrid.DataSource).DataSet.RecordCount-1 do
   begin
   if dm.LocateTovar(integer(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['plu'])) then
     begin
     if (dm.tovarSHTUKA.AsInteger=1) or (length(dm.barcodeBARCODE.Value)<>13)
         then
            begin
              Tdatasource(dbgrid.DataSource).DataSet.Next;
              continue;
            end;
      if wesbox.Checked then
        begin
           if inscennik[j+1]=0 then
             begin
                Tdatasource(dbgrid.DataSource).DataSet.Next;
                continue;
             end;
        end;
     oi:=i+1;
     try
      kol_vo:= Tdatasource(dbgrid.DataSource).DataSet.FieldValues['kol_vo'];
       if kol_vo>3 then kol_vo:=kol_vo-trunc(int(kol_vo/4));
     i:=i+kol_vo;

     except
      dm.addmemo('неправильное значение количества');
     end;
     for k := Low(table) to High(table) do   SetLength(table[k], i);
     for k:=oi to i do
          begin
            fill(k-1);

          end;
    end;
    Tdatasource(dbgrid.DataSource).DataSet.Next;

   end;


cenform.Showreport(3,dmunit.repedit,table);


  finally
  CenForm.close;
  end;



end;
//-------------------------------------------------------------
procedure TViewForm.BitBtn6Click(Sender: TObject);
var temp :boolean;
begin
temp:=dm.tovar.ReadOnly;
if MessageDlg('Изменить поставщика в карточке ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then
        begin


          try

            dm.nofilter;
            dm.tovar.ReadOnly:=false;
            Tdatasource(dbgrid.DataSource).DataSet.First;
            QgetOld.Open;
            if not dm.Qpostav.Locate('cod',QgetOld.FieldValues['ppost'],[])
            then exit;
          while not  Tdatasource(dbgrid.DataSource).DataSet.Eof
          do begin

              if DM.LocateTovar(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['plu'])
              then
                 begin
                  dm.tovar.Edit;
                  dm.tovarPOST.Value:=integer(QgetOld.FieldValues['ppost']);
                  dm.tovar.Post;
                 end;
                Tdatasource(dbgrid.DataSource).DataSet.Next;
              end;
          dm.commit;
          dm.tovar.ReadOnly:=temp;
          except

          dm.rollback;
          dm.tovar.Cancel;
          dm.tovar.ReadOnly:=temp;
          exit;
          end;
        end;
end;
//-------------------------------------------------------------
procedure TViewForm.ClientDSBeforePost(DataSet: TDataSet);
begin
//
//clientds.FieldValues['total']:=clientds.FieldValues['kol_vo']*
//clientds.FieldValues['cenasnds'];
ok.Enabled:=true;
nakledit:=true;
end;
//-------------------------------------------------------------
procedure TViewForm.FormCreate(Sender: TObject);
begin
nakledit:=false;
rekvedit:=false;
ppost:=0;
end;
//-------------------------------------------------------------
 function TViewForm.updateprice:boolean;
  var oldprice:currency;
   function UpdateRashod(const nom,plu:integer;oldcena:currency):boolean;
     begin
       result:=false;
       try
       QSelDoc.Close;
       QSelDoc.SetVariable('nom',nom);
       QSelDoc.SetVariable('plu',plu);
       QSelDoc.Open;
        while not QSelDoc.Eof
         do begin
            with UpRashod do
               begin
                  SetVariable('nom',QSelDoc.FieldValues['nom']);
                  SetVariable('plu',plu);
                  SetVariable('cenasnds',oldcena);
                  execute;
                end;
              QSelDoc.Next;
            end;
      qseldoc.Close;
      result:=true;
      except
        abort;
      end;
     end;
begin
result:=false;
if MessageDlg('Изменить цены в накладной ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then
        begin
          try
           if clientds.State<>dsbrowse then ClientDS.Post;
            clientds.First;
            while not ClientDS.Eof do
             begin
                 oldQuery.SetVariable('nom',TViewForm(self).nom);
                 oldQuery.SetVariable('id',ClientDS.FieldValues['id']);
                 oldQuery.Execute;
                oldprice:=ClientDS.FieldValues['cenasnds'];
                 while not oldQuery.Eof do
                    begin
                    oldprice:=oldQuery.Field('cena');
                    oldQuery.Next;
                    end;
                oldprice:=(ClientDS.FieldValues['cenasnds']-oldprice)*
                            ClientDS.FieldValues['kol_vo'];

                 with UpPrihod do
               begin
                  SetVariable('nom',TViewForm(self).nom);
                  SetVariable('id',ClientDS.FieldValues['id']);
                  SetVariable('cenabnds',ClientDS.FieldValues['cenabnds']);
                  SetVariable('cenasnds',ClientDS.FieldValues['cenasnds']);
                  SetVariable('total',ClientDS.FieldValues['total']);
                  execute;
                end;


                    with UpKniga do
                    begin
                    SetVariable('nom',TViewForm(self).nom);
                    SetVariable('plu',ClientDS.FieldValues['plu']);
                    SetVariable('cenasnds',ClientDS.FieldValues['cenasnds']);
                    execute;
                    end;
               if not UpdateRashod(TViewForm(self).nom,
                                   ClientDS.FieldValues['plu'],
                                                   oldprice)
                                    then abort;
               ClientDS.Next;
             end;//while
            upJurnal.SetVariable('nom',TViewForm(self).nom);
            upJurnal.Execute;
           dm.commit;
           dm.addmemo('сохранено');
           result:=true;
          except
          dm.rollback;
          dm.addmemo('ошибка в проводке');
          end;
        end;
end;
//-------------------------------------------------------------

procedure TViewForm.okClick(Sender: TObject);
begin
IF nakledit
   then
    begin
    nakledit:= not updateprice;
    ok.Enabled:=not nakledit;
   end;
IF rekvedit
   then
    begin
    rekvedit:= not updaterekv;
    ok.Enabled:=not rekvedit;
   end;
 end;
//-----------------------------------------------------------------
procedure TViewForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if  (nakledit) or (rekvedit)
   then ok.Click;
   CanClose:=true;
end;

procedure TViewForm.dbgridKeyPress(Sender: TObject; var Key: Char);
var nds:integer;
begin
 if (ord(key)=13)  then

 begin
   if ClientDS.State in [dsInsert,dsEdit]  then
    begin
       if (ClientDS.FieldValues['plu']<>'0') and
    (dm.LocateTovar(ClientDS.FieldValues['plu'])) then
    nds:=dm.tovarNDS.AsInteger else nds:=0;
      If (dbgrid.SelectedField.FieldName='CENABNDS') then
    begin
      if ClientDS.FieldValues['CENABNDS']<>null then
       begin
            case nds of
            0: ClientDS.FieldValues['CENASNDS']:=ClientDS.FieldValues['CENABNDS'];
            10: ClientDS.FieldValues['CENASNDS']:=roundto(ClientDS.FieldValues['CENABNDS']*1.1,-2);
            else ClientDS.FieldValues['CENASNDS']:=roundto(ClientDS.FieldValues['CENABNDS']*(1+(nds/100)),-2);
            end;
            clientds.FieldValues['total']:=clientds.FieldValues['kol_vo']*
                                        clientds.FieldValues['cenasnds'];
              exit;

        end;

       end;//if
         If (dbgrid.SelectedField.FieldName='CENASNDS')  then
          begin
           if ClientDS.FieldValues['CENASNDS']<>null then
           begin
             case nds of
             0:ClientDS.FieldValues['CENABNDS']:=ClientDS.FieldValues['CENASNDS'];
             10:ClientDS.FieldValues['CENABNDS']:=roundto(ClientDS.FieldValues['CENASNDS']/1.1,-2);
             else ClientDS.FieldValues['CENABNDS']:=roundto(ClientDS.FieldValues['CENASNDS']/(1+(nds/100)),-2);
             end;
              clientds.FieldValues['total']:=clientds.FieldValues['kol_vo']*
                                        clientds.FieldValues['cenasnds'];
               exit;

           end;
          END;

             If (dbgrid.SelectedField.FieldName='TOTAL') then
              begin
               if clientds.FieldValues['total']<>null then
                   begin
                  if  (clientds.FieldValues['kol_vo']>0) and
                           (clientds.FieldValues['total']>0)
                       then ClientDS.FieldValues['CENASNDS']:=roundto(clientds.FieldValues['total']/clientds.FieldValues['kol_vo'],-2);
              case nds of
                  0:ClientDS.FieldValues['CENABNDS']:=ClientDS.FieldValues['CENASNDS'];
                 10:ClientDS.FieldValues['CENABNDS']:=roundto(ClientDS.FieldValues['CENASNDS']/1.1,-2);
                else ClientDS.FieldValues['CENABNDS']:=roundto(ClientDS.FieldValues['CENASNDS']/(1+(nds/100)),-2);
               end;

                end;
            end;




    end;//if
 end;//if
end;

procedure TViewForm.SpeedButton2Click(Sender: TObject);
var temp:integer;
begin
 If not assigned(postsprav)  then
  begin
    postsprav:=Tpostsprav.Create(tform(self),tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Поставщики';
            temp:=postsprav.ShowModal-100;
   tform(self).OnActivate(self);
    if temp>0 then
    begin
     ppost:=temp;
     ppostname.Text:=dmunit.postname;
     rekvedit:=true;
     ok.Enabled:=true;
   //  dmunit.post:=temp;
     end;

 end;
end;

procedure TViewForm.numberedKeyPress(Sender: TObject; var Key: Char);
begin
 rekvedit:=true;
 ok.Enabled:=true;
end;
//-------------------------------------------------------------------
 function TViewForm.updaterekv:boolean;
  begin
   result:=false;
      if MessageDlg('Изменить реквизиты ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then
        begin
            if trim(numbered.Text)='' then
              begin
                dm.addmemo('номер накладной не указан.');
                exit;
              end;
    try
     dm.ExecuteSQL('update tmp.tprihnakl set nn='+numbered.Text+' where nom='+inttostr(nom));
     dm.ExecuteSQL('update tmp.tprihj set nn='+numbered.Text+' where nom='+inttostr(nom));
     if ppost<>0 then
        dm.ExecuteSQL('update tmp.tprihj set ppost='+inttostr(ppost)+' where nom='+inttostr(nom));
     dm.ExecuteSQL('update tmp.tprihj set prim='+chr(39)+osnedit.Text+chr(39)+' where nom='+inttostr(nom));



    dm.commit;
    result:=true;
    except
    dm.addmemo('ошибка записи реквизитов');
    dm.rollback;
    end;

 end;//if
 end;
//------------------------------------------------------------------
end.
