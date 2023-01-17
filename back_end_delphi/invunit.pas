unit invunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, DBCtrlsEh, DBLookupEh, Mask,db,
  Buttons,sunit, OracleData, ComCtrls, SpeedForm,math, FiltrUnit, Menus,Provider,
  DBClient;

type
  Tinvform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid: TDBGridEh;
    Label5: TLabel;
    numbedit: TDBNumberEditEh;
    Label1: TLabel;
    Skladed: TDBLookupComboboxEh;
    Label2: TLabel;
    dataed: TDBDateTimeEditEh;
    primed: TDBEditEh;
    Label3: TLabel;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    Labelread: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    katselect: TDBLookupComboboxEh;
    Button2: TButton;
    Button3: TButton;
    PrintB: TBitBtn;
    doublePlu: TOracleDataSet;
    Button4: TButton;
    splashForm: TSpeedForm;
    ProgressBar: TProgressBar;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Panel4: TPanel;
    selkat: TOracleDataSet;
    weschek: TCheckBox;
    PM: TPopupMenu;
    ds1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ClientDS: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SkladedChange(Sender: TObject);
    procedure dataedChange(Sender: TObject);
    procedure DBGridColumns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure weschekClick(Sender: TObject);
    procedure ds1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
   predtovar:string;
   Filtr:TFiltrform;
  procedure Scan (Sender:Tobject;Barcode:string);
  Function FindPlu(const Barcode:string):integer;

    { Private declarations }
  procedure InsertReport(const barcode:string;const kolvo:integer);
  public
    { Public declarations }
  procedure  Setnom(const nom:integer);
  procedure  showtovar;
  procedure deletenew;
  end;

var
  invform: Tinvform;
  insert:boolean=false;
  new:boolean=true;
  reg:boolean=true;
  termload:boolean=false;
  implementation
 uses dmunit, kartunit, messageunit, about, TermUnit;
 
{$R *.dfm}
procedure Tinvform.deletenew;
 begin
 if new then
          begin
           dm.ExecuteSQL('delete from tmp.tinvent where nom='+inttostr(dmunit.skladnom));
           dm.commit;
          end;

 end;
procedure  Tinvform.showtovar;
 begin
// If not reg  then  dm.invedit(Tdataset(dbgrid.DataSource.DataSet));

  
   if not assigned(KartForm) then
   begin
    KartForm:=TKartForm.Create(tform(self),tsform(self).mybar);
    //DM.openkatalog;
   
    end;
     if (Tdatasource(dbgrid.DataSource).DataSet.State<>dsInsert)
     and (Tdatasource(dbgrid.DataSource).DataSet.FieldByName('plu').AsString<>'')
     then begin
         dm.nofilter;

         dmunit.BOOKMARK:=Tdatasource(dbgrid.DataSource).DataSet.Fields[0].AsInteger;

         dm.tovargetmark;
         end;
         KartForm.Show;

        // dm.invedit(Tdataset(dbgrid.DataSource.DataSet));

end;

//------------------------------------------------------------------------
procedure  Tinvform.Setnom(const nom:integer);
 var DS:Tdatasource;
  begin
   dataed.Value:=now;
   numbedit.Value:=nom;
   dmunit.datadok:=date+StrtoTime('23:59');
  // invform.Caption:=formatdatetime('hh.nn.ss dd.mm.yyyy',dmunit.datadok);
   primed.DataSource:=nil;
   ds:=dm.openinvent(nom);
  If ds<>nil  then
        begin
          new:=false;
          case  ds.DataSet.FieldValues['reg'] of
          0: reg:=false;
          1: reg:=true;
          end;
          numbedit.DataSource:=DS;
          numbedit.DataField:='nom';
          dataed.DataSource:=ds;
          dataed.DataField:='data';
          dataed.ReadOnly:=reg;
          skladed.ReadOnly:=reg;
          dmunit.datadok:=ds.DataSet.FieldValues['data'];
          skladed.DataSource:=ds;
          skladed.DataField:='skladid';
          dmunit.skladinv:=ds.DataSet.FieldValues['skladid'];
          skladed.ListFieldIndex:=ds.DataSet.FieldValues['skladid'];
          primed.DataSource:=ds;
          primed.DataField:='komment';
        end else
        begin
         insert:=false;
         reg:=false;
         new:=true;
        end;
        labelread.Visible:=reg;
        dbgrid.ReadOnly:=reg;
 end;
