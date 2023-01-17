unit naklunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, DBGridEh, Mask,
  Buttons, DBCtrlsEh,DB, DBLookupEh,loadunit,cennik,main, Menus,strutils,sunit,
  Oracle,math, SpeedForm, GridsEh;

type
  Tnaklform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    dbgrid: TDBGridEh;
    Panel3: TPanel;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    Label2: TLabel;
    datanakl: TDateTimePicker;
    Label3: TLabel;
    osnedit: TEdit;
    Label4: TLabel;
    sklad: TDBLookupComboboxEh;
    postname: TEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    numbered: TEdit;
    Labelread: TLabel;
    PrintB: TBitBtn;
    BitBtn1: TBitBtn;
    OpenDial: TOpenDialog;
    loadbtn: TBitBtn;
    CenButton: TBitBtn;
    wesbox: TCheckBox;
    Label6: TLabel;
    BarBtn: TBitBtn;
    BitBtn3: TBitBtn;
    CreateBt: TBitBtn;
    SelBt: TBitBtn;
    BitBtn4: TBitBtn;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    LoadMenu: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    Qprint: TOracleQuery;
    strihmenu: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    expmenu: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    Label7: TLabel;
    pname: TEdit;
    SpeedButton2: TSpeedButton;
    N3: TMenuItem;
    Qprice: TOracleQuery;
    pricemenu: TPopupMenu;
    N4: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    movform: TSpeedForm;
    nnom: TDBNumberEditEh;
    knom: TDBNumberEditEh;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure datanaklChange(Sender: TObject);
    procedure numberedChange(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure skladChange(Sender: TObject);
    procedure dbgridColumns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure okClick(Sender: TObject);
    procedure dbgridColumns2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbgridCellClick(Column: TColumnEh);
    procedure PrintBClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bitbtn2Click(Sender: TObject);
    procedure dbgridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cennboxClick(Sender: TObject);
    procedure wesboxClick(Sender: TObject);
    procedure dbgridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure postnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BarBtnClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
   
    procedure CreateBtClick(Sender: TObject);
    
    procedure SelBtClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure CenButtonClick(Sender: TObject);
  
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N6Click(Sender: TObject);
    procedure loadbtnClick(Sender: TObject);
     procedure BarClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure pricemenuPopup(Sender: TObject);
    procedure dbgridDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgridDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgridEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgridStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure N10Click(Sender: TObject);
  private
   datadoc:Tdatetime;
     krd:array of integer;
    sdrag:integer;
  // function getx(const main:Tform;sender:TDbgrideh;column:byte):integer;
   procedure printCennik(const tip:integer);
   procedure Scan (Sender:Tobject;Barcode:string);
   procedure InsertReport(const barcode:string;const kolvo:integer);
   function GetLastPrice(const plu:integer=0):currency;
   procedure reorderRow(const x:integer;const y:integer);
    { Private declarations }

  public
    { Public declarations }

  procedure getold;
   procedure showtovar;

  end;

var
  naklform: Tnaklform;
  var post :integer=0;
  ppost:integer=0;
  inscennik: array of integer;
  implementation

uses dmunit, postunit, kartunit, tranzUnit, messageunit, priceunit,
  peremunit, excelunit, TermUnit, textunit, Types;

{$R *.dfm}
//----------------------------------------------------------
procedure Tnaklform.printCennik(const tip:integer);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j,sklad:integer;
    org,podr:string;
    //rec1,rec2:Pstr;
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
If dmunit.reg=0  then begin dm.addmemo('��������� ���������');exit; end;
If Tdatasource(dbgrid.DataSource).DataSet.RecordCount=0  then exit;
CenForm:=TCenForm.Create(naklform);
//new(rec1);
//new(rec2);
  try
   dm.nofilter;
   org:='';
   podr:='';
   If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);
  sklad:=dm.QnakltempSKLADID.Value;
  if  dm.qsklad.Locate('skladid',sklad,[]) then org:=dm.qskladNAME.Value;


  // else begin org:=rec1^;podr:=rec2^;end;
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
  for j:=1 to dm.Qnakltemp.RecordCount do
  if inscennik[j]<>0 then inc(i);
  If i=0  then exit;
  // i:=length(inscennik)-1;
   for j := Low(table) to High(table) do   SetLength(table[j], i);
    i:=0;
    for j:=0 to dm.Qnakltemp.RecordCount-1 do
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
 {function Tnaklform.getx(const main:Tform;sender:TDbgrideh;column:byte):integer;
  var i:byte;x:integer;
  begin
     x:=Tform(main).Left;
   for i:=0 to column do
       x:=x+Tdbgrideh(sender).Columns[i].Width;
       result:=x;
  end;             }
