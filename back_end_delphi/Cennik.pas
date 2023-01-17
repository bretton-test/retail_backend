unit Cennik;

interface

uses
  Windows, Messages, SysUtils,dialogs, Variants, Classes,  Controls, Forms,
   FR_DSet,  FR_Class, FR_Desgn,barcodeunit, ExtCtrls, SpeedForm, StdCtrls,
  Buttons, Mask, DBCtrlsEh;
type  TCenArray = Array[0..9] of Array of String;
//0-name,1-price,2-barcode,3-kod,4-7:stroka
type
  TCenForm = class(TForm)
    frReport: TfrReport;
    frDesigner1: TfrDesigner;
    UserDs: TfrUserDataset;
    mcForm: TSpeedForm;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Box: TListBox;
    mcedit: TSpeedForm;
    nameedit: TEdit;
    Label1: TLabel;
    koledit: TDBNumberEditEh;
    Label2: TLabel;
    BitBtn4: TBitBtn;
     procedure frReportGetValue(const ParName: String;
      var ParValue: Variant);
    procedure UserDsCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure UserDsFirst(Sender: TObject);
    procedure UserDsNext(Sender: TObject);
    procedure UserDsPrior(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure mcFormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BoxDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    vryad:integer;
    Podr:string;
    Org:string;
    prArray:Tcenarray;
    index,dlinna,realdlinna:integer;
    cenfile:tstringlist;
     function getname(const stroka:string):string;
     function getfile(const stroka:string):string;
     function getnum(const stroka:string):string;
     function   InsertCennik(const massiv:TCenArray):boolean;
  public
    { Public declarations }

  procedure  Showreport(const tip:byte;const Edit:boolean;const massiv:TCenArray);
  procedure  setRecvizit(const n1,n2:string);
  end;

var
  CenForm: TCenForm;
  const bigcennik:string='\reports\BigCennikUser.frf';
  const Smallcennik:string='\reports\SmalCennikUser.frf';
  const Barcode:string='\reports\barcode.frf';

  implementation

{$R *.dfm}

function   TcenForm.InsertCennik(const massiv:TCenArray):boolean;
 var I,all:integer;
   
begin
result:=false;
try
prarray:=massiv;
index:=0;
dlinna:=length(prarray[low(prarray)]);
RealDlinna:=dlinna;

while   (RealDlinna/vryad)<>(int(RealDlinna/vryad)) do  inc(RealDlinna);

for all:=low(prarray) to high(prarray) do
           SetLength(prarray[all],RealDlinna);

for i:=dlinna to RealDlinna-1 do
 begin
   for all:=low(prarray) to high(prarray) do
       prarray[all,i]:=prarray[all,dlinna-1];
 end;


result:=true;
except
abort;

end;
end;
//----------------------------------------------------------------------------
procedure  TcenForm.Showreport(const tip:byte;const Edit:boolean;const massiv:TCenArray);
begin
if tip=3 then  frreport.LoadFromFile(ExtractFilePath(Application.ExeName)+Barcode)
else
 begin
{case tip of
1:frreport.LoadFromFile(ExtractFilePath(Application.ExeName)+Bigcennik);
2:frreport.LoadFromFile(ExtractFilePath(Application.ExeName)+Smallcennik);
3:frreport.LoadFromFile(ExtractFilePath(Application.ExeName)+Barcode);
else exit;
end; }

mcForm.ShowModal;


end;
if InsertCennik(massiv)then
If edit  then frreport.DesignReport else frreport.ShowReport;

end;

//------------------------------------------------------------------------
procedure TCenForm.frReportGetValue(const ParName: String;
  var ParValue: Variant);
begin
If parname='org'  then ParValue:=Org;
If parname='podr'  then ParValue:=podr;
case vryad of
3: begin
If parname='name'  then ParValue:=prArray[0,index-1];
If parname='name_1'  then ParValue:=prArray[0,index];
If parname='name_2'  then ParValue:=prArray[0,index+1];
If parname='price'  then ParValue:=prArray[1,index-1];
If parname='price_1'  then ParValue:=prArray[1,index];
If parname='price_2'  then ParValue:=prArray[1,index+1];
If parname='barcode'  then ParValue:=prArray[2,index-1];
If parname='barcode_1'  then ParValue:=prArray[2,index];
If parname='barcode_2'  then ParValue:=prArray[2,index+1];
If parname='kod'  then ParValue:=prArray[3,index-1];
If parname='kod_1'  then ParValue:=prArray[3,index];
If parname='kod_2'  then ParValue:=prArray[3,index+1];
If parname='str1'  then ParValue:=prArray[4,index-1];
If parname='str1_1'  then ParValue:=prArray[4,index];
If parname='str1_2'  then ParValue:=prArray[4,index+1];
If parname='str2'  then ParValue:=prArray[5,index-1];
If parname='str2_1'  then ParValue:=prArray[5,index];
If parname='str2_2'  then ParValue:=prArray[5,index+1];
If parname='str3'  then ParValue:=prArray[6,index-1];
If parname='str3_1'  then ParValue:=prArray[6,index];
If parname='str3_2'  then ParValue:=prArray[6,index+1];
If parname='str4'  then ParValue:=prArray[7,index-1];
If parname='str4_1'  then ParValue:=prArray[7,index];
If parname='str4_2'  then ParValue:=prArray[7,index+1];
If parname='ean'  then ParValue:=codebar(prArray[3,index-1]);
If parname='ean_1'  then ParValue:=codebar(prArray[3,index]);
If parname='ean_2'  then ParValue:=codebar(prArray[3,index+1]);
If parname='sp1'  then ParValue:=prArray[8,index-1];
If parname='sp2'  then ParValue:=prArray[8,index];
If parname='sp3'  then ParValue:=prArray[8,index+1];
If parname='pr1'  then ParValue:=prArray[9,index-1];
If parname='pr2'  then ParValue:=prArray[9,index];
If parname='pr3'  then ParValue:=prArray[9,index+1];
end;
2: begin
If parname='name'  then ParValue:=prArray[0,index-1];
If parname='name_1'  then ParValue:=prArray[0,index];
If parname='name_2'  then ParValue:=prArray[0,index];
If parname='price'  then ParValue:=prArray[1,index-1];
If parname='price_1'  then ParValue:=prArray[1,index];
If parname='price_2'  then ParValue:=prArray[1,index];
If parname='barcode'  then ParValue:=prArray[2,index-1];
If parname='barcode_1'  then ParValue:=prArray[2,index];
If parname='barcode_2'  then ParValue:=prArray[2,index];
If parname='kod'  then ParValue:=prArray[3,index-1];
If parname='kod_1'  then ParValue:=prArray[3,index];
If parname='kod_2'  then ParValue:=prArray[3,index];
If parname='str1'  then ParValue:=prArray[4,index-1];
If parname='str1_1'  then ParValue:=prArray[4,index];
If parname='str1_2'  then ParValue:=prArray[4,index];
If parname='str2'  then ParValue:=prArray[5,index-1];
If parname='str2_1'  then ParValue:=prArray[5,index];
If parname='str2_2'  then ParValue:=prArray[5,index];
If parname='str3'  then ParValue:=prArray[6,index-1];
If parname='str3_1'  then ParValue:=prArray[6,index];
If parname='str3_2'  then ParValue:=prArray[6,index];
If parname='str4'  then ParValue:=prArray[7,index-1];
If parname='str4_1'  then ParValue:=prArray[7,index];
If parname='str4_2'  then ParValue:=prArray[7,index];
If parname='ean'  then ParValue:=codebar(prArray[3,index-1]);
If parname='ean_1'  then ParValue:=codebar(prArray[3,index]);
If parname='ean_2'  then ParValue:=codebar(prArray[3,index]);
If parname='sp1'  then ParValue:=prArray[8,index-1];
If parname='sp2'  then ParValue:=prArray[8,index];
If parname='sp3'  then ParValue:=prArray[8,index];
If parname='pr1'  then ParValue:=prArray[9,index-1];
If parname='pr2'  then ParValue:=prArray[9,index];
If parname='pr3'  then ParValue:=prArray[9,index];
end;
1: begin
If parname='name'  then ParValue:=prArray[0,index];
If parname='name_1'  then ParValue:=prArray[0,index];
If parname='name_2'  then ParValue:=prArray[0,index];
If parname='price'  then ParValue:=prArray[1,index];
If parname='price_1'  then ParValue:=prArray[1,index];
If parname='price_2'  then ParValue:=prArray[1,index];
If parname='barcode'  then ParValue:=prArray[2,index];
If parname='barcode_1'  then ParValue:=prArray[2,index];
If parname='barcode_2'  then ParValue:=prArray[2,index];
If parname='kod'  then ParValue:=prArray[3,index];
If parname='kod_1'  then ParValue:=prArray[3,index];
If parname='kod_2'  then ParValue:=prArray[3,index];
If parname='str1'  then ParValue:=prArray[4,index];
If parname='str1_1'  then ParValue:=prArray[4,index];
If parname='str1_2'  then ParValue:=prArray[4,index];
If parname='str2'  then ParValue:=prArray[5,index];
If parname='str2_1'  then ParValue:=prArray[5,index];
If parname='str2_2'  then ParValue:=prArray[5,index];
If parname='str3'  then ParValue:=prArray[6,index];
If parname='str3_1'  then ParValue:=prArray[6,index];
If parname='str3_2'  then ParValue:=prArray[6,index];
If parname='str4'  then ParValue:=prArray[7,index];
If parname='str4_1'  then ParValue:=prArray[7,index];
If parname='str4_2'  then ParValue:=prArray[7,index];
If parname='ean'  then ParValue:=codebar(prArray[3,index]);
If parname='ean_1'  then ParValue:=codebar(prArray[3,index]);
If parname='ean_2'  then ParValue:=codebar(prArray[3,index]);
If parname='sp1'  then ParValue:=prArray[8,index];
If parname='sp2'  then ParValue:=prArray[8,index];
If parname='sp3'  then ParValue:=prArray[8,index];
If parname='pr1'  then ParValue:=prArray[9,index];
If parname='pr2'  then ParValue:=prArray[9,index];
If parname='pr3'  then ParValue:=prArray[9,index];
end;


 end;
end;
//---------------------------------------------------------------------------
 procedure  TCenForm.setRecvizit(const n1,n2:string);
   begin
    Org:=n1;
    Podr:=n2;
   end;
//---------------------------------------------------------------------------
procedure TCenForm.UserDsCheckEOF(Sender: TObject; var Eof: Boolean);
begin
case vryad of
2,3: If index>RealDlinna  then eof:=true
                        else eof:=false;
1: If index>RealDlinna-1  then eof:=true
                        else eof:=false;
end;
end;

procedure TCenForm.UserDsFirst(Sender: TObject);
begin
case vryad of
2,3:
index:=1;
1:index:=0;
end;
end;

procedure TCenForm.UserDsNext(Sender: TObject);
begin
inc(index,vryad);
end;

procedure TCenForm.UserDsPrior(Sender: TObject);
begin
dec(index,vryad);
end;

procedure TCenForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TCenForm.FormDestroy(Sender: TObject);
begin
cenform:=nil;
end;

procedure TCenForm.mcFormShow(Sender: TObject);
var i:integer;
begin
box.Items.Clear;
for i:=0 to cenfile.Count-1 do
begin
box.Items.Add(getname(cenfile.Strings[i]));
end;
box.ItemIndex:=0;
box.SetFocus;
end;
 //--------------------------------------------------------------
procedure TCenForm.FormCreate(Sender: TObject);
begin
 cenfile:=tstringlist.Create;
 cenfile.LoadFromFile(ExtractFilePath(Application.ExeName)+'cennik.txt');
 vryad:=3;
end;
//--------------------------------------------------------------
 function TCenForm.getname(const stroka:string):string;
    var i:integer;
        counter:integer;
        TEMP:String;
    begin
    result:='';
    counter:=0;
    temp:='';
     if length(stroka)<5 then exit;
     for i:=0 to  length(stroka) do
       begin
       if stroka[i]=';' then inc(counter);

        if counter>=1 then break;

        temp:=temp+stroka[i];


       end;
     delete(temp,1,1);
     result:=temp;
    end;
//---------------------------------------------------
  function TCenForm.getfile(const stroka:string):string;
    var i:integer;
        counter:integer;
        TEMP:String;
    begin
    result:='';
    counter:=0;
    temp:='';
     if length(stroka)<5 then exit;
     for i:=1 to  length(stroka) do
       begin
        if stroka[i]=';' then inc(counter);
        if counter<2 then continue;
        if counter>=3 then break;

        temp:=temp+stroka[i];

       end;
     delete(temp,1,1);
     result:=temp;
    end;

//----------------------------------------------

//---------------------------------------------------
  function TCenForm.getnum(const stroka:string):string;
    var i:integer;
        counter:integer;
        TEMP:String;
    begin
    result:='';
    counter:=0;
    temp:='';
     if length(stroka)<5 then exit;
     for i:=1 to  length(stroka) do
       begin
        if stroka[i]=';' then inc(counter);
        if counter<1 then continue;
        if counter>=2 then break;

        temp:=temp+stroka[i];

       end;
     delete(temp,1,1);
     result:=temp;
    end;

//----------------------------------------------





procedure TCenForm.BoxDblClick(Sender: TObject);
begin
vryad:=strtoint(getnum(cenfile[box.ItemIndex]));
frreport.LoadFromFile(ExtractFilePath(Application.ExeName)+getfile(cenfile[box.ItemIndex]));
mcForm.Close;

end;


///
procedure TCenForm.BitBtn2Click(Sender: TObject);
begin
if box.ItemIndex=-1 then exit;
if  cenfile.Count<3 then
begin
showmessage('Не удаляйте понапрасну формы.Лучше редактируйте.');
exit;
end;
if MessageDlg('Точно Удалить?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
   cenfile.Delete(box.ItemIndex);
   cenfile.SavetoFile(ExtractFilePath(Application.ExeName)+'cennik.txt');
   mcFormShow(nil);
  end;

end;
//--------------------------------------------------------------
procedure TCenForm.BitBtn1Click(Sender: TObject);
var iFileHandle: Integer;
    newfile:integer;
  iFileLength: Integer;
  iBytesRead: Integer;
  Buffer: PChar;
  
begin
 nameedit.Text:='Новый '+inttostr(box.Items.Count+1);
if mcedit.ShowModal=mrOk then
  begin
 if nameedit.Text='' then exit;
 if koledit.Value=null then exit;
 try


    iFileHandle :=FileOpen(ExtractFilePath(Application.ExeName)+'\reports\BigCennikUser.frf',fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);
      Buffer := PChar(AllocMem(iFileLength + 1));
      iBytesRead := FileRead(iFileHandle, Buffer^, iFileLength);
       FileClose(iFileHandle);
      newfile :=FileCreate(ExtractFilePath(Application.ExeName)+'\reports\'+nameedit.Text+'.frf');
      FileWrite(newfile, Buffer^, iFileLength);
      FileClose(newfile);
      cenfile.Add(nameedit.Text+';'
            +string(koledit.Value)+';'
            +'\reports\'+nameedit.Text+'.frf;') ;
  cenfile.SavetoFile(ExtractFilePath(Application.ExeName)+'cennik.txt');
  mcFormShow(nil);
  finally
      FreeMem(Buffer);


 end;
 end;
end;
//////////-------------------------------------
procedure TCenForm.BitBtn3Click(Sender: TObject);
var temp:string;
begin
if box.ItemIndex=-1 then exit;
nameedit.Text:=getname(cenfile[box.ItemIndex]) ;
koledit.Value:=strtoint(getnum(cenfile[box.ItemIndex]));
temp:=getfile(cenfile[box.ItemIndex]);

if mcedit.ShowModal=mrOk then
  begin
    if nameedit.Text='' then exit;
    if koledit.Value=null then exit;

 cenfile.Strings[box.ItemIndex]:= nameedit.Text+';'
            +string(koledit.Value)+';'+ temp+';';
  cenfile.SavetoFile(ExtractFilePath(Application.ExeName)+'cennik.txt');
  mcFormShow(nil);

  end;
end;

procedure TCenForm.BoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then BoxDblClick(nil);
end;

end.
