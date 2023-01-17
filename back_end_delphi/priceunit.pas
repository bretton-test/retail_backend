unit priceunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DBCtrlsEh, StdCtrls, Mask, ExtCtrls, Grids, DBGridEh,db,
  Menus,sunit, OracleData;

type
  Tpriceform = class(TSForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Labelread: TLabel;
    numbedit: TDBNumberEditEh;
    dataed: TDBDateTimeEditEh;
    primed: TDBEditEh;
    Panel2: TPanel;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    DBGrid: TDBGridEh;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    prbut: TBitBtn;
    selsklad: TOracleDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridColumns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure DBGridColumns2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure printCennik(const tip:byte);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
  
    procedure prbutClick(Sender: TObject);
  private
  procedure  showtovar;
    { Private declarations }
  public
  procedure  Setnom(const nom:integer;const data:TdateTime);

    { Public declarations }
  end;

var
  priceform: Tpriceform;
  insert:boolean=false;
  pnew:boolean=true;
  reg:boolean=true;
implementation

uses dmunit, kartunit, tranzUnit, messageunit, Cennik, about;

{$R *.dfm}

procedure  TPriceform.showtovar;
 begin
 If not reg  then
 begin
  if not assigned(KartForm) then   KartForm:=TKartForm.Create(tform(self),tsform(self).mybar);
         KartForm.Show;
         //DM.openkatalog;
         dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger;
         dm.tovargetmark;
         dm.invedit(Tdataset(dbgrid.DataSource.DataSet));
 end;
end;
//------------------------------------------------------------------------
procedure  TPriceform.Setnom(const nom:integer;const data:TdateTime);
 var DS:Tdatasource;
     temp:byte;
  begin
   temp:=0;
   dataed.Value:=data;
   numbedit.Value:=nom;
   dmunit.datadok:=data;//date+StrtoTime('23:59');
   primed.DataSource:=nil;
   ds:=dm.OpenPereozenka(nom);
  If ds<>nil  then
        begin
          pnew:=false;
          case  ds.DataSet.FieldValues['reg'] of
          0: reg:=false;
          1: reg:=true;
          end;
          if  not reg then dm.UserRights(nom,temp);
           if temp=1 then reg:=true;

          numbedit.DataSource:=DS;
          numbedit.DataField:='nom';
          dataed.DataSource:=ds;
          dataed.DataField:='data';
          dataed.ReadOnly:=true;
          dmunit.datadok:=ds.DataSet.FieldValues['data'];

          primed.DataSource:=ds;
          primed.DataField:='komment';
        end else reg:=false;

        labelread.Visible:=reg;
        dbgrid.ReadOnly:=reg;
 end;
//-------------------------------------------------------------------

procedure Tpriceform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.Qprice.Close;

Action:=caFree;
end;

procedure Tpriceform.FormDestroy(Sender: TObject);
begin
Priceform:=nil;
end;

procedure Tpriceform.DBGridColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
showtovar;
end;

procedure Tpriceform.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
 if (dbgrid.Col=1) and (ord(key)=13) then   showtovar;
end;

procedure Tpriceform.cancelClick(Sender: TObject);
begin
dm.rollback;
priceform.Close;
end;

procedure Tpriceform.okClick(Sender: TObject);
//var ds:Tdatasource;
begin
if not reg  then
if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
              If primed.Text=''  then primed.Text:='-';
                 dbgrid.SumList.RecalcAll;
                dm.safePereozenka(primed.Text,dbgrid.SumList.SumCollection.Items[0].sumvalue);
                if MessageDlg(messageunit.m19,
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 begin
                    //ds:=dbgrid.DataSource;
                    //dbgrid.DataSource:=nil;
                 try
                    tranzunit.regprice(dmunit.pricenom);
                   reg:=true;
                  except
                   raise;
                  end;

                    //dbgrid.DataSource:=ds;
                 end;

             end else dm.rollback;

      //  Priceform.Close;

end;

procedure Tpriceform.DBGridColumns2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var xPoint:TPoint;
   begin
 GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
 xPoint:= Point(-1, TWinControl(Sender).Height);

 with TWinControl(Sender).ClientToScreen(xPoint)  do
If not reg  then  dm.editnewprice(X,y);


end;

procedure Tpriceform.Printcennik(const tip:byte);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j:integer;
    org,podr:string;
   // rec1,rec2:Pstr;
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
//new(rec1);
//new(rec2);
  try
   dm.nofilter;
   org:='';
   podr:='';
   If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);
  // else begin org:=rec1^;podr:=rec2^;end;

   selsklad.Close;
   selsklad.Open;
   if  dm.qsklad.Locate('skladid',selsklad.FieldValues['sklad'],[]) then org:=dm.qskladNAME.Value;
   selsklad.Close;
   cenform.setRecvizit(org,podr);

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
 cenform.Showreport(tip,dmunit.repedit,table);


  finally
  CenForm.close;
  //dispose(rec1);
 // dispose(rec2);
  end;


end;

procedure Tpriceform.BitBtn2Click(Sender: TObject);
begin
        if Tdatasource(dbgrid.DataSource).DataSet.RecordCount=0 then exit;
        dm.nofilter;

 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(tform(self),tsform(self).mybar);
        //DM.openkatalog;
        end;
        dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['plu'];
        dm.tovargetmark;
        KartForm.Show;


end;

procedure Tpriceform.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if  not reg then
 begin
 if  Tdatasource(dbgrid.DataSource).DataSet.FieldByName('oldprice').AsCurrency
     > Tdatasource(dbgrid.DataSource).DataSet.FieldByName('Newprice').AsCurrency
     then TDBGridEh(Sender).Canvas.Brush.Color:=$00e0FFe0;

 if  Tdatasource(dbgrid.DataSource).DataSet.FieldByName('oldprice').AsCurrency
     < Tdatasource(dbgrid.DataSource).DataSet.FieldByName('Newprice').AsCurrency
     then TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF;
end;



IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure Tpriceform.SpeedButton1Click(Sender: TObject);
begin
printcennik(1);

end;



procedure Tpriceform.prbutClick(Sender: TObject);
begin
 
   selsklad.Close;
   selsklad.Open;
    dm.qsklad.Locate('skladid',selsklad.FieldValues['sklad'],[]) ;
   selsklad.Close;

if reg then AboutBox.printPereozenka(numbedit.Value);

end;

end.
