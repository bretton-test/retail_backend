unit cennikunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,db, Grids, DBGridEh, ExtCtrls, ComCtrls, ToolWin, ActnList, StdCtrls,
  Buttons, FiltrUnit,sunit, Mask, DBCtrlsEh, DBLookupEh;


type
  Tcennikform = class(TsForm)
    Panel1: TPanel;
    grid1: TDBGridEh;
    Panel2: TPanel;
    Grid: TStringGrid;
    ActionList1: TActionList;
    delall: TAction;
    printcennik: TAction;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    BitBtn2: TBitBtn;
    Button2: TButton;
    skladSelect: TDBLookupComboboxEh;
    barbtn: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure grid1KeyPress(Sender: TObject; var Key: Char);
    procedure grid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure delallExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure barbtnClick(Sender: TObject);
  private
    { Private declarations }
    filtr:TFiltrform;
    tempBarcode:string;
   procedure Scan (Sender:Tobject;Barcode:string);
  public
    { Public declarations }
  end;

var
   cennikform: Tcennikform;
 // c_mask:shortstring='';
implementation

uses dmunit, about, kartunit, Cennik, messageunit;



{$R *.dfm}

procedure Tcennikform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
filtr.Close;

dm.showcennik.Close;
dm.showcennik.Filtered:=false;
Action := caFree;
end;

procedure Tcennikform.FormDestroy(Sender: TObject);
begin
Cennikform:=nil;
end;

procedure Tcennikform.grid1KeyPress(Sender: TObject; var Key: Char);
var temp:string;
begin
if ord(key) >31 then
begin
//If not assigned( Filtrform)  then
// Filtrform:=TFiltrform.Create(application) ;
temp:= Filtr.PutChar(Key);
  if grid1.SelectedField.FieldName='PLU' then
          begin
         //dm.tovar.Locate('PLU',temp,[loCaseInsensitive])
         dm.showcennik.Filtered:=false;
         dm.showcennik.Locate('PLU',temp,[loCaseInsensitive]);
          end else
        begin
          dm.showcennik.Filter:='name='+chr(39)+
          temp
          +'*'+chr(39);
          dm.showcennik.Filtered:=true;
       end;
 end;
end;

procedure Tcennikform.grid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var i,n:word;
 begin
//showmessage(inttostr(key));
 if key=13 then
begin
i:=grid.RowCount-1;
grid.RowCount:=i+2;
if dm.ds15.DataSet=dm.showcennik then begin
grid.Cells[0,i]:=copy(dm.showcennikNAME.AsString,1,30);
grid.Cells[1,i]:=floattostr(int(dm.showcennikPRICE.AsCurrency))+'-'+copy(formatfloat('0.00',frac(dm.showcennikPRICE.AsCurrency)),3,2);
grid.Cells[2,i]:=dm.showcennikED_IZM.AsString;
grid.Cells[3,i]:=dm.showcennikBARCODE.AsString;
grid.Cells[4,i]:=dm.showcennikplu.AsString;
grid.Cells[5,i]:=dm.showcennikCENNIK.AsString;

end;
end;
if (key=46) and (grid.RowCount>2) then
     begin
grid.RowCount:=grid.RowCount-1;
n:=grid.RowCount-1;
grid.Cells[0,n]:='';
   grid.Cells[1,n]:='';
   grid.Cells[2,n]:='';
   grid.Cells[3,n]:='';
   grid.Cells[4,n]:='';
   grid.Cells[5,n]:='';


     end;
If key=27  then dm.showcennik.Filtered:=false;


 end;

procedure Tcennikform.delallExecute(Sender: TObject);
var i:integer;
begin
for i:=1 to grid.RowCount do
begin
 grid.Cells[0,i]:='';
 grid.Cells[1,i]:='';
 grid.Cells[2,i]:='';
 grid.Cells[3,i]:='';
 grid.Cells[4,i]:='';
 grid.Cells[5,i]:='';
 end;
grid.RowCount:=2;
 end;


procedure Tcennikform.Button1Click(Sender: TObject);
begin
dm.nofilter;
if  grid.RowCount<=2 then exit;

IF (GRID.Cells[4,grid.Selection.Top]<>'')  then
//dm.tovar.Locate('plu',strtoint(GRID.Cells[4,grid.Selection.Top]),[]);
   if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(cennikform,tsform(self).mybar);
        end;
         KartForm.Show;
         dm.LocateTovar(strtoint(GRID.Cells[4,grid.Selection.Top]));

end;

procedure Tcennikform.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i:word;
  begin
if (key=46) and (grid.RowCount>2) then begin
   i:=grid.RowCount-2;
   grid.RowCount:=grid.RowCount-1;
   grid.Cells[0,i]:='';
   grid.Cells[1,i]:='';
   grid.Cells[2,i]:='';
   grid.Cells[3,i]:='';
   grid.Cells[4,i]:='';
   grid.Cells[5,i]:='';
              end;
end;

procedure Tcennikform.FormShow(Sender: TObject);
begin
//mform.StatusBar.Panels[1].Text:='—трочку в задании можно удалить кнопкой DEL';
end;

procedure Tcennikform.FormActivate(Sender: TObject);
begin

end;
{-------------------------------------------------------------------}
procedure Tcennikform.PrintBClick(Sender: TObject);
var table:TCenArray;
  i,j,row:integer;
  CenForm:TCenForm;
  org,podr:string;
  tfil:boolean;
  //rec1,rec2:Pstr;
  begin
