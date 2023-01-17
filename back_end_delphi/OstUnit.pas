unit OstUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls,db,FiltrUnit, StdCtrls,main, Mask,
  DBCtrlsEh, Buttons, Oracle, sunit;

type
  TOstForm = class(TsForm)
    Panel1: TPanel;
    DBGrid: TDBGridEh;
    Panel2: TPanel;
    filtrCombo: TDBComboBoxEh;
    Edit1: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    partq: TOracleQuery;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NoSellClick(Sender: TObject);
    procedure ShortviewClick(Sender: TObject);
    procedure filtrComboChange(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Filtr:TFiltrform;
    name:variant;
    isclose:boolean;
    procedure setEmpty;
  public
    { Public declarations }
  end;

var
  OstForm: TOstForm;
   b,e:TdateTime;
   sklad:integer;
   implementation

uses dmunit, MovUnit, kartunit, about;

{$R *.dfm}

procedure TOstForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Tdatasource(dbgrid.DataSource).DataSet.Close;
dm.QsumOst.Close;
dm.qaltost.SQL.Strings[29]:='t.name';
Filtr.Close;

isclose:=true;
Action:=caFree;
end;

procedure TOstForm.FormDestroy(Sender: TObject);
begin
if not isclose then
begin
Tdatasource(dbgrid.DataSource).DataSet.Close;
dm.QsumOst.Close;
dm.qaltost.SQL.Strings[29]:='t.name';
Filtr.Close;



end;
OstForm:=nil;
end;

procedure TOstForm.DBGridDblClick(Sender: TObject);
begin
case dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger) of
   1:  dm.openprihod(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,1,0,Tdatasource(dbgrid.DataSource).DataSet.Fields[2].AsInteger);
   2:  dm.openrashod(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,1,Tdatasource(dbgrid.DataSource).DataSet.Fields[2].AsInteger);
   3: dm.openperem(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,1);
   7: dm.spisanief(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,2);
   8: dm.spisanief(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,3);
   12: main.MainForm.OpenKKmreport(Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger,Tdatasource(dbgrid.DataSource).DataSet.Fields[2].AsInteger);

  end;
end;

procedure TOstForm.DBGridGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
{If  TDBGridEh(Sender).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4
    else
     Background := $00FFDDDD;

   }

end;

procedure TOstForm.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
{If Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger=0  then
  begin
     TDBGridEh(Sender).Canvas.Brush.Color:= clYellow;
  end;
 If (Tdatasource(dbgrid.DataSource).DataSet.Fields[4].AsDateTime=dmunit.pbegin)

 and ( Column.Index in [1,2,3] ) then
       TDBGridEh(Sender).Canvas.Font.Color:=clYellow;   }
 if dm.qaltostKLIENT.AsString='-' then
  begin
   if FiltrCombo.ItemIndex in [1,2,3,4,5] then
    begin
        if  Column.Index in [1,2,3,4] then
           TDBGridEh(Sender).Canvas.Font.Color:=clWindow;
         TDBGridEh(Sender).Canvas.Brush.Color:= clWindow;


   end else
   begin
   TDBGridEh(Sender).Canvas.Brush.Color:= clYellow;
   if  Column.Index in [1,2,3] then
                  TDBGridEh(Sender).Canvas.Font.Color:=clYellow;
   end;
  end else if dm.qaltostPRIHOD.Value>0 then
                TDBGridEh(Sender).Canvas.Brush.Color:= clAqua;




 IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);

 end;

procedure TOstForm.FormActivate(Sender: TObject);
begin
label2.Caption:=dm.QsumOstSUM.AsString+' руб.';

end;

procedure TOstForm.FormCreate(Sender: TObject);
begin

tform(self).Top:=0;
tform(self).left:=0;
Tform(sender).Width:=MainForm.ClientWidth-25;
Tform(sender).Height:=mainform.ClientHeight-55;

filtr:=TFiltrform.Create(OstForm);
Filtr.SetKoords(panel2);
name:='';
isclose:=false;
end;

procedure TOstForm.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(key)>31 then

 Tdatasource(dbgrid.DataSource).DataSet.Locate('name',(Filtr.PutChar(Key)),[loCaseInsensitive, loPartialKey]) ;

end;

procedure TOstForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If key=13   then     TDBGridEh(sender).OnDblClick(self);
end;

procedure TOstForm.NoSellClick(Sender: TObject);
//var name:variant;
begin

 dm.qaltost.Filter:='(klient='+chr(39)+'-'+chr(39)+') and (rashod=0)';
 dm.qaltost.Filtered:=true;;
 name:=dm.qaltostNAME.Value;
end;

procedure TOstForm.ShortviewClick(Sender: TObject);
var name:variant;
begin
 name:=dm.qaltostNAME.Value;
 dm.qaltost.Filter:='klient='+chr(39)+'-'+chr(39);
 dm.qaltost.Filtered:=True;
 dm.qaltost.Locate('name',name,[]);

end;
 procedure TOstForm.setEmpty;
 begin
  name:=dm.qaltostNAME.Value;
  dm.qaltost.Filter:='(ostatok<=1) and (klient='+chr(39)+'-'+chr(39)+')';
  dm.qaltost.Filtered:=True;
  dm.qaltost.Locate('name',name,[]);
 end;

procedure TOstForm.filtrComboChange(Sender: TObject);
var i:byte;
begin
case filtrCombo.ItemIndex of
1:ostform.ShortviewClick(nil);
2:ostform.NoSellClick(nil);
3:setEmpty;
4:edit1.SetFocus;
5:begin
 dm.qaltost.Filter:='(klient='+chr(39)+'-'+chr(39)+') and ((rashod<>0) or (prihod<>0))';
 dm.qaltost.Filtered:=True;

 end;

