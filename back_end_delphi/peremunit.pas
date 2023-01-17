unit peremunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh, ComCtrls, StdCtrls,
  Grids, DBGridEh,db, Buttons,sunit;

type
  TPeremform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    numbered: TEdit;
    Label2: TLabel;
    datanakl: TDateTimePicker;
    Label3: TLabel;
    osnedit: TEdit;
    Label4: TLabel;
    skladout: TDBLookupComboboxEh;
    skladin: TDBLookupComboboxEh;
    Label5: TLabel;
    dbgrid: TDBGridEh;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    BitBtn3: TBitBtn;
    Labelread: TLabel;
    PrintB: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure numberedChange(Sender: TObject);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridColumns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure datanaklChange(Sender: TObject);
    procedure skladoutChange(Sender: TObject);
    procedure skladinChange(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
  private
    { Private declarations }
   procedure showtovar;
   procedure SetReadOnly;
  public
    { Public declarations }
   reg:integer;
   procedure getold;
  end;

var
  Peremform: TPeremform;

implementation

uses dmunit, kartunit, tranzUnit, messageunit, about;

{$R *.dfm}

 procedure TPeremform.SetReadOnly;
  begin

    if peremform.reg=1 then
  begin
   numbered.ReadOnly:=true;
   datanakl.Enabled:=false;
   osnedit.ReadOnly:=true;
   skladout.ReadOnly:=true;
    skladin.ReadOnly:=true;
    Labelread.Visible:=true;
  end;


  end;

 procedure TPeremform.getold;
 begin

 SetReadOnly;


  if dmunit.postname<>'' then
 begin

 datanakl.Date:=dmunit.datadok;
 //numbered.Text:=inttostr(dmunit.nomerdok);
 skladin.KeyValue:=dmunit.skladin;
 skladout.KeyValue:=dmunit.sklad;
 end;
end;
 //---------------------------------------------------------------
procedure TPeremform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Tdatasource(dbgrid.DataSource).DataSet.Close;
dm.delnakl;

Action:=caFree;

end;

procedure TPeremform.FormDestroy(Sender: TObject);
begin
  Peremform:=nil;
end;

procedure TPeremform.FormCreate(Sender: TObject);
begin
//datanakl.MinDate:=dmunit.pbegin;
//datanakl.MaxDate:=dmunit.pend;
Tform(sender).Left:=0;
Tform(sender).top:=0;
Tform(sender).Width:=APPLICATION.MainForm.Width-25;//MainForm.ClientWidth-25;
Tform(sender).Height:=APPLICATION.MainForm.Height-100;


datanakl.Date:=date;
datanakl.Time:=Time;
dmunit.datadok:=now;
dmunit.post:=0;
dmunit.sklad:=0;
dm.opentemp(0);


end;

procedure TPeremform.numberedChange(Sender: TObject);
begin
try
dmunit.nomerdok:=strtoint(Tedit(sender).Text);
dm.setedit;
except
 numbered.Text:='';
end;

end;

procedure TPeremform.dbgridKeyPress(Sender: TObject; var Key: Char);
begin
 if (dm.setedit) and(dbgrid.Col=1) and (ord(key)=13) then

       showtovar
  
    else If ord(key)=13  then  dm.tempPost;


end;
//------------------------------------------------------
procedure Tperemform.showtovar;
  begin
      if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(tform(self),tsform(self).mybar);

         end;

          KartForm.Show;
          dm.findtovar;


  end;

procedure TPeremform.dbgridColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if dm.setedit  then
    begin
   dm.seteditnakl;

    showtovar;

    end;
end;
procedure TPeremform.datanaklChange(Sender: TObject);
begin
dmunit.datadok:=TDateTimePicker(sender).DateTime;
end;

procedure TPeremform.skladoutChange(Sender: TObject);
begin
dmunit.sklad:=skladout.KeyValue;
dm.setedit;

end;

procedure TPeremform.skladinChange(Sender: TObject);
begin
dmunit.skladin:=skladin.KeyValue;
dm.setedit;
end;

procedure TPeremform.okClick(Sender: TObject);
begin
dm.commit;
if numbered.Text='' then begin
                        dm.addmemo(messageunit.m32);

                         exit;
                        end;

 if (skladin.Text='') or (skladout.text='')  then begin
                        dm.addmemo(messageunit.m15);

                         exit;
                        end;



If (dmunit.tipdok=5) and (dm.setedit)  then
if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin


If dm.showtime then
        begin
        dm.insertperem(osnedit.Text);
        if MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
         tranzunit.Perem(dmunit.nom);//dm.peremprovodka;
            peremform.reg:=1;
         end;
         end;




end;
If (dmunit.tipdok=6) and (dm.setedit)  then
if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
        dm.insertperem(osnedit.Text);
        if MessageDlg(messageunit.m19,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin

            tranzunit.Perem(dmunit.nom);//dm.peremprovodka;
            peremform.reg:=1;
         end;
        end;



   SetReadOnly;

 dm.RefreshJournal;

//dm.delnakl;
//dm.closetemp;
//peremform.Close;

end;

procedure TPeremform.cancelClick(Sender: TObject);
begin

dm.rollback;
dm.delnakl;
dm.closetemp;
peremform.Close;
end;

procedure TPeremform.BitBtn3Click(Sender: TObject);
begin
showtovar;
end;

procedure TPeremform.PrintBClick(Sender: TObject);
begin
 if peremform.reg=1 then
 aboutbox.printperem(dmunit.nom);
end;

end.