//------------------------------------------------------------
procedure Tnaklform.getold;
begin
 if dmunit.postname<>'' then
 begin
 ppost:=dm.ExecuteSQL('select ppost from tmp.tprihj where nom='+inttostr(dmunit.nom));
 dm.Qpostav.Filtered:=false;
 dm.Qpostav.Refresh;
 if dm.Qpostav.Locate('cod',ppost,[]) then pname.Text:=dm.QpostavNAME.AsString
 else pname.Text:='�� ������';




 datanakl.Date:=dmunit.datadok;
 datadoc:=dmunit.datadok;
 numbered.Text:=inttostr(dmunit.nomerdok);
 postname.Text:=dmunit.postname;
 sklad.KeyValue:=dmunit.sklad;
 if dmunit.reg=1 then
  begin
  datanakl.Enabled:=false;
    numbered.ReadOnly:=true;
    postname.ReadOnly:=true;
    sklad.ReadOnly:=true;
  end;
 end ;
end;
 //----------------------------------------------------------------
procedure Tnaklform.showtovar;
  begin
    If dm.setedit   then  begin
      if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(naklform,tsform(self).mybar);
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


//----------------------------------------------------------------

procedure Tnaklform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.Ftovar.Close;
if izmeneno then  ok.Click else
if (dmunit.reg=0) and (dmunit.tipdok=2) then begin
                       dm.setreg(0,dmunit.nom);
                       dm.commit;
                        dm.RefreshJournal;
                      end;
If dmunit.tipdok=1  then
  begin
   dm.delnakl ;
   dm.closetemp;
  end ;
If dmunit.tipdok=2  then dm.delnakl ;
dm.rollback;
dmunit.post:=0;
dmunit.sklad:=0;
dmunit.nomerdok:=0;

Tdatasource(dbgrid.DataSource).DataSet.Close;
action:=caFree;
end;

procedure Tnaklform.FormDestroy(Sender: TObject);
begin

naklform:=nil;
end;

procedure Tnaklform.FormCreate(Sender: TObject);
begin
Tsform(self).OnScanAction:=scan;
Tform(sender).Left:=0;
Tform(sender).top:=0;
Tform(sender).Width:=main.MainForm.ClientWidth-25;
Tform(sender).Height:=mainform.ClientHeight-55;

//datanakl.MinDate:=dmunit.pbegin;
//datanakl.MaxDate:=dmunit.pend;
datanakl.DateTime:=now;;
dmunit.datadok:=now;
datadoc:=now;
dm.qsklad.First;
sklad.KeyValue:=dm.qskladSKLADID.AsInteger;
end;

