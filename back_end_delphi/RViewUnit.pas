unit RViewUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,main, DB, OracleData, DBClient, Grids, DBGridEh, Mask, DBCtrlsEh,
  DBLookupEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, Provider, Menus,sunit;

type
  TrViewForm = class(TsForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Labelread: TLabel;
    numbered: TEdit;
    datanakl: TDateTimePicker;
    sklad: TDBLookupComboboxEh;
    osnedit: TEdit;
    postname: TEdit;
    Panel2: TPanel;
    cancel: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    provlabel: TLabel;
    DBGrid: TDBGridEh;
    DataSource1: TDataSource;
    ClientDS: TClientDataSet;
    QgetOld: TOracleDataSet;
    Qnakl: TOracleDataSet;
    QnaklNN: TIntegerField;
    QnaklPOST: TIntegerField;
    QnaklPOKUP: TIntegerField;
    QnaklDATA: TDateTimeField;
    QnaklNAME: TStringField;
    QnaklED_IZM: TStringField;
    QnaklMEST: TIntegerField;
    QnaklKOL_UP: TFloatField;
    QnaklROSSIP: TFloatField;
    QnaklKOL_VO: TFloatField;
    QnaklCENABNDS: TFloatField;
    QnaklCENASNDS: TFloatField;
    QnaklTOTAL: TFloatField;
    QnaklSKLADID: TIntegerField;
    QnaklPLU: TFloatField;
    QnaklID: TFloatField;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    N121: TMenuItem;
    N1161: TMenuItem;
    N131: TMenuItem;
    N122: TMenuItem;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    wesbox: TCheckBox;
    N123: TMenuItem;
    N124: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure cancelClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N1161Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N131Click(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  
    procedure wesboxClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure N123Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
  private
    { Private declarations }
    nom:integer;
    reg:byte;
    inscennik: array of integer;
    procedure Printcennik(const tip:byte);

  public
    { Public declarations }
   procedure ReLoad;
   procedure LoadData(const nom:integer;const plu:integer;const reg:byte);
  end;

var
  rViewForm: TrViewForm;

implementation

uses dmunit, kartunit, about, Cennik, messageunit;

{$R *.dfm}

procedure TrViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

action:=caFree;
end;

procedure TRviewForm.LoadData(const nom:integer;const plu:integer;const reg:byte);
var  TempProvider:TDataSetProvider;
begin
  TRviewForm(self).reg:=reg;
  TRviewForm(self).nom:=nom;
  Qnakl.SetVariable('nom',nom);
  Qnakl.Open;
  qgetOld.SetVariable('nom',nom);
  qgetOld.Open;
  if QgetOld.RecordCount>0 then
    begin
       datanakl.Date:=QgetOld.FieldValues['data'];
        numbered.Text:=QgetOld.FieldValues['nn'];
        postname.Text:=QgetOld.FieldValues['pok_name'];
        sklad.KeyValue:=QgetOld.FieldValues['skladid'];
        osnedit.Text:=QgetOld.FieldValues['osn'];
        osnedit.ReadOnly:=true;
        Label7.Caption:='Автор: '+ QgetOld.FieldValues['owner'];
         datanakl.Enabled:=false;
        numbered.ReadOnly:=true;
        postname.ReadOnly:=true;
        sklad.ReadOnly:=true;
        Labelread.Visible:=true;
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




procedure TrViewForm.DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
case Acol of
0:if Qnakl.SQL.Strings[23]<>'order by n.name' then Qnakl.SQL.Strings[23]:='order by n.name' else exit;
4:if Qnakl.SQL.Strings[23]<>'order by n.rossip desc' then Qnakl.SQL.Strings[23]:='order by n.rossip desc' else exit;
5:if Qnakl.SQL.Strings[23]<>'order by n.kol_vo desc' then Qnakl.SQL.Strings[23]:='order by n.kol_vo desc' else exit;

else exit;
end;

reload;
end;


procedure TrViewForm.ReLoad;
var  TempProvider:TDataSetProvider;
     plu:integer;
begin
  plu:=ClientDS.FieldValues['plu'];
  ClientDs.Close;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=Qnakl;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
  ClientDS.Open;
  ClientDS.Locate('plu',plu,[]);
  Qnakl.Close;


end;

procedure TrViewForm.cancelClick(Sender: TObject);
begin
TrViewForm(self).Close;
end;

procedure TrViewForm.SpeedButton2Click(Sender: TObject);
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

procedure TrViewForm.N121Click(Sender: TObject);
begin
aboutbox.printrashod(nom);
end;

procedure TrViewForm.N1161Click(Sender: TObject);
begin
if reg=1 then  aboutbox.print116(nom)
                else  aboutbox.print116_1(nom);
end;

procedure TrViewForm.SpeedButton3Click(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  PopupMenu1.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do PopupMenu1.Popup(x,y);

end;

procedure TrViewForm.N131Click(Sender: TObject);
begin
aboutbox.printTorg12v(nom,13);
end;

procedure TrViewForm.N122Click(Sender: TObject);
begin
AboutBox.printtorg12v(nom,12);
end;

 {-----------------------------------------------------------}

  procedure TrViewForm.Printcennik(const tip:byte);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j,skl:integer;
    org,podr:string;

procedure  fill(const j:integer);
 begin
  table[0,j]:=dm.tovarplu.AsString;
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

    skl:=sklad.KeyValue; //dm.QnakltempSKLADID.Value;
  if  dm.qsklad.Locate('skladid',skl,[]) then org:=dm.qskladNAME.Value;


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

  end;
end;

  procedure TrViewForm.SpeedButton4Click(Sender: TObject);

  begin
printcennik(1);
end;



procedure TrViewForm.wesboxClick(Sender: TObject);
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

procedure TrViewForm.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

try

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

procedure TrViewForm.DBGridCellClick(Column: TColumnEh);
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

procedure TrViewForm.N123Click(Sender: TObject);
begin
aboutbox.rashodf.Close;
aboutbox.rashodf.SetVariable('nom',nom);
aboutbox.setreport(aboutbox.rashodf,nil,nil,nil,'\reports\frTorg-12_3.frf');
end;

procedure TrViewForm.N124Click(Sender: TObject);
begin
aboutbox.rashodf1.Close;
aboutbox.rashodf1.SetVariable('nom',nom);
aboutbox.setreport(aboutbox.rashodf1,nil,nil,nil,'\reports\frTorg-12_4.frf');

end;

end.
