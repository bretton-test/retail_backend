unit rashunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh, ComCtrls, StdCtrls,
  Buttons, Grids, DBGridEh,db,main, Menus,sunit;

type
  Trashform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    numbered: TEdit;
    Label2: TLabel;
    datanakl: TDateTimePicker;
    Label4: TLabel;
    sklad: TDBLookupComboboxEh;
    Label3: TLabel;
    osnedit: TEdit;
    Label5: TLabel;
    postname: TEdit;
    SpeedButton1: TSpeedButton;
    Labelread: TLabel;
    DBGrid: TDBGridEh;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    BitBtn2: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N121: TMenuItem;
    N1161: TMenuItem;
    provlabel: TLabel;
    last: TCheckBox;
    N131: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure numberedChange(Sender: TObject);
    procedure datanaklChange(Sender: TObject);
    procedure skladChange(Sender: TObject);
    procedure DBGridColumns0EditButtons0Click(Sender: TObject;

      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure DBGridColumns6EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure PrintBClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N1161Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N131Click(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure N123Click(Sender: TObject);
    procedure DBGridColumns9EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure N124Click(Sender: TObject);
  private
    { Private declarations }
   //function getx(const main:Tform;sender:TDbgrideh;column:byte):integer;
   procedure Scan (Sender:Tobject;Barcode:string);
    procedure Printcennik(const tip:byte);
  public
    { Public declarations }
  procedure getold;
  procedure showtovar;

  end;

var
  rashform: Trashform;
  var post :integer=0;
  //loadrep:boolean=false;
implementation

uses dmunit, postunit, kartunit, tranzUnit, messageunit, about, Cennik,
  Math, CHEKUNIT;

{$R *.dfm}
 procedure Trashform.getold;
 begin
  if dmunit.postname<>'' then
 begin

 datanakl.Date:=dmunit.datadok;
 numbered.Text:=inttostr(dmunit.nomerdok);
 osnedit.Text:=string(dm.ExecuteSQL('select prim from tmp.trashj where nom='+inttostr(dmunit.nom)));
 postname.Text:=dmunit.postname;
 sklad.KeyValue:=dmunit.sklad;
 if dmunit.reg=1 then
  begin
  datanakl.Enabled:=false;
  numbered.ReadOnly:=true;
  postname.ReadOnly:=true;
  sklad.ReadOnly:=true;
  end;


 end else
        begin
         numbered.Text:=inttostr(RandomRange(100,9999));
         //FormatDateTime('ddmm',date);
         sklad.KeyValue:=1;

        end;
end;
//-----------------------------------------------------------------
procedure Trashform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if izmeneno then  ok.Click else
if (dmunit.reg=0) and (dmunit.tipdok=4) then begin
                       dm.setreg(0,dmunit.nom);
                       dm.commit;
                       dm.RefreshJournal;
                      end;


dmunit.post:=0;
dmunit.sklad:=0;
dmunit.nomerdok:=0;

Tdatasource(dbgrid.DataSource).DataSet.Close;
dm.Qnakltemp.SQL.Strings[47]:='order by n.id';
dm.Qnakltemp.AutoCalcFields:=true;
dm.delnakl;
Action:=caFree;
end;
//--------------------------------------------------------------------
procedure Trashform.FormDestroy(Sender: TObject);
begin
rashform:=nil;
end;
//---------------------------------------------------------------------
procedure Trashform.SpeedButton1Click(Sender: TObject);
var temp:integer;
begin
If dmunit.reg=0  then begin
  If not assigned(postsprav)  then begin
 postsprav:=Tpostsprav.Create(rashform,tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Покупатели';
      //postsprav.OnActivate(postsprav);

       temp:=postsprav.ShowModal-100;
      tform(self).OnActivate(self);
    if temp>0 then
    begin
     post:=temp;
     postname.Text:=dmunit.postname;
     dmunit.post:=post;
     end;
    dm.setedit;
     end;
    end;
end;

procedure Trashform.numberedChange(Sender: TObject);
begin
try
dmunit.nomerdok:=strtoint(Tedit(sender).Text);
dm.setedit;
except
 numbered.Text:='';
end;
end;

procedure Trashform.datanaklChange(Sender: TObject);
begin
dmunit.datadok:=TDateTimePicker(sender).DateTime;
if dm.Qnakltemp.State in [dsInsert,dsEdit] then dm.Qnakltemp.Post;
dm.Qnakltemp.Refresh;
end;

procedure Trashform.skladChange(Sender: TObject);
begin
dmunit.sklad:=sklad.KeyValue;
dm.setedit;
end;

procedure Trashform.DBGridColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
 showtovar;
end;
//------------------------------------------------------------------------
procedure Trashform.showtovar;
  begin
 If dm.setedit   then  begin
       if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(rashform,tsform(self).mybar);
         KartForm.Show;
         //DM.openkatalog;
         dm.findtovar;

         dm.seteditnakl;
        end else
          begin
          KartForm.Show;
          dm.findtovar;

         end;

  end;
end;

  //-------------------------------------------------------------------------

procedure Trashform.FormCreate(Sender: TObject);
begin
Tform(self).Left:=0;
Tform(self).top:=0;
Tform(self).Width:=MainForm.ClientWidth-25;
Tform(self).Height:=mainform.ClientHeight-55;
//datanakl.MinDate:=dmunit.pbegin;
//datanakl.MaxDate:=dmunit.pend;
datanakl.Date:=date;
datanakl.Time:=0;
dmunit.datadok:=now;

 Trashform(self).OnScanAction:=scan;
 end;

procedure Trashform.DBGridCellClick(Column: TColumnEh);
begin
case  dmunit.reg of
  1: labelread.Visible:=true;
  0: labelread.Visible:=false;

 end;
 

 end;

procedure Trashform.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
If (dm.est) and (dmunit.reg=0) then
 TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF else
 TDBGridEh(Sender).Canvas.Brush.Color:=clWindow;
  if column.FieldName='KOL_UP'
  then begin
   if dm.QnakltempKOL_UP.AsInteger=0
   then
       TDBGridEh(Sender).Canvas.Font.Color:=
          TDBGridEh(Sender).Canvas.Brush.Color;
   end;

IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure Trashform.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
 if (dm.setedit) and(dbgrid.Col=1) and (ord(key)=13) then
    begin showtovar

    end else If ord(key)=13  then  dm.tempPost;

end;

procedure Trashform.okClick(Sender: TObject);
begin
dm.commit;
If (dmunit.tipdok=3) and (dm.setedit)  then
if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin

          If dm.showtime then
          begin
                DM.insertrashod(osnedit.Text);

                        //dm.insertnakl(osnedit.Text);
             if MessageDlg(messageunit.m19,
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                   begin
                      ok.Enabled:=false;
                      cancel.Enabled:=false;
                      tranzunit.Rashod(dmunit.nom,provlabel,last.Checked);//dm.provodka;
                      ok.Enabled:=true;
                      cancel.Enabled:=true;
                   end;
                if dmunit.reg=1 then
                 begin
                  datanakl.Enabled:=false;
                  numbered.ReadOnly:=true;
                   postname.ReadOnly:=true;
                  sklad.ReadOnly:=true;
                  end;


          end;
        exit;
        end;
 if (dmunit.tipdok=4) and (dmunit.reg=0) then

if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      dmunit.tipdok:=4;
         dm.setreg(0,dmunit.nom);
         DM.insertrashod(osnedit.Text);
        if MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                              begin
                                 ok.Enabled:=false;
                                  cancel.Enabled:=false;
                                    tranzunit.Rashod(dmunit.nom,provlabel,last.Checked);//dm.provodka;
                                ok.Enabled:=true;
                                cancel.Enabled:=true;

                               end;
  end else izmeneno:=false;


end;

procedure Trashform.cancelClick(Sender: TObject);
begin
if izmeneno then  ok.Click else
if (dmunit.reg=0) and (dmunit.tipdok=4) then begin
                       dm.setreg(0,dmunit.nom);
                       dm.commit;
                       dm.RefreshJournal;
                      end;

 izmeneno:=false;
dm.rollback;
dm.delnakl;
dm.closetemp;
rashform.Close;
end;

procedure Trashform.DBGridColumns6EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var xPoint:TPoint;
   begin
 GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
 xPoint:= Point(-1, TWinControl(Sender).Height);

If dmunit.reg=0  then
  with TWinControl(Sender).ClientToScreen(xPoint)  do
  case dbgrid.Col of
    8:    dm.editnds1(x,y);
    9:    dm.editnds2(x,y);
      // 8: dm.editnds1(getx(rashform,dbgrid,6),rashform.Top+210+(dbgrid.Row*dbgrid.RowHeight));
  // 9: dm.editnds2(getx(rashform,dbgrid,7),rashform.Top+210+(dbgrid.Row*dbgrid.RowHeight));

   end;
end;
 //---------------------------------------------------------
{ function Trashform.getx(const main:Tform;sender:TDbgrideh;column:byte):integer;
  var i:byte;x:integer;
  begin
     x:=Tform(main).Left;
   for i:=0 to column do
       x:=x+Tdbgrideh(sender).Columns[i].Width;
       result:=x;
  end;         }





procedure Trashform.BitBtn1Click(Sender: TObject);

begin
printcennik(1);
end;

procedure Trashform.BitBtn2Click(Sender: TObject);
begin
Tdatasource(dbgrid.DataSource).DataSet.Refresh;
dbgrid.SumList.RecalcAll;
//dm.addmemo(dm.Qnakltemp.SQL.Strings[47]);
end;

procedure Trashform.DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
{case Acol of
0:if dm.Qnakltemp.SQL.Strings[47]<>'order by n.name' then dm.Qnakltemp.SQL.Strings[47]:='order by n.name' else exit;
5:if dm.Qnakltemp.SQL.Strings[47]<>'order by n.rossip desc' then dm.Qnakltemp.SQL.Strings[47]:='order by n.rossip desc' else exit;
6:if dm.Qnakltemp.SQL.Strings[47]<>'order by n.kol_vo desc' then dm.Qnakltemp.SQL.Strings[47]:='order by n.kol_vo desc' else exit;

else exit;
end;
dm.Qnakltemp.Close;
dm.Qnakltemp.AutoCalcFields:=false;
dm.Qnakltemp.Open;
 }
end;

procedure Trashform.PrintBClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  PopupMenu1.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do PopupMenu1.Popup(x,y);
end;

procedure Trashform.BitBtn3Click(Sender: TObject);
begin
 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(rashform,tsform(self).mybar);
         KartForm.Show;
         //DM.openkatalog;
         dm.findtovar;
        end else
          begin
          KartForm.Show;
          dm.findtovar;
         end;
end;

procedure Trashform.SpeedButton5Click(Sender: TObject);
begin
if dmunit.reg<>0 then exit;
if not  dm.setedit then exit;
if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(rashform,tsform(self).mybar);
         //DM.openkatalog;
        end ;
KartForm.Show;
kartform.SetSelect(Tdataset(dm.Qnakltemp),4);
end;

procedure Trashform.N121Click(Sender: TObject);
begin
aboutbox.printrashod(dmunit.nom);
end;

procedure Trashform.N1161Click(Sender: TObject);
begin
if dmunit.reg=1 then  aboutbox.print116(dmunit.nom)
                else  aboutbox.print116_1(dmunit.nom);
end;

procedure Trashform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if not ok.Enabled then
                     begin
                     canclose:=false;
                     exit;
                     end;
if izmeneno then  ok.Click else
if (dmunit.reg=0) and (dmunit.tipdok=4) then begin
                       dm.setreg(0,dmunit.nom);
                       dm.commit;
                       dm.RefreshJournal;
                      end;
 CanClose:=true;
end;
procedure Trashform.Scan (Sender:Tobject;Barcode:string);
var filt:string;
 begin
   
  if dm.setedit then
 begin

  filt:=dm.findkart(barcode);
  if filt<>'' then DM.setfilter(filt)
  else  exit;


 case dm.tovar.RecordCount of

    0:begin
           dm.ExecuteSQL('delete from tmp.tbarcode where barcode='+chr(39)+barcode+chr(39));
           dm.commit;
           dm.barcode.Refresh;


           end;
    1: begin
         
         if (dm.Qnakltemp.State=dsBrowse) and ( dm.Qnakltemp.Locate('plu',dm.tovarPLU.AsInteger,[]))
              then  Trashform(self).Show
               else
                begin


                   if (dm.Qnakltemp.RecordCount=0) and (dm.Qnakltemp.State=dsBrowse)
                              then dm.Qnakltemp.Insert;
                      if dm.Qnakltemp.State=dsBrowse then dm.Qnakltemp.Edit;
                dm.inserttovar;



               end;
       end;
    else
        begin
        if dm.Qnakltemp.State=dsBrowse then dm.Qnakltemp.Edit;
        showtovar;
        
        end;
    end;


  end;

 end;

procedure Trashform.N131Click(Sender: TObject);
begin
aboutbox.printTorg12v(dmunit.nom,13);
end;

procedure Trashform.N122Click(Sender: TObject);
begin
AboutBox.printtorg12v(dmunit.nom,12);
end;



 procedure Trashform.Printcennik(const tip:byte);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j,sklad:integer;
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

    sklad:=dm.QnakltempSKLADID.Value;
  if  dm.qsklad.Locate('skladid',sklad,[]) then org:=dm.qskladNAME.Value;


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

  end;


end;



procedure Trashform.N123Click(Sender: TObject);
begin
aboutbox.rashodf.Close;
aboutbox.rashodf.SetVariable('nom',dmunit.nom);
aboutbox.setreport(aboutbox.rashodf,nil,nil,nil,'\reports\frTorg-12_3.frf');
end;

procedure Trashform.DBGridColumns9EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var child:TchekForm;
begin
if not dm.Qnakltemp.ReadOnly
then
begin
dm.nofilter;
dm.LocateTovar(dm.QnakltempPLU.AsInteger);
if dm.Qnakltemp.State=dsBrowse then   dm.Qnakltemp.Edit;
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Поставки '+dm.tovarNAME.Value;
//child.Top:=KartForm.Top;
//child.Left:=kartform.Left;
child.OnActivate(child);
child.movbut.Visible:=true;
child.naklReport.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.naklReport.Open;
child.chDs.DataSet:=child.naklReport;
//child.DBSum.SumCollection[1].FieldName:='partost';
//child.DBSum.SumCollection[0].FieldName:='kol_vo';
//child.DBSum.DataSet:=child.PostReport;
//child.DBSum.Activate(true);
child.Show;
child.postavka:=true;
child.setvybor(dm.qnakltempkol_up,dm.qnakltemprossip);
end;
end;

procedure Trashform.N124Click(Sender: TObject);
begin
aboutbox.rashodf1.Close;
aboutbox.rashodf1.SetVariable('nom',dmunit.nom);
aboutbox.setreport(aboutbox.rashodf1,nil,nil,nil,'\reports\frTorg-12_4.frf');

end;

end.