procedure Tnaklform.SpeedButton1Click(Sender: TObject);
var temp:integer;
begin
If dmunit.reg=0  then begin
 If not assigned(postsprav)  then begin
    postsprav:=Tpostsprav.Create(naklform,tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='����������';
     // postsprav.OnActivate(postsprav);

       temp:=postsprav.ShowModal-100;
   tform(self).OnActivate(self);
    if temp>0 then
    begin
     post:=temp;
     postname.Text:=dmunit.postname;
     dmunit.post:=temp;
     end;
    dm.setedit;
 end;
 end;
end;

procedure Tnaklform.datanaklChange(Sender: TObject);
begin

dmunit.datadok:=TDateTimePicker(sender).Date;
datadoc:=TDateTimePicker(sender).Date;
end;

procedure Tnaklform.numberedChange(Sender: TObject);
begin
try
dmunit.nomerdok:=strtoint(Tedit(sender).Text);
dm.setedit;
except
 numbered.Text:='';
end;

end;

procedure Tnaklform.cancelClick(Sender: TObject);
begin
if izmeneno then  ok.Click else
if (dmunit.reg=0) and (dmunit.tipdok=2) then begin
                       dm.setreg(0,dmunit.nom);
                       dm.commit;
                       //dm.RefreshJournal;
                      end;
 izmeneno:=false;
 dm.rollback;
 dm.closetemp;
 dm.delnakl;
 naklform.Close;
end;

procedure Tnaklform.skladChange(Sender: TObject);
begin
dmunit.sklad:=sklad.KeyValue;
dm.setedit;
end;

procedure Tnaklform.dbgridColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin

 if (not dm.setedit) and (dmunit.reg=0)  then  dm.addmemo(messageunit.m28)
 else
showtovar;
 end;

procedure Tnaklform.dbgridKeyPress(Sender: TObject; var Key: Char);
 var nds:integer;
     pprice:currency;
 begin


  if ord(key) in [46,254] then key:=chr(44);

 if (ord(key)=13)  then

 begin
 If (dbgrid.SelectedField.FieldName='NAME') and  (dm.setedit) then
   begin
     showtovar;
     exit;

   end;
 If (dbgrid.SelectedField.FieldName='NAME') and (not dm.setedit) and (dmunit.reg=0)  then
 begin
 dm.addmemo(messageunit.m28);
 exit;
 end;
 // tform(self).Caption:=inttostr(ord(key));

//dm.addmemo( inttostr(dbgrid.Columns.Items[dbgrid.Col].Tag));
if dm.Qnakltemp.State in [dsInsert,dsEdit]  then
begin
 // if not dm.tovar.Locate('plu',dm.QnakltempPLU.AsVariant,[])
 //       then begin dm.nofilter;dm.tovar.Locate('plu',dm.QnakltempPLU.AsVariant,[]);end;
 dm.nofilter;
 if (dm.QnakltempPLU.AsString<>'0') and
    (dm.LocateTovar(dm.QnakltempPLU.AsInteger)) then
    nds:=dm.tovarNDS.AsInteger else nds:=0;

 pprice:=GetLastPrice(dm.QnakltempPLU.AsInteger);

// case dbgrid.Col  of
  If (dbgrid.SelectedField.FieldName='CENABNDS') then
  begin
      if dm.QnakltempCENABNDS.AsString<>'' then
       begin
            case nds of
            0: dm.QnakltempCENASNDS.AsCurrency:=dm.QnakltempCENABNDS.AsCurrency;
            10: dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempCENABNDS.AsCurrency*1.1,-2);
            20: dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempCENABNDS.AsCurrency*1.2,-2);
            else dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempCENABNDS.AsCurrency*(1+(nds/100)),-2);
            end;
        dm.QnakltempTOTAL.AsCurrency:=dm.QnakltempKOL_VO.AsFloat*dm.QnakltempCENASNDS.AsCurrency;
       end;
     exit;
    end;
   If (dbgrid.SelectedField.FieldName='CENASNDS')  then
 begin
     if dm.QnakltempCENASNDS.AsString<>'' then
       begin
          case nds of
          0:dm.QnakltempCENABNDS.AsCurrency:=dm.QnakltempCENASNDS.AsCurrency;
          10:dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/1.1,-2);
          20:dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/1.2,-2);
          else dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/(1+(nds/100)),-2);
          end;
          dm.QnakltempTOTAL.AsCurrency:=dm.QnakltempKOL_VO.AsFloat*dm.QnakltempCENASNDS.AsCurrency;
       end;

    END;
    If (dbgrid.SelectedField.FieldName='TOTAL') then
  begin
     if dm.QnakltempTOTAL.AsString<>'' then
      begin
      if  (dm.QnakltempKOL_VO.AsFloat>0) and
          (dm.QnakltempTOTAL.AsCurrency>0)
           then dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempTOTAL.AsCurrency/dm.QnakltempKOL_VO.AsFloat,-2);
          case nds of
          0:dm.QnakltempCENABNDS.AsCurrency:=dm.QnakltempCENASNDS.AsCurrency;
          10:dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/1.1,-2);
          20:dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/1.2,-2);
          else dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/(1+(nds/100)),-2);
          end;

      end;
    end;
      if (pprice<>0)  and
            (dm.QnakltempCENASNDS.AsCurrency=pprice) then
       begin
          if   (DM.QnakltempCENAREAL.AsString='') or
                  (DM.QnakltempCENAREAL.AsString='0')
               then begin

               if (dm.QnakltempPLU.AsString<>'0') and
                (dm.LocateTovar(dm.QnakltempPLU.AsInteger)) then
                 dm.QnakltempCENAREAL.AsCurrency:=dm.tovarPRICE.AsCurrency;
                    end;

       end;

//end;
end;
end;
end;


procedure Tnaklform.okClick(Sender: TObject);

begin
try
if dm.Qnakltemp.State<>dsBrowse then dm.Qnakltemp.Post;
except
dm.Qnakltemp.Cancel;
end;
dm.commit;
If (dmunit.tipdok=1) and (not dm.setedit) then
  dm.addmemo(messageunit.m28);


If (dmunit.tipdok=1) and (dm.setedit)  then
if  MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
//If dm.Qnakltemp.Locate('plu',0,[])  then //notend:=true else notend:=false;
//                       begin
//                        dm.addmemo(messageunit.m21);
//                        exit;
//                        end;
       if dmunit.nomerdok=0 then begin
                              dm.addmemo('������� ����� ���������');
                              exit;
                              end;



       if dmunit.sklad=0 then begin
                              dm.addmemo('�������� �����');
                              exit;
                              end;
       if dmunit.post=0 then begin
                              dm.addmemo('�������� ����������');
                              exit;
                              end;

        if dm.Qnakltemp.RecordCount=0 then
                                       exit;
       if pname.Text='' then ppost:=0;

       If dm.showtime then
        begin
        dm.insertnakl(osnedit.Text,ppost);

        if MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then tranzunit.Prihod(dmunit.nom);
        end;
    exit;
