unit Spisunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, DBCtrlsEh, DBLookupEh, StdCtrls, Mask,
  Buttons,DB,sunit, FiltrUnit;

type
  TSpForm = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid: TDBGridEh;
    Label5: TLabel;
    numbedit: TDBNumberEditEh;
    Label2: TLabel;
    dataed: TDBDateTimeEditEh;
    Label1: TLabel;
    Skladed: TDBLookupComboboxEh;
    Label3: TLabel;
    primed: TDBEditEh;
    Labelread: TLabel;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    Label4: TLabel;
    osned: TDBEditEh;
    Fillbtn: TBitBtn;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    prbut: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure dataedChange(Sender: TObject);
    procedure SkladedChange(Sender: TObject);
    procedure osnedEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FillbtnClick(Sender: TObject);
    procedure DBGridColumns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure prbutClick(Sender: TObject);
  private
    { Private declarations }

   Filtr:TFiltrform;
  procedure  showtovar;
  public
  procedure Setnom(const nom,tip:integer);
    { Public declarations }
  end;

var
  SpForm: TSpForm;
  insert:boolean=false;
  new:boolean=true;
  reg:boolean=true;
  tipnakl:byte=0;
implementation

uses dmunit, JurnUnit, kartunit, tranzUnit, messageunit, about;

{$R *.dfm}

procedure  TSpform.showtovar;
 begin


  if not assigned(KartForm) then
   begin
    KartForm:=TKartForm.Create(tform(self),tsform(self).mybar);
    //DM.openkatalog;
    
    end;
         KartForm.Show;
         dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger;
         dm.tovargetmark;
   If not reg  then   dm.invedit(Tdataset(dbgrid.DataSource.DataSet));

end;
//----------------------------------------------------------------


procedure  TSpform.Setnom(const nom,tip:integer);
 var DS:Tdatasource;
  begin
   dataed.Value:=now;
   numbedit.Value:=nom;
   //dmunit.datadok:=now;
   tipnakl:=tip;
   ds:=dm.opentmz(nom,tip);
   If tip=2  then  begin
   // dbgrid.Columns[4].Visible:=false;
   // dbgrid.Columns[5].Visible:=false;
   // dbgrid.FooterRowCount:=0;
   end;
  If ds<>nil  then
        begin
          new:=false;
          case  ds.DataSet.FieldValues['reg'] of
          0: reg:=false;
          1: reg:=true;
          end;

          osned.DataSource:=ds;
          osned.DataField:='osdoc';
          numbedit.DataSource:=DS;
          numbedit.DataField:='nom';
          dataed.ReadOnly:=reg;
          skladed.ReadOnly:=reg;
          dataed.DataSource:=ds;
          dataed.DataField:='data';
          dmunit.osndoc:=ds.DataSet.FieldValues['osnov'];
          dmunit.datadok:=ds.DataSet.FieldValues['data'];
          skladed.DataSource:=ds;
          skladed.DataField:='skladid';
          dmunit.skladinv:=ds.DataSet.FieldValues['skladid'];
          skladed.ListFieldIndex:=ds.DataSet.FieldValues['skladid'];
          primed.DataSource:=ds;
          primed.DataField:='komment';
        end else begin
         reg:=false;
         insert:=false;
         new:=true;
        end;
        labelread.Visible:=reg;
        dbgrid.ReadOnly:=reg;
 end;
//-------------------------------------------------------------------







procedure TSpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//If primed.DataSource.Name<>''  then  Tdatasource(primed.DataSource).DataSet.Close;
//if assigned(filtr) then  filtr.Close;
Tdatasource(dbgrid.DataSource).DataSet.Close;

Action:=caFree;
end;

procedure TSpForm.FormDestroy(Sender: TObject);
begin
Spform:=nil;
end;

procedure TSpForm.dataedChange(Sender: TObject);
begin
dmunit.datadok:=int(dataed.Value)+time;

end;

procedure TSpForm.SkladedChange(Sender: TObject);
begin
if skladed.KeyValue<>null then  dmunit.skladtmz:=skladed.KeyValue;

end;

procedure TSpForm.osnedEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var child:Tjurnform;
begin
If not reg   then
begin
  child:=Tjurnform.Create(tform(self),tsform(self).mybar);
  child.FormStyle:=fsNormal;
  child.Visible:=false;
