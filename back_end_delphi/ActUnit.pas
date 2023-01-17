unit ActUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrlsEh, Mask, ExtCtrls, Grids, DBGridEh,
  DBClient, DB, OracleData, Provider, Oracle, DBLookupEh,sunit;
 type Estatus= (nNew,nSaved,nEdit,nReg);
type
  TActForm = class(TSForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Labelread: TLabel;
    numbedit: TDBNumberEditEh;
    dataed: TDBDateTimeEditEh;
    primed: TDBEditEh;
    Panel2: TPanel;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    DBGrid: TDBGridEh;
    selAct: TOracleDataSet;
    DataSource1: TDataSource;
    ClientDS: TClientDataSet;
    ClientDSOLDPLU: TFloatField;
    ClientDSONAME: TStringField;
    ClientDSNEWPLU: TFloatField;
    ClientDSNNAME: TStringField;
    ClientDSOLDPRICE: TFloatField;
    ClientDSNEWPRICE: TFloatField;
    ClientDSKOLVO: TFloatField;
    ClientDSSUM: TFloatField;
    Qsafeact: TOracleQuery;
    Qjourn: TOracleDataSet;
    sklad: TDBLookupComboboxEh;
    Label4: TLabel;
    Qsafeprice: TOracleQuery;
    PrintB: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridColumns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridColumns3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure ClientDSBeforePost(DataSet: TDataSet);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrintBClick(Sender: TObject);
    procedure ClientDSNewRecord(DataSet: TDataSet);


  private
    { Private declarations }
     nom:integer;
     status:Estatus;
     edit :boolean;
     part:integer;
    KKMED_IZM: TStringField;
    KKMNDS: TFloatField;
    KKMNSP: TFloatField;
      function Save:boolean;
      procedure LoadData(const nom:integer;const plu:integer);
  public
    { Public declarations }
     procedure New;
     procedure Open(const nom:integer);
  end;

var
  ActForm: TActForm;

implementation

uses dmunit, kartunit, messageunit, tranzUnit, about;

{$R *.dfm}

procedure TActForm.FormCreate(Sender: TObject);
begin
  edit:=false;


 end;

procedure TActForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Action:=caFree;
end;

procedure TActForm.LoadData(const nom:integer;const plu:integer);
var  TempProvider:TDataSetProvider;
begin
  TActForm(self).nom:=nom;
  selact.SetVariable('nom',nom);
  selact.Open;


  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=selact;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
  ClientDS.Open;
  ClientDS.Locate('oldplu',plu,[]);
  selact.Close;
  TActForm(self).Caption:='Акт Переоценки № '+inttostr(nom);
  tactform(self).OnActivate(self);

 end;

procedure TActForm.New;
 var nom:integer;
 begin
   nom:=dm.newkod('PRIHSEQ');
   part:=dm.newkod('partseq');
   numbedit.Text:=inttostr(nom);
   dataed.Value:=now;
   status:=nnew;
   sklad.KeyValue:=1;
   loaddata(nom,0);
 end;


procedure TActForm.DBGridColumns1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
 if status=nreg then exit;
 if not assigned(KartForm) then  KartForm:=TKartForm.Create(application,tsform(self).mybar);
 if clientds.State=dsBrowse then clientds.Edit;


 kartform.setvybor(clientdsoldplu,clientdsoname,clientdsoldprice,kkmed_izm,kkmnds,tform(self),kkmnsp);


 KartForm.Show;
  if clientdsoldplu.AsString<>'' then
  begin

  if not dm.LocateTovar(clientdsoldplu.AsInteger)
     then
       begin
        dm.nofilter;
        dm.LocateTovar(clientdsoldplu.AsInteger);
       end;

  end;


end;

procedure TActForm.DBGridColumns3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
 if status=nreg then exit;
  if not assigned(KartForm) then  KartForm:=TKartForm.Create(application,tsform(self).mybar);
 if clientds.State=dsBrowse then clientds.Edit;
 kartform.setvybor(clientdsnewplu,clientdsnname,clientdsnewprice,kkmed_izm,kkmnds,tform(self),kkmnsp);


 KartForm.Show;
  if clientdsnewplu.AsString<>'' then

  begin

  if not  dm.LocateTovar(clientdsnewplu.AsInteger)
      then
       begin
       dm.nofilter;
       dm.LocateTovar(clientdsnewplu.AsInteger);
       end;
  end;




end;

procedure TActForm.ClientDSBeforePost(DataSet: TDataSet);
begin
if ClientDSOLDPLU.AsInteger=ClientDSNEWPLU.AsInteger then
begin
dm.addmemo('для переоценки товара используйте: Документы->Склад->Переоценка ');
 ClientDs.Cancel;

 IF (ClientDS.State=dsBrowse) and
    (ClientDSOLDPLU.AsInteger=ClientDSNEWPLU.AsInteger)
    and (not  ClientDS.ReadOnly)
    then ClientDS.Delete;


   exit;
 end;

ClientDSsum.AsCurrency:=(ClientDSNEWPRICE.AsCurrency-ClientDSOLDPRICE.AsCurrency)*ClientDSKOLVO.AsFloat;
 edit:=true;
end;

procedure TActForm.okClick(Sender: TObject);

begin
if status in [nreg] then exit;
   if  (status in [nedit,nnew]) and (MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
        begin
              If primed.Text=''  then primed.Text:='-';
              if save then
                         begin
                         dm.commit;
                         status:=nSaved;
                        if MessageDlg(messageunit.m19,
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          begin
                          tranzunit.ActPereozenky(nom);
                          status:=nreg;
                          end else exit;




                         end else dm.rollback;


        end;
  if (status=nsaved) and  (MessageDlg(messageunit.m19,
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                          begin
                          tranzunit.ActPereozenky(nom);
                          status:=nreg;
                          end;



end;

function TActForm.Save:boolean;
begin
 result :=false;
 if ClientDS.State in [dsedit,dsinsert] then ClientDS.Post;
 if clientds.RecordCount=0 then exit;
    clientds.First;
   dm.ExecuteSQL('delete from tmp.actprice where nom='+inttostr(nom));
    while not clientds.Eof do
      begin
        Qsafeact.SetVariable('nom',nom);
        Qsafeact.SetVariable('oldplu',ClientDSOLDPLU.AsString);
        Qsafeact.SetVariable('newplu',ClientDSNEWPLU.AsString);
        Qsafeact.SetVariable('oldprice',ClientDSOLDPrice.AsCurrency);
        Qsafeact.SetVariable('newprice',ClientDSnewPrice.AsCurrency);
        Qsafeact.SetVariable('kolvo',ClientDSkolvo.AsCurrency);
        Qsafeact.SetVariable('sum',ClientDSsum.AsCurrency);
        Qsafeact.Execute;
        clientds.Next;
      end;
   dm.ExecuteSQL('delete from tmp.actpricej where nom='+inttostr(nom));
    Qsafeprice.SetVariable('nom',nom);
    Qsafeprice.SetVariable('data',int(dataed.Value)+time);
    Qsafeprice.SetVariable('sum',dbgrid.SumList.SumCollection.Items[0].SumValue);
    Qsafeprice.SetVariable('komment',primed.Text);
    Qsafeprice.SetVariable('sklad',sklad.KeyValue);
    Qsafeprice.SetVariable('part',part);
    Qsafeprice.Execute;


   edit:=false;
  result:=true;
end;





procedure TActForm.cancelClick(Sender: TObject);
begin
 if (status in [nNew,nEdit]) and (edit) then
    begin

       if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
              If primed.Text=''  then primed.Text:='-';
              if save then
                         begin
                         dm.commit;
                         status:=nSaved;
                         if MessageDlg(messageunit.m19,
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          tranzunit.ActPereozenky(nom);

                         end else dm.rollback;


        end;




   status:=nSaved;

   end;

  Tactform(self).Close;



end;

procedure TActForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (status in [nNew,nEdit]) and (edit) then
 begin
 CanClose:=false;
 ok.Click;
 end else CanClose:=true;

 end;

procedure TActForm.Open(const nom:integer);
 begin

    tActform(self).nom:=nom;
   numbedit.Text:=inttostr(nom);
    Qjourn.SetVariable('nom',nom);
    Qjourn.Open;
    if Qjourn.RecordCount>0 then
    begin
     loaddata(nom,0);
     dataed.Value:=Qjourn.FieldValues['data'];
     primed.Text:=Qjourn.FieldValues['komment'];
     sklad.KeyValue:=Qjourn.FieldValues['skladid'];
     part:=Qjourn.FieldValues['part'];
     if Qjourn.FieldValues['reg']>0 then
                        begin
                         labelread.Visible:=true;
                         sklad.ReadOnly:=true;
                         clientds.ReadOnly:=true;
                         status:=nreg;
                        end else  status:=nedit;
    Qjourn.Close;
    end else
        begin
         status:=nreg;
         tActform(self).Close;

        end;
 end;


procedure TActForm.PrintBClick(Sender: TObject);
begin
if status<>nreg then dm.addmemo(messageunit.m17 ) else
aboutbox.printakt(nom);
end;

procedure TActForm.ClientDSNewRecord(DataSet: TDataSet);
begin
ClientDSKOLVO.Value:=0;
end;

end.
