unit repunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons,sunit,
  ComCtrls, Menus;

type
  Trepform = class(TSForm)
    Panel2: TPanel;
    listsklad: TDBLookupComboboxEh;
    Label1: TLabel;
    Shape1: TShape;
    Button1: TButton;
    allkat: TCheckBox;
    Shape2: TShape;
    katlist: TDBLookupComboboxEh;
    Label2: TLabel;
    Button3: TButton;
    Button2: TButton;
    pbegin: TDBDateTimeEditEh;
    pend: TDBDateTimeEditEh;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Shape3: TShape;
    Label3: TLabel;
    prname: TDBEditEh;
    SpeedButton2: TSpeedButton;
    RadioGroup1: TRadioGroup;
    kolBut: TRadioButton;
    nameBut: TRadioButton;
    Button4: TButton;
    Button5: TButton;
    month: TDateTimePicker;
    Label6: TLabel;
    Button6: TButton;
    Button7: TButton;
    nullchek: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    daybar: TTrackBar;
    daylabel: TLabel;
    valbut: TRadioButton;
    zak: TCheckBox;
    mnogo: TCheckBox;
    postlist: TDBLookupComboboxEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    prodbutton: TButton;
    SpeedButton3: TSpeedButton;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure monthCloseUp(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure daybarChange(Sender: TObject);
    procedure zakClick(Sender: TObject);
    procedure mnogoClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure prodbuttonClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  function SelKategory:string;

  public
    { Public declarations }
  end;

var
  repform: Trepform;

implementation

uses dmunit, printunit, OstUnit, messageunit, about, przunit, DB,
  OracleData, postunit;

{$R *.dfm}

procedure Trepform.FormClose(Sender: TObject; var Action: TCloseAction);
begin

action:=caFree;
end;

procedure Trepform.Button1Click(Sender: TObject);
var b,e:TdateTime;
    sort:string;

begin
if zak.Checked then sort:='having ((sum(rkolvo)-sum(enal))>t.wes) or (sum(enal)=0)  ';
if mnogo.Checked then sort:='having (sum(enal)-sum(rkolvo)-minost)>0  ';


if nameBut.Checked then sort:=sort + ' order by t.kat,t.name '
else if kolBut.Checked  then  sort:=sort +' order by t.kat,sum(rkolvo) desc'
else  sort:=sort+ ' order by t.kat,sum(val) desc ';


b:=dmunit.pbegin;
e:=dmunit.pend;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),listsklad.KeyValue,true);
about.n:=DateToStr(pbegin.Value);
about.k:=DateToStr(pend.Value);

 If allkat.Checked  then dm.opensklad(1,listsklad.KeyValue,'%',sort)
 else
     If katlist.KeyValue<>null  then  dm.opensklad(1,listsklad.KeyValue,katlist.KeyValue,sort)
                              else
                                 begin
                                 dm.addmemo(messageunit.m6);
                                 exit;
                                 end;

  dm.setperiod(DateToStr(b),DateToStr(e));


 end;

procedure Trepform.FormDestroy(Sender: TObject);
begin
Repform:=nil;
end;

procedure Trepform.katlistChange(Sender: TObject);
begin
allkat.Checked:=false;
end;

procedure Trepform.Button2Click(Sender: TObject);
var b,e:TdateTime;
begin
b:=dmunit.pbegin;
e:=dmunit.pend;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value));

aboutbox.katreport.Close;
aboutbox.setreport(aboutbox.katreport,nil,nil,nil,'\reports\kat_report_f.frf');
dm.setperiod(DateToStr(b),DateToStr(e));
end;

procedure Trepform.Button3Click(Sender: TObject);
var b,e:TdateTime;
begin
b:=dmunit.pbegin;
e:=dmunit.pend;

dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),listsklad.KeyValue);

  If  assigned(ostform)  then ostform.Close;
  while  assigned(ostform) do application.ProcessMessages;
 ostunit.b:=pbegin.Value;
 ostunit.e:=pend.Value;
  ostunit.sklad:=listsklad.KeyValue;
 If allkat.Checked  then dm.opensklad(2,listsklad.KeyValue,'%','')
                    else
                     If katlist.KeyValue<>null
                        then dm.opensklad(2,listsklad.KeyValue,katlist.KeyValue,'')
                        else begin
                             dm.addmemo(messageunit.m6);
                               exit;
                             end;


 ostform:=tostform.Create(application,tsform(self).mybar);
 ostform.Caption:=ostform.Caption+' '+listsklad.Text+' за период с '
              +dateTostr(pbegin.Value)+' по '+dateTostr(pend.Value);
 ostform.Show;
 ostform.OnActivate(ostform);

 dm.setperiod(DateToStr(b),DateToStr(e));
end;

