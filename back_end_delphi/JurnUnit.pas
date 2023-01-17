unit JurnUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, ImgList,oracle,db, OracleData, StdCtrls, Buttons, Menus,
  Mask, DBCtrlsEh, SpeedForm,main,sunit, DBLookupEh,math;

type
  Tjurnform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Dbgrid: TDBGridEh;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    unreg: TMenuItem;
    reg: TMenuItem;
    del: TMenuItem;
    CancelDel: TMenuItem;
    prbut: TBitBtn;
    BitBtn1: TBitBtn;
    intform: TSpeedForm;
    Label2: TLabel;
    d1: TDBDateTimeEditEh;
    d2: TDBDateTimeEditEh;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Shape1: TShape;
    Label4: TLabel;
    Label5: TLabel;
    NumberNakl: TDBNumberEditEh;
    tov_print: TBitBtn;
    Unblok: TMenuItem;
    repBut: TBitBtn;
    nsklad: TDBLookupComboboxEh;
    Label6: TLabel;
    closeper: TBitBtn;
    Selprihod: TOracleDataSet;
    selpart: TOracleDataSet;
    updaterashod: TOracleQuery;
    N1: TMenuItem;
    N2: TMenuItem;
    splashform: TSpeedForm;
    outlabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbgridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrintbtClick(Sender: TObject);
    procedure regClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure CancelDelClick(Sender: TObject);
    procedure DbgridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure prbutClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure NumberNaklKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure DbgridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure tov_printClick(Sender: TObject);
    procedure UnblokClick(Sender: TObject);
    procedure repButClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DbgridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure closeperClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }

  mydata:tdatetime;
  mycolor:Tcolor;
  procedure  oninterval;

  public
    { Public declarations }

  end;

var
  jurnform: Tjurnform;

  doc:boolean=false;


  implementation

uses dmunit, naklunit, tranzUnit, messageunit, about, testunit;

{$R *.dfm}
 procedure  Tjurnform.oninterval;
 var temp:integer;
   tbeg,tend:tdatetime;
 begin
  If   Tdatasource(dbgrid.DataSource).DataSet.FieldValues['nom']<>null
 then temp:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['nom']
 else temp:=0;
 tbeg:=dmunit.pbegin;
 tend:=dmunit.pend;
 dmunit.pbegin:=d1.Value+StrtoTime('00:00');
 dmunit.pend:=d2.Value+StrtoTime('23:59');
 dm.setperiod(datetostr(dmunit.pbegin),datetostr(dmunit.pend));
 Tdatasource(dbgrid.DataSource).DataSet.close;
 Tdatasource(dbgrid.DataSource).DataSet.open;
 dmunit.pbegin:=tbeg;
 dmunit.pend:=tend;

  dm.setperiod(datetostr(dmunit.pbegin),datetostr(dmunit.pend));
 Tdatasource(dbgrid.DataSource).DataSet.Locate('nom',temp,[]);


 end;
//----------------------------------------------------------
procedure Tjurnform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Tdatasource(dbgrid.DataSource).DataSet.Close;

Action:=caFree;
end;

