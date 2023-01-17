unit masterunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,sunit, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh;

type
  Tmasterform = class(TSForm)
    PageC: TPageControl;
    Sheet1: TTabSheet;
    Sheet2: TTabSheet;
    Sheet3: TTabSheet;
    Panel1: TPanel;
    NAZAD: TSpeedButton;
    VPERED: TSpeedButton;
    ok: TSpeedButton;
    datafrom: TDBDateTimeEditEh;
    datato: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    katlist: TDBLookupComboboxEh;
    Label3: TLabel;
    all: TCheckBox;
    Label4: TLabel;
    listsklad: TDBLookupComboboxEh;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    nameBut: TRadioButton;
    kolBut: TRadioButton;
    RadioGroup1: TRadioGroup;
    sumbutton: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure VPEREDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NAZADClick(Sender: TObject);
    procedure katlistDropDown(Sender: TObject);
    procedure okClick(Sender: TObject);
     private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  masterform: Tmasterform;

implementation

uses dmunit, about;

{$R *.dfm}

procedure Tmasterform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ACTION:=caFree;
end;

procedure Tmasterform.FormDestroy(Sender: TObject);
begin
masterform:=nil;
end;

procedure Tmasterform.VPEREDClick(Sender: TObject);
begin
 if pagec.ActivePageIndex=0 then
 begin
  if (datafrom.Value=null) or
     (datato.Value=null)
     then begin
           dm.addmemo('Даты нужно всё-таки указать');
           exit;
          end;
   if integer(datafrom.Value)>integer(datato.Value)
   then  begin
  dm.addmemo('Начальная дата больше конечной');
   exit;
   end;


 end;
if pagec.ActivePageIndex<4 then
    pagec.SelectNextPage(true,false);

if pagec.ActivePageIndex=4 then
   begin
     memo1.Clear;
     memo1.Lines.Add('отчет с даты '+FormatDateTime('dd.mmmm.yy',datafrom.Value));
     memo1.Lines.Add('отчет по дату '+FormatDateTime('dd.mmmm.yy',datato.Value));
     if not all.Checked  then
       memo1.Lines.Add('по категории '+katlist.Text);
      memo1.Lines.Add('по складу '+ listsklad.Text);
      if nameBut.Checked then
       memo1.Lines.Add('упорядочить по имени');
      if kolBut.Checked then
       memo1.Lines.Add('упорядочить по количеству');
      if sumButton.Checked then
       memo1.Lines.Add('упорядочить по сумме');


       vpered.Enabled:=false;
       ok.Enabled:=true;

     end;
nazad.Enabled:=true;
end;

procedure Tmasterform.FormCreate(Sender: TObject);
begin
pagec.ActivePageIndex:=0;
nazad.Enabled:=false;
ok.Enabled:=false;;
end;

procedure Tmasterform.NAZADClick(Sender: TObject);
begin
if pagec.ActivePageIndex>0 then
   begin
    pagec.SelectNextPage(false,false);
    ok.Enabled:=false;
   end ;
if pagec.ActivePageIndex=0 then   nazad.Enabled:=false;

VPERED.Enabled:=true;
end;

procedure Tmasterform.katlistDropDown(Sender: TObject);
begin
all.Checked:=false;
end;

procedure Tmasterform.okClick(Sender: TObject);
var  sort:string;
     j:integer;
begin
AboutBox.kassreport.Close;
AboutBox.kassreport.SetVariable('nd',integer(datafrom.Value));
AboutBox.kassreport.SetVariable('kd',integer(datato.Value)+0.999999);
AboutBox.kassreport.SetVariable('sklad',listsklad.KeyValue);
if all.Checked then
dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+'%'+chr(39)+ ' where parametr='+chr(39)+'kat'+chr(39))

//AboutBox.kassreport.SetVariable('kat','%')
else
  dm.ExecuteSQL('update tmp.toptions set value='+inttostr(katlist.KeyValue)+ ' where parametr='+chr(39)+'kat'+chr(39));

//AboutBox.kassreport.SetVariable('kat',katlist.KeyValue);
  if nameBut.Checked then sort:='order by t.name';
  if kolBut.Checked then sort:='order by sum(r.kolvo) desc';
  if sumButton.Checked then sort:='order by sum(r.total) desc';
j:=AboutBox.kassreport.SQL.Count;
AboutBox.kassreport.SQL.Strings[j-1]:=sort;

aboutbox.kassreport.Open;
aboutbox.setreport(ABOUTBOX.kassreport,nil,nil,nil,'\reports\kassrep.frf');


end;

end.