//-------------------------------------------------------------------

procedure Tinvform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 insert:=false;
if assigned(filtr) then  filtr.Close;
//If primed.DataSource<>nil  then  Tdatasource(primed.DataSource).DataSet.Close;
Tdatasource(dbgrid.DataSource).DataSet.Close;

Action:=caFree;
end;

procedure Tinvform.FormDestroy(Sender: TObject);
begin
 invform:=nil;
end;



procedure Tinvform.SkladedChange(Sender: TObject);
begin
dmunit.skladinv:=skladed.KeyValue;
end;

procedure Tinvform.dataedChange(Sender: TObject);
begin

dmunit.datadok:=int(dataed.Value)+StrtoTime('23:59');
// invform.Caption:=formatdatetime('hh.nn.ss dd.mm.yyyy',dmunit.datadok);

end;

procedure Tinvform.DBGridColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if dmunit.skladinv=0 then
    begin
    dm.addmemo(messageunit.m15);
    exit;
    end;
  If not reg  then  dm.invedit(Tdataset(dbgrid.DataSource.DataSet));

  showtovar;

end;

procedure Tinvform.DBGridKeyPress(Sender: TObject; var Key: Char);
var temp:string;
begin
 if (dbgrid.SelectedField.FieldName='NAME') and
 (ord(key)=13) then   showtovar

  else
  if  (ord(key)=13) and
  (Tdatasource(dbgrid.DataSource).DataSet.State in [dsinsert,dsedit])
        then  Tdatasource(dbgrid.DataSource).DataSet.Post;


 if
 (ord(key)>31) then
  begin

    temp:=filtr.PutChar(key);
    if temp<>'' then
        begin
        if dbgrid.SelectedField.FieldName='NAME' then
         begin
         dm.Qinvent.Locate('name',temp,[loCaseInsensitive, loPartialKey]);
         end;
         if dbgrid.SelectedField.FieldName='PLU' then
         begin
         dm.Qinvent.Locate('PLU',temp,[loCaseInsensitive]);
         end;

    end;
  end;
 end;


procedure Tinvform.okClick(Sender: TObject);
begin

