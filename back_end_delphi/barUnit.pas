unit barUnit;

interface
uses Extctrls,
   Windows,  Classes,controls,forms, Graphics,buttons,sysutils;


type
  TTaskbar = class(TPanel)
  private
    { Private declarations }
  sform :array  of Tobject;
  formcount :integer;
  button :integer;
  act:boolean;

  procedure myButtonClick(Sender: TObject);
  procedure LoadGlif(const mform:tform;var b:TSpeedButton);


  public
    { Public declarations }
  actForm:Tobject;
  constructor Create(AOwner: TComponent); override;
  procedure  showform(const mform :tform);
  procedure  delform(const mform :tform);
  procedure  addform(const mform :tform);
  procedure  resizeButtons;
  procedure resizewindows;

  end;




implementation

 constructor TTaskbar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  BevelInner:=bvNone;
  BevelOuter:=bvNone;
  Align:=alBottom;
  Color:=clBtnFace;
  Height:=23;
  end;

//-----------------------------------------------------------------------
   procedure  TTaskbar.showform(const mform :tform);
     var but:TSpeedButton;
     begin

       but:= tspeedbutton(TTaskbar(self).FindComponent('x'+inttostr(mform.Tag)));

       act:=true;
       if but<>nil then myButtonClick(but);
      // tform(sform[mform.Tag]).Caption:=mform.Caption;
      actForm:=mform;

     end;

//------------------------------------------------------------------------

procedure TTaskbar.myButtonClick(Sender: TObject);
begin
  If (not act) and (tspeedbutton(sender).Font.Style=[fsBold]) and (tform(sform[tspeedbutton(sender).Tag]).BorderStyle=bsSizeable)  then
 begin
  If tform(sform[tspeedbutton(sender).Tag]).WindowState=wsNormal  then
     begin


     tform(sform[tspeedbutton(sender).Tag]).WindowState:=wsMinimized;
    end else
    begin
    
    tform(sform[tspeedbutton(sender).Tag]).WindowState:=wsNormal;


    end;
 end;


 act:=false;
 tform(sform[tspeedbutton(sender).Tag]).Show;
 tform(sform[tspeedbutton(sender).Tag]).Tag:=tspeedbutton(sender).Tag;

 if  TTaskbar(self).FindComponent('x'+inttostr(button))<> nil then
 TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(button))).Font.Style:=[];
 tspeedbutton(sender).Font.Style:=[fsBold];
 //


//
 tspeedbutton(sender).Down:=true;
 tspeedbutton(sender).Caption:=tform(sform[tspeedbutton(sender).Tag]).Caption;
 tspeedbutton(sender).Hint:=tspeedbutton(sender).Caption;
  button:=tspeedbutton(sender).Tag;

 end;
 //---------------------------------------------------------------------------
 procedure TTaskbar.LoadGlif(const mform:tform;var b:TSpeedButton);

   var
         TheIcon : TIcon;
         TheBitmap : TBitmap;

  begin


     if mform.Icon.HandleAllocated
          then  TheIcon:=mform.Icon
          else TheIcon:=application.Icon;

   TheBitmap := TBitmap.Create;
   TheBitmap.Width := TheIcon.Width;
   TheBitmap.Height := TheIcon.Height;
   TheBitmap.Canvas.Draw(0, 0,TheIcon);
   b.Glyph.Width:=16;
   b.Glyph.Height:=16;
   b.Glyph.PixelFormat:=pf8bit;
   b.Glyph.Canvas.StretchDraw(Rect(0,0,16 ,
                             16), TheBitmap);




   TheBitmap.Free;

  end;
