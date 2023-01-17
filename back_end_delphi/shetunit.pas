unit shetunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData,dmunit,sunit;

type
  Tshetform = class(TSForm)
    qschet: TOracleDataSet;
    sds: TDataSource;
    DBGridEh1: TDBGridEh;
    qschetID: TIntegerField;
    qschetNAIMEN: TStringField;
    qschetRAS_SCH: TFloatField;
    qschetBANK_ID: TIntegerField;
    qschetDATE_OTKR: TDateTimeField;
    qschetDATE_ZAKR: TDateTimeField;
    qschetBANK: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure qschetNewRecord(DataSet: TDataSet);
    procedure qschetAfterPost(DataSet: TDataSet);
    procedure DBGridEh1Columns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  isclose:boolean;
  public
    { Public declarations }
  end;

var
  shetform: Tshetform;

implementation

uses  Bankunit, MAIN;

{$R *.dfm}

procedure Tshetform.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 qschet.Close;

isclose:=true;
Action:=caFree;
end;

procedure Tshetform.FormDestroy(Sender: TObject);
begin
if not isclose then begin
qschet.Close;


end;

shetform:=nil;
end;

procedure Tshetform.qschetNewRecord(DataSet: TDataSet);
begin
qschetid.Value:=dm.newkod('schetseq');
end;

procedure Tshetform.qschetAfterPost(DataSet: TDataSet);
begin
qschet.RefreshRecord;
end;

procedure Tshetform.DBGridEh1Columns1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var   IP:Pint; sp:Pstr;
 begin
new(ip);
new(sp);
 try
ip^:=0;
sp^:='';
 If not assigned(bankform)   then
  begin
  bankform:=tbankform.Create(self,tsform(self).mybar);

  end;
// bankform.FormStyle:=fsNormal;
// bankform.Visible:=false;

bankform.setRecviz(ip,sp,qschetbank_id.Value);
bankform.FormStyle:=fsnormal;
bankform.Visible:=false;
bankform.ShowModal;
if ip^<>0 then begin
  if  qschet.State=dsBrowse then qschet.edit;
  qschetbank_id.Value:=ip^;
  qschetbank.Value:=sp^;
 end;
finally
dispose(ip);
 dispose(sp);
end;
 end;

procedure Tshetform.FormCreate(Sender: TObject);
begin


qschet.Open;
isclose:=false;
end;

end.
