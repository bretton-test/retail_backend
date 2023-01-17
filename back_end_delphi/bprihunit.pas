unit bprihunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmunit, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DB, OracleData,
  ExtCtrls, Buttons, Oracle,sunit;

type
  Tbprihform = class(TSForm)
    Panel1: TPanel;
    qschet: TOracleDataSet;
    qschetID: TIntegerField;
    qschetNAIMEN: TStringField;
    qschetBANK: TStringField;
    qschetRAS_SCH: TFloatField;
    qschetBANK_ID: TIntegerField;
    qschetDATE_OTKR: TDateTimeField;
    qschetDATE_ZAKR: TDateTimeField;
    sds: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    KONTRNAME: TDBEditEh;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    typoplaty: TDBComboBoxEh;
    Lshet: TDBLookupComboboxEh;
    datadok: TDBDateTimeEditEh;
    Label5: TLabel;
    Label4: TLabel;
    sumedit: TDBNumberEditEh;
    Label6: TLabel;
    komment: TDBEditEh;
    Label7: TLabel;
    docnom: TDBEditEh;
    Label8: TLabel;
    datanakl: TDBDateTimeEditEh;
    okbt: TBitBtn;
    cancbt: TBitBtn;
    insq: TOracleQuery;
    SpeedButton3: TSpeedButton;
    qkassorder: TOracleDataSet;
    kassds: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sumeditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure docnomEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure sumeditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okbtClick(Sender: TObject);
    procedure cancbtClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }


    procedure calc;

  public
    { Public declarations }

  procedure settip(const stip:byte;const nom:integer);
  end;

var
  bprihform: Tbprihform;
  tip:integer=0;
  kontragent :integer=0;
  nom:integer=0;
  doc:integer=0;
  reg:byte=1;
implementation

uses postunit, JurnUnit, messageunit;

{$R *.dfm}

procedure Tbprihform.settip(const stip:byte;const nom:integer);
 var ttip:integer;
 begin
 bprihunit.tip:=stip;
 if stip=3 then
 begin
 qkassorder.Close;
 qkassorder.SetVariable('nom',nom);
 qkassorder.Open;
 bprihunit.reg:=qkassorder.FieldByName('reg').AsInteger;
 If bprihunit.reg=1  then qkassorder.ReadOnly:=true  else qkassorder.ReadOnly:=false;
 ttip:=qkassorder.FieldByName('tip').AsInteger;
 If ttip=2  then
     begin
      tform(self).Caption:='Выписка из банка (расход)';

     with typoplaty.items do
     begin
     Clear;
     add('Оплата поставщику');
     add('Возврат поупателю');
     add('прочее');

     end;
     end;
     bprihunit.doc:=qkassorder.FieldValues['doc'];
     bprihunit.nom:=qkassorder.FieldValues['nom'];
     bprihunit.kontragent:=qkassorder.FieldValues['kontragent'];
     lshet.KeyValue:=qkassorder.FieldValues['schet'];
     lshet.DataSource:=kassds;
     lshet.DataField:='schet';
     datadok.DataSource:=kassds;
     datadok.DataField:='data';
     datanakl.DataSource:=kassds;
     datanakl.DataField:='d';
     docnom.DataSource:=kassds;
     docnom.DataField:='nn';
     kontrname.DataSource:=kassds;
     kontrname.DataField:='name';
     typoplaty.DataSource:=kassds;
     typoplaty.DataField:='osnov';
     sumedit.DataSource:=kassds;
     sumedit.DataField:='sum';
     komment.DataSource:=kassds;
     komment.DataField:='prim';

 end;
 end;

procedure Tbprihform.calc;
var x,y :integer;
 begin
 x:=(tform(self).Left+sumedit.Left);
 y:=(tform(self).Top+sumedit.Top);


 sumedit.Value:=dm.calc(x,y,sumedit.Value);


 end;


procedure Tbprihform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
qschet.Close;


Action:=caFree;
end;