else  begin

        if dm.qaltost.SQL.Strings[29]<>'t.name'
        then begin
        for i:=0 to 9 do dbgrid.Columns.Items[i].Title.Color:=clBtnFace;
         dm.setperiod(DateToStr(b),DateToStr(e),sklad);
         dm.qaltost.Close;
         dm.qaltost.SQL.Strings[29]:='t.name';
         dm.qaltost.Open;
        dm.setperiod(DateToStr(dmunit.pbegin),DateToStr(dmunit.pend),sklad);
        end;
        name:=dm.qaltostNAME.Value;
        dm.qaltost.Filtered:=false;
        dm.qaltost.Locate('name',name,[]);
      end;

end;


dbgrid.SumList.Active:=dm.qaltost.Filtered;

end;

procedure TOstForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
begin
 dm.qaltost.Filter:='(klient='+chr(39)+'-'+chr(39)+') and (name='+chr(39)+edit1.Text+'*'+chr(39)+')'+
 'and ((rashod<>0) or (prihod<>0))';
 dm.qaltost.Filtered:=True;
 filtrCombo.ItemIndex:=4;
 end;
end;

procedure TOstForm.BitBtn1Click(Sender: TObject);
var Child:TMovForm;
begin
if (dm.qaltostPRIHOD.AsFloat>0) and (dm.qaltostNOM.AsInteger<>0)
then
    begin
    dm.ExecuteSQL('update tmp.toptions set value='+dm.qaltostPLU.AsString+  'where parametr='+chr(39)+'plu'+chr(39));
    partq.SetVariable('plu',dm.qaltostPLU.AsInteger);
    partq.SetVariable('nom',dm.qaltostnom.AsInteger);
    partq.Execute;
    dm.OraBase.Commit;
    child:=tmovform.Create(ostform,tsform(self).mybar);
    child.Caption:=dm.qaltostNAME.AsString;
    child.Show;


    end;
end;
procedure TOstForm.BitBtn2Click(Sender: TObject);
begin
 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(ostform,tsform(self).mybar);

         //DM.openkatalog;

        end ;

          KartForm.Show;


 if dm.qaltostPLU.AsString<>'' then
  begin
  dm.nofilter;
 dm.LocateTovar(dm.qaltostPLU.AsInteger) ;// dm.tovar.Locate('plu',dm.qaltostPLU.AsInteger,[]);
 end;

 end;

procedure TOstForm.BitBtn3Click(Sender: TObject);
var temp:Tdatasource;
begin
{Printdb.PageHeader.CenterText.Text:=ostform.Caption;
if  filtrCombo.ItemIndex in [1..5] then
Printdb.PageHeader.LeftText.Text:='Фильтр: '+ filtrCombo.Items.Strings[filtrCombo.ItemIndex];
PrintDb.Preview;}
about.temp:=ostform.Caption;
 if  filtrCombo.ItemIndex in [1..5] then
about.temp:=about.temp+' Фильтр: '+ filtrCombo.Items.Strings[filtrCombo.ItemIndex];
temp:=dbgrid.DataSource;
dbgrid.DataSource:=nil;
aboutbox.setreport(dm.qaltost,nil,nil,nil,'\reports\table.frf');
dbgrid.DataSource:=temp;




end;

procedure TOstForm.DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
 var plu:variant;
    i:byte;

  begin
//
//dm.addmemo(dm.qaltost.SQL.Strings[29]);
for i:=0 to 9 do dbgrid.Columns.Items[i].Title.Color:=clBtnFace;
dbgrid.Columns.Items[acol].Title.Color:=clTeal;
plu:=dm.qaltostPLU.Value;
case Acol of
0: begin
   dm.setperiod(DateToStr(b),DateToStr(e),sklad);
   dm.qaltost.Close;
   dm.qaltost.SQL.Strings[29]:='t.name';
   dm.qaltost.Open;
   end;
5: begin
   dm.setperiod(DateToStr(b),DateToStr(e),sklad);
   dm.qaltost.Close;
   dm.qaltost.SQL.Strings[29]:='prihod';
   dm.qaltost.Open;
   end;
6: begin
   dm.setperiod(DateToStr(b),DateToStr(e),sklad);
   dm.qaltost.Close;
   dm.qaltost.SQL.Strings[29]:='rashod';
   dm.qaltost.Open;
   end;
7: begin
   dm.setperiod(DateToStr(b),DateToStr(e),sklad);
   dm.qaltost.Close;
   dm.qaltost.SQL.Strings[29]:='ostatok';
   dm.qaltost.Open;
   end;
8: begin
   dm.setperiod(DateToStr(b),DateToStr(e),sklad);
   dm.qaltost.Close;
   dm.qaltost.SQL.Strings[29]:='sum_prihod';
   dm.qaltost.Open;
   end;
9: begin
   dm.setperiod(DateToStr(b),DateToStr(e),sklad);
   dm.qaltost.Close;
   dm.qaltost.SQL.Strings[29]:='sum_rashod';
   dm.qaltost.Open;
   end;



end;
dm.qaltost.Locate('plu',plu,[]);
dm.setperiod(DateToStr(dmunit.pbegin),DateToStr(dmunit.pend),sklad);
if (acol in [0,5,6,7,8,9]) and (not dm.qaltost.Filtered) then  filtrcombo.ItemIndex:=1;
end;

procedure TOstForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=' ' then key:='*';
end;

end.
