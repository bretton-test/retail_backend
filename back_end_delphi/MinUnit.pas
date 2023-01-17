unit MinUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit, Grids, DBGridEh, ExtCtrls, Buttons, DBCtrlsEh, DBLookupEh,
  StdCtrls, Mask, DB, OracleData,Provider, DBClient, Oracle;
type TState=(newempty,newedit,newsaved,old,oldedit,oldsaved,registred);
type

  TMinForm = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    Label5: TLabel;
    numbedit: TDBNumberEditEh;
    Label2: TLabel;
    dataed: TDBDateTimeEditEh;
    Label1: TLabel;
    Sklad: TDBLookupComboboxEh;
    Label3: TLabel;
    primed: TDBEditEh;
    Labelread: TLabel;
    ds: TDataSource;
    qMinus: TOracleDataSet;
    ClientDS: TClientDataSet;
    ClientDSmPLU: TFloatField;
    ClientDSONAME: TStringField;
    ClientDSPPLU: TFloatField;
    ClientDSNNAME: TStringField;
    ClientDSMPRICE: TFloatField;
    ClientDSPPRICE: TFloatField;
    ClientDSKOLVO: TFloatField;
    ClientDSSUM: TFloatField;
    DBGrid: TDBGridEh;
    Qselmin: TOracleDataSet;
    QselminPLU: TFloatField;
    QselminNAME: TStringField;
    QselminCENA: TFloatField;
    QselminSUM: TFloatField;
    SelBut: TSpeedButton;
    Qsafeact: TOracleQuery;
    Qsafeprice: TOracleQuery;
    Qjourn: TOracleDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    
    procedure ClientDSBeforePost(DataSet: TDataSet);
    procedure SelButClick(Sender: TObject);
    procedure DBGridColumns3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ClientDSAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  nom:integer;
  State:Tstate;
    KKMED_IZM: TStringField;
    KKMNDS: TFloatField;
    KKMNSP: TFloatField;
  procedure LoadData(const nom:integer;const plu:integer);
  function Save:boolean;
  public
    { Public declarations }

  PROCEDURE New;
  procedure Open(const nom:integer);
  end;

var
  MinForm: TMinForm;

implementation

uses dmunit, kartunit, messageunit, tranzUnit;

{$R *.dfm}

procedure TMinForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TMinForm.FormDestroy(Sender: TObject);
begin
minform:=nil;
end;


{-----------------------------------------------------------------}
procedure TMinForm.New;
 begin
   nom:=dm.newkod('PRIHSEQ');
   numbedit.Text:=inttostr(nom);
   dataed.Value:=now;
   state:=newempty;
   sklad.KeyValue:=1;
   loaddata(nom,0);
 end;
{------------------------------------------------------------------}
procedure Tminform.LoadData(const nom:integer;const plu:integer);
var  TempProvider:TDataSetProvider;
begin
  qminus.SetVariable('nom',nom);
  qminus.Open;
  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=qminus;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
  ClientDS.Open;
  ClientDS.Locate('mplu',plu,[]);
  qminus.Close;


end;

procedure TMinForm.ClientDSBeforePost(DataSet: TDataSet);
begin
ClientDSSUM.AsCurrency:=(ClientDSMPRICE.AsCurrency-ClientDSPPRICE.AsCurrency)*ClientDSKOLVO.AsFloat;


case state of
  old,oldsaved:      state:=oldedit;
  newempty,newsaved: state:=newedit;

end;
end;
{--------------------------------------------------------------------}
procedure TMinForm.SelButClick(Sender: TObject);
begin
if state = newempty
then
begin
 Qselmin.Close;
 Qselmin.SetVariable('data',int(dataed.Value)+0.99999);
 Qselmin.Open;
 if Qselmin.RecordCount=0 then begin
                                  qselmin.Close;
                                  dm.addmemo('нет данных');
                                  exit;
                               end;
  Qselmin.First;
  while not Qselmin.Eof do
    begin
     try
      ClientDS.Insert;
      ClientDSmPLU.AsInteger:=QselminPLU.AsInteger;
      ClientDSONAME.Value:=QselminNAME.Value;
      ClientDSMPRICE.AsCurrency:=QselminCENA.AsCurrency;
      ClientDSKOLVO.AsFloat:=-1*QselminSUM.AsFloat;
      ClientDSPPLU.AsInteger:=0;
      ClientDSNNAME.Value:='-';
      ClientDSPPRICE.Value:=0;

      ClientDS.Post;

     except
      qselmin.Close;
      if ClientDS.State<>dsBrowse then ClientDS.Cancel;
      raise;
      end;
     Qselmin.Next;
    end;
   dataed.ReadOnly:=true;
  qselmin.Close;