procedure Tbprihform.SpeedButton1Click(Sender: TObject);
var post:integer;
begin
   If not assigned(postsprav)  then begin
    postsprav:=Tpostsprav.Create(tform(self),tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Поставщики';
     // postsprav.OnActivate(postsprav);

       post:=postsprav.ShowModal-100;

    if post>0 then
    begin
    kontragent:=post;
    kontrname.Text:=dmunit.postname
    end else begin
    kontragent:=0;
    kontrname.Text:='';
    end;
   end;
end;

procedure Tbprihform.SpeedButton2Click(Sender: TObject);
begin
 kontragent:=0;
 kontrname.Text:='';
end;

procedure Tbprihform.FormCreate(Sender: TObject);
begin

datadok.Value:=now;
tform(self).Width:=440;
tform(self).Height:=320;
insq.DeclareVariable('nom',otInteger);
insq.DeclareVariable('data',otDate);
insq.DeclareVariable('kontragent',otInteger);
insq.DeclareVariable('doc',otInteger);
insq.DeclareVariable('osnov',otString);
insq.DeclareVariable('sum',otFloat);
insq.DeclareVariable('tip',otInteger);
insq.DeclareVariable('reg',otInteger);
insq.DeclareVariable('prim',otString);
insq.DeclareVariable('schet',otInteger);
qschet.Open;
end;

procedure Tbprihform.sumeditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
calc;

end;

procedure Tbprihform.docnomEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
  var child:Tjurnform;
  begin
  child:=Tjurnform.Create(tform(self));
  child.FormStyle:=fsNormal;
  child.Visible:=false;
  child.Label1.Caption:='Общий Журнал';
  child.Caption:='Общий Журнал';
  child.Dbgrid.Columns[5].Title.caption:='Клиент';
  jurnunit.doc:=true;
 child.OnActivate(child);

  dm.FullJournal(child.Dbgrid);
  jurnform:=child;
  if doc<>0 then  dm.Qfullj.Locate('nom',doc,[]);
  If   child.ShowModal =mrok then
    begin
      docnom.Text:=inttostr(dmunit.nomerdok);
      doc:=dmunit.nom;
      datanakl.Value:=dmunit.datadok;
    end;

end;

procedure Tbprihform.sumeditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key =13 then calc;
end;

procedure Tbprihform.okbtClick(Sender: TObject);
begin



 If tip in [1,2]  then
 begin
  if sumedit.Value=0 then
  begin
  dm.addmemo('сумма равна нулю!');
  exit;
  end;
 if kontragent=0 then
  begin
  dm.addmemo('Выберите контрагента');
  exit;
  end;
if lshet.KeyValue=null then
  begin
  dm.addmemo('Выберите счет');
  exit;
  end;
         dmunit.datadok:=datadok.Value+time;
        If  dm.showtime then
        begin
        nom:=dm.newkod('prihseq');
        try
        if komment.Text='' then  komment.Text:='-';
        insq.SetVariable('nom',nom);
        insq.SetVariable('data',dmunit.datadok);
        insq.SetVariable('kontragent',kontragent);
        insq.SetVariable('doc',doc);
        insq.SetVariable('osnov',typoplaty.Value);
        insq.SetVariable('sum',sumedit.Value);
        insq.SetVariable('tip',tip);
        insq.SetVariable('reg',1);
        insq.SetVariable('prim',komment.Text);
        insq.SetVariable('schet',lshet.KeyValue);

        insq.Execute;
        dm.commit;
       except
        dm.rollback;
       end;

                    // dm.insKassa(kontragent,nom,tip,doc,dmunit.datadok,tipoplaty.Text,komment.Text,sumedit.Value,nds.Value,nsp.Value);
      end;

  end;
 If (bprihunit.tip=3) and (bprihunit.reg=0)  then If  MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
          If qkassorder.State<>dsbrowse then
          qkassorder.Post;
          dm.setreg(1,bprihunit.nom);
          dm.commit;
          dm.RefreshJournal;
          end;
 tform(self).Close;

 end;

procedure Tbprihform.cancbtClick(Sender: TObject);
begin
dm.rollback;
tform(self).Close;
end;

procedure Tbprihform.FormResize(Sender: TObject);
begin
if tform(sender).Height<306 then

 tform(sender).Height:=306;
if tform(sender).Width<420 then

 tform(sender).Width:=420;


okbt.Top:=tform(sender).Height-80;
cancbt.Top:=okbt.Top;
okbt.Left:=tform(sender).Width-160;
cancbt.Left:=tform(sender).Width-100;
end;

procedure Tbprihform.SpeedButton3Click(Sender: TObject);
begin
doc:=0;
docnom.Value:=null;
datanakl.Value:=null;
end;

end.
