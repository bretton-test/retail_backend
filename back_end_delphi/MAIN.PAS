unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, 
  StdCtrls,  Buttons, Messages, ExtCtrls, ComCtrls,dialogs,
   ImgList, ToolWin,   SpeedForm,  DB, DBCtrlsEh, Mask, StdActns,
   XPStyleActnCtrls, ActnMan, ActnColorMaps, ActnCtrls,
  ActnMenus, ActnList, IniFiles,  SUnit,barUnit,
  PropStorageEh, Oracle, DBLookupEh,variants, OracleData;
{const
  CKey : TKey = ($C5,$8F,$8B,$D6,$92,$C9,$A4,$D8,
                 $FA,$FF,$6F,$8D,$AB,$FC,$DF,$14);
 }
type
//  Edllloaderror = class(Exception);
  TMainForm = class(TForm)
    ImageList1: TImageList;
    Panel2: TPanel;
    Memo: TMemo;
    Panel3: TPanel;
    Closebut: TSpeedButton;
    Selfform: TSpeedForm;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    DBEditEh10: TDBEditEh;
    DBEditEh11: TDBEditEh;
    DBEditEh12: TDBEditEh;
    DBEditEh13: TDBEditEh;
    Label1: TLabel;
    DBEditEh14: TDBEditEh;
    Label15: TLabel;
    DBEditEh15: TDBEditEh;
    Label16: TLabel;
    datezap: TDBDateTimeEditEh;
    okbut: TBitBtn;
    nobut: TBitBtn;
    DBEditEh16: TDBEditEh;
    Label17: TLabel;
    Button1: TButton;
    ActionMainMenuBar1: TActionMainMenuBar;
    XPColorMap1: TXPColorMap;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action28: TAction;
    Action29: TAction;
    Action31: TAction;
    Action32: TAction;
    Action33: TAction;
    Action34: TAction;
    Aterm: TAction;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action40: TAction;
    Action41: TAction;
    Action42: TAction;
    PropStorageEh1: TPropStorageEh;
    FontDialog1: TFontDialog;
    Action43: TAction;
    Action7: TAction;
    Action8: TAction;
    Action30: TAction;
    Actionabc: TAction;
    Action35: TAction;
    yaAction: TAction;
    SaveDialog1: TSaveDialog;
    pluquery: TOracleQuery;
    modform: TSpeedForm;
    pb: TProgressBar;
    Label7: TLabel;
    maxlabel: TLabel;
    RegPropStorageManEh1: TRegPropStorageManEh;
    Action39: TAction;
    Action44: TAction;
    lform: TSpeedForm;
    Label8: TLabel;
    datafrom: TDBDateTimeEditEh;
    Label9: TLabel;
    datato: TDBDateTimeEditEh;
    Label18: TLabel;
    katlist: TDBLookupComboboxEh;
    repbutton: TButton;
    Action45: TAction;
    katQuery: TOracleDataSet;
    shnurQuery: TOracleDataSet;
    Action46: TAction;
    procedure FileExit1Execute(Sender: TObject);
    procedure katalogExecute(Sender: TObject);
    procedure edizmExecute(Sender: TObject);
    procedure proizwExecute(Sender: TObject);
