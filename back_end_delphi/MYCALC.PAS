unit mycalc;

interface
 


 uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls,InFix;

type
  Tcalcform = class(TForm)
      b1: TSpeedButton;
    b2: TSpeedButton;
    b3: TSpeedButton;
    b0: TSpeedButton;
    Shape2: TShape;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    bt: TSpeedButton;
    Shape5: TShape;
    b4: TSpeedButton;
    display: TLabel;
    Shape6: TShape;
    b5: TSpeedButton;
    Shape7: TShape;
    Shape8: TShape;
    b6: TSpeedButton;
    Shape9: TShape;
    b7: TSpeedButton;
    Shape10: TShape;
    Shape11: TShape;
    b8: TSpeedButton;
    b9: TSpeedButton;
    Shape12: TShape;
    bravno: TSpeedButton;
    plusshape: TShape;
    bplus: TSpeedButton;
    Shape13: TShape;
    bminus: TSpeedButton;
    Shape14: TShape;
    Shape15: TShape;
    bumn: TSpeedButton;
    bdel: TSpeedButton;
    Shape16: TShape;
    SpeedButton1: TSpeedButton;
    Shape17: TShape;
    Shape18: TShape;
    bend: TSpeedButton;
    Timer1: TTimer;
    procedure b1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure bplusClick(Sender: TObject);
    procedure bravnoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    //var init,output :double;
 private
    { Private declarations }

   procedure addnull();

  public
   init,output: double;
    x,y:word;

    { Public declarations }


  end;

var
  calcform: Tcalcform;
  t,oper,no,res,sbr,second,light: boolean;

  button :Tobject;
  input :string;

 procedure addChar(Sender: TObject);
 procedure EvaluateExp(Const MyExpr : string);
 implementation

{$R *.DFM}
//------------------------------------------------------------
  procedure tcalcform.addnull();
     begin
  if input='' then exit;

  if (input[strlen(pchar(input))]='.') or
 (input[strlen(pchar(input))]=',')  then input:=input+'0';


     end;
//-----------------------------------------------------------
procedure EvaluateExp(Const MyExpr : string);
var
	MyErr	: Byte;
 // MyAddr : String[20];
  MyResult : Real;

  begin
	MyErr := 0;
  MyResult := 0.0;
  InFix.RawCalculate(MyExpr, MyResult, MyErr);
  if abs(trunc(myresult))>9999999999 then
  Calcform.display.Caption :='ERROR'
  else
   if trunc(myresult)=myresult then calcform.display.Caption :=floattostr(myresult)
else
  begin

  calcform.display.Caption := formatfloat('0.00',Myresult);
  end;
  input:='';
  res:=true;
  calcform.output:=Myresult;
  end;

//------------------------------------------------------------

procedure addChar(Sender: TObject);
var
	btn : TButton;
        temp: byte;
        begin
       if light=false then begin
       tspeedbutton(sender).font.Color:=$00e0e0FF;
       calcform.Timer1.Enabled:=true;
       button:=sender;
       light:=true;
       end;

       if res=true then begin
       res:=false ;

        end;
        temp:=calcform.display.GetTextLen;
        if (temp=13) and (oper=false) then exit;
        if oper=false then begin
        if no = true then begin
        calcform.display.caption:='';
        no:=false;

        end;
	btn := TButton(Sender);
	calcform.display.caption:=calcform.display.caption + btn.Caption;
        input:=input+ btn.Caption;

        end else begin
         btn := TButton(Sender);
        input:=input+ btn.Caption;
        no:=true;
         end;
        end;
//----------------------------------------------------------
procedure Tcalcform.b1Click(Sender: TObject);
begin

if sender=bt then begin
  if t=true then exit;
if (oper=true) or (res=true)or (sbr=true) then exit;

 t:=true;
end;
  if res=true then begin
       res:=false ;
     display.caption:='';
     end;

if sbr=true then begin
display.Caption:='';
input:='';
end;
sbr:=false;
if oper=true then begin
 oper:=false;
 second:=true;
end;
  addChar(Sender);
end;
//---------------------------------------------------------
procedure Tcalcform.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
110: b1.OnClick(bt);
190: b1.OnClick(bt);
48: b1.OnClick(b0);
96:  b1.OnClick(b0);
97: b1.OnClick(b1);
49: b1.OnClick(b1);
50: b1.OnClick(b2);
98:  b1.OnClick(b2);
51: b1.OnClick(b3);
99:  b1.OnClick(b3);
52: b1.OnClick(b4);
100:  b1.OnClick(b4);
53: b1.OnClick(b5);
101:  b1.OnClick(b5);
54: b1.OnClick(b6);
102:  b1.OnClick(b6);
55: b1.OnClick(b7);
103:  b1.OnClick(b7);
56: b1.OnClick(b8);
104:  b1.OnClick(b8);
57: b1.OnClick(b9);
105:  b1.OnClick(b9);
107: bplus.OnClick(bplus);
109: bplus.OnClick(bminus);
106: bplus.OnClick(bumn);
111: bplus.OnClick(bdel);
13: bend.OnClick(bend);
 end;

end;
//-------------------------------------------------
procedure Tcalcform.FormActivate(Sender: TObject);
begin

t:=false;
oper:=false;
no:=false;
res:=false;
sbr:=true;
second:=false;
output:=init;
input:=floattostr(init);
display.Caption:=input;
end;
//-----------------------------------------------------
procedure Tcalcform.bplusClick(Sender: TObject);
begin
sbr:=false;
if second=true then begin
second:=false;
bravno.OnClick(bravno);
end;
if (oper=true)  then exit;

if res=true then input:=Floattostr(output);
t:=false;
oper:=true;
addnull;
addChar(Sender);
end;
//--------------------------------------------------------
procedure Tcalcform.bravnoClick(Sender: TObject);
begin
if res=true then exit;
second:=false;
t:=false;
addnull;
EvaluateExp(input);

end;
//-----------------------------------------------------------
procedure Tcalcform.SpeedButton1Click(Sender: TObject);
begin

output:=0;

calcform.OnActivate(calcform);
end;
//-----------------------------------------------------------
procedure Tcalcform.bendClick(Sender: TObject);
begin
bravno.Click;
calcform.ModalResult:=mrok;
end;
//-----------------------------------------------------------
procedure Tcalcform.FormShow(Sender: TObject);
begin
light:=false;
calcform.Left:=x;
calcform.Top:=y;
end;
//-----------------------------------------------------------
procedure Tcalcform.Timer1Timer(Sender: TObject);
begin
 light:=false;
 tspeedbutton(button).font.Color:=clBlack;
 timer1.Enabled:=false;
 end;

procedure Tcalcform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure Tcalcform.FormDestroy(Sender: TObject);
begin
calcform:=nil;
end;





end.