procedure Trepform.SpeedButton1Click(Sender: TObject);
var b,e:TdateTime;
begin
b:=dmunit.pbegin;
e:=dmunit.pend;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value));
 about.n:=datetostr(pbegin.Value);
 about.k:=datetostr(pend.Value);
 aboutbox.Summreport.Close;
 aboutbox.Summreport.SetVariable('sklad',listsklad.KeyValue);
 aboutbox.Summreport.Open;
  dm.setperiod(DateToStr(b),DateToStr(e));
 aboutbox.setreport(aboutbox.Summreport,nil,nil,nil,'\reports\summ.frf');





end;

procedure Trepform.SpeedButton2Click(Sender: TObject);
var b,e:TdateTime;
    sort:string;
    j:integer;
    begin
if zak.Checked then sort:='having ((sum(rkolvo)-sum(enal))>t.wes) or (sum(enal)=0)  ';
if mnogo.Checked then sort:='having (sum(enal)-sum(rkolvo)-minost)>0  ';


if nameBut.Checked then sort:=sort + ' order by t.name '
else if kolBut.Checked  then  sort:=sort +' order by sum(rkolvo) desc'
else  sort:=sort+ ' order by  sum(val) desc ';

AboutBox.kkmreportP.Close;
     j:=AboutBox.kkmreportP.SQL.Count;
     AboutBox.kkmreportP.SQL.Strings[j-1]:=sort;


if not assigned(przform) then przform:=Tprzform.Create(application,tsform(self).mybar);
 przform.ShowModal;
    if przform.ModalResult<>2 then
          begin
          dm.Qprzwd.Locate('proizw',przform.ModalResult-100,[]);
          prname.Text:=dm.QprzwdNAME.AsString;
          dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+dm.QprzwdPROIZW.AsString+chr(39)+ ' where parametr='+chr(39)+'PROIZW'+chr(39));
          dm.commit;
          b:=dmunit.pbegin;
          e:=dmunit.pend;
          dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),listsklad.KeyValue,true);
          about.n:=DateToStr(pbegin.Value);
          about.k:=DateToStr(pend.Value);
           try
           aboutbox.setreport(AboutBox.kkmreportp,nil,nil,nil,'\reports\kkmreportp.frf');

          AboutBox.kkmreportP.Close;

          finally
          dm.setperiod(DateToStr(b),DateToStr(e));
          end;

          end;


end;

procedure Trepform.Button4Click(Sender: TObject);
var b,e:TdateTime;
    name:string;
begin

b:=dmunit.pbegin;
e:=dmunit.pend;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),listsklad.KeyValue);
about.n:=DateToStr(pbegin.Value);
about.k:=DateToStr(pend.Value);
if nullchek.Checked then name:='notnull' else name:='';
 If allkat.Checked  then dm.opensklad(tbutton(sender).Tag,listsklad.KeyValue,'%',name)
 else
     If katlist.KeyValue<>null  then  dm.opensklad(tbutton(sender).Tag,listsklad.KeyValue,katlist.KeyValue,name)
                              else
                                 begin
                                 dm.addmemo(messageunit.m6);
                                 exit;
                                 end;

  dm.setperiod(DateToStr(b),DateToStr(e));


end;

procedure Trepform.FormCreate(Sender: TObject);
begin
month.Date:=date;
end;

procedure Trepform.monthCloseUp(Sender: TObject);
 var kat:string;
begin
kat:=SelKategory;

  aboutbox.chartreport.Close;
  aboutbox.chartreport.SetVariable('kat',kat);
   aboutbox.chartreport.SetVariable('data',month.Date);
  aboutbox.chartreport.Open;
 aboutbox.setreport(aboutbox.chartreport,nil,nil,nil,'\reports\chartkat.frf');
 aboutbox.chartreport.Close;



end;

procedure Trepform.Button6Click(Sender: TObject);
var kat:string;
begin
about.n:=DateToStr(pbegin.Value);
about.k:=DateToStr(pend.Value);
kat:=SelKategory;

ABOUTBOX.wisyak.Close;
AboutBox.wisyak.SetVariable('kat',kat);
ABOUTBOX.wisyak.SetVariable('MINDATA',int(pbegin.Value));
ABOUTBOX.wisyak.SetVariable('maxdata',int(pend.Value)+0.9999);
ABOUTBOX.wisyak.SetVariable('days',daybar.Position);
ABOUTBOX.wisyak.SetVariable('sklad',listsklad.KeyValue);
ABOUTBOX.wisyak.Open;
aboutbox.setreport(ABOUTBOX.wisyak,nil,nil,nil,'\reports\wisyak.frf');

ABOUTBOX.wisyak.Close;
end;