//  child.Label1.Caption:='Общий Журнал';
 // child.Caption:='Общий Журнал';
    child.Label1.Caption:='Журнал Инвентаризации';
  child.Caption:=child.Label1.Caption;




  child.Dbgrid.Columns[5].Title.caption:='Клиент';
  jurnunit.doc:=true;

   dm.InvJournal(child.Dbgrid);
  //dm.FullJournal(child.Dbgrid);
  jurnform:=child;

   If   child.ShowModal =mrok then
    begin

     dataed.Value:=dmunit.datadok;
    //dataed.OnChange(application);
    osned.Text:=dmunit.osntext;

    end;
   tform(self).OnActivate(self);
end;
end;

procedure TSpForm.FillbtnClick(Sender: TObject);
 var DS:Tdatasource;
begin

If dmunit.osndoc<>0 {and (dm.TipNakl(dmunit.osndoc)=6)}
  then ds:=dm.openinvent(dmunit.osndoc,true)
                     else begin
                     dm.addmemo(messageunit.m16);
                     exit;
                     end;
If ds=nil   then  exit;

 If  ds.DataSet.FieldValues['reg']<>1  then
                     begin
                     dm.addmemo(messageunit.m17);
                     exit;
                     end;


  skladed.KeyValue:=ds.DataSet.FieldValues['skladid'];
  dmunit.skladtmz:=ds.DataSet.FieldValues['skladid'];
  If not insert  then  dm.insertspisanie(tipnakl);

  insert:=true;
end;

procedure TSpForm.DBGridColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
 showtovar;
end;

procedure TSpForm.DBGridKeyPress(Sender: TObject; var Key: Char);
var temp:string;
begin
 if (dbgrid.SelectedField.FieldName='NAME') and (ord(key)=13) then   showtovar;


 if
 (ord(key)>31) then
  begin

    temp:=filtr.PutChar(key);
    if temp<>'' then
        begin
        if dbgrid.SelectedField.FieldName='NAME' then
         begin
         dm.Qtmc.Locate('name',temp,[loCaseInsensitive, loPartialKey]);
         end;
         if dbgrid.SelectedField.FieldName='PLU' then
         begin
         dm.Qtmc.Locate('PLU',temp,[loCaseInsensitive]);
         end;

    end;
  end;


 end;

procedure TSpForm.okClick(Sender: TObject);
begin

If not reg  then
if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
                // If new  then  dm.showtime;
                dm.showtime;
                try
                dm.safespis(primed.Text,tipnakl,dbgrid.SumList.SumCollection.Items[0].sumvalue);
                dm.commit;
                new:=false;
                except
                dm.rollback;
              end;
               try
                if MessageDlg(messageunit.m19,
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
               cancel.Enabled:=false;
                        case tipnakl of
                        2: tranzunit.Spisanie(dmunit.tmznom,label6,dmunit.osndoc<>0);
                        3: tranzunit.Priemka(dmunit.tmznom,dmunit.osndoc<>0);
                        end;
                 dm.commit;
               reg:=true;
              dm.Qtmc.ReadOnly:=true;
              cancel.Enabled:=true;
              end;
              except
               cancel.Enabled:=true;
              dm.rollback;
             end;
        end ;



end;

procedure TSpForm.cancelClick(Sender: TObject);
begin
 dm.rollback;
  Spform.Close;
end;

procedure TSpForm.SpeedButton1Click(Sender: TObject);
begin
If not reg  then  osned.Text:='';
dmunit.osndoc:=0;
dmunit.osntext:='';
//label4.Caption:=floattostr(dbgrid.SumList.SumCollection.Items[0].sumvalue);
end;

procedure TSpForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Canclose:=cancel.Enabled;
end;

procedure TSpForm.FormCreate(Sender: TObject);
begin
filtr:=TFiltrform.Create(tform(self));
Filtr.SetKoords(panel3);

end;

procedure TSpForm.BitBtn1Click(Sender: TObject);
begin
showtovar;
end;

 procedure TSpForm.prbutClick(Sender: TObject);
begin


  dm.QtmzJ.Close;
  dm.QtmzJ.SetVariable('nom',dmunit.tmznom);
  dm.QtmzJ.SetVariable('tip',tipnakl);
  dm.QtmzJ.Open;
   dm.Qtmc.Open;
   if tipnakl=2 then
 begin
 AboutBox.setreport(dm.Qtmc,nil,nil,nil,'\reports\frTorg15sm.frf');

 end
 else
   AboutBox.setreport(dm.Qtmc,nil,nil,nil,'\reports\frTorg-12_2.frf');

  dm.Qtmc.Open;
 end;

end.