//    procedure ApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure postExecute(Sender: TObject);
    procedure test1Click(Sender: TObject);


    procedure FormCreate(Sender: TObject);
    procedure skladExecute(Sender: TObject);
    procedure prihedExecute(Sender: TObject);
    procedure prihodExecute(Sender: TObject);
    procedure sklrepExecute(Sender: TObject);
    procedure rashedExecute(Sender: TObject);
    procedure rashodExecute(Sender: TObject);
    procedure fulljournExecute(Sender: TObject);
    procedure closebutClick(Sender: TObject);
    procedure peremExecute(Sender: TObject);
    procedure perjournalExecute(Sender: TObject);
    procedure delObjectExecute(Sender: TObject);
    procedure balansExecute(Sender: TObject);
    procedure selfrecvExecute(Sender: TObject);
    procedure kassprihExecute(Sender: TObject);
    procedure kassarashExecute(Sender: TObject);
    procedure kassjformClose(Sender: TObject; var Action: TCloseAction);
    procedure kassjournalExecute(Sender: TObject);
    procedure inventarExecute(Sender: TObject);
    procedure inventjExecute(Sender: TObject);
    procedure SpisTMCExecute(Sender: TObject);
    procedure PrimTMZExecute(Sender: TObject);
    procedure newpriceExecute(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cennikExecute(Sender: TObject);
    procedure find_prExecute(Sender: TObject);
    procedure bankiExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure prihbankExecute(Sender: TObject);
    procedure rashbankExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pereozjExecute(Sender: TObject);
    procedure reestr_cExecute(Sender: TObject);
   // procedure ApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure ubviewExecute(Sender: TObject);
    procedure AtermExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionabcExecute(Sender: TObject);
    procedure Action36Execute(Sender: TObject);
    procedure Action37Execute(Sender: TObject);
    procedure Action38Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure yaActionExecute(Sender: TObject);
    procedure Action40Execute(Sender: TObject);
    procedure Action41Execute(Sender: TObject);
    procedure Action42Execute(Sender: TObject);
    procedure Action43Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action30Execute(Sender: TObject);
    procedure Action35Execute(Sender: TObject);
    procedure Action39Execute(Sender: TObject);
    procedure Action44Execute(Sender: TObject);
    procedure datatoChange(Sender: TObject);
    procedure datafromChange(Sender: TObject);
    procedure katlistChange(Sender: TObject);
    procedure repbuttonClick(Sender: TObject);
    procedure Action45Execute(Sender: TObject);
    procedure Action46Execute(Sender: TObject);
  private
    { Private declarations }





  public
    { Public declarations }
    TheDir  : string;
    IniFile : TIniFile;
    myBar:TTaskbar;
  procedure OpenMinus (const nom:integer);
  procedure OpenActPrice (const nom:integer);
  procedure OpenKKmreport(const doc:integer;const plu:integer=0);
  procedure Baraction(const barcode :string);
  procedure addmemo(const str:string);
  procedure  createrash;
 //  procedure scan(kod: Pchar);StdCall;
   procedure  docinit;
  end;

var
  MainForm: TMainForm;

  act:boolean=false;
  scanloaded:boolean=false;
  implementation


uses CHILDWIN, about, dmunit, kartunit, przunit, dialunit, postunit,
  skladunit, naklunit, JurnUnit, repunit, rashunit, peremunit, tranzUnit,
  Balunit, kassunit, kassjunit, invunit, Spisunit,  priceunit,
  cennikunit, messageunit, FindUnit, Bankunit, shetunit, bprihunit, ubunit,
  posunit, kkmUNIT, ActUnit, MinUnit, TEXTUNIT, rfindunit, kassrepUnit,
  masterunit, aUnit, abcunit, zakunit, yearunit, marketunit, m1unit;


 procedure initproc(Aproc: Tfarproc);StdCall ;external 'scandll.dll';
 function  Load(const port:byte):byte;StdCall;external 'scandll.dll';
 procedure Unload;StdCall ;external 'scandll.dll';
  {$R *.dfm}

 //------------------------------------------------------------------


 //-------------------------------------------------------------------
  procedure scan(kod: Pchar);StdCall;
   begin

   //mainform.Caption:=StrPas(kod);
    mainform.baraction(StrPas(kod));

   end;

 //-------------------------------------------------------------------
    procedure  TMainForm.createrash;
     begin
       kassform.Caption:='Расходный кассовый ордер';
 kassform.Label1.Caption:='Получатель';
 kassform.OnActivate(kassform);
 kassform.NDS.Visible:=false;
 kassform.NSP.Visible:=false;
 kassform.label8.Visible:=false;
 kassform.label9.Visible:=false;


 with kassform.tipoplaty.items do
 begin
    Clear;
    add('Оплата поставщику');
    add('Возврат поупателю');
    add('Выдача подотчетнику');
    add('прочее');

 end;


     end;

  //--------------------------------------------------------------------
    procedure TMainForm.addmemo(const str:string);
     begin
       panel2.Visible:=true;
       panel3.Visible:=true;


       memo.Visible:=true;
       closebut.Visible:=true;
       memo.Lines.Add(str);
       end;
  //----------------------------------------------------------------------
   procedure  TMainForm.docinit;
     begin
      dmunit.post:=0;
      dmunit.postname:='';
      dmunit.nomerdok:=0;
      dmunit.reg:=0;
     end;

procedure TMainForm.Baraction(const barcode :string);
 // var   filt:string;
  begin
 if assigned(Tform(mybar.actform)) then
                          begin

                          Tsform(mybar.actform).ScanAction(barcode);
                          end;

  end;



procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.katalogExecute(Sender: TObject);
begin
if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(mainform,mybar);
         KartForm.Show;
         DM.openkatalog;
         end else kartform.Show;
         dm.nofilter;
         end;

procedure TMainForm.edizmExecute(Sender: TObject);
begin
  if not assigned(MDIChild) then
        begin
         MDIChild:=TMDIChild.Create(application,myBar);
         MDIChild.Caption:='Настройка';
         MDIChild.OnActivate(MDIChild);

         end;
       MDIChild.Show;


end;

procedure TMainForm.proizwExecute(Sender: TObject);
begin
  if not assigned(przform) then
        begin
         przform:=Tprzform.Create(mainform,mybar);
         przform.Top:=mainform.Top+30;

         end;
przform.Show;
end;



procedure TMainForm.postExecute(Sender: TObject);
//var child :Tpostsprav;
begin
   if not assigned(postsprav) then
   begin
    postsprav:=Tpostsprav.Create(mainform,myBar);


      postsprav.Caption:='Контрагенты';
      //postsprav.OnActivate(postsprav);

 end;
  postsprav.Show;
end;

procedure TMainForm.test1Click(Sender: TObject);

begin
//
end;
//

//---------------------------

procedure TMainForm.FormCreate(Sender: TObject);
//var i:byte;
begin

 if (GetSystemMetrics($1000)=0) and (not main.scanloaded) and ( load(1)=1) then
                  begin

                   scanloaded:=true;
                   MAIN.initproc(@scan);

                  end;


if myBar=nil then
begin
myBar:=TTaskbar.Create(self);
myBar.Parent:=Tform(self);
myBar.Visible:=true;
end;



 end;

procedure TMainForm.skladExecute(Sender: TObject);
var child:Tskladform;
begin

child:=TSkladform.Create(mainform,mybar);
child.Caption:='Список Складов';
child.Show;
child.setds(dm.skladds);

end;



procedure TMainForm.prihedExecute(Sender: TObject);

begin
If assigned(rashform)  then exit;
If assigned(naklform)  then naklform.Close;
while  assigned(naklform) do application.ProcessMessages;
 dm.delnakl;
 naklform:=Tnaklform.Create(mainform,mybar);
 naklform.Caption:='Редактирование Приходной Накладной';
 naklform.Show;
 //naklform.OnResize(nil);
 docinit;
 dm.opentemp(0);
 dmunit.tipdok:=1;

 naklform.getold;
 
 end;

procedure TMainForm.prihodExecute(Sender: TObject);
var child:Tjurnform;
 user:string;
begin
  child:=Tjurnform.Create(application,myBar);
  child.Show;
  child.Label1.Caption:='Приходные накладные';
  child.Caption:='Журнал Приходных Накладных';
  child.OnActivate(child);
  child.tov_print.Visible:=true;
 // child.Selprihod.Open;
  user:=string(dm.ExecuteSQL('select upper(user) from dual'));

  if user='ALEX' then
  child.closeper.Visible:=true;

  dm.PrihJournal(child.Dbgrid);
  end;

procedure TMainForm.sklrepExecute(Sender: TObject);
begin
 If not assigned(repform)  then
  begin
    repform:=Trepform.Create(mainform,myBar);
    repform.Show;
    repform.listsklad.KeyValue:=1;
    repform.pbegin.Value:=dmunit.pbegin;
    repform.pend.Value:=dmunit.pend;



  end;
end;

procedure TMainForm.rashedExecute(Sender: TObject);
begin
If assigned(naklform)  then exit;
If assigned(rashform)  then
begin
rashform.show;
exit;
end;
while  assigned(rashform) do application.ProcessMessages;
rashform:=tRashform.Create(mainform,myBar);

rashform.Show;
docinit;
dm.opentemp(0);
dmunit.tipdok:=3;

rashform.getold;
//rashform.OnResize(rashform);
end;

procedure TMainForm.rashodExecute(Sender: TObject);
var child:Tjurnform;
begin
  child:=Tjurnform.Create(application,myBar);
  child.Show;
  child.Label1.Caption:='Расходные накладные';
  child.Caption:='Журнал Расходных Накладных';
  child.OnActivate(child);

  dm.RashJournal(child.Dbgrid);

end;

procedure TMainForm.fulljournExecute(Sender: TObject);
var child:Tjurnform;
begin

  child:=Tjurnform.Create(application,myBar);

  child.Show;
  child.Label1.Caption:='Общий Журнал';
  child.Caption:='Общий Журнал';
  child.Dbgrid.Columns[5].Title.caption:='Клиент';
  child.OnActivate(child);

  dm.FullJournal(child.Dbgrid);
end;

procedure TMainForm.closebutClick(Sender: TObject);
begin
panel3.Visible:=false;
panel2.Visible:=false;
memo.Lines.Clear;
memo.Visible:=false;
closebut.Visible:=false;
end;

procedure TMainForm.peremExecute(Sender: TObject);
begin
If assigned(naklform)  then naklform.Close;
while  assigned(naklform) do application.ProcessMessages;
If assigned(rashform)  then rashform.Close;
while  assigned(rashform) do application.ProcessMessages;
If assigned(peremform)  then peremform.Close;
while  assigned(peremform) do application.ProcessMessages;
peremform:=tperemform.Create(mainform,myBar);
dmunit.reg:=0;
peremform.reg:=0;
dmunit.tipdok:=5;
dmunit.postname:='Перемещение';
peremform.OnResize(peremform);
peremform.Show;
dm.opentemp(0);


end;

procedure TMainForm.perjournalExecute(Sender: TObject);
var child:Tjurnform;
begin
  child:=Tjurnform.Create(application,myBar);
  child.Show;
  child.Label1.Caption:='Журнал Перемещений';
  child.Caption:='Журнал Перемещений';
  child.Dbgrid.Columns[5].Title.caption:='Со Склада';
  child.OnActivate(child);

  dm.PeremJournal(child.Dbgrid);
end;



procedure TMainForm.delObjectExecute(Sender: TObject);
begin
if MessageDlg('Удалить Документы ? Помеченые Документы будут безвозвратно удалены !!!',
        mtWarning, [mbYes, mbNo], 0) = mrYes then tranzunit.DeleteAll ;


end;

procedure TMainForm.balansExecute(Sender: TObject);
begin
 if not assigned(Balform) then
        begin
         Balform:=TBalform.Create(mainform,MyBar);

         Balform.Show;

         end;
end;

procedure TMainForm.selfrecvExecute(Sender: TObject);
begin
//baraction('4605922000846');
dm.selfrecv(selfform.ShowModal) ;


end;

procedure TMainForm.kassprihExecute(Sender: TObject);

begin
 If not assigned(kassform)   then
 begin
 kassform:=tkassform.Create(mainform,myBar);
 kassunit.tip:=1;

 end;
end;

procedure TMainForm.kassarashExecute(Sender: TObject);
begin
If not assigned(kassform)   then
 begin
 kassform:=tkassform.Create(mainform,mybar);
 kassunit.tip:=2;
 createrash;

 end;
end;

procedure TMainForm.kassjformClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.qkassjourn.Close;
end;

procedure TMainForm.kassjournalExecute(Sender: TObject);
begin
 If not assigned(kassjform)   then
  begin
   kassjform:=tkassjform.Create(application,myBar);


  end;
end;

procedure TMainForm.inventarExecute(Sender: TObject);
var nom:integer;
begin
If not assigned(invform)   then
  begin
   invform:=tinvform.Create(mainform,mybar);

   nom:=dm.newkod('PRIHSEQ');
   invform.Setnom(nom);
  // invform.OnResize(invform);
  end;
  invform.Show;
end;

procedure TMainForm.inventjExecute(Sender: TObject);
var child:Tjurnform;
begin
  child:=Tjurnform.Create(application,myBar);
  child.Show;
  child.Label1.Caption:='Журнал Инвентаризации';
  child.Caption:=child.Label1.Caption;
  child.OnActivate(child);

  dm.InvJournal(child.Dbgrid);

end;

procedure TMainForm.SpisTMCExecute(Sender: TObject);
var nom:integer;
begin
  If not assigned(Spform)   then
  begin
   Spform:=tSpform.Create(mainform,mybar);
 //  spform.Caption:='Списание ТМЦ №';
 //  Spform.Label5.Caption:=spform.Caption;

   nom:=dm.newkod('PRIHSEQ');
   Spform.Setnom(nom,2);
  // Spform.OnResize(SPform);
  end;
  Spform.Show;


end;

procedure TMainForm.PrimTMZExecute(Sender: TObject);
var nom:integer;
begin
  If not assigned(Spform)   then
  begin
   Spform:=tSpform.Create(mainform,mybar);
   spform.Caption:='Прием ТМЦ №';
   Spform.Label5.Caption:=spform.Caption;
   spform.OnActivate(spform);

   nom:=dm.newkod('PRIHSEQ');
   Spform.Setnom(nom,3);
  // Spform.OnResize(SPform);
  end;
  Spform.Show;

end;

procedure TMainForm.newpriceExecute(Sender: TObject);
begin
  If not assigned(Priceform)   then
  begin
  Priceform:=tPriceform.Create(application,myBar);

  nom:=dm.newkod('PRIHSEQ');
  Priceform.Setnom(nom,now);
  Priceform.OnResize(Priceform);
  end;
  Priceform.Show;
end;

procedure TMainForm.N26Click(Sender: TObject);
begin
if MessageDlg('Внимание.Все терминалы будут Перезагружены в течении 5 мин. Продолжить ?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then
         tranzunit.InsertAllKatalog;


   end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if assigned(kartform) then kartform.close;
if assigned(przform) then przform.close;
if assigned(bankform) then bankform.close;
if assigned(shetform) then shetform.close;
if assigned(postsprav) then postsprav.close;
if assigned(cennikform) then cennikform.Close;

//if assigned(ApdComPort) then begin
//ApdComPort.Open:=false;
//ApdComPort.Free;
//end;
//dm.delnakl;
if scanloaded then
begin
 main.unload;
scanloaded:=false;
end;
end;

procedure TMainForm.cennikExecute(Sender: TObject);
begin
  If not assigned(cennikform)   then
  begin
  cennikform:=tcennikform.Create(mainform,mybar);

  dm.showcennik.Open;
  end;
    cennikform.Show;

end;

procedure TMainForm.find_prExecute(Sender: TObject);
var temp:TFindForm;
begin
temp:=TFindForm.Create(mainform,myBar);
temp.Show;
end;

procedure TMainForm.bankiExecute(Sender: TObject);
begin
  If not assigned(bankform)   then
  begin
  bankform:=tbankform.Create(mainform,mybar);

  end;
    bankform.Show;

end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
 If not assigned(shetform)   then
  begin
  shetform:=tshetform.Create(mainform,myBar);

  end;
   selfform.ModalResult:=mrcancel;
    shetform.Show;


end;

procedure TMainForm.prihbankExecute(Sender: TObject);
var temp:Tbprihform;
begin
temp:=Tbprihform.Create(mainform,myBar);


temp.settip(1,0);
temp.Show;

end;

procedure TMainForm.rashbankExecute(Sender: TObject);
var temp:Tbprihform;
begin
temp:=Tbprihform.Create(mainform,myBar);

temp.settip(2,0);
temp.Caption:='Выписка из банка (расход)';
temp.OnActivate(temp);
with temp.typoplaty.items do
 begin
    Clear;
    add('Оплата поставщику');
    add('Возврат поупателю');
    add('прочее');

 end;


temp.Show;

end;

procedure TMainForm.FormShow(Sender: TObject);
begin
if

(assigned(dm)) and
( not dm.OraBase.Connected)
and (not act)  then


              if not dm.StayConnect then mainform.Close
              else
             dm.selfrecv(0);

   end;

procedure TMainForm.pereozjExecute(Sender: TObject);
var child:Tjurnform;
begin
  child:=Tjurnform.Create(application,myBar);
  child.Show;
  child.Label1.Caption:='Переоценки';
  child.Caption:='Журнал Переоценок';
  child.OnActivate(child);

  dm.qPEROZj.Close;
  dm.qPEROZj.Open;
  //addmemo(inttostr(dm.qPEROZj.RecordCount));
  child.Dbgrid.DataSource:=dm.perds;
  child.repBut.Visible:=true;

end;

procedure TMainForm.reestr_cExecute(Sender: TObject);
begin
aboutbox.reestr.Close;
aboutbox.setreport(aboutbox.reestr,nil,nil,nil,'\reports\reestr_cen.frf');
end;



procedure TMainForm.ubviewExecute(Sender: TObject);
var child:Tubform;
begin

    child:=Tubform.Create(application,myBar);

   child.SetTip(1);
 child.CreateMassiv;
 child.Show;
end;

procedure TMainForm.AtermExecute(Sender: TObject);
begin
If not assigned(posform)  then
  begin
    posform:=Tposform.Create(application,myBar);

  end;
 posform.Show;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if not dm.OraBase.Connected then
    begin
     CanClose:=true;
     exit;
    end;
if mainform.MDIChildCount>0 then
begin
addmemo('Закройте все активные документы.');
CanClose:=false
end else CanClose:=true;


end;

{procedure TMainForm.ActionabcExecute(Sender: TObject);
var child:Tubform;
begin

    child:=Tubform.Create(application,myBar);

   child.SetTip(0);
 child.CreateMassiv;
 child.Show;
end;  }

procedure TMainForm.ActionabcExecute(Sender: TObject);
 var temp:tabcForm;
begin
temp:=TabcForm.Create(mainform,myBar);
temp.Show;
end;





procedure TMainForm.Action36Execute(Sender: TObject);
var child:Tskladform;
begin

child:=TSkladform.Create(mainform,myBar);
child.Caption:='Список ККМ';
child.Show;
dm.KKM.Open;
child.setds(dm.KKM_ds,true);


end;

procedure TMainForm.Action37Execute(Sender: TObject);
var child: TKkmForm;
begin

child:=TKkmForm.Create(mainform,myBar);
child.Caption:='Отчет ККМ';
child.newdoc;
child.Show;
child.OnActivate(child);
end;
procedure TMainForm.OpenKKmreport(const doc:integer;const plu:integer);
 var child: TKkmForm;
begin

child:=TKkmForm.Create(mainform,myBar);
child.Caption:='Отчет ККМ';

child.Opendoc(doc,plu);
child.Show;
child.OnActivate(child);
end;


procedure TMainForm.Action38Execute(Sender: TObject);
 var child: TactForm;
begin

child:=TactForm.Create(mainform,myBar);
child.New;
child.Show;

end;

 procedure TMainForm.OpenActPrice (const nom:integer);
 var child: TactForm;
 begin

child:=TactForm.Create(mainform,mybar);
child.Open(nom);
child.Show;

end;

procedure TMainForm.FormResize(Sender: TObject);
begin
 if mybar<>nil

 then
  begin
  mybar.resizeButtons;
  mybar.resizewindows;

 end;
end;

procedure TMainForm.yaActionExecute(Sender: TObject);
 var temp:tyForm;
begin
temp:=TyForm.Create(mainform,myBar);
temp.Show;
end;

procedure TMainForm.OpenMinus (const nom:integer);
begin
   If not assigned(MinForm)   then
  begin
   MinForm:=tMinForm.Create(mainform,mybar);
   minform.Open(nom);
  end;
  MinForm.Show;
end;
procedure TMainForm.Action40Execute(Sender: TObject);
var temp:Tsavestring;
var pluarray: array of integer;
i:integer;
begin
 temp:=Tsavestring.Create;
// dm.nofilter;
 //  SetLength(pluarray,dm.tovar.RecordCount);
 // dm.tovar.First;
//  for i:=low(pluarray) to high(pluarray)
 //  do begin
 //    if dm.tovarPLU.AsInteger<>0 then   pluarray[i]:=dm.tovarPLU.AsInteger;

//    dm.tovar.Next;
//     end;
i:=1;
pluquery.Execute;
while not pluquery.Eof do
  begin
    SetLength(pluarray,i);
    pluarray[i-1]:=pluquery.Field('plu');
      inc(i);
    pluquery.Next;
  end;
  maxlabel.Caption:=inttostr(i-1);

     // if  temp.savespisok(pluarray) then dm.addmemo('файл записан.');

 if SaveDialog1.Execute then
 begin
 try
 dm.addmemo(SaveDialog1.FileName);

  modform.Show;
  if  temp.savespisok(pluarray,SaveDialog1.FileName,pb,true) then dm.addmemo('файл записан.');

 finally
 temp.Free;
 modform.Close;

 end;
 end;
 end;

procedure TMainForm.Action41Execute(Sender: TObject);
var temp:trfindform;
begin
temp:=trfindform.Create(mainform,myBar);
temp.Show;
end;

procedure TMainForm.Action42Execute(Sender: TObject);
var temp:TkassrepForm;
begin
temp:=TkassrepForm.Create(mainform,myBar);
temp.Show;


end;

procedure TMainForm.Action43Execute(Sender: TObject);
begin
FontDialog1.Font:=ActionMainMenuBar1.Font;
if FontDialog1.Execute then ActionMainMenuBar1.Font:=FontDialog1.Font;
end;

procedure TMainForm.Action7Execute(Sender: TObject);
begin
FontDialog1.Font:=MainForm.Font;
if FontDialog1.Execute then MainForm.Font:=FontDialog1.Font;

end;

procedure TMainForm.Action8Execute(Sender: TObject);
var temp:Tmasterform;
begin
temp:=Tmasterform.Create(mainform,myBar);
temp.Show;
end;

procedure TMainForm.Action30Execute(Sender: TObject);
var temp:taform;
begin
temp:=taform.Create(mainform,myBar);
temp.Show;
end;

procedure TMainForm.Action35Execute(Sender: TObject);
var temp:TzakForm;
begin
temp:=TzakForm.Create(mainform,myBar);
temp.Show;

end;

procedure TMainForm.Action39Execute(Sender: TObject);
var temp:TMForm;
begin
temp:=TMForm.Create(mainform,myBar);
temp.Show;

end;

procedure TMainForm.Action44Execute(Sender: TObject);
var temp:TM1Form;
begin
temp:=TM1Form.Create(mainform,myBar);
temp.Show;

end;

procedure TMainForm.datatoChange(Sender: TObject);
begin
if integer(TDBDateTimeEditEh(sender).Value)>0 then
begin

 dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(TDBDateTimeEditEh(sender).Value)+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;
 dm.commit;
end;
end;

procedure TMainForm.datafromChange(Sender: TObject);
begin
if integer(TDBDateTimeEditEh(sender).Value)>0 then
begin

dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+string(TDBDateTimeEditEh(sender).Value)+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
dm.commit;
end;
end;

procedure TMainForm.katlistChange(Sender: TObject);
begin
if katlist.KeyValue<>null
then
 begin
    AboutBox.qkat.Close;
    AboutBox.Qkat.SetVariable('name',string(katlist.KeyValue));
    AboutBox.Qkat.Open;

    dm.ExecuteSQL('update tmp.toptions set value='+AboutBox.QkatKAT.AsString+ ' where parametr='+chr(39)+'kat'+chr(39));


    dm.commit;

 end;
end;

procedure TMainForm.repbuttonClick(Sender: TObject);
begin
if katlist.Visible then
begin
katQuery.Close;
if katlist.Text='' then
  begin
  dm.addmemo('выберите категорию.');
  exit;
  end;
 katlist.OnChange(nil);
end;
 screen.Cursor:=crSQLWait;
datafrom.OnChange(datafrom);
datato.OnChange(datato);

if integer(datafrom.Value)>integer(datato.Value)
then
begin
  dm.addmemo('Начальная дата больше конечной');
 screen.Cursor:=crDefault;
  exit;
end;
if katlist.Visible then   AboutBox.setreport(katQuery,nil,nil,nil,'\reports\kat_report_litr.frf')
                    else  AboutBox.setreport(shnurQuery,nil,nil,nil,'\reports\shnur_report.frf');


screen.Cursor:=crDefault;
end;

procedure TMainForm.Action45Execute(Sender: TObject);
begin
lform.Close;
Label18.Visible:=true;
katlist.Visible:=true;
lform.Caption:= 'отчёт по категориям в литрах';
lform.Refresh;
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));

lform.Show;
end;

procedure TMainForm.Action46Execute(Sender: TObject);
begin
lform.Close;
 Label18.Visible:=false;
katlist.Visible:=false;
lform.Caption:= 'скидка на шнур за период';
lform.Refresh;
datafrom.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'from'+chr(39));
datato.Value:=dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'to'+chr(39));

lform.Show;
end;

initialization

//main.Load(application);
//main.initproc(@scan);




end.