procedure Trepform.Button7Click(Sender: TObject);
begin
aboutbox.sroky.Close;
aboutbox.sroky.SetVariable('kat',selkategory);
aboutbox.sroky.Open;
aboutbox.setreport(ABOUTBOX.sroky,nil,nil,nil,'\reports\sroky.frf');


aboutbox.sroky.Close;
end;

 function Trepform.SelKategory:string;
 begin
 result:='%';
   if (katlist.KeyValue<>null)  and (not allkat.Checked) then
       begin
         aboutbox.Qkat.Close;
          aboutbox.Qkat.SetVariable('name',katlist.KeyValue);
          aboutbox.Qkat.Open;
         result:=aboutbox.QkatKAT.AsString;
       aboutbox.Qkat.Close;
       end;


 end;

procedure Trepform.daybarChange(Sender: TObject);
begin
daylabel.Caption:=inttostr(ttrackbar(sender).Position);
end;

procedure Trepform.zakClick(Sender: TObject);
begin
if zak.Checked then mnogo.Checked:=false;
end;





procedure Trepform.mnogoClick(Sender: TObject);
begin
if mnogo.Checked then zak.Checked:=false;
end;




procedure Trepform.N1Click(Sender: TObject);
var b,e:TdateTime;
    name:string;
begin

b:=dmunit.pbegin;
e:=dmunit.pend;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),listsklad.KeyValue);
about.n:=DateToStr(pbegin.Value);
about.k:=DateToStr(pend.Value);
name:='0';
 If allkat.Checked  then dm.opensklad(5,listsklad.KeyValue,'%',name)
 else
     If katlist.KeyValue<>null  then  dm.opensklad(5,listsklad.KeyValue,katlist.KeyValue,name)
                              else
                                 begin
                                 dm.addmemo(messageunit.m6);
                                 exit;
                                 end;

  dm.setperiod(DateToStr(b),DateToStr(e));
end;

procedure Trepform.Button5Click(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  PopupMenu1.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do PopupMenu1.Popup(x,y);
end;

procedure Trepform.N2Click(Sender: TObject);
begin
if postlist.Value=null  then
        begin
          dm.addmemo('Поставки от кого ? Выберите поставщика.');
        exit;
        end;
 with  AboutBox.qposttovar do
 begin
   close;
   SetVariable('post',postlist.Value);
   SetVariable(':nd',pbegin.Value);
   SetVariable(':kd',pend.Value+0.9999);
   open;
 end;
 aboutbox.setreport(AboutBox.qposttovar,nil,nil,nil,'\reports\posttovar.frf');



 end;

procedure Trepform.N3Click(Sender: TObject);
var b,e:TdateTime;
    name:string;
begin

b:=dmunit.pbegin;
e:=dmunit.pend;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),listsklad.KeyValue);
about.n:=DateToStr(pbegin.Value);
about.k:=DateToStr(pend.Value);
name:='1';
 If allkat.Checked  then dm.opensklad(5,listsklad.KeyValue,'%',name)
 else
     If katlist.KeyValue<>null  then  dm.opensklad(5,listsklad.KeyValue,katlist.KeyValue,name)
                              else
                                 begin
                                 dm.addmemo(messageunit.m6);
                                 exit;
                                 end;

  dm.setperiod(DateToStr(b),DateToStr(e));
end;

procedure Trepform.prodbuttonClick(Sender: TObject);
begin
if postlist.Value=null  then
        begin
          dm.addmemo('Выберите поставщика.');
        exit;
        end;
dm.setperiod(DateToStr(pbegin.Value),DateToStr(pend.Value),1,true);
      try

        dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+floattostr(postlist.Value)+chr(39)+' where parametr='+chr(39)+'PROIZW'+chr(39)) ;
         dm.OraBase.Commit;
      except
        dm.OraBase.Rollback;
      end;
 with  AboutBox.qprodtovar do
 begin
   close;
   SetVariable('post',postlist.Value);
   SetVariable(':nd',pbegin.Value);
   SetVariable(':kd',pend.Value+0.9999);
   open;
 end;
 aboutbox.setreport(AboutBox.qprodtovar,nil,nil,nil,'\reports\prodtovar.frf');

end;

procedure Trepform.SpeedButton3Click(Sender: TObject);
var temp:integer;
begin
 if not assigned(postsprav) then
   begin
    postsprav:=Tpostsprav.Create(self,myBar);
    end;
  temp:=postsprav.ShowModal;
  if   temp>100
  then
      begin
       postlist.Value:=temp-100;

      end;
 end;

procedure Trepform.N6Click(Sender: TObject);
begin
 with  AboutBox.sumpost do
 begin
   close;

   SetVariable(':nd',pbegin.Value);
   SetVariable(':kd',pend.Value+0.9999);
   open;
 end;
 aboutbox.setreport(AboutBox.sumpost,nil,nil,nil,'\reports\postsum.frf');

end;

end.
