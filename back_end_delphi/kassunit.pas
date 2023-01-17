unit kassunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, DBCtrlsEh, StdCtrls, Buttons,db,sunit;

type
  Tkassform = class(TSForm)
    Panel1: TPanel;
    Label1: TLabel;
    tipoplaty: TDBComboBoxEh;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    datadok: TDBDateTimeEditEh;
    Label5: TLabel;
    Label6: TLabel;
    sumedit: TDBNumberEditEh;
    docnom: TDBEditEh;
    Label7: TLabel;
    datanakl: TDBDateTimeEditEh;
    Label8: TLabel;
    NDS: TDBNumberEditEh;
    NSP: TDBNumberEditEh;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    komment: TDBEditEh;
    KONTRNAME: TDBEditEh;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sumeditEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure docnomEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tip:integer=1;
  kassform: Tkassform;
  kontragent :integer=0;
  nom:integer=0;
  doc:integer=0;
  reg:byte=0;
implementation

uses dmunit, postunit, JurnUnit, messageunit;

{$R *.dfm}

procedure Tkassform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If tip=3 then dm.qkassorder.Close; 

  action:=caFree;

end;

procedure Tkassform.SpeedButton1Click(Sender: TObject);
var post:integer;
begin
   If not assigned(postsprav)  then begin
    postsprav:=Tpostsprav.Create(tform(self),tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Поставщики';
      //postsprav.OnActivate(postsprav);

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

procedure Tkassform.sumeditEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
 var x,y :integer;


 begin
 x:=(kassform.Left+sumedit.Left);
 y:=(kassform.Top+sumedit.Top);


 sumedit.Value:=dm.calc(x,y,sumedit.Value);

end;

procedure Tkassform.FormDestroy(Sender: TObject);
begin
kassform:=nil;

end;

procedure Tkassform.SpeedButton2Click(Sender: TObject);
begin
 kontragent:=0;
    kontrname.Text:='';
end;

procedure Tkassform.FormCreate(Sender: TObject);
begin

datadok.Value:=now;
end;

procedure Tkassform.docnomEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var child:Tjurnform;
begin
  child:=Tjurnform.Create(tform(self),tsform(self).mybar);
 if reg=0 then
  begin
  child.FormStyle:=fsNormal;
  child.Visible:=false;
  end;
  child.Label1.Caption:='Общий Журнал';
  child.Caption:='Общий Журнал';
  child.Dbgrid.Columns[5].Title.caption:='Клиент';
  jurnunit.doc:=true;
  child.OnActivate(child);

  dm.FullJournal(child.Dbgrid);
  jurnform:=child;
  if doc<>0 then  dm.Qfullj.Locate('nom',doc,[]);
   if (reg=0) and
     (child.ShowModal =mrok) then
    begin
      docnom.Text:=inttostr(dmunit.nomerdok);
      doc:=dmunit.nom;
      datanakl.Value:=dmunit.datadok;
    end else child.Show;

end;

procedure Tkassform.BitBtn2Click(Sender: TObject);
begin
kassform.Close;
end;

procedure Tkassform.BitBtn1Click(Sender: TObject);
begin
  If tip in [1,2]  then
          begin
          dmunit.datadok:=datadok.Value+time;
          If  dm.showtime then
            begin
             nom:=dm.newkod('prihseq');
             dm.insKassa(kontragent,nom,tip,doc,dmunit.datadok,tipoplaty.Text,komment.Text,sumedit.Value,nds.Value,nsp.Value);
            end;

  end;
  If (tip=3) and (reg=0)  then If  MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
          If dm.qkassorder.State<>dsbrowse then
          dm.qkassorder.Post;
          dm.setreg(1,nom);
          dm.commit;
          dm.RefreshJournal;
          end;

kassform.Close;
end;

procedure Tkassform.SpeedButton3Click(Sender: TObject);
begin
doc:=0;
docnom.Value:=null;
datanakl.Value:=null;
end;

end.