//----------------------------------------------------------------------------
  procedure TTaskbar.delform(const mform :tform);
    var i:byte;
       shift:boolean;
       var b:TSpeedButton;
    begin

     actForm:=nil;
    if formcount=0 then exit;

    b:=TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(button)));
    if b<>nil then b.Font.Style:=[];

    shift:=false;

    for i:=1 to formcount do
      begin
       if (tform(sform[i])<>mform) and (not shift) then continue;
        if (tform(sform[i])=mform)and (not shift) then
          begin
            shift:=true;
            sform[i]:=nil;
            if i=formcount then begin dec(formcount);
                                b:=TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(i)));
                                if b<>nil then b.Free;

                               resizeButtons;
                                exit;
                                end;
            sform[i]:=sform[i+1];
            tform(sform[i]).Tag:=i;

             b:=TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(i)));
             if b<>nil  then begin
                              b.Caption:=tspeedbutton(TTaskbar(self).FindComponent('x'+inttostr(i+1))).caption;
                              loadglif(tform(sform[i]),b);


                             end;
           continue;
          end;
      if shift then
        begin
         if i=formcount then begin
          dec(formcount);
          sform[i]:=nil;

          break;
          end;
           sform[i]:=sform[i+1];
           tform(sform[i]).Tag:=i;
           b:=TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(i)));
             if b<>nil  then begin
                              b.Caption:=tspeedbutton(TTaskbar(self).FindComponent('x'+inttostr(i+1))).caption;
                               loadglif(tform(sform[tspeedbutton(TTaskbar(self).FindComponent('x'+inttostr(i+1))).tag]),b);
                             end;
        end;
     end;
     b:=TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(formcount+1)));
     if b<>nil then b.Free;
    resizeButtons;

    end;
 //---------------------------------------------------------------------------
  procedure TTaskbar.resizeButtons;
   var   i:byte;
         But:TSpeedButton;
    begin
       for i:=1 to formcount do
         begin
        But:=TSpeedButton(TTaskbar(self).FindComponent('x'+inttostr(i)));
        case formcount of
        0..5: begin

        if but<>nil then
        begin
        but.Width:=Round(TTaskbar(self).Width/5);
        but.Left:=2+(Round(TTaskbar(self).Width/5)*(i-1));
        but.Font.Style:=[];
        end;
         end;
         else begin

          if but<>nil then
        begin
        but.Width:=Round(TTaskbar(self).Width/formcount);
        but.Left:=2+(Round(TTaskbar(self).Width/formcount)*(i-1));
         but.Font.Style:=[];
        end;

         end;

         end;
        end;


    end;
//--------------------------------------------------------------------
  procedure TTaskbar.addform(const mform :tform);
    var x:TSpeedButton;

     begin

       inc(formcount);
       setlength(sform,formcount+1);

       sform[formcount]:=mform;
       tform(sform[formcount]).Tag:=formcount;

       button:=formcount;

       x:=TSpeedButton.Create(TTaskbar(self));
       x.Name:='x'+ inttostr(formcount);
       x.Width:=89;
       x.Height:=TTaskbar(self).Height;
       x.Caption:= mform.Caption;
       x.Hint:=x.Caption;
       x.ShowHint:=true;
       x.Visible:=true;
       x.Enabled:=true;
       x.Tag:=formcount;
       x.Left:=0;
       x.Margin:=2;
       x.NumGlyphs:=1;
       x.GroupIndex:=1;
       x.OnClick:=myButtonClick;
       x.Parent:=TTaskbar(self);
       loadglif(mform,x);
       x.Down:=true;
       x.Font.Style:=[fsBold];
       

        resizeButtons;
     end;
  //---------------------------------------------------------------------

 procedure TTaskbar.resizewindows;
  var i: integer;
  begin
   if formcount=0 then exit;
   for i:=1 to formcount do
    begin
    if (tform(sform[i]).FormStyle=fsMDIChild) and (tform(sform[i]).BorderStyle=bsSizeable)
     then
       begin
         Tform(sform[i]).Width:=APPLICATION.MainForm.ClientWidth-25;
          Tform(sform[i]).Height:=APPLICATION.MainForm.ClientHeight-55;

       end;
    end;

  end;

end.