end ;
end;

procedure TMinForm.DBGridColumns3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
 if state in [registred,newempty] then exit;
  if not assigned(KartForm) then  KartForm:=TKartForm.Create(application,tsform(self).mybar);
 if clientds.State=dsBrowse then clientds.Edit;
 kartform.setvybor(clientdspplu,clientdsnname,clientdspprice,kkmed_izm,kkmnds,tform(self),kkmnsp);
 kartform.Caption:=ClientDSONAME.AsString+' '+ClientDSMPRICE.AsString;

 KartForm.Show;
  if clientdspplu.AsString<>'' then

  begin

  if not  dm.LocateTovar(clientdspplu.AsInteger)
      then
       begin
       dm.nofilter;
       dm.LocateTovar(clientdspplu.AsInteger);
       end;
  end;
end;
{--------------------------------------------------------------------}


function TMinForm.Save:boolean;
begin
 result :=false;
 if ClientDS.State in [dsedit,dsinsert] then ClientDS.Post;
 if clientds.RecordCount=0 then exit;
    clientds.First;
   dm.ExecuteSQL('delete from tmp.tminus where nom='+inttostr(nom));
    while not clientds.Eof do
      begin
        Qsafeact.SetVariable('nom',nom);
        Qsafeact.SetVariable('mplu',ClientDSMPLU.AsString);
        Qsafeact.SetVariable('pplu',ClientDSPPLU.AsString);
        Qsafeact.SetVariable('mprice',ClientDSMPrice.AsCurrency);
        Qsafeact.SetVariable('pprice',ClientDSPPrice.AsCurrency);
        Qsafeact.SetVariable('kolvo',ClientDSkolvo.AsCurrency);
        Qsafeact.SetVariable('sum',ClientDSsum.AsCurrency);
        Qsafeact.Execute;
        clientds.Next;
      end;
   dm.ExecuteSQL('delete from tmp.tminusj where nom='+inttostr(nom));
    Qsafeprice.SetVariable('nom',nom);
    Qsafeprice.SetVariable('data',int(dataed.Value)+0.99999);
    Qsafeprice.SetVariable('sum',dbgrid.SumList.SumCollection.Items[0].SumValue);
    Qsafeprice.SetVariable('komment',primed.Text);
    Qsafeprice.SetVariable('sklad',sklad.KeyValue);
    Qsafeprice.Execute;

    result:=true;
end;




procedure TMinForm.okClick(Sender: TObject);
begin
if state in [registred,newempty] then exit;

   if state in [newedit,oldedit]
   then
   begin
    if (MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
              If primed.Text=''  then primed.Text:='-';
              if save then
                         begin
                         dm.commit;
                          case state of
                          oldedit:      state:=oldsaved;
                          newedit:      state:=newsaved;

                          end;

                         end else dm.rollback;
        end   else
       begin
       state:=oldsaved;
       exit;
       end;
    end;
     if (state in [newsaved,old,oldsaved]) and (MessageDlg(messageunit.m19,
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                          begin
                          if  tranzunit.ActPeresortiza(nom)
                            then
                            begin
                             state:=registred;
                             ClientDS.ReadOnly:=true;
                             Labelread.Visible:=true;
                             end;
                          end else exit;





end;

procedure TMinForm.cancelClick(Sender: TObject);
begin
 if state in [newedit,oldedit]
   then ok.Click;

  MinForm.Close;

end;

procedure TMinForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if state in [newedit,oldedit] then
 begin
 CanClose:=false;
 ok.Click;
 end else CanClose:=true;

end;
{------------------------------------------------------------------}
procedure TMinForm.Open(const nom:integer);
  begin
     tminform(self).nom:=nom;
   numbedit.Text:=inttostr(nom);
    Qjourn.SetVariable('nom',nom);
    Qjourn.Open;
    if Qjourn.RecordCount>0 then
    begin
     dataed.ReadOnly:=true;
     dataed.Value:=Qjourn.FieldValues['data'];
     primed.Text:=Qjourn.FieldValues['komment'];
     sklad.KeyValue:=Qjourn.FieldValues['skladid'];
      if Qjourn.FieldValues['reg']>0 then
                        begin
                         labelread.Visible:=true;
                         sklad.ReadOnly:=true;
                         clientds.ReadOnly:=true;
                         state:=registred;
                        end else  state:=old;

    end else
        begin

         state:=newempty;
        end;
 Qjourn.Close;
 loaddata(nom,0);
  end;

procedure TMinForm.ClientDSAfterDelete(DataSet: TDataSet);
begin
case state of
  old,oldsaved:      state:=oldedit;
  newempty,newsaved: state:=newedit;

end;
end;

end.
