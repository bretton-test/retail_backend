unit FindUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData,Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Buttons, SpeedForm,strutils,sunit;

type
  TFindForm = class(TSForm)
    Panel1: TPanel;
    DBGrid: TDBGridEh;
    Qfind: TOracleDataSet;
    DataSource1: TDataSource;
    NameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure NameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindForm: TFindForm;

implementation

uses dmunit, MovUnit;

{$R *.dfm}

procedure TFindForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Action:=caFree;
end;

procedure TFindForm.FormCreate(Sender: TObject);
begin

tform(sender).Left:=0;
tform(sender).Top:=0;

Qfind.DeclareVariable('name',otString);
Qfind.DeclareVariable('nn',otString);

Qfind.SetVariable('name','');
Qfind.SetVariable('nn','%');


end;

procedure TFindForm.NameEditChange(Sender: TObject);
var temp:string;
begin
temp:=Tedit(sender).Text;
while pos('*',temp)>0 do temp:=StuffString(temp,pos('*',temp),1,'%');//temp[pos('*',temp)]:='%';
//Tedit(sender).Text:=temp;
Qfind.SetVariable('name',temp);

end;

procedure TFindForm.NameEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
If key=13  then
begin
Qfind.Close;
//Qfind.SetVariable('name',Nameedit.text);
Qfind.Open;

end;

end;

procedure TFindForm.Edit1Change(Sender: TObject);
begin
If Tedit(sender).Text<>''  then
Qfind.SetVariable('nn',Tedit(sender).Text)
else  Qfind.SetVariable('nn','%');

end;

procedure TFindForm.DBGridDblClick(Sender: TObject);

begin
if qfind.FieldValues['nom']<>0 then dm.openprihod(qfind.FieldValues['nom'],1,qfind.FieldValues['part'],qfind.FieldValues['plu']);
end;

procedure TFindForm.BitBtn1Click(Sender: TObject);
var Child:TMovForm;
begin
if not qfind.Active then exit;
if (qfind.RecordCount>0) and (qfind.FieldValues['nom']<>0) then
begin
dm.ExecuteSQL('update tmp.toptions set value='+inttostr(qfind.FieldValues['plu'])+  'where parametr='+chr(39)+'plu'+chr(39));
dm.ExecuteSQL('update tmp.toptions set value='+inttostr(qfind.FieldValues['part'])+  'where parametr='+chr(39)+'part'+chr(39));
dm.commit;
child:=tmovform.Create(findform,tsform(self).mybar);
child.Caption:=qfind.FieldValues['Товар'];
child.Show;

end;
end;

procedure TFindForm.BitBtn2Click(Sender: TObject);
begin
with qfind do
begin
 if active then first;
end;
end;

procedure TFindForm.BitBtn3Click(Sender: TObject);
begin
with qfind do
begin
 if active then last;
end;
end;

procedure TFindForm.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
if key=' ' then key:='*';
end;

end.