end;
If (dmunit.tipdok=2) and (dmunit.reg=0)  then
begin
      if dmunit.sklad=0 then begin
                              dm.addmemo('�������� �����');
                              exit;
                              end;
       if dmunit.post=0 then begin
                              dm.addmemo('�������� ����������');
                              exit;
                              end;

        if dm.Qnakltemp.RecordCount=0 then
                                       exit;


       if (pname.Text='�� ������') or (pname.Text='') then ppost:=0;
        if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           dm.setreg(0,dmunit.nom);
           dm.insertnakl(osnedit.Text,ppost);



           if MessageDlg(messageunit.m19,
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
            tranzunit.Prihod(dmunit.nom);
            end;

        end else izmeneno:=false;

end ;

//dm.delnakl;
//dm.closetemp;
//naklform.Close;

end;

procedure Tnaklform.dbgridColumns2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var xPoint:TPoint;
   begin
 GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
 xPoint:= Point(-1, TWinControl(Sender).Height);

If dmunit.reg=0  then
  with TWinControl(Sender).ClientToScreen(xPoint)  do
  begin
 if dbgrid.SelectedField.FieldName='CENABNDS' then  dm.editnds1(x,y);
 if dbgrid.SelectedField.FieldName='CENASNDS' then    dm.editnds2(x,y);
 if dbgrid.SelectedField.FieldName='CENAREAL' then    dm.editcena(x,y);
 end

end;

procedure Tnaklform.dbgridCellClick(Column: TColumnEh);
begin
{if (tcolumneh(column).FieldName='row') and (not wesbox.Checked)
and (DM.Qnakltemp.State=dsbrowse)
then  begin
       dbgrid.DragMode:=dmAutomatic;
      // dbgrid.BeginDrag(true);
       exit;
      end;  }
case  dmunit.reg of
  1: labelread.Visible:=true;
  0: labelread.Visible:=false;
 end;
 case  dmunit.reg of
  1: n4.Enabled:=false;
  0: n4.Enabled:=true;
 end;


 if wesbox.Checked
then
 begin
  if  inscennik[dm.Qnakltemp.RecNo]=0 then
  inscennik[dm.Qnakltemp.RecNo]:=dm.Qnakltempplu.AsInteger
  else  inscennik[dm.Qnakltemp.RecNo]:=0;
  dbgrid.Repaint;

 end;


end;

procedure Tnaklform.PrintBClick(Sender: TObject);
begin
dm.PrintPrihod(dmunit.nom);
end;

procedure Tnaklform.BitBtn1Click(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  expmenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do expmenu.Popup(x,y);
end;

procedure Tnaklform.bitbtn2Click(Sender: TObject);
var test: Tloadnakl;
    kodif:string;
    temp:boolean;
    MyFile:string;
    myExcel:Tloadexcel;
    i:integer;
    begin
 i:=0;
    if dmunit.tipdok<>1 then
begin
 if MessageDlg(messageunit.m26,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
    dm.delnakl;
    dbgrid.DataSource.DataSet.Refresh;
    dmunit.nomerdok:=0;
    dmunit.reg:=0;
    dmunit.tipdok:=1;
    datanakl.DateTime:=now;
    datadoc:=now;
    dmunit.datadok:=now;
    numbered.Text:='0';
    osnedit.Text:='';
    end else
exit;

end;
{test:=Tloadnakl.Create;

If opendial.Execute   then
  test.setPath(opendial.FileName)
  else  begin
        test.Free;
        exit;
        end;
                       }
If opendial.Execute   then myfile:=opendial.FileName
else exit;

 if AnsiUpperCase(rightStr(myfile,3))='XLS' then
 begin
  myExcel:=Tloadexcel.Create;
  try

  if  myexcel.open(myfile) then
  begin
  //myexcel.visible:=true;
  dmunit.datadok:=now;
  datanakl.Date:=now;
  datadoc:=now;
  while not myExcel.EOF do
  begin


   dm.InsertLoadedString(myExcel.Tovar,myExcel.edizm,'0',myExcel.price,0,myExcel.pricebnds,0,myExcel.kolvo,1);
   inc(i);
   if i>250 then break;
   myExcel.next;

  end;

 dm.commit;

  end else exit;
  finally
   myexcel.close;
   myexcel.Free;
   bitbtn4.Click;
  end;
 end else
 begin
test:=Tloadnakl.Create;
test.setPath(myFile);
try
if test.Load  then
begin
if dm.FindLoadNakl(strtoint(test.nomer),test.Date)
then begin
      showmessage('��������� ��� �������');
      exit;
     end;
if dm.Qnakltemp.RecordCount>0
 then begin
      showmessage('��������� ���������');
      exit;
     end;



numbered.Text:=test.nomer;
datanakl.Date:=test.Date;
dmunit.datadok:=test.Date;
datadoc:=test.Date;
kodif:=test.kodifikator;
temp:=dm.Qpostav.Active;
if not temp then dm.Qpostav.Open;
if dm.Qpostav.Locate('kodifik',kodif,[]) then
 begin
   postname.Text:=dm.QpostavNAME.AsString;
   dmunit.post:=dm.QpostavCOD.AsInteger;

 end else postname.Text:='���='+kodif;
dm.Qpostav.Active:=temp;
 WHILE not test.EOF do
 begin

 dm.InsertLoadedString(test.tovName,test.ed_izm,test.krasnId,test.InPrice,test.OutPrice,(test.InPrice-(test.InPrice/100*test.nds)),test.Mest,test.kol_vo,test.KolvoVmeste);
 test.Next;
 end;
end;

finally
dm.commit;
if assigned(test) then
begin
test.onFree;
test.Free;
end;
end;
end;
end;

procedure Tnaklform.dbgridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
try

if not wesbox.Checked then
begin



if dm.QnakltempPLU.AsString='0' then begin  TDBGridEh(Sender).Canvas.Brush.Color:=clYellow;exit;end;

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
        if inscennik[dm.qnakltemp.RecNo]=dm.qnakltempplu.AsInteger
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

procedure Tnaklform.cennboxClick(Sender: TObject);
var nom:integer;
begin
 If dmunit.reg=0 then exit;

if MessageDlg(messageunit.m23,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  If not assigned(Priceform)   then
  begin
  Priceform:=tPriceform.Create(application,tsform(self).mybar);

  nom:=dm.newkod('PRIHSEQ');
  Priceform.Setnom(nom,{dmunit.datadok}now);
  Priceform.dataed.Value:=dmunit.datadok;
 // Priceform.OnResize(Priceform);
  end;
  Priceform.Show;
  Priceform.primed.Text:='�� �����. ���� � '+numbered.Text;
   dm.InsertPereozenka(dmunit.nom);
end;


end;

procedure Tnaklform.wesboxClick(Sender: TObject);
var i,n:integer;
begin
if wesbox.Checked then
begin
DBGrid.Canvas.Brush.Color:=clCream;
i:=(dm.Qnakltemp.RecordCount);
 setlength(inscennik,i+1);
 for n:=low(inscennik) to high(inscennik) do inscennik[n]:=0;

 end;
dbgrid.SetFocus;
dbgrid.Repaint;
end;

procedure Tnaklform.dbgridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (wesbox.Checked)
then begin
  if  inscennik[dm.Qnakltemp.RecNo]=0 then
 inscennik[dm.Qnakltemp.RecNo]:=dm.Qnakltempplu.AsInteger
 else  inscennik[dm.Qnakltemp.RecNo]:=0;
 dbgrid.Repaint;

 end;
//if key in [46,254] then key:=44;
end;

procedure Tnaklform.postnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If key=13  then SpeedButton1.Click; 
end;

procedure Tnaklform.BarBtnClick(Sender: TObject);
var CenForm:TCenForm;
    table:TCenArray;
    i,j:integer;
    org,podr:string;
  //  rec1,rec2:Pstr;
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
//If dmunit.reg=0  then begin dm.addmemo('��������� ���������');exit; end;
if dm.QnakltempPLU.AsInteger=0 then  begin dm.addmemo('�� �������� ���');exit; end;
If Tdatasource(dbgrid.DataSource).DataSet.RecordCount=0  then exit;

CenForm:=TCenForm.Create(naklform);
//new(rec1);
//new(rec2);
  try
   dm.nofilter;
   org:='';
   podr:='';
   If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);
  // else begin org:=rec1^;podr:=rec2^;end;
   cenform.setRecvizit(org,podr);
  I:=strtoint( InputBox('������� �������� ?', '����������',inttostr(dm.QnakltempKOL_VO.AsInteger )));
  if i=0 then exit;
  if i>3 then i:=round(i-(i/4));

   for j := Low(table) to High(table) do   SetLength(table[j], i);
   for j:=0 to i-1 do
      begin
      dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['plu'];
      dm.tovargetmark;
      if dm.tovarSHTUKA.AsInteger=1 then begin dm.addmemo('������� �����');exit; end;
      fill(j);
 //     Tdatasource(dbgrid.DataSource).DataSet.Next;
    end;

    cenform.Showreport(3,dmunit.repedit,table);


  finally
  CenForm.close;
  //dispose(rec1);
 // dispose(rec2);
  end;
end;

procedure Tnaklform.BitBtn3Click(Sender: TObject);
begin
 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(naklform,tsform(self).mybar);
         //DM.openkatalog;
         end;

          KartForm.Show;
          dm.findtovar;

end;



procedure Tnaklform.CreateBtClick(Sender: TObject);

var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  pm1.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do pm1.Popup(x,y);
end;



procedure Tnaklform.SelBtClick(Sender: TObject);
begin
if dmunit.reg<>0 then exit;
if not  dm.setedit then exit;
if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(naklform,tsform(self).mybar);
         //DM.openkatalog;
        end ;
KartForm.Show;
kartform.SetSelect(Tdataset(dm.Qnakltemp),2);

end;

procedure Tnaklform.BitBtn4Click(Sender: TObject);
begin
dbgrid.DataSource.DataSet.Refresh;
end;

procedure Tnaklform.N1Click(Sender: TObject);
begin
naklform.cennboxClick(nil);
end;

procedure Tnaklform.N2Click(Sender: TObject);
var temp:boolean;
begin
   if dmunit.reg=0 then
           begin
            dm.addmemo(messageunit.m17);
            exit;
           end;
    if MessageDlg(messageunit.m26,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
  if dm.Qnakltemp.RecordCount>0 then
  begin
   temp:=dm.Qnakltemp.ReadOnly;
   dm.Qnakltemp.ReadOnly:=false;
   dm.Qnakltemp.First;
   while not dm.Qnakltemp.Eof do
   begin
    dm.Qnakltemp.Edit;
    dm.QnakltempMEST.AsInteger:=0;
    dm.QnakltempKOL_VO.AsFloat:=0;
    dm.QnakltempCENAREAL.AsFloat:=0;
    dm.Qnakltemp.Post;
    dm.Qnakltemp.Next;
   end;
   dm.Qnakltemp.ReadOnly:=temp;
   end;
    datanakl.Enabled:=true;;
    numbered.ReadOnly:=false;
    postname.ReadOnly:=false;
    sklad.ReadOnly:=false;
    dmunit.nomerdok:=0;
    dmunit.reg:=0;
    dmunit.tipdok:=1;
    datanakl.DateTime:=now;
    dmunit.datadok:=now;
    numbered.Text:='0';
    osnedit.Text:='';
end;
end;
procedure Tnaklform.CenButtonClick(Sender: TObject);
begin
PrintCennik(1);
end;



procedure Tnaklform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if izmeneno then  ok.Click else
if (dmunit.reg=0) and (dmunit.tipdok=2) then begin
                       dm.setreg(0,dmunit.nom);
                       dm.commit;
                       //dm.RefreshJournal;
                      end;
 CanClose:=true;
 end;

  procedure Tnaklform.Scan (Sender:Tobject;Barcode:string);
  var filt:string;
      counter:integer;
      temp:integer;
   procedure insertmytovar;
     begin
         if (dm.Qnakltemp.State=dsBrowse) and ( dm.Qnakltemp.Locate('plu',dm.tovarPLU.AsInteger,[]))
              then  Tnaklform(self).Show
               else
                begin
                    if (dm.Qnakltemp.RecordCount=0) and (dm.Qnakltemp.State=dsBrowse)
                        then dm.Qnakltemp.Insert;
                    if dm.Qnakltemp.State=dsBrowse then dm.Qnakltemp.Edit;
                        dm.inserttovar;

                end ;


     end;
   begin

   // dm.addmemo('��� ������ '+barcode);

  if dm.setedit then
 begin

   filt:=dm.findkart(barcode);
  if filt='' then
      begin
     dm.CreateKart(barcode);

     exit;
     end;

  if filt<>'' then
  begin
  DM.setfilter(filt);



    case dm.tovar.RecordCount of

    0:begin
           dm.ExecuteSQL('delete from tmp.tbarcode where barcode='+chr(39)+barcode+chr(39));
           dm.commit;
           dm.barcode.Refresh;
           dm.CreateKart(barcode);
      end;
    1: begin
         insertmytovar;


      end;
    else
        begin
         counter:=0;
         temp:=0;
         dm.tovar.First;
         while not dm.tovar.Eof do
         begin
          if dm.tovarEXPORT.AsInteger=1 then
                             begin
                             inc(counter);
                              temp:=dm.tovarPLU.AsInteger;
                             end;
          dm.tovar.Next;
         end;

        if counter<>1 then
          begin
          if dm.Qnakltemp.State=dsBrowse then dm.Qnakltemp.Edit;
          Tnaklform(self).showtovar;
          end else
               begin
               dm.LocateTovar(temp);
               insertmytovar;
               end;





        end;
    end;




 end;
 end;




 end;



procedure Tnaklform.N6Click(Sender: TObject);
var myfile:string;
    i,p:integer;
    kolvo:integer;
    barcode:string;
    termfile:tstringlist;
begin
   if dmunit.tipdok<>1 then
begin
 if MessageDlg(messageunit.m26,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
    dm.delnakl;
    dbgrid.DataSource.DataSet.Refresh;
    dmunit.nomerdok:=0;
    dmunit.reg:=0;
    dmunit.tipdok:=1;
    datanakl.DateTime:=now;
    dmunit.datadok:=now;
    numbered.Text:='0';
    osnedit.Text:='';
    end else
exit;

end;
myfile:=ExtractFilePath(Application.ExeName)+'terminal.txt';

if not termunit.LoadFromTerminal(myfile) then
 begin
    exit;
 end;

if not FileExists(myfile)  then
 begin

  exit;
 end;
 termfile:=TstringList.Create;
 termfile.LoadFromFile(myfile);
  for i:=0 to termfile.Count-1 do
 begin
  p:=pos(',',termfile.Strings[i]);
  barcode:=copy(termfile.Strings[i],1,p-1);
  kolvo:=strtoint(copy(termfile.Strings[i],p+1,length(termfile.Strings[i])-p));
  InsertReport(barcode,kolvo);

  end;


//termfile.Free;
end;

procedure Tnaklform.loadbtnClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  LoadMenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do LoadMenu.Popup(x,y);
end;

 procedure Tnaklform.InsertReport(const barcode:string;const kolvo:integer);
  var plu:integer;
      wkolvo:double;
      temp,filter:string;
     procedure Iedit(const kolvo:double);
     begin
          dm.Qnakltemp.Edit;
          dm.QnakltempKOL_VO.AsFloat:=dm.QnakltempKOL_VO.AsFloat+kolvo;
          dm.Qnakltemp.Post;
       end;
  begin
    if copy(barcode,1,2)='21' then
      begin
        plu:=strtoint(copy(barcode,3,5));
        temp:=copy(barcode,8,2)+','+copy(barcode,10,3);
         wkolvo:=strtofloat(temp);
        if dm.Qnakltemp.State<>dsbrowse then dm.Qnakltemp.Cancel;
        if dm.Qnakltemp.Locate('plu',plu,[]) then
         begin
         Iedit(wkolvo);
         end
         else if dm.LocateTovar(plu) then
               begin
                dm.Qnakltemp.Insert;
                dm.inserttovar;
                dm.Qnakltemp.Post;
                Iedit(wkolvo);
              end;
      end else
      begin
       if dm.Qnakltemp.State<>dsbrowse then dm.Qnakltemp.Cancel;
          filter:=dm.findkart(barcode);
         if filter<>'' then
          DM.setfilter(filter)
          else begin
                  dm.addmemo('������ �� ���������� '+barcode+'�� �������');
                  dm.InsertLoadedString('? '+barcode,'��.','0',0,0,0,0,kolvo,1);
                   application.ProcessMessages;
                  exit;
               end;
          case dm.tovar.RecordCount of
          0:;
          1:  if dm.Qnakltemp.Locate('plu',dm.tovarPLU.Value,[]) then Iedit(kolvo)
              else begin
                dm.Qnakltemp.Insert;
                dm.inserttovar;
                dm.Qnakltemp.Post;
                     Iedit(kolvo);
                   end;

          else dm.addmemo('��������� ������� �� ���������� '+barcode+' kolvo '+inttostr(kolvo));

          end;


      end;
    application.ProcessMessages;
   dm.Qnakltemp.Refresh;
  end;

procedure Tnaklform.BarClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  strihmenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do strihmenu.Popup(x,y);


end;


  procedure Tnaklform.N8Click(Sender: TObject);
begin
BarBtnClick(nil);
end;

procedure Tnaklform.N9Click(Sender: TObject);
var i:integer;
    plu:integer;
begin
 dm.nofilter;
 I:=strtoint( InputBox('������� �������� ?', '����������',{inttostr(Tdatasource(dbgrid.DataSource).DataSet.FieldByName('kol_vo').AsInteger)}'0'));
  if i<=0 then exit;
  if i>100 then begin
                   dm.addmemo('������ ��� �� �������.');
                 exit;
                end;
  plu:=dm.Qnakltemp.FieldValues['plu'];
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

   end else  dm.addmemo('����� �� ������');



end;

procedure Tnaklform.N11Click(Sender: TObject);
var i,j:integer;
    n:string;
const s:string='�����';
begin
//dm.addmemo(messageunit.m5);
if dmunit.reg=0 then begin dm.addmemo(messageunit.m17);exit;end;
i:=dm.ExportNakl(dmunit.nom);
j:=i;
n:=copy(inttostr(i),length(inttostr(i)),1);
i:=strtoint(n);
case i of
1: n:=s+'�';
2,3,4 :n:=s+'�';
else n:=s;
end;
dm.addmemo('��������������: '+inttostr(j)+' '+n);
end;

procedure Tnaklform.N12Click(Sender: TObject);
var temp:Tsavestring;
var pluarray: array of integer;
i:integer;
begin
 temp:=Tsavestring.Create;
   SetLength(pluarray,dm.Qnakltemp.RecordCount);
  dm.Qnakltemp.First;
  for i:=low(pluarray) to high(pluarray)
   do begin
     if dm.QnakltempPLU.AsInteger <>0 then   pluarray[i]:=dm.QnakltempPLU.AsInteger ;

    dm.Qnakltemp.Next;
     end;
 if  temp.savespisok(pluarray,'a:\pos.spr',nil,false) then dm.addmemo('���� �������.');


 temp.Free;
end;

procedure Tnaklform.FormActivate(Sender: TObject);
begin
 if  tdate(dmunit.datadok)<>tdate(datadoc)
 then  dmunit.datadok:=datadoc;


end;






procedure Tnaklform.SpeedButton2Click(Sender: TObject);
var temp:integer;
begin
If dmunit.reg=0  then begin
 If not assigned(postsprav)  then begin
    postsprav:=Tpostsprav.Create(naklform,tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='����������';
     // postsprav.OnActivate(postsprav);

       temp:=postsprav.ShowModal-100;
   tform(self).OnActivate(self);
    if temp>0 then
    begin
     ppost:=temp;
     pname.Text:=dmunit.postname;
   //  dmunit.post:=temp;
     end;

 end;
 end;

end;

procedure Tnaklform.N3Click(Sender: TObject);
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
      dm.addmemo('������������ �������� ����������');
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

procedure Tnaklform.N4Click(Sender: TObject);
var key:char;
begin
key:=chr(13);

if  MessageDlg('���������� ���� �� ��������� �������� ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           dm.Qnakltemp.First;
           while not dm.Qnakltemp.Eof do
            begin
              if dm.QnakltempCENASNDS.AsInteger=0 then
               begin
                  dm.Qnakltemp.Edit;
                  dm.QnakltempCENASNDS.AsCurrency:=GetLastPrice(dm.QnakltempPLU.AsInteger);

                
                  dbgridKeyPress(nil,key);
                  dm.Qnakltemp.Post;
                 end;
               dm.Qnakltemp.Next;
            end;
        end;
end;

procedure Tnaklform.pricemenuPopup(Sender: TObject);
begin
if (dm.Qnakltemp.State<>dsBrowse) or (dm.Qnakltemp.RecordCount=0)
 or (dbgrid.SelectedField.FieldName='NAME')
 then n4.Enabled:=false else n4.Enabled:=true;


end;
//-------------------------------------------------------
 function tnaklform.GetLastPrice(const plu:integer=0):currency;
 begin
  result:=0;
  qprice.SetVariable('plu',plu);
  qprice.Execute;
  while not Qprice.Eof do
  begin
  result:=currency(Qprice.Field('pprice'));
  Qprice.Next;
  end;

 end;
//------------------------------------------------------------
procedure Tnaklform.dbgridDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);


  begin


Accept:=y>dbgrid.TitleHeight;

end;

procedure Tnaklform.dbgridDragDrop(Sender, Source: TObject; X, Y: Integer);
//var temp:integer;
  // frow:integer;
begin
{ frow:=0;
 for temp:=1 to dbgrid.RowCount do
 begin
 if y>krd[temp] then frow:=temp;
  end;
 //dm.addmemo(inttostr(sdrag)+'   '+inttostr(frow));

 if sdrag<>frow then
  if  MessageDlg('����������� ������ �'+inttostr(sdrag)+' �� ������ �'+inttostr(frow),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        reorderRow(sdrag,frow);
 }
 end;

procedure Tnaklform.dbgridEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
dbgrid.DragMode:=dmManual;

end;

procedure Tnaklform.dbgridStartDrag(Sender: TObject;
  var DragObject: TDragObject);
// var i:integer;
  begin
{SetLength(krd,dbgrid.RowCount+1);
for i:=1 to dbgrid.RowCount do
krd[i]:=dbgrid.CellRect(1,i).TopLeft.Y;
sdrag:=dbgrid.Row;}
end;

procedure Tnaklform.reorderRow(const x:integer;const y:integer);
var nid,kid:array of double;
i:integer;
begin
SetLength(nid,dm.Qnakltemp.RecordCount+1);
SetLength(kid,dm.Qnakltemp.RecordCount+1);
if dm.Qnakltemp.RecordCount=0 then exit;
if x>dm.Qnakltemp.RecordCount then exit;
if y>dm.Qnakltemp.RecordCount then exit;
if x<=0 then exit;
if x=y then exit;
if y<=0 then exit;
dm.Qnakltemp.First;
i:=1;
while not DM.Qnakltemp.Eof
do begin
  nid[i]:=dm.QnakltempID.Value;
  kid[i]:=dm.QnakltempID.Value;
 inc(i);
 dm.Qnakltemp.Next;
end;
if x<y then begin

    for i:=x+1 to y do
      begin
        kid[i]:=nid[i-1];
      end;//for
      kid[x]:=nid[y];

   end; //if
if x>y then begin

    for i:=y to x-1 do
      begin
        kid[i]:=nid[i+1];
      end;//for
      kid[x]:=nid[y];

   end; //if

dm.Qnakltemp.CommitOnPost:=false;
dm.Qnakltemp.First;
try
 for i:=1 to high(nid) do
 begin
     if nid[i]<>kid[i] then
   begin
      dm.Qnakltemp.Edit;
      dm.QnakltempID.Value:=RandomRange(10,30000)+ i;
      dm.Qnakltemp.Post;
   end;
   dm.Qnakltemp.Next;
 end;
  dm.Qnakltemp.First;
  for i:=1 to high(nid) do
 begin
     if nid[i]<>kid[i] then
   begin
      dm.Qnakltemp.Edit;
      dm.QnakltempID.Value:=kid[i];
      dm.Qnakltemp.Post;
   end;
   dm.Qnakltemp.Next;
 end;

 dm.commit;
 dm.Qnakltemp.CommitOnPost:=true;
 dm.Qnakltemp.Close;
 dm.Qnakltemp.Open;
 except
 dm.rollback;
 dm.Qnakltemp.CommitOnPost:=true;
 end

end;

procedure Tnaklform.N10Click(Sender: TObject);
begin
if (dmunit.reg=0) and (dm.Qnakltemp.State=dsBrowse) then
begin
nnom.MaxValue:=dm.Qnakltemp.RecordCount;
knom.MaxValue:=dm.Qnakltemp.RecordCount;

if  movform.ShowModal=mrOk
then
    begin
      if (nnom.Value<>null) and (knom.Value<>null)
      then  reorderRow(integer(nnom.Value),integer(knom.Value) );
    end;
end;
end;

end.
