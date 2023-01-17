unit SUnit;

interface
 uses  SysUtils,forms,classes,buttons,BARUNIT,DBGridEh;

 type
 TscanEvent = procedure (Sender:Tobject;Barcode:string) of object;
 TSform = class (TForm)
 procedure FormActivate(Sender: TObject);
 procedure FormClose(Sender: TObject; var Action: TCloseAction);
 procedure FormResize(Sender: TObject);
 private
 FonScan:TscanEvent;
 MyNotifi:TNotifyEvent;
 resNotifi:TNotifyEvent;
 FonClose:TCloseEvent;
 reg_task:boolean;

 public

 mybar:TTaskbar;
 procedure ScanAction(const barcode:string);
 constructor Create(AOwner: TComponent;const TaskBar:TTaskbar);reintroduce;overload;
 destructor Destroy;override;

 published
 property OnScanAction:TscanEvent read FonScan write FonScan;




 end;



implementation



 {------------------------------------------------------------------------}
 procedure Tsform.ScanAction(const barcode:string);
  begin
   if assigned(FonScan) then FonScan(self,barcode);


  end;
{------------------------------------------------------------------------}
  constructor TSform.Create(AOwner: TComponent;const TaskBar:TTaskbar);
 var bok,bcancel:tspeedButton;
 temp:integer;
   begin
  inherited Create(AOwner);
  tsform(self).Font:=Application.MainForm.Font;
  tsform(self).ParentFont:=true;
  for temp:=0 to  tsform(self).ComponentCount-1 do
  begin
   if tsform(self).Components[temp].ClassName='TDBGridEh'
  then   TDBGridEh(tsform(self).Components[temp]).ParentFont:=true;
   end;
 reg_task:=false;
  Tsform(self).Left:=0;
if (tsform(self).FormStyle=fsMDIChild)
  and (tsform(self).BorderStyle=bsSizeable)

then
begin
Tsform(self).top:=0;

Tsform(self).Width:=APPLICATION.MainForm.ClientWidth-25;
Tsform(self).Height:=APPLICATION.MainForm.ClientHeight-55;
end else Tsform(self).top:=53;

bOk:=TSpeedButton(FindComponent('ok'));
bcancel:=TSpeedButton(FindComponent('cancel'));
if (bok<>nil) and (bcancel<>nil) then
   begin
     bcancel.Left:=Tform(self).Width-bcancel.Width-15;
      bok.Left:=Tform(self).Width-bok.Width-bcancel.Width-30;
   end;
 if bcancel<>nil then
   begin
     bcancel.Left:=Tform(self).Width-bcancel.Width-15;
    end;


   mybar:=TaskBar;
  try
   if mybar<>nil then mybar.addform(self);
   reg_task:=true;
  except;
   raise;
  end;
   resNotifi:=OnResize;
   MyNotifi:=OnActivate;
   OnActivate:=FormActivate;
   FonClose:=OnClose;
   OnClose:=FormClose;
   OnResize:=FormResize;
   end;
{------------------------------------------------------------------------}
procedure TSform.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
try
 if (mybar<>nil) and (reg_task) then mybar.delform(self);
 reg_task:=false;
 mybar:=nil;

finally
 if assigned(FonClose) then FonClose(Sender,Action);
end;

 end;
{------------------------------------------------------------------------}
procedure TSform.FormActivate(Sender: TObject);
begin
if assigned(MyNotifi) then  MyNotifi(Sender);

 if mybar<>nil then mybar.showform(self);

end;
{------------------------------------------------------------------------}
procedure TSform.FormResize(Sender: TObject);
var bok,bcancel:tspeedButton;
begin
if assigned(resNotifi) then  resNotifi(Sender);

bOk:=TSpeedButton(FindComponent('ok'));
bcancel:=TSpeedButton(FindComponent('cancel'));
if (bok<>nil) and (bcancel<>nil) then
   begin
     bcancel.Left:=Tform(self).Width-bcancel.Width-15;
      bok.Left:=Tform(self).Width-bok.Width-bcancel.Width-30;
     exit;
   end;
if bcancel<>nil then
   begin
     bcancel.Left:=Tform(self).Width-bcancel.Width-15;
    end;

end;




{---------------------------------------------------------------------}
destructor TSform.Destroy;
 begin
 try

 if (mybar<>nil) and  (assigned(mybar)) then mybar.delform(self);

 finally
 inherited destroy;
 end;

 end;





end.