//new(rec1);
//new(rec2);
CenForm:=TCenForm.Create(cennikform);
tfil:=dm.tovar.Filtered;
try
org:='';
podr:='';
row:=1;
If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);
//else begin org:=rec1^;podr:=rec2^;end;
if skladSelect.KeyValue<>'' then org:= skladSelect.KeyValue;
cenform.setRecvizit(org,podr);
i:=grid.RowCount-2;
 dm.nofilter;
//dm.tovar.Filtered:=false;
for j := Low(table) to High(table) do   SetLength(table[j], i);
for j:=0 to i-1 do
 begin
 // table[0,j]:=grid.Cells[0,row];
  table[0,j]:=grid.Cells[4,row];
  table[1,j]:=grid.Cells[1,row];
  table[2,j]:=grid.Cells[2,row];
  table[3,j]:=grid.Cells[3,row];
 // dm.tovar.Locate('plu',strtoint(grid.Cells[4,row]),[]);
 if dm.LocateTovar(strtoint(grid.Cells[4,row])) then
begin
 if dm.tovarPROIZW.AsInteger<>1 then
      dm.Qprzwd.Locate('proizw',dm.tovarPROIZW.AsInteger,[])
 else if not dm.Qprzwd.Locate('proizw',dm.barcodeKODPR.AsInteger,[])
         then  dm.Qprzwd.Locate('proizw',1,[]);


  table[4,j]:=dm.tovarCENNIK1.AsString;
  table[5,j]:=dm.tovarCENNIK2.AsString;
  table[6,j]:=dm.tovarCENNIK3.AsString;
  if (grid.Cells[5,row]='') or (length(grid.Cells[5,row])<3) then table[7,j]:=dm.tovarCENNIK4.AsString
                          else table[7,j]:=grid.Cells[5,row];
  table[8,j]:=dm.QprzwdSTRANA.AsString;
  table[9,j]:=dm.QprzwdNAME.AsString;
  inc(row);
 end;

 end;
cenform.Showreport(1,dmunit.repedit,table);

finally
dm.tovar.Filtered:=tfil;
cenform.close;
// dispose(rec1);
// dispose(rec2);
end;
end;
//--------------------------------------------------------------------
procedure Tcennikform.FormCreate(Sender: TObject);

begin

Tform(sender).Left:=0;
Tform(sender).top:=0;
Tform(sender).Width:=APPLICATION.MainForm.Width-25;//MainForm.ClientWidth-25;
Tform(sender).Height:=APPLICATION.MainForm.Height-100;
 skladSelect.Left:=Panel4.Width-skladSelect.Width-3;
 skladSelect.KeyValue:=dm.qskladNAME.Value;
filtr:=TFiltrform.Create(Tcennikform(sender));
 Filtr.SetKoords(panel4);
Tcennikform(self).OnScanAction:=scan;
 end;

procedure Tcennikform.Button2Click(Sender: TObject);
begin
dm.showcennik.Refresh;
end;

procedure Tcennikform.Scan (Sender:Tobject;Barcode:string);
var temp:string;

begin
 tempBarcode:=barcode;
 dm.showcennik.Filtered:=false;
 if copy(barcode,1,2)<>'21' then
 begin
  temp:=dm.findkart(barcode);

        if temp<>'' then
                    begin
                    dm.showcennik.Filter:=temp;
                    dm.showcennik.Filtered:=true;
                    end
                    else
                      begin
                      dm.addmemo(messageunit.m3);
                       tempbarcode:='';
                      end;
 end else if not dm.showcennik.Locate('plu',strtoint(copy(barcode,3,5)),[])

   then begin
        dm.addmemo(messageunit.m3);
         tempbarcode:='';
        end;
 end;
procedure Tcennikform.barbtnClick(Sender: TObject);
 var CenForm:TCenForm;
    table:TCenArray;
    i,j,row,oi,k,kol_vo:integer;


procedure  fill(const j:integer);
 begin
  table[0,j]:=dm.tovarNAME.AsString;
  table[1,j]:=floattostr(int(dm.TovarPRICE.AsCurrency))+'-'+copy(formatfloat('0.00',frac(dm.TovarPRICE.AsCurrency)),3,2);
  table[2,j]:=dm.tovarED_IZM.AsString;
  table[3,j]:=dm.barcodeBARCODE.AsString;
  table[4,j]:='';
  table[5,j]:='';
  table[6,j]:='';
  table[7,j]:='';
 end;


begin

CenForm:=TCenForm.Create(kartform);

  try
   i:=0;

   row:=1;
   for j:=0 to grid.RowCount-3 do
   begin
   if dm.LocateTovar(strtoint(grid.Cells[4,row])) then
     begin
     if (dm.tovarSHTUKA.AsInteger=1) or (length(dm.barcodeBARCODE.Value)<>13) then
            begin
              inc(row);
              continue;
            end;

     oi:=i+1;
     try
     if (grid.Cells[5,row]='') or (length(grid.Cells[5,row])>4) then inc(i) else
        begin
           kol_vo:=strtoint(grid.Cells[5,row]) ;
            if kol_vo>3 then kol_vo:=kol_vo-trunc(int(kol_vo/4));
          i:=i+kol_vo;
        end;

     except
      dm.addmemo('неправильное значение количества');
     end;
     for k := Low(table) to High(table) do   SetLength(table[k], i);
     for k:=oi to i do
          begin
            fill(k-1);

          end;
    end;
    inc(row);

   end;


  cenform.Showreport(3,dmunit.repedit,table);


  finally
  CenForm.close;
  end;

end;

end.