If not reg  then
if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
         doublePlu.Close;
         doublePlu.SetVariable('nom',inttostr(dmunit.skladnom));
         doublePlu.Open;
         if doublePlu.RecordCount>0 then
             begin
               doublePlu.First;
                while not doublePlu.Eof do
                     begin
                       dm.addmemo('найден двойной товар '+doublePlu.FieldValues['name']);

                      doublePlu.Next;
                     end;
             doublePlu.Close;
             exit;
             end else doublePlu.Close;

          // If new  then  dm.showtime;




                 dm.safeinvent(primed.Text,dbgrid.SumList.SumCollection.Items[1].sumvalue);
                 new:=false;
                if MessageDlg(messageunit.m19,
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then dm.setreg(1,dmunit.skladnom) ;
                 dm.commit;
        end else
        begin
        dm.rollback;
       deletenew;
        end;
       // invform.Close;
end;

procedure Tinvform.cancelClick(Sender: TObject);
begin
  dm.rollback;
   deletenew;
  invform.Close;
end;

procedure Tinvform.FormCreate(Sender: TObject);
begin
predtovar:='';


termload:=false;
tinvform(self).OnScanAction:=scan;

filtr:=TFiltrform.Create(tform(self));
Filtr.SetKoords(panel4);

end;

procedure Tinvform.BitBtn1Click(Sender: TObject);
begin
  showtovar;

  // dm.locatetovar(dm.QinventPLU.AsInteger);
  
end;

procedure Tinvform.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 
If Tdatasource(TDBGridEh(Sender).DataSource).DataSet.Fields[4].AsInteger=0

  then  TDBGridEh(Sender).Canvas.Brush.Color:=clSkyBlue;





IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;
{-------------------------------------------------------------------}


procedure Tinvform.Button2Click(Sender: TObject);
VAR KAT,wes:string;
begin
 if (not new) and (katselect.Text='')  then  exit;

If  skladed.KeyValue=null then begin
                     dm.addmemo(messageunit.m15);
                     exit;end;
 If not insert  then
 BEGIN
if MessageDlg('Заполниь из состояния склада на '+formatdatetime('hh:nn  dd.mm.yyyy',dmunit.datadok) ,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 begin

 if katselect.Text='' then kat:='%' else kat:=katselect.Text;
 screen.Cursor:=crSQLwait;
  application.ProcessMessages;
 if    kat<>'%' then
  begin
    if not dm.Qrazdel.Locate('name',kat,[]) then
    begin
     screen.Cursor:=crDefault;
     exit;
    end;
    selkat.Close;
    selkat.SetVariable('nom',numbedit.Value);
    selkat.Open;
    if selkat.Locate('kat',dm.QrazdelKAT.AsInteger,[]) then
     begin
      dm.addmemo('Категория уже внесена');
      selkat.Close;
     screen.Cursor:=crDefault;
      exit;
     end;
     selkat.Close;

  end;
  if weschek.Checked then wes:='1' else wes:='';
  dm.opensklad(Tbutton(sender).Tag,skladed.KeyValue,kat,wes);
   dbgrid.SumList.RecalcAll;
   ///dbgrid.DataSource:=nil;

  // dm.insertinvent(label4);
  // dbgrid.DataSource:=DM.InvDS;
  if  kat='%' then insert:=true;
  screen.Cursor:=crDefault;
 END;
 end;


end;
{-------------------------------------------------------------------}

procedure Tinvform.PrintBClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  PM.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do PM.Popup(x,y);


  //about.AboutBox.printinvent(dmunit.skladnom);
end;

{-------------------------------------------------------------------}

procedure Tinvform.Scan (Sender:Tobject;Barcode:string);
 var filt:string;
 begin
     filt:=dm.findkart(barcode);
  if filt<>'' then
  begin
  DM.setfilter(filt);
  case dm.tovar.RecordCount of

    0:begin
           dm.ExecuteSQL('delete from tmp.tbarcode where barcode='+chr(39)+barcode+chr(39));
           dm.commit;
           dm.barcode.Refresh;

           end;
    1: begin

           if (dm.Qinvent.State=dsBrowse) and ( dm.Qinvent.Locate('plu',dm.tovarPLU.AsInteger,[]) )
           then invform.Show
           else dm.insertinvline;

          end;
     else
        begin
       if dm.Qinvent.State<>dsBrowse then dm.Qinvent.Cancel;
       if not dm.Qinvent.Locate('plu',dm.tovarPLU.AsInteger,[])
           then  invform.showtovar
           else invform.Show;
        end;
    end;




 end else dm.addmemo('Товар с шк. '+barcode+' не найден.');
 end;
{-------------------------------------------------------------------}

procedure Tinvform.Button4Click(Sender: TObject);
var
i,p:integer;
    termfile:tstringlist;
    kolvo:integer;
    barcode:string;
    var myfile:string;
    begin
    if labelread.Visible then
    begin
    dm.addmemo('накладная проведена');
    exit;

    end;
if termload then
   begin
    dm.addmemo('Уже считано');
    exit;
   end;
myfile:=ExtractFilePath(Application.ExeName)+'terminal.txt';
if not dm.Qinvent.Active then exit;
splashform.Show;
if not termunit.LoadFromTerminal(myfile) then
 begin
  splashform.Hide;
  exit;
 end;
 
if not FileExists(myfile)  then
 begin
  splashform.Hide;
  exit;
 end;

termfile:=TstringList.Create;

termfile.LoadFromFile(myfile);
progressbar.Min:=0;
  progressbar.Max:=termfile.Count-1;
 //dbgrid.DataSource:=nil;
 predtovar:='';
 ok.Enabled:=false;
 cancel.Enabled:=false;
  for i:=0 to termfile.Count-1 do
 begin
 try

 progressbar.Position:=i;
 application.ProcessMessages;
 p:=pos(',',termfile.Strings[i]);
 barcode:=copy(termfile.Strings[i],1,p-1);
 kolvo:=strtoint(copy(termfile.Strings[i],p+1,length(termfile.Strings[i])-p));
 InsertReport(barcode,kolvo);
  predtovar:=dm.QinventNAME.AsString;
 label4.Caption:=inttostr(i)+' из '+inttostr(termfile.Count-1);
 //dm.addmemo(barcode+'  '+inttostr(kolvo));
 except
   ok.Enabled:=true;
 cancel.Enabled:=true;
 end;

 end;
 //dbgrid.DataSource:=dm.InvDS;
 dm.Qinvent.Refresh;
 dbgrid.SumList.RecalcAll;
 termload:=true;
 splashform.Hide;
 ok.Enabled:=true;
 cancel.Enabled:=true;
 predtovar:='';

 // termfile.Free;
 end;
{-------------------------------------------------------------------}


 procedure Tinvform.InsertReport(const barcode:string;const kolvo:integer);
  var plu,i:integer;
      wkolvo:double;
      temp,prname:string;
  procedure Iedit(const kolvo:double);
     begin
          dm.Qinvent.Edit;
          dm.QinventKOL_FAKT.AsFloat:=dm.QinventKOL_FAKT.AsFloat+kolvo;
          dm.Qinvent.Post;
       end;

  begin
   if (copy(barcode,1,2)='21') and (length(barcode)=13) then
      begin


        plu:=strtoint(copy(barcode,3,5));
        if plu=1 then
        begin
        wkolvo:=kolvo;
        plu:=strtoint(copy(barcode,8,5));

        end else
        begin

        if kolvo<=1 then
        begin
        temp:=copy(barcode,8,2)+','+copy(barcode,10,3);
         wkolvo:=strtofloat(temp);
        end else
        if kolvo<=99 then
         wkolvo:=kolvo
        else wkolvo:=roundto(kolvo/1000,-3);

        end;
        if dm.Qinvent.State<>dsbrowse then dm.Qinvent.Cancel;
        if dm.Qinvent.Locate('plu',plu,[]) then
         begin
         Iedit(wkolvo);
         end
         else if dm.LocateTovar(plu) then
               begin
                dm.insertinvline;
                Iedit(wkolvo);
              end
              else
               begin
                  dm.addmemo('весового товара с кодом '+inttostr(plu)+' не найдено.'+floattostr(wkolvo)+' пред.товар-'+predtovar);
                 //  application.ProcessMessages;
                  exit;
               end;

      end else
      begin
       if dm.Qinvent.State<>dsbrowse then dm.Qinvent.Cancel;
         dm.findplu.SetVariable('barcode',barcode);
          dm.findplu.Execute;
        i:=0;
        plu:=0;
         while not dm.findplu.Eof do
         begin
           plu:=dm.findplu.Field('plu');

                  inc(i);
            dm.findplu.Next;
            end;




        // filter:=dm.findkart(barcode);
         if plu<>0 then
         // DM.setfilter(filter)
          else begin
              if dm.Qprzwd.Locate('proizw',copy(barcode,1,7),[loCaseInsensitive]) then prname:=dm.QprzwdNAME.Value
                                                                      else prname:='не найден';
                  dm.addmemo('товара с шк. '+barcode+' не найдено.кол-во '+inttostr(kolvo)+' пред.товар-'+predtovar+ ' произв. '+prname);
                 //  application.ProcessMessages;
                  exit;
               end;
          case i {dm.tovar.RecordCount}  of
          0:;
          1:  if dm.Qinvent.Locate('plu',plu,[]) then Iedit(kolvo)
              else begin
                     if dm.LocateTovar(plu) then
                    begin
                     dm.insertinvline;
                     Iedit(kolvo);
                    end;
                   end;

          else
          begin
          dm.addmemo('несколько товаров со штрихкодом '+barcode+' кол-во '+inttostr(kolvo));
           if dm.Qinvent.Locate('plu',plu,[]) then Iedit(kolvo)
              else begin
                    if dm.LocateTovar(plu) then
                    begin
                     dm.insertinvline;
                     Iedit(kolvo);
                    end;
                   end;

          end;
          end;


      end;
   // application.ProcessMessages;
   // dm.Qinvent.Refresh;
  end;

{-------------------------------------------------------------------}
procedure Tinvform.BitBtn2Click(Sender: TObject);
var kolvo:double;
    price:currency;
begin
if (not dm.Qinvent.Active) or (dm.Qinvent.RecordCount=0) then exit;
if dm.Qinvent.ReadOnly then exit;
 dm.Qinvent.First;
 while not dm.Qinvent.Eof do
  begin
   kolvo:=dm.sumostatok(dm.QinventPLU.AsInteger,
                      skladed.KeyValue,
                        int(dataed.Value)+StrtoTime('23:59'));

   price:=dm.PriceFromDate(dm.QinventPLU.AsInteger,
                           int(dataed.Value)+StrtoTime('23:59'));

    if kolvo<>dm.QinventKOL_SKLAD.AsFloat then
            begin
                dm.Qinvent.Edit;
                dm.QinventKOL_SKLAD.AsFloat:=kolvo;
                dm.Qinvent.Post;
            end;
    if price<>dm.QinventPRICE.AsCurrency then
            begin
                dm.Qinvent.Edit;
                dm.QinventPrice.AsCurrency:=price;
                dm.Qinvent.Post;
     end;
   if dm.QinventSUM_SKL.AsCurrency<>dm.QinventKOL_SKLAD.AsFloat*dm.QinventPRICE.AsCurrency
   then begin
               dm.Qinvent.Edit;
               dm.Qinvent.Post;
        end;
   if dm.QinventSUM_FAKT.AsCurrency<>dm.QinventKOL_FAKT.AsFloat*dm.QinventPRICE.AsCurrency
   then begin
               dm.Qinvent.Edit;
               dm.Qinvent.Post;
        end;





   dm.Qinvent.Next;
  end;
end;

procedure Tinvform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=(predtovar='');
end;

procedure Tinvform.weschekClick(Sender: TObject);
begin
if katselect.Text<> '' then weschek.Checked:=false;
end;

procedure Tinvform.ds1Click(Sender: TObject);
begin
 about.AboutBox.printinvent(dmunit.skladnom,true,skladed.KeyValue);
end;

procedure Tinvform.N1Click(Sender: TObject);
begin
about.AboutBox.printinvent(dmunit.skladnom,false,skladed.KeyValue);
end;

procedure Tinvform.N2Click(Sender: TObject);
var myfile:string;
    termfile:tstringlist;
     TempProvider:TDataSetProvider;
    price:currency;
    i,p:integer;
    plu:integer;
    kolvo:integer;
    barcode:string;
    name:string;
    begin
//

myfile:=ExtractFilePath(Application.ExeName)+'terminal.txt';
if not FileExists(myfile)  then begin
                                dm.addmemo('Файл не найден ');
                                exit;
                                END;

termfile:=TstringList.Create;
termfile.LoadFromFile(myfile);



  TempProvider := TDataSetProvider.Create(nil);
  TempProvider.DataSet :=dm.Qinvent;
  ClientDS.Data := TempProvider.Data;
  TempProvider.Free;
  ClientDS.Open;
  ClientDS.First;
  while not ClientDS.Eof do
  begin
  ClientDS.Delete;
  ClientDS.first;
  end;
  ok.Enabled:=false;
 cancel.Enabled:=false;
splashform.Show;
 for i:=0 to termfile.Count-1 do
 begin
 try

 progressbar.Position:=i;
 application.ProcessMessages;
 p:=pos(',',termfile.Strings[i]);
 barcode:=copy(termfile.Strings[i],1,p-1);
 kolvo:=strtoint(copy(termfile.Strings[i],p+1,length(termfile.Strings[i])-p));
 plu:=FindPlu(barcode);
 if plu<>0 then
     begin
      dm.LocateTovar(plu);
      name:=dm.tovarNAME.Value;
      price:=dm.tovarPRICE.AsCurrency;
     end else
       begin
       name:=barcode;
       price:=0;
       end;
 clientds.Insert;
 ClientDS.FieldValues['plu']:=plu;
 ClientDS.FieldValues['name']:=name;
  ClientDS.FieldValues['kol_fakt']:=kolvo;
   ClientDS.FieldValues['price']:=price;
  ClientDS.Post;
 label4.Caption:=inttostr(i+1)+' из '+inttostr(termfile.Count);
  //dm.addmemo(barcode+'  '+inttostr(kolvo));
 except
 splashform.hide;
   ok.Enabled:=true;
 cancel.Enabled:=true;
 raise;
 end;

 end;
 dm.InvDS.DataSet:=dm.Qinvent;
 dm.Qinvent.Open;
 splashform.hide;
 ok.Enabled:=true;
 cancel.Enabled:=true;

  AboutBox.setreport(ClientDS,nil,nil,nil,'\reports\terminal.frf');


end;
{----------------------------------------------------------------------}
 Function tinvform.FindPlu(const Barcode:string):integer;

   begin
   result:=0;
    if (copy(barcode,1,2)='21') and (length(barcode)=13) then
      begin
        result:=strtoint(copy(barcode,3,5));
        exit;
      end;
       dm.findplu.SetVariable('barcode',barcode);
       dm.findplu.Execute;
         while not dm.findplu.Eof do
         begin
           result:=dm.findplu.Field('plu');
           dm.findplu.Next;
         end;







   end;
end.