procedure Tjurnform.DbgridDblClick(Sender: TObject);
var tip:byte;
begin
 dm.RefreshJournal;
 tip:= dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 If  not doc  then
  case  tip  of
   1:  dm.openprihod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,Tdatasource(dbgrid.DataSource).DataSet.Fields[1].AsInteger,Tdatasource(dbgrid.DataSource).DataSet.Fields[10].AsInteger,0);
   2:  dm.openrashod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,Tdatasource(dbgrid.DataSource).DataSet.Fields[1].AsInteger,0);
   3: dm.openperem(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,Tdatasource(dbgrid.DataSource).DataSet.Fields[1].AsInteger);
   4,5: dm.openkassprih(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
   6:dm.inventf(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
   7:dm.spisanief(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,2);
   8:dm.spisanief(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,3);
   9:dm.pereozenkashow(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
   10,11:dm.openbeznal(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
   12:main.MainForm.OpenKKmreport(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
   13:main.MainForm.OpenActPrice(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
   14:MainForm.OpenMinus(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
  end else
    //If dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger) in [1,2]  then
    begin
    doc:=false;
    dmunit.datadok:=Tdatasource(dbgrid.DataSource).DataSet.Fields[11].AsDateTime;
    dmunit.osndoc:=Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger;
    dmunit.osntext:=Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsString+' № '+
                    Tdatasource(dbgrid.DataSource).DataSet.Fields[2].AsString;
    dmunit.nom:=Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger;
    dmunit.nomerdok:=Tdatasource(dbgrid.DataSource).DataSet.Fields[2].AsInteger;
    jurnform.ModalResult:=mrok;
  end;


end;

procedure Tjurnform.FormCreate(Sender: TObject);

 begin

  tform(self).Top:=0;
  tform(self).left:=0;
  Tform(sender).Width:=MainForm.ClientWidth-25;
  Tform(sender).Height:=mainform.ClientHeight-55;
  d1.Value:=dmunit.pbegin;
  d2.Value:=dmunit.pend;
  tjurnform(sender).mydata:=0;
  tjurnform(sender).mycolor:=clwhite;
  
 end;

procedure Tjurnform.PrintbtClick(Sender: TObject);
begin
If dm.getreg(Tdatasource(dbgrid.DataSource).DataSet)=1  then
begin

 if MessageDlg(messageunit.m20,
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then

          case dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger) of
        4,5,6,10,11:   begin
           dm.setreg(0,Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
           dm.commit;
           end ;

        1,2,3,7,8,12,13,14:
             begin
              dm.setnom(Tdatasource(dbgrid.DataSource).DataSet);
             tranzunit.otmena(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
             end;
        9: tranzunit.unregprice(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
          end;



dm.RefreshJournal;



end;
end;

procedure Tjurnform.regClick(Sender: TObject);
begin
 If dm.getreg(Tdatasource(dbgrid.DataSource).DataSet)=0  then
begin

 if MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
         splashform.Show;
         Dbgrid.Enabled:=false;
           case dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger) of
              1:tranzunit.Prihod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
              2:tranzunit.Rashod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,Tjurnform(self).outlabel);
              3:tranzunit.Perem(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
              4,5,6,10,11:begin
                  dm.setreg(1,Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
                  dm.commit;
                  dm.RefreshJournal;
                 end;
              7: tranzunit.Spisanie(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,Tjurnform(self).outlabel) ;
              8: tranzunit.Priemka(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
              9: tranzunit.regprice(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger) ;
              12:tranzunit.KkmRashod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger,Tjurnform(self).outlabel);
              13:tranzunit.ActPereozenky(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
              14:tranzunit.ActPeresortiza(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
            end;
           end;

      splashform.Close;
       Dbgrid.Enabled:=true;
      dm.RefreshJournal;
    end;
end;

procedure Tjurnform.PopupMenu1Popup(Sender: TObject);
var user:string;
    docTime:Tdatetime;
begin
case dm.getreg(Tdatasource(dbgrid.DataSource).DataSet) of
  0:begin  reg.Enabled:=true;unreg.Enabled:=false;del.Enabled:=true;CancelDel.Enabled:=false;Unblok.Enabled:=false;end;
  1:begin  reg.Enabled:=false;unreg.Enabled:=true;del.Enabled:=false;CancelDel.Enabled:=false;Unblok.Enabled:=false;end;
  2:begin  reg.Enabled:=false;unreg.Enabled:=false;del.Enabled:=false;CancelDel.Enabled:=true;Unblok.Enabled:=false;end;
  3:begin  reg.Enabled:=false;unreg.Enabled:=false;del.Enabled:=false;CancelDel.Enabled:=false;Unblok.Enabled:=true;end;
  end;
  {user:=string(dm.ExecuteSQL('select upper(user) from dual'));
  if user<>'ALEX' then
      begin
         docTime:=Tdatasource(dbgrid.DataSource).DataSet.Fields[11].AsDateTime;
     
       if date-docTime>7
        then unreg.Enabled:=false;

      end;   }

end;

procedure Tjurnform.delClick(Sender: TObject);
begin
If dm.getreg(Tdatasource(dbgrid.DataSource).DataSet)=0  then
tranzunit.SetDelete(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
dm.RefreshJournal;
end;

procedure Tjurnform.CancelDelClick(Sender: TObject);
begin
if dm.getreg(Tdatasource(dbgrid.DataSource).DataSet)=2 then
tranzunit.NoDelete(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
dm.RefreshJournal;
end;

procedure Tjurnform.DbgridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If key=13  then Dbgrid.OnDblClick(Dbgrid);
end;

procedure Tjurnform.prbutClick(Sender: TObject);
var tip:byte;
begin
tip:= dm.TipNakl(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 case tip of

 1:dm.PrintPrihod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 2:aboutbox.printrashod(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 3: aboutbox.printperem(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 //6:about.AboutBox.printinvent(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 9:about.AboutBox.printPereozenka(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 12:aboutbox.printkm6(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
 13:if dm.getreg(Tdatasource(dbgrid.DataSource).DataSet)=1 then
 aboutbox.printakt(Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);

 end;

end;

procedure Tjurnform.BitBtn1Click(Sender: TObject);
begin
// temp:=Tdatasource(dbgrid.DataSource).DataSet.FieldValues['nom'];
// Tdatasource(dbgrid.DataSource).DataSet.Refresh;
// Tdatasource(dbgrid.DataSource).DataSet.Locate('nom',temp,[]);
dbgrid.SumList.RecalcAll;
dm.RefreshJournal;
 end;

procedure Tjurnform.BitBtn3Click(Sender: TObject);

begin
If   intform.ShowModal=mrOk then
 oninterval;
end;

procedure Tjurnform.Label4Click(Sender: TObject);
begin
dbgrid.DataSource.DataSet.First;
end;

procedure Tjurnform.Label5Click(Sender: TObject);
begin
dbgrid.DataSource.DataSet.Last;
end;

procedure Tjurnform.NumberNaklKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
 begin
  If NumberNakl.Text<>'' then
   if dbgrid.DataSource.DataSet.Locate('NN',NumberNakl.Text,[])
   then dbgrid.SetFocus;
   
 end;
end;

procedure Tjurnform.Label4MouseEnter(Sender: TObject);
begin
tlabel(sender).Cursor:=crHandPoint;
end;

procedure Tjurnform.Label4MouseLeave(Sender: TObject);
begin
tlabel(sender).Cursor:=crDefault;
end;

procedure Tjurnform.DbgridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var nom:variant;
    i:byte;
    j:integer;
begin
//dm.addmemo(Tdatasource(dbgrid.DataSource).DataSet.);
//dm.addmemo(toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[16]);
//if   toracledataset(dbgrid.DataSource.DataSet).Name<>'QfsklJ' then
//begin
for i:=0 to 9 do dbgrid.Columns.Items[i].Title.Color:=clBtnFace;
dbgrid.Columns.Items[acol].Title.Color:=clTeal;
nom:=toracledataset(dbgrid.DataSource.DataSet).FieldValues['nom'];
j:=toracledataset(dbgrid.DataSource.DataSet).SQL.Count;
case acol of
0:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;
  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by tip,d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;
1:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;
  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by reg,d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;
2:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;
  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by nn,d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;
3,4:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;
  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;
5:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;
  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by name,d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;
6:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;
  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by sklad,d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;
9:begin
  toracledataset(dbgrid.DataSource.DataSet).Close;

  toracledataset(dbgrid.DataSource.DataSet).SQL.Strings[j-1]:='order by owner,d';
  toracledataset(dbgrid.DataSource.DataSet).Open;
  end;




end;
toracledataset(dbgrid.DataSource.DataSet).Locate('nom',nom,[]);
//end;
//Tdatasource(dbgrid.DataSource).
end;

procedure Tjurnform.tov_printClick(Sender: TObject);
begin
label6.Visible:=true;
nsklad.Visible:=true;

If   intform.ShowModal=mrOk then
begin
 if nsklad.KeyValue=null
    then begin
     dm.addmemo(messageunit.m15);
     exit;
     end;


with aboutbox.tov_otch do
begin
 Close;
 SetVariable('sklad',nsklad.KeyValue);
 SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
end;
with aboutbox.tov_otch_sec do
begin
 Close;
  SetVariable('sklad',nsklad.KeyValue);
 SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
end;
with aboutbox.journ_sum do
begin
 Close;
  SetVariable('sklad',nsklad.KeyValue);
 SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
 open;
 end;
 with aboutbox.rash_sum do
begin
 Close;
  SetVariable('sklad',nsklad.KeyValue);
 SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
 open;
 end;
with aboutbox.rash_otch do
begin
 Close;
  SetVariable('sklad',nsklad.KeyValue);
 SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
end;
with aboutbox.rash_otch1 do
begin
 Close;
  SetVariable('sklad',nsklad.KeyValue);
 SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
end;



aboutbox.setreport(aboutbox.tov_otch,aboutbox.tov_otch_sec,
                      aboutbox.rash_otch,aboutbox.rash_otch1,'\reports\frTorg-29DT.frf');
aboutbox.tov_otch.Close;
aboutbox.tov_otch_sec.Close;
aboutbox.journ_sum.close;
aboutbox.rash_otch.Close;
aboutbox.rash_otch1.Close;
aboutbox.rash_sum.Close;



end;
end;



procedure Tjurnform.UnblokClick(Sender: TObject);
begin
If dm.getreg(Tdatasource(dbgrid.DataSource).DataSet)=3  then
begin
 if MessageDlg('Документ открыт на редатирование!  Разблокировать ?',
     mtWarning, [mbYes, mbNo], 0) = mrYes then
               begin
                dm.setreg(0,Tdatasource(dbgrid.DataSource).DataSet.Fields[9].AsInteger);
                dm.commit;
                dm.RefreshJournal;
               end;
end;
end;






procedure Tjurnform.repButClick(Sender: TObject);
begin
d2.Value:=round(date);
d1.Value:=d2.Value-7;
If   intform.ShowModal=mrOk then
begin
aboutbox.printPriceJournal(d1.Value,d2.Value+0.9999);

end;
end;

procedure Tjurnform.FormActivate(Sender: TObject);
var nom:variant;

begin
if toracledataset(dbgrid.DataSource.DataSet).Active then
begin
nom:= toracledataset(dbgrid.DataSource.DataSet).FieldValues['nom'];
 toracledataset(dbgrid.DataSource.DataSet).Refresh;
toracledataset(dbgrid.DataSource.DataSet).Locate('nom',nom,[]);
end;
Tjurnform(self).Caption:= Label1.Caption+' с '+datetostr(dmunit.pbegin)+' по '+datetostr(dmunit.pend);

end;

procedure Tjurnform.DbgridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if  toracledataset(dbgrid.DataSource.DataSet)<>nil then
 begin
 if tjurnform(self).mydata<>int(toracledataset(dbgrid.DataSource.DataSet).FieldValues['d'])
   then
      begin
       tjurnform(self).mydata:=int(toracledataset(dbgrid.DataSource.DataSet).FieldValues['d']);
       if tjurnform(self).mycolor=clwhite then tjurnform(self).mycolor:=clCream
                                          else  tjurnform(self).mycolor:=clwhite;

     end;

 end;
  TDBGridEh(Sender).Canvas.Brush.Color:=tjurnform(self).mycolor;
 IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure Tjurnform.BitBtn4Click(Sender: TObject);
begin
label6.Visible:=false;
nsklad.Visible:=false;
end;

procedure delprihod(const nom:integer;const data:string);
 begin
  dm.ExecuteSQL('delete from tmp.tprihnakl where nom='+inttostr(nom));
  dm.ExecuteSQL('delete from tmp.tprihj where nom='+inttostr(nom));
  dm.ExecuteSQL('delete from tmp.tprice where nom in (select nom from tmp.tpricej where data <=to_date('+chr(39)+data+chr(39) +'))');
  dm.ExecuteSQL('delete from tmp.tpricej where data<=to_date('+chr(39)+data+chr(39)+')' );
  dm.ExecuteSQL('delete from tmp.kkmreport where doc in (select doc from tmp.kkmj where data <=to_date('+chr(39)+data+chr(39) +'))');
  dm.ExecuteSQL('delete from tmp.kkmj where data<=to_date('+chr(39)+data+chr(39)+')' );
  dm.ExecuteSQL('delete from tmp.trashnakl where nom in (select nom from tmp.trashj where data <=to_date('+chr(39)+data+chr(39) +'))');
  dm.ExecuteSQL('delete from tmp.trashj where data<=to_date('+chr(39)+data+chr(39)+')' );
  dm.ExecuteSQL('delete from tmp.tinvent where nom in (select nom from tmp.tskladj where data <=to_date('+chr(39)+data+chr(39) +'))');
  dm.ExecuteSQL('delete from tmp.tskladj where data<=to_date('+chr(39)+data+chr(39)+')' );



  end;

procedure Tjurnform.closeperClick(Sender: TObject);
var summa,KOLrash,kolpr:double;
begin
selprihod.Open;
 Tdatasource(dbgrid.DataSource).DataSet.First;
try
 while not  Tdatasource(dbgrid.DataSource).DataSet.Eof
 do begin
     if Selprihod.RecordCount=0 then delprihod(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['nom'],
                                               datetostr(round(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['d'])) )
     else begin


     summa:=double(dm.ExecuteSQL('select sum(partost) from tmp.kniga where otkat=0 and partia='+floattostr(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['part'])));
     KOLrash:=double(dm.ExecuteSQL('select sum(KOLVO) from tmp.tpart where part='+floattostr(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['part'])));
     KOLpr:=double(dm.ExecuteSQL('select sum(prihod) from tmp.kniga where otkat=0 and partia='+floattostr(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['part'])));

     if (roundto(summa,-3)=0) and (kolrash=kolpr)
      then
                begin
//dm.addmemo(inttostr(Selprihod.FieldValues['plu']));
      dm.ExecuteSQL('update tmp.kniga set otkat=1 where otkat=0 and partia='+floattostr(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['part']));

                 selprihod.First;
                  while not Selprihod.Eof do

                  begin
                   selpart.Close;
                   selpart.SetVariable('part',Selprihod.FieldValues['partia']);
                   selpart.SetVariable('plu',Selprihod.FieldValues['plu']);
                   selpart.Open;
                     while not selpart.Eof
                     do begin
                         updaterashod.SetVariable('kolvo',selpart.FieldValues['kolvo']);
                         updaterashod.SetVariable('nom',selpart.FieldValues['nomrash']);
                         updaterashod.SetVariable('plu',selpart.FieldValues['plu']);
                         updaterashod.Execute;
                         selpart.Next;
                       end;
                //       test.testkniga(Selprihod.FieldValues['plu'],
                //                    Selprihod.FieldValues['skladid'],
                //                    Selprihod.FieldValues['data'],
                //                    false);

                    dm.ExecuteSQL('delete from tmp.tpart where plu='+floattostr(Selprihod.FieldValues['plu'])+' and part='+floattostr(Selprihod.FieldValues['partia']));
                   selprihod.Next;
                  end;
                 delprihod(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['nom'],
                                               datetostr(round(Tdatasource(dbgrid.DataSource).DataSet.FieldValues['d'])) ) ;


                end;
          end;
     Tdatasource(dbgrid.DataSource).DataSet.Next;
    end;
 dm.ExecuteSQL('update tmp.kniga set otkat=1 where round(sum,3)=0');
dm.commit;
 except
dm.rollback;
raise;
end;
    selprihod.Close;
BitBtn1.Click;
end;

procedure Tjurnform.N2Click(Sender: TObject);
begin
label6.Visible:=false;
nsklad.Visible:=false;

If   intform.ShowModal=mrOk then
begin
  with aboutbox.sumpostprim do
begin
 Close;
  SetVariable('nd',d1.Value);
 SetVariable('kd',d2.Value+0.9999);
 open;
 aboutbox.setreport(aboutbox.sumpostprim,nil,
                      nil,nil,'\reports\sumpost.frf');


 aboutbox.sumpostprim.Close;
 end;
end;

end;

end.
