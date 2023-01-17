unit ubunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,main, DB, OracleData, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Buttons,sunit;

type
  Tubform = class(TSForm)
    Qub: TOracleDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGrid: TDBGridEh;
    QubPLU: TFloatField;
    QubNAME: TStringField;
    QubNOMRASH: TFloatField;
    QubCENAZAK: TFloatField;
    QubCENAREAL: TFloatField;
    QubTO_CHARRDATADDMMYYYY: TStringField;
    QubNOM: TFloatField;
    QubPART: TFloatField;
    SpeedButton1: TSpeedButton;
    QubTO_DATETO_CHARPDATADDMM: TDateTimeField;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    wybor: TCheckBox;
    perButton: TSpeedButton;
    QubSHTUKA: TIntegerField;
    westovar: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure wyborClick(Sender: TObject);
    procedure perButtonClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure westovarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure SetTip(const tip:byte);
   procedure CreateMassiv;

  end;

var
  ubform: Tubform;
  inscennik: array [0..1] of array of integer;
implementation

uses dmunit, kartunit, MovUnit, priceunit, messageunit;

{$R *.dfm}

procedure Tubform.SetTip(const tip:byte);
 begin
   if tip=1 then begin
    tform(self).Caption:='Продажи в убыток';
   tform(self).OnActivate(tform(self));
   Qub.SQL.Strings[8]:='where cenazak-cenareal>0.02'
  end  else
  begin
   Qub.SQL.Strings[8]:='where cenareal-cenazak>0.02';
    tform(self).Caption:='Продажи c запасом';
   tform(self).OnActivate(tform(self));
  end;
    screen.Cursor:=crsqlwait;
    Qub.Open;
    Qub.Last;
    screen.Cursor:=crdefault;


 end;


 procedure Tubform.CreateMassiv;
  var n:integer;
begin
setlength(inscennik[0],qub.RecordCount+1);
 setlength(inscennik[1],qub.RecordCount+1);

 for n:=low(inscennik[0]) to high(inscennik[0]) do inscennik[0,n]:=0;
 for n:=low(inscennik[1]) to high(inscennik[1]) do inscennik[1,n]:=0;


dbgrid.Repaint;
end;



procedure Tubform.FormClose(Sender: TObject; var Action: TCloseAction);

begin
inscennik[0]:=nil;
inscennik[1]:=nil;

qub.Close;
//mainform.delform(tform(self));
Action:=caFree;
end;

procedure Tubform.FormDestroy(Sender: TObject);
begin
ubform:=nil;
end;

procedure Tubform.FormCreate(Sender: TObject);
 
begin

  tform(self).Top:=0;
  tform(self).left:=0;
  Tform(sender).Width:=MainForm.ClientWidth-25;
  Tform(sender).Height:=mainform.ClientHeight-55;
  //qub.Open;
  //qub.Last;

 
  end;

procedure Tubform.BitBtn1Click(Sender: TObject);
begin
if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(application,tsform(self).mybar);

         //DM.openkatalog;

        end ;
          dm.nofilter;
          KartForm.Show;
   dm.LocateTovar(qubplu.AsInteger);
  //dm.tovar.Locate('plu',qubplu.AsInteger,[]);

end;

procedure Tubform.BitBtn2Click(Sender: TObject);
begin
dm.openprihod(qubnom.AsInteger,1,0,qubplu.AsInteger);
end;

procedure Tubform.BitBtn3Click(Sender: TObject);
begin
dm.openrashod(qubnomrash.AsInteger,1,qubplu.AsInteger);
end;

procedure Tubform.SpeedButton1Click(Sender: TObject);
var Child:TMovForm;
begin
if Qubplu.Value<>0 then
begin
dm.ExecuteSQL('update tmp.toptions set value='+qubplu.AsString+  'where parametr='+chr(39)+'plu'+chr(39));
dm.ExecuteSQL('update tmp.toptions set value='+qubpart.asstring+  'where parametr='+chr(39)+'part'+chr(39));
dm.commit;
child:=tmovform.Create(self,tsform(self).mybar);
child.Caption:=qubname.asstring;
child.Show;

end;

end;

procedure Tubform.DBGridCellClick(Column: TColumnEh);
begin
if wybor.Checked then
begin
  if  inscennik[0,qub.RecNo]=0 then
  begin
  inscennik[0,qub.RecNo]:=qubplu.AsInteger;
  inscennik[1,qub.RecNo]:=qubnom.AsInteger
  end else  inscennik[0,qub.RecNo]:=0;
  dbgrid.Repaint;
end;
end;

procedure Tubform.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
if wybor.Checked then
begin
  if inscennik[0,qub.RecNo]<>0
        then     TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF
         else TDBGridEh(Sender).Canvas.Brush.Color:=clWindow;
end else   TDBGridEh(Sender).Canvas.Brush.Color:=clWindow;
IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);



end;

procedure Tubform.wyborClick(Sender: TObject);
var n:integer;
begin
perbutton.Enabled:=wybor.Checked;
  for n:=low(inscennik[0]) to high(inscennik[0]) do inscennik[0,n]:=0;
dbgrid.Repaint;
  end;

procedure Tubform.perButtonClick(Sender: TObject);
var nom,n:integer;
begin

  If (not assigned(Priceform) )
and (MessageDlg(messageunit.m23,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin


        Priceform:=tPriceform.Create(application,tsform(self).mybar);

        nom:=dm.newkod('PRIHSEQ');
        Priceform.Setnom(nom,now);
        Priceform.dataed.Value:=now ;
end;

        Priceform.Show;
        for n:=low(inscennik[0]) to high(inscennik[0]) do
        if inscennik[0,n]<>0 then dm.InsertPereozenka(inscennik[1,n],inscennik[0,n]);









end;

procedure Tubform.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid.OnCellClick(nil);
end;

procedure Tubform.westovarClick(Sender: TObject);

begin

if westovar.Checked then
begin
qub.Filter:='shtuka=0';
qub.Filtered:=true;


end else qub.Filtered:=false;
qub.Last;
end;

end.
