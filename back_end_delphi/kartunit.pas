unit kartunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids,  ImgList, StdCtrls,
  Buttons, DBCtrls, OracleNavigator, DBCtrlsEh,DB,oracle, OracleData,
  SpeedForm,FiltrUnit, cennik, Mask, ToolWin, DBGridEh, CheckLst,
  DBLookupEh, ComCtrls, Menus,sunit,strutils,math, DBSumLst;

type
  TKartForm = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    Panel3: TPanel;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    NameEdit: TEdit;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Shape1: TShape;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Shape3: TShape;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid2: TDBGrid;
    OracleNavigator1: TOracleNavigator;
    editkart: TCheckBox;
    DBEdit11: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    selbutton: TSpeedButton;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBComboBoxEh1: TDBComboBoxEh;
    Label18: TLabel;
    Qhistory: TOracleDataSet;
    Hform: TSpeedForm;
    DBGridEh1: TDBGridEh;
    histds: TDataSource;
    QhistoryCENA: TFloatField;
    QhistorySUM: TFloatField;
    QhistoryDATA: TDateTimeField;
    ExpBut: TBitBtn;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    ToolButton1: TToolButton;
    CprintForm: TSpeedForm;
    Label12: TLabel;
    Clabel: TLabel;
    CountLabel: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Shape4: TShape;
    barbtn: TBitBtn;
    ToolButton2: TToolButton;
    SelList: TCheckListBox;
    insnaklbt: TBitBtn;
    ToolButton3: TToolButton;
    kartbt: TBitBtn;
    ToolButton4: TToolButton;
    Button1: TButton;
    insbt: TBitBtn;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    istbut: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    QhistoryNOM: TFloatField;
    QhistoryPARTIA: TFloatField;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    SpeedButton3: TSpeedButton;
    exportBox: TDBCheckBox;
    QhistoryCENASNDS: TFloatField;
    QhistoryNAME: TStringField;
    QhistorySKLAD: TStringField;
    HistMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SelTovar: TOracleDataSet;
    DataSource1: TDataSource;
    tovgrid: TDBGridEh;
    N4: TMenuItem;
    N5: TMenuItem;
    barmenu: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    Qprint: TOracleQuery;
    priceedit: TDBNumberEditEh;
    Label2: TLabel;
    QhistoryNN: TIntegerField;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    qwesprint: TOracleQuery;
    N11: TMenuItem;
    atribmenu: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    DBEdit12: TDBEdit;
    Label20: TLabel;
    N14: TMenuItem;
    N15: TMenuItem;
    DBCheckBox2: TDBCheckBox;
    QhistoryLIFE: TDateTimeField;
    filtrbutton: TBitBtn;
    FiltrMenu: TPopupMenu;
    Dtc1: TMenuItem;
    N16: TMenuItem;
    N01: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    fbarcode: TDBNumberEditEh;
    Label19: TLabel;
    Label16: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    Label1: TLabel;
    SpeedButton4: TSpeedButton;
    tovarcounter: TDBSumList;
    tovarLabel: TLabel;
    N02: TMenuItem;
    N20: TMenuItem;
    Label21: TLabel;
    filtrCaption: TLabel;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    Shape5: TShape;
    Label22: TLabel;
    N25: TMenuItem;
    Tree: TTreeView;
    qprotree: TOracleDataSet;
    qprotreePROIZW: TIntegerField;
    qprotreeNAME: TStringField;
    qprotreeSTRANA: TStringField;
    qposttree: TOracleDataSet;
    qposttreeCOD: TIntegerField;
    qposttreeNAME: TStringField;
    ImageList1: TImageList;
    Panel5: TPanel;
    postbox: TDBLookupComboboxEh;
    postbutton: TSpeedButton;
    Label15: TLabel;
    RadioGroup1: TRadioGroup;
    shButton: TRadioButton;
    kgButton: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure katfiltrClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure editkartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wesClick(Sender: TObject);
  
//    procedure DBEdit1Click(Sender: TObject);
    procedure selbuttonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);

    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure proizwFiltrClick(Sender: TObject);
    procedure istbutClick(Sender: TObject);
    procedure HformClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ExpButClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure InsBtClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PostBtClick(Sender: TObject);
    procedure insnaklbtClick(Sender: TObject);
    procedure razcenaClick(Sender: TObject);
    procedure kartbtClick(Sender: TObject);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure FbarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboboxEh1DropDown(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNumberEditEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure tovgridDblClick(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tovgridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure barbtnClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure priceeditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure minusClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure HistMenuPopup(Sender: TObject);
    procedure filtrbuttonClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure tovarcounterRecalcAll(Sender: TObject);
    procedure N02Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure postboxClick(Sender: TObject);
    procedure postboxDropDown(Sender: TObject);
   
    procedure N25Click(Sender: TObject);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure TreeDblClick(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure postboxCloseUp(Sender: TObject; Accept: Boolean);
    procedure postbuttonClick(Sender: TObject);
    procedure shButtonClick(Sender: TObject);
   


  private
    { Private declarations }

    Filtr:TFiltrform;
    Tablica:TDataset;
    tipdoc:byte;
    TSelect:boolean;
    isclosed:boolean;
    wybor:boolean;
    KKMPLU: TFloatField;
    KKMNAME: TStringField;
    KKMED_IZM: TStringField;
    KKMNDS: TFloatField;
    KKMPRICE: TFloatField;
    KKMNSP: TFloatField;
    aform:Tform;
    wesfiltered:boolean;

    procedure InsSelItems;
    function GetCaption:string;
    procedure SetCaption(const caption:string);
    procedure Scan (Sender:Tobject;Barcode:string);
     procedure RebuildTree;
    Procedure ExpandLevel( Node : TTreeNode);
  public
    { Public declarations }
   property  Caption:string  read GetCaption write SetCaption;
   procedure SetSelect(var Tabl:Tdataset;const tip:byte);
   procedure setvybor(var KKMPLU: TFloatField;
                      var KKMNAME: TStringField;
                      var KKMPRICE: TFloatField;
                      var KKMED_IZM: TStringField;
                      var KKMNDS: TFloatField;
                      const myform:tform;
                      var KKMNSP: TFloatField);

   procedure InsertWybor;
   function CreateArray(const Inputstr:string;
                      var word1:string;
                      var word2:string;
                      var word3:string;
                       var word4:string;
                       var word5:string): integer;



  end;

var
  KartForm: TKartForm;
  kartvis:boolean=false;

//var  isclosed:boolean=false;
  implementation

uses dmunit, selunit, przunit, messageunit, postunit, CHEKUNIT, dialunit,
  BARCODEunit, about;

{$R *.dfm}
  procedure TKartForm.SetCaption(const caption:string);
    begin
       tform(self).Caption:=caption;
       tform(self).OnActivate(tform(self));

    end;

  function TKartForm.GetCaption:string;
   begin

    result:=TForm(self).caption;


   end;

  procedure TKartForm.InsSelItems;
   var I:integer;
       rashod:boolean;
   begin
   if tipdoc in [3,4] then rashod:= true else rashod:=false;
   dm.nofilter;
    try
     if SelList.Items.Count=0 then exit;
     if not assigned(tablica) then exit;
     for i:=0 to Sellist.Items.Count-1 do
      begin
        dbgrid1.DataSource:=nil;
        if SelList.Checked[i] then
         // if dm.tovar.Locate('name',sellist.Items.Strings[i],[])
          if dm.locatetovar(sellist.Items.Strings[i])
           then
             begin

             with tablica do
             begin
             if State=dsBrowse then  Insert;
             FieldByName('plu').AsInteger:=dm.tovarPLU.AsInteger;
             FieldByName('NAME').Value:=dm.tovarNAME.Value;
             FieldByName('ED_IZM').Value:=dm.tovarED_IZM.Value;
             FieldByName('MEST').AsInteger:=0;
             FieldByName('KOL_UP').Value:=1;
             FieldByName('ROSSIP').AsInteger:=0;
             FieldByName('KOL_VO').AsInteger:=0;
             FieldByName('CENAWZALE').AsCurrency:=dm.tovarPRICE.AsCurrency;

             end;
             if not rashod then  tablica.FieldByName('CENAREAL').AsCurrency:=0    //dm.QnakltempCENAREAL.AsCurrency:=0
                       else begin
                             tablica.FieldByName('CENAREAL').AsCurrency:=dm.tovarPRICE.AsCurrency;
                             tablica.FieldByName('CENASNDS').AsCurrency:=dm.tovarPRICE.AsCurrency;

                            end;
             tablica.Post;

          end

       end;
    finally
      if tablica.State<>dsBrowse then tablica.Post;
      tablica.Refresh;

     Tselect:=false;
     Kartform.Close;
    end;
   end;
//------------------------------------------------------------
  procedure Tkartform.setvybor(var KKMPLU: TFloatField;
                      var KKMNAME: TStringField;
                      var KKMPRICE: TFloatField;
                      var KKMED_IZM: TStringField;
                      var KKMNDS: TFloatField;
                      const myform:tform;
                      var KKMNSP: TFloatField);
  begin
      kartform.KKMPLU:=KKMPLU;
      kartform.KKMNAME:=KKMNAME;
      kartform.KKMED_IZM:=KKMED_IZM;
      kartform.KKMPRICE:=KKMPRICE;
      kartform.KKMNDS:=KKMNDS;
      kartform.KKMNSP:=KKMNSP;
      aform:=myform;
   wybor:=true;
  end;
  procedure TKartForm.InsertWybor;
   begin
    if wybor then
     begin
  if kartform.kkmplu<>nil then      kartform.kkmplu.AsInteger:=dm.tovarPLU.AsInteger;
  if kartform.KKMNAME<>nil then       kartform.KKMNAME.AsString:=copy(dm.tovarNAME.Value,1,52);
  if kartform.KKMED_IZM<>nil then     kartform.KKMED_IZM.AsString:=dm.tovarED_IZM.AsString;
  if kartform.KKMNDS<>nil then       kartform.KKMNDS.Value:=dm.tovarNDS.AsFloat;
  if kartform.KKMNSP<>nil then     kartform.KKMNSP.Value:=dm.tovarNSP.AsFloat;
  if kartform.KKMPRICE<>nil then     kartform.KKMPRICE.Value:=dm.tovarPRICE.AsCurrency;


       if assigned(aform) then aform.Show;

     end;
     wybor:=false;
   end;
 procedure TKartForm.SetSelect(var Tabl:Tdataset;const tip:byte);
  begin
  TSelect:=true;
  SelList.Visible:=true;
  sellist.Items.Clear;
  insbt.Visible:=true;
  insnaklbt.Visible:=false;
  tablica:=tabl;
  tipdoc:=tip;
  end;
//-----------------------------------------------------------------
procedure TKartForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.nofilter;
 Filtr.Close;
 Tselect:=false;
 sellist.Items.Clear;

 //dm.closekatalog;
 isclosed:=true;
 Action:=caFree;
end;

procedure TKartForm.FormDestroy(Sender: TObject);
begin
if not isclosed  then begin
 dm.nofilter;
 Filtr.Close;
 Tselect:=false;
 sellist.Items.Clear;



 end;
   KartForm:=nil;

 end;



procedure TKartForm.katfiltrClick(Sender: TObject);
begin

 selform:=Tselform.Create(kartform);
 selform.Caption:='Категории Товаров';
 selform.DBGrid1.DataSource:=dm.razdds;
 try

   if selform.ShowModal<>mrCancel then begin

       filtrCaption.Caption:='категория';
      // Nameedit.Enabled:=false;
     //  postbt.Enabled:=false;
     //  wes.Enabled:=false;
     //  wes.Checked:=false;
     //  razcena.Checked:=false;
       dm.settip(selform.ModalResult-20);
      // proizwfiltr.Enabled:=false;
       end;
     tform(self).OnActivate(self);

 finally
  selform.Free;
  selform:=nil;
 end;
end;

procedure TKartForm.BitBtn1Click(Sender: TObject);
begin
  // minus.Checked:=false;
  filtrCaption.Caption:='';
  wesfiltered:=false;
   dm.nofilter;
   priceedit.Text:='';

   shButton.Checked:=false;
   kgButton.Checked:=false;
   
   shButton.enabled:=true;
   kgButton.enabled:=true;
  // wes.Checked:=false;
  // razcena.Checked:=false;
  // katfiltr.Enabled:=true;
   nameedit.Enabled:=true;
  // RAZCENA.Enabled:=TRUE;
  // postbt.Enabled:=true;;
  /// wes.Enabled:=true;
  // proizwfiltr.Enabled:=true;
   dm.tovargetmark;
   end;

procedure TKartForm.NameEditChange(Sender: TObject);
var filtr:string;
    barcod:string;

begin
filtr:=Nameedit.Text;barcod:='';

   shButton.Checked:=false;
   kgButton.Checked:=false;
   
   shButton.enabled:=true;
   kgButton.enabled:=true;

if pos(',',filtr)>0 then
                      begin
                       if pos(',',filtr)=length(filtr) then exit;
                       barcod:=copy(filtr,pos(',',filtr)+1,13);
                        if barcod<>'' then
                         begin
                            try
                             strtoint(barcod);
                             filtr:=copy(filtr,1,pos(',',filtr)-1);

                             except
                             barcod:='';
                             end;

                         end;


                      end;


if filtr='' then dm.tovar.Filtered:=false
 else
  BEGIN

  if priceedit.Text<>'' then
  dm.setfilter('(price>'+floattostr(double(priceedit.Value)-0.2)+
  ') and (price<'+floattostr(double(priceedit.Value)+0.2)+')'
   +'and (name='+chr(39)+filtr+'*'+chr(39)+')')
  else  dm.setfilter('name='+chr(39)+filtr+'*'+chr(39));

 // katfiltr.Enabled:=false;
  if dm.tovar.RecordCount=0 then  nameedit.SetFocus;


  END;

 if (barcod<>'') and (dm.tovar.Filtered) and (dm.tovar.RecordCount>0) then
    begin
      dm.findplu.Close;
      dm.findplu.SetVariable('barcode','%'+barcod);
      dm.findplu.Execute;
      while not dm.findplu.Eof do
      begin
        if dm.tovar.Locate('plu',dm.findplu.Field('plu'),[loCaseInsensitive])
           then break;
        dm.findplu.Next;
      end;
     dm.findplu.Close;
    end;
 end;

procedure TKartForm.editkartClick(Sender: TObject);
begin
bitbtn2.Enabled:=editkart.Checked;
dm.editkatalog(not editkart.Checked);
dbgrid2.ReadOnly:=not editkart.Checked;
end;

procedure TKartForm.FormCreate(Sender: TObject);

begin
wesfiltered:=false;
tkartform(self).OnScanAction:=scan;
editkart.OnClick(application);
Tform(sender).Height:=application.mainform.ClientHeight-55;
if not kartvis then
panel2.Height:=0
else  panel2.Height:=238;
tform(self).width:=762;
wybor:=false;

try
if not kartvis then
kartbt.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Arrow1D.bmp')
else
kartbt.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Arrow1U.bmp');
except

end;

filtr:=TFiltrform.Create(KartForm);
Filtr.SetKoords(panel4);
//-Button1.Visible:=dmunit.repedit;
 TSelect:=false;
 //dm.barcodeAfterScroll(dm.barcode);
 isclosed:=false;
 tree.Width:=0;

 RebuildTree;

 end;

procedure TKartForm.wesClick(Sender: TObject);
begin
  filtrCaption.Caption:='Весовой товар';
   wesfiltered:=true;
    dm.setwes(1);
 end;




procedure TKartForm.selbuttonClick(Sender: TObject);
begin
   if not assigned(przform) then przform:=Tprzform.Create(kartform,tsform(self).mybar);
       // begin

        if  dm.tovarPROIZW.AsInteger<>1 then
         dm.Qprzwd.Locate('proizw',dm.tovarPROIZW.AsInteger,[])
          else
          dm.Qprzwd.Locate('proizw',dm.barcodeKODPR.AsInteger,[]);
                   //  then  dm.Qprzwd.Locate('proizw',1,[]);


         przform.ShowModal;
         tform(self).OnActivate(self);
        if (przform.ModalResult<>2) and (editkart.Checked) then
          begin
          // dm.Qprzwd.Locate('proizw',przform.ModalResult-100,[]);
           dm.setproizw(przform.ModalResult-100,'8');

          end;
      // end;


end;
//------------------------------------------------------
procedure TKartForm.SpeedButton1Click(Sender: TObject);

begin

if editkart.Checked then dm.delbarcode;
end;
//------------------------------------------------------
procedure TKartForm.SpeedButton2Click(Sender: TObject);
var res:string;
begin
if editkart.Checked then
 begin
 res:=dm.newbarcode;
 if res<>'0' then dm.addmemo(res);
 end;

end;

procedure TKartForm.DBGrid1DblClick(Sender: TObject);
var ind:integer;
begin
if not Tselect then
 begin
        if wybor then InsertWybor;
        If   dm.insertinvline then exit;//kartform.Close;
        If   dm.insertspisline then exit;//kartform.Close;
        If   dm.insertpriceline then exit;//kartform.Close;

       if (dm.Qnakltemp.Active) and (not  dm.Qnakltemp.ReadOnly)
       then
        begin
        ir:=true;
        dm.inserttovar;
        end;
        //kartform.Close;

  end else
  begin
   if dm.tovarNAME.AsString<>'' then
   begin
   ind:=sellist.Items.Add(dm.tovarNAME.AsString);
   sellist.Checked[ind]:=true;


   end;
  end;
end;

procedure TKartForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var temp:string;
    plu:integer;
begin
plu:=0;
If Tdatasource(dbgrid1.DataSource).DataSet.State=dsBrowse then
 begin

    if ord(key)=13 then  dbgrid1.OnDblClick(nil);

      if ord(key)>31 then
  begin
  if key=' ' then key:='*';
  temp:=Filtr.PutChar(Key);

 // dm.locatetovar(Filtr.PutChar(Key));

 if  temp='*' then
 begin
  plu:=dm.tovarPLU.AsInteger;
  temp:='';


 end;
 if temp='' then dm.tovar.Filtered:=false
      else
        begin
        if dbgrid1.SelectedField.FieldName='NAME' then
        begin
        dm.setfilter('name='+chr(39)+temp+'*'+chr(39));
        filtrCaption.Caption:='название';
        end;
        if dbgrid1.SelectedField.FieldName='PLU' then
         dm.tovar.Locate('PLU',temp,[loCaseInsensitive]);


        end;
  if plu<>0 then dm.LocateTovar(plu);

   end;
  end;
end;



procedure TKartForm.FormShow(Sender: TObject);
begin
tovarcounter.Activate(true);
Tform(sender).Left:=0;
Tform(sender).top:=0;
dbgrid1.SetFocus;
end;

procedure TKartForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (key=27)
  and (not Tselect)
  then Kartform.Close ;
end;

procedure TKartForm.Button1Click(Sender: TObject);

begin

 if kartform.FormStyle=fsMDIChild
 then
    begin

    kartform.FormStyle:=fsStayOnTop;
    tbutton(sender).Caption:='Стандарт';
    kartform.Left:=0;
    kartform.Top:=53;
   end
  else
    begin

   
    kartform.FormStyle:=fsMDIChild;
    tbutton(sender).Caption:='Поверх';

    end;
  kartform.Height:=application.mainform.ClientHeight-55;
end;

procedure TKartForm.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
If Button=nbInsert  then
begin
dbedit1.ReadOnly:=false;
dbedit2.SetFocus;
dbedit10.ReadOnly:=false;
end;


If Button in [nbCancel,nbPost]  then
begin
dbedit1.ReadOnly:=true;
dbGrid1.SetFocus;
if  dm.tovarPRICE.AsInteger=0 then exit;
dbedit10.ReadOnly:=true;
end;
end;

procedure TKartForm.proizwFiltrClick(Sender: TObject);
begin
  if not assigned(przform) then
        begin
         przform:=Tprzform.Create(kartform,tsform(self).mybar);

         przform.ShowModal;
         tform(self).OnActivate(self);
        if (przform.ModalResult<>2) then
          begin
          dm.setfilter('proizw='+chr(39)+inttostr(przform.ModalResult-100)+chr(39));
          filtrCaption.Caption:='производитель';
          //Nameedit.Enabled:=false;
         // wes.Enabled:=false;
        //  postbt.Enabled:=false;
        ///  wes.Checked:=false;
        //  razcena.Checked:=false;
         // katfiltr.Enabled:=false;

         end;
       end;



end;

procedure TKartForm.istbutClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  HistMenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do HistMenu.Popup(x,y);

end;
procedure TKartForm.HformClose(Sender: TObject; var Action: TCloseAction);
begin
 qhistory.Close;
end;

procedure TKartForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  //var temp:integer;
  begin
 // temp:=clred;
 // dm.addmemo(inttostr(temp));
  if not  wesfiltered  then

begin

If (Tdatasource(TDBGrid(Sender).DataSource).DataSet.Fields[18].AsInteger=0)
                    or (dm.tovarPRICE.AsCurrency<>dm.tovarKASSA.AsCurrency)
 then
  TDBGrid(Sender).Canvas.Brush.Color:=$00FFe0e0{clYellow} else
   begin

     If (Tdatasource(TDBGrid(Sender).DataSource).DataSet.Fields[16].AsInteger>0)
      and (Tdatasource(TDBGrid(Sender).DataSource).DataSet.Fields[17].AsCurrency>Tdatasource(TDBGrid(Sender).DataSource).DataSet.Fields[5].AsCurrency)

       then  TDBGrid(Sender).Canvas.Brush.Color:=$00e0e0FF
       else
        if (dm.tovarNAL.Value>0) and (dm.tovarPRICE.AsCurrency>dm.tovarCENAPRIH.AsCurrency)
          then  TDBGrid(Sender).Canvas.Brush.Color:= $00e0FFe0 ;//clLime;






    end;


end else
       begin



       if (dm.tovarWESY.AsCurrency<>dm.tovarPRICE.AsCurrency)
       and (dm.tovarWESY.AsString<>'')
        then
         TDBGrid(Sender).Canvas.Brush.Color:=clYellow;

        end;
 //if dm.tovarCENAPRIH.AsInteger=-1 then  TDBGrid(Sender).Canvas.Font.Color:=clBlue;

 if dm.tovarNAL.AsCurrency<0 then TDBGrid(Sender).Canvas.Brush.Color:=clSilver;

IF  gdSelected   IN State
        Then Begin
                TDBGrid(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGrid(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGrid(Sender).Canvas.Brush.Color:=TDBGrid(Sender).Canvas.Brush.Color;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TKartForm.ExpButClick(Sender: TObject);

begin
   if dm.tovarEXPORT.AsInteger=0   then
   begin
   dm.addmemo('Экспорт запрещён');
   exit;
   end;
   if dm.tovarPRICE.AsCurrency=0 then
   begin
   dm.addmemo('Измените цену');
   exit;
   end;
   if (dm.barcode.RecordCount=0)
   and (dm.tovarSHTUKA.AsInteger=0) then
   begin
   dm.addmemo('нет штрихкода');
   exit;
   end;

  if   dm.InsertPosTovar(dm.tovarPLU.AsInteger,dm.tovarKAT.AsInteger,dm.tovarPROIZW.AsInteger)  then
  begin



   expbut.Enabled:=false;
   dm.commit;
     
  end else dm.rollback;

end;

procedure TKartForm.BitBtn2Click(Sender: TObject);
 var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  AtribMenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do AtribMenu.Popup(x,y);
end;

procedure TKartForm.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
if key=' ' then key:='*';
if nameedit.Text<>'' then filtrCaption.Caption:='Название';
If ord(key)=13  then dbgrid1.OnDblClick(dbgrid1);
end;

procedure TKartForm.BitBtn6Click(Sender: TObject);
var CenForm:TCenForm;
    table:TCenArray;
    i,j:integer;
    org,podr,si:string;
   // rec1,rec2:Pstr;
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
SI:='15';

CenForm:=TCenForm.Create(kartform);
//new(rec1);
//new(rec2);
  try
   org:='';
   podr:='';
   If not dm.Get_Rekvizit(org,podr) then dm.addmemo(messageunit.m1);
   //else begin org:=rec1^;podr:=rec2^;end;
   cenform.setRecvizit(org,podr);
  if not InputQuery('Сколько печатать ?', 'количество',si) then
  exit;
   i:=strtoint(si);
  //I:=strtoint( InputBox('Сколько печатать ?', 'количество','15'));
  if i=0 then exit;
  if i>3 then i:=round(i-(i/4));
   for j := Low(table) to High(table) do   SetLength(table[j], i);
   for j:=0 to i-1 do
      begin
      if dm.tovarSHTUKA.AsInteger=1 then begin dm.addmemo('Весовой товар');exit; end;
      if length(dm.barcodeBARCODE.Value)<>13 then begin dm.addmemo('только EAN13');exit; end;
      fill(j);
     end;

    cenform.Showreport(3,dmunit.repedit,table);


  finally
  CenForm.close;
 // dispose(rec1);
 // dispose(rec2);
  end;
end;

procedure TKartForm.InsBtClick(Sender: TObject);
begin
InsSelItems;
end;

procedure TKartForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=false;
if (Tselect)
  and (SelList.Items.Count>0)
 then
           begin
             if MessageDlg(messageunit.m27,
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               InsSelItems
               else CanClose:=true;


 end else
 CanClose:=true;


end;

procedure TKartForm.PostBtClick(Sender: TObject);
var post:integer;
begin
 If not assigned(postsprav)  then
  begin
    postsprav:=Tpostsprav.Create(kartform,tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Поставщики';
      //postsprav.OnActivate(postsprav);

       post:=postsprav.ShowModal-100;
      tform(self).OnActivate(self);
    if (post>0) and (post<>2) then
    begin
    dm.setfilter('post='+chr(39)+inttostr(post)+chr(39));

   // dm.tovar.SQL.Strings[34]:='and t.plu in (select distinct plu from tmp.tprihnakl where post='+inttostr(post)+')';
     filtrCaption.Caption:='поставщик';


 //   dm.tovar.Close;
  //   dm.tovar.Open;


    end;
  //  DM.tovar.Filtered:=FALSE;

 end;
end;

procedure TKartForm.insnaklbtClick(Sender: TObject);
begin
if assigned(aform) then  InsertWybor;
if dm.insertpriceline then  exit;




if (dm.Qnakltemp.Active) and (not  dm.Qnakltemp.ReadOnly)
then
begin
 //if dm.tovar.RecordCount=0 then exit;
  if dm.Qnakltemp.State=dsBrowse then
     dm.Qnakltemp.Edit;

    // dm.Qnakltemp.Fields.Fields[15].Value
     dm.QnakltempPLU.Value:=dm.tovarPLU.Value;
     dm.QnakltempNAME.Value:=dm.tovarNAME.Value;
     dm.QnakltempED_IZM.Value:=dm.tovarED_IZM.Value;
     dm.QnakltempMEST.AsInteger:=0;
     dm.QnakltempKOL_UP.Value:=1;
     dm.QnakltempROSSIP.Value:=0;
     dm.QnakltempKOL_VO.Value:=0;
     dm.QnakltempCENAWZALE.AsCurrency:=dm.tovarPRICE.AsCurrency;
     dm.QnakltempCENABNDS.AsCurrency:=0;
     dm.QnakltempCENASNDS.AsCurrency:=0;
     dm.QnakltempCENAREAL.AsCurrency:=0;
     dm.QnakltempTOTAL.AsFloat:=0;

end;
ir:=true;

//mainform.Baraction('4607001200024');
end;

procedure TKartForm.razcenaClick(Sender: TObject);
begin
filtrCaption.Caption:='разные цены';
dm.setfilter('((price<>wesy) and (wesy>0)) or ((kassa<>price) and (kassa<>-1)) or ((price<>cenaprih) and (cenaprih>0))');

end;

procedure TKartForm.kartbtClick(Sender: TObject);
begin
kartvis:=not kartvis;
if not kartvis then
begin
kartbt.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Arrow1D.bmp');
panel2.Height:=0;
end else
begin
kartbt.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Arrow1U.bmp');
panel2.Height:=238;
end;

end;

procedure TKartForm.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
if ord(key) in [46,254] then key:=chr(44);
end;

procedure TKartForm.FbarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
begin
filtrCaption.Caption:='штрихкод';
DM.setfilter(dm.findkart(fbarcode.Value));
end;
end;

procedure TKartForm.DBLookupComboboxEh1DropDown(Sender: TObject);
begin
dm.Qrazdel.Refresh;
end;

procedure TKartForm.DBGridEh1DblClick(Sender: TObject);
begin
dm.openprihod(kartform.QhistoryNOM.AsInteger,1,kartform.QhistoryPARTIA.AsInteger,kartform.Qhistory.GetVariable('plu'));

end;

procedure TKartForm.SpeedButton3Click(Sender: TObject);
begin

If dm.tovar.State=dsBrowse then
begin

bookmark:=dm.tovarPLU.AsInteger;
//dm.tovar.Close;
 dm.tovar.Refresh;
//dm.tovar.open;
dm.tovargetmark;


end;


end;

procedure TKartForm.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not editkart.Checked then editkart.Checked:=true;
end;

procedure TKartForm.DBNumberEditEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (DBNumberEditEh1.Text<>'') then
begin
dm.nofilter;
filtrCaption.Caption:='';
dm.LocateTovar(strtoint(DBNumberEditEh1.Text));
end;
end;

procedure TKartForm.N1Click(Sender: TObject);
begin

qhistory.Close;
qhistory.SetVariable('plu',dm.tovarPLU.AsInteger);
qhistory.Open;
with hform do
  begin
        Caption:=dm.tovarNAME.AsString;
        Top:=istbut.Top;
        Left:=istbut.Left;
        ShowModal;
  end;
  tform(self).OnActivate(self);
  end;

procedure TKartForm.N2Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Продажа '+dm.tovarNAME.Value;
child.OnActivate(child);
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.SaleReport.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.SaleReport.Open;
child.DBSum.DataSet:=child.SaleReport;
child.DBSum.SumCollection[1].FieldName:='sumall';
child.DBSum.SumCollection[0].FieldName:='sumkolvo';
child.chDs.DataSet:=child.SaleReport;
child.DBSum.Activate(true);
child.Show;

end;

procedure TKartForm.N3Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Поставки '+dm.tovarNAME.Value;
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.OnActivate(child);
child.movbut.Visible:=true;
child.postReport.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.postReport.Open;
child.chDs.DataSet:=child.PostReport;
child.DBSum.SumCollection[1].FieldName:='partost';
child.DBSum.SumCollection[0].FieldName:='kol_vo';
child.DBSum.DataSet:=child.PostReport;
child.DBSum.Activate(true);


child.Show;
end;

procedure TKartForm.tovgridDblClick(Sender: TObject);
begin
 if seltovar.FieldValues['name']<>'' then
 dm.tovarNAME.AsString:=seltovar.FieldValues['name'];
 dm.tovarECRNAME.AsString:=copy(seltovar.FieldValues['name'],1,26);
 tovgrid.Visible:=false;
 end;

procedure TKartForm.DBEdit2Change(Sender: TObject);
begin
if dm.tovar.State in [dsInsert,dsEdit] then
  begin

    seltovar.Filter:='name='+chr(39)+trimRight(dbedit2.Text)+'*'+chr(39);
    seltovar.Filtered:=true;
    tovgrid.Visible:=true;
   if not seltovar.Active then seltovar.Open;
  end;
end;

procedure TKartForm.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//dm.addmemo(inttostr(key));

if (key=40) and (tovgrid.Visible) then tovgrid.SetFocus;
if (key=13) and (tovgrid.Visible) then tovgrid.Visible:=false;
end;

procedure TKartForm.tovgridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=27)  then begin
                   tovgrid.Visible:=false;
                   dbedit2.SetFocus;
                  end;
if key=13 then tovgrid.OnDblClick(tovgrid);
if (key=38) and (seltovar.Bof) then dbedit2.SetFocus;
end;

procedure TKartForm.N4Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Продажа '+dm.tovarNAME.Value;
child.OnActivate(child);
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.rashReport.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.rashReport.Open;
child.chDs.DataSet:=child.rashReport;
child.DBSum.SumCollection[1].FieldName:='sumall';
child.DBSum.SumCollection[0].FieldName:='sumkolvo';
child.DBSum.DataSet:=child.rashReport;
child.DBSum.Activate(true);
child.Show;
end;

procedure TKartForm.N5Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='История переоценок  '+dm.tovarNAME.Value;
child.OnActivate(child);
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.PriceRep.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.PriceRep.Open;
child.chDs.DataSet:=child.PriceRep;

child.Show;

end;
procedure TKartForm.Scan (Sender:Tobject;Barcode:string);
 begin

  if dm.tovar.State<>dsBrowse then
   begin
     dm.addmemo('Карточка на редактировании');
     exit;
    end;
    if editkart.Checked then



      begin
        dialform.ShowModal;
        case dialform.ModalResult
        of 100:   DM.setfilter(dm.findkart(barcode));
           101:   dm.insbarcode(barcode,dm.tovarPLU.AsInteger);
        end;
        dialform.Hide;
      end else DM.setfilter(dm.findkart(barcode));




end;



procedure TKartForm.barbtnClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  barMenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do barMenu.Popup(x,y);
end;

procedure TKartForm.N6Click(Sender: TObject);
var i:integer;

begin

 I:=strtoint( InputBox('Сколько печатать ?', 'количество','0'));
  if i=0 then exit;
  if i>100 then begin
                   dm.addmemo(messageunit.m35);
                 exit;
                end;

  if dm.tovarplu.AsInteger=0 then exit;

     if dm.tovarSHTUKA.AsInteger<>0 then
                                  begin
                                   dm.addmemo(messageunit.m25);
                                  exit;
                                  end;
     try
     qprint.SetVariable('plu',dm.tovarplu.AsInteger);
     qprint.SetVariable('kolvo',i);
     Qprint.Execute;
     dm.OraBase.Commit;
     except
      dm.OraBase.Rollback;
      raise;
     end;


end;

procedure TKartForm.priceeditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
begin
  if priceedit.Value=null then dm.nofilter
   else
   begin
   filtrCaption.Caption:='Цена';
   IF NameEdit.Text='' then
   dm.setfilter('(price>'+floattostr(double(priceedit.Value)-0.2)+
                      ') and (price<'+floattostr(double(priceedit.Value)+0.2)+')')
   else   dm.setfilter('(price>'+floattostr(double(priceedit.Value)-0.2)+
  ') and (price<'+floattostr(double(priceedit.Value)+0.2)+')'
   +'and (name='+chr(39)+Nameedit.Text+'*'+chr(39)+')');

   end;
end;
end;

procedure TKartForm.N8Click(Sender: TObject);
var i:integer;
    quantity:double;
    temp,kod:string;
begin

    if (dm.tovarplu.AsInteger=0)
        or (dm.tovarSHTUKA.AsInteger<>1) then exit;


      I:=strtoint( InputBox('Сколько печатать ?', 'количество','1'));
      if i<1 then exit;
       if i>100 then begin
                   dm.addmemo(messageunit.m35);
                 exit;
                end;
     temp:=InputBox('Вес товара ?', 'Вес в килограммах.','1');
     while pos('.',temp)>0 do temp:=StuffString(temp,pos('.',temp),1,',');
     quantity:=strtofloat(temp);
     if quantity<0.05 then
                begin
                  dm.addmemo('имеет смысл печатать меньше 50 грамм ?');
                  exit;
                end;
   if quantity>99.999 then
                      begin
                      dm.addmemo('вес в килограммах.Не больше 99.999');
                      exit;
                      end;


   kod:='21';
   case length(dm.tovarPLU.AsString) of
      1:kod:=kod+'0000'+dm.tovarPLU.AsString;
      2:kod:=kod+'000'+dm.tovarPLU.AsString;
      3:kod:=kod+'00'+dm.tovarPLU.AsString;
      4:kod:=kod+'0'+dm.tovarPLU.AsString;
      5:kod:=kod+dm.tovarPLU.AsString;
     else  exit;

    end;
    temp:=floattostr(quantity*1000);
     case length(temp) of
      1:temp:='0000'+temp;
      2:temp:='000'+temp;
      3:temp:='00'+temp;
      4:temp:='0'+temp;
      5:;
     else  exit;

    end;



    if length(kod)=7 then kod:=kod+temp;

   temp:=barcodeunit.CalcBar(kod);
   if temp='error' then exit;

     try
     qprint.SetVariable('plu',dm.tovarplu.AsInteger);
     qprint.SetVariable('kolvo',i);
    // qwesprint.SetVariable('barcode',temp);
     Qprint.Execute;

     qwesprint.SetVariable('plu',dm.tovarplu.AsInteger);
     qwesprint.SetVariable('barcode',temp);
     Qwesprint.Execute;
      
     dm.OraBase.Commit;
     except
      dm.OraBase.Rollback;
      raise;
     end;



end;
{-----------------------------------------------------------------------------}

function Tkartform.CreateArray(const Inputstr:string;
                      var word1:string;
                      var word2:string;
                      var word3:string;
                       var word4:string;
                       var word5:string): integer;



 var dlinna:integer;
     i:integer;
     probel:integer;
     counter:integer;
     space:boolean;





 begin

 counter:=1;
 probel:=1;
 result:=0;
 space:=true;
 word1:='';  word2:=''; word3:='';word4:=''; word5:='';
 dlinna:=length(Inputstr);
 if dlinna<3 then exit;
 if pos(' ',Inputstr)>0 then
     begin
      for i:=1 to dlinna do
        begin
         if (Inputstr[i]=' ') and (not space) then
            begin
            if (i-probel)<5 then continue;


              case counter  of
              1:word1:=trim(copy(Inputstr,probel,i-probel));
              2:word2:=trim(copy(Inputstr,probel,i-probel));
              3:word3:=trim(copy(Inputstr,probel,i-probel));
              4:word4:=trim(copy(Inputstr,probel,i-probel));
              5:word5:=trim(copy(Inputstr,probel,i-probel));


              else;
              end;//case
              space:=true;
              probel:=i;
              inc(counter);

            end else space:=false;

        end;//for

     end;//if
 case counter of
   2:word2:=trim(copy(Inputstr,probel,dlinna-probel));
   3:word3:=trim(copy(Inputstr,probel,dlinna-probel));
   4:word4:=trim(copy(Inputstr,probel,dlinna-probel));
   5:word5:=trim(copy(Inputstr,probel,dlinna-probel));

 end;

if counter>1 then
begin
  if length(word1)+length(word2)+1<17 then
                                     begin
                                      word1:=word1+' '+word2;
                                      word2:=word3;
                                      word3:=word4;
                                      word4:=word5;
                                      word5:='';
                                      dec(counter);
                                     end;

end;

if counter>1 then
begin
if length(word2)+length(word3)+1<17 then
                                     begin
                                      word2:=word2+' '+word3;
                                      word3:=word4;
                                      word4:=word5;
                                      word5:='';
                                     dec(counter);
                                     end;

end;
if counter>1 then
begin
if length(word3)+length(word4)+1<17 then
                                     begin
                                      word3:=word3+' '+word4;
                                      word4:=word5;
                                      word5:='';
                                     dec(counter);
                                     end;

end;
if counter>1 then
begin
if length(word4)+length(word5)+1<17 then
                                     begin
                                      word4:=word4+' '+word5;
                                      word5:='';
                                     dec(counter);
                                     end;

end;





  result:=counter;


 end;
{-----------------------------------------------------------------------------}
procedure TKartForm.N11Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Проведённая Продажа '+dm.tovarNAME.Value;
child.OnActivate(child);
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.knigarashod.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.knigarashod.Open;
child.chDs.DataSet:=child.knigarashod;
child.DBSum.SumCollection[1].FieldName:='kol_vo';
child.DBSum.SumCollection[0].FieldName:='kol_vo';
child.DBSum.DataSet:=child.knigarashod;
child.DBSum.Activate(true);
child.Show;

end;

procedure TKartForm.minusClick(Sender: TObject);
begin
filtrCaption.Caption:='минус';
dm.setfilter('nal<0');

end;

procedure TKartForm.N12Click(Sender: TObject);
 var temp,newkat:integer;

 begin
 if not dm.tovar.Filtered then
  begin
   dm.addmemo('Товар не выбран !');
   exit;

  end;
if  MessageDlg('Изменить Категорию ?',
        mtWarning, [mbYes, mbNo], 0) = mrYes
   then
begin

 temp:=dm.tovarPLU.AsInteger;

 selform:=Tselform.Create(kartform);
 selform.Caption:='Категории Товаров';
 selform.DBGrid1.DataSource:=dm.razdds;
 try

   if selform.ShowModal<>mrCancel then
        begin
           newkat:=selform.ModalResult-20;

       end
    else  exit;


 finally
  tform(self).OnActivate(self);
  selform.Free;
  selform:=nil;
 end;
 dm.tovar.First;
 while not dm.tovar.Eof do
  begin
    if dm.tovarKAT.AsInteger<>newkat then
       begin
         dm.tovar.Edit;
         dm.tovarKAT.AsInteger:=newkat;
         dm.tovar.Post;

       end;
    dm.tovar.Next;
  end;

 dm.locatetovar(temp);
 end;

end;

procedure TKartForm.N13Click(Sender: TObject);
 var temp,newproizw:integer;
begin
 if not dm.tovar.Filtered then
  begin
   dm.addmemo('Товар не выбран !');
   exit;
 end;
   if  MessageDlg('Изменить Производителя ?',
        mtWarning, [mbYes, mbNo], 0) = mrYes
   then
begin
    if not assigned(przform) then przform:=Tprzform.Create(kartform,tsform(self).mybar);


        if  dm.tovarPROIZW.AsInteger<>1 then
         dm.Qprzwd.Locate('proizw',dm.tovarPROIZW.AsInteger,[]);

         przform.ShowModal;
         tform(self).OnActivate(self);
        if (przform.ModalResult<>2) and (editkart.Checked) then

         newproizw:=przform.ModalResult-100
         else exit;

  temp:=dm.tovarPLU.AsInteger;
  dm.tovar.First;
 while not dm.tovar.Eof do
  begin
    if dm.tovarPROIZW.AsInteger<>newproizw then
       begin
         dm.tovar.Edit;
         dm.tovarPROIZW.AsInteger:=newproizw;
         dm.tovar.Post;

       end;
    dm.tovar.Next;
  end;

 dm.locatetovar(temp);





end;





end;

procedure TKartForm.N15Click(Sender: TObject);
begin
  if  MessageDlg('Это займет некоторое время.Продолжить ?',
        mtWarning, [mbYes, mbNo], 0) = mrYes
   then
 begin
  dmunit.repedit:=true;
  editkart.Checked:=true;
  dm.nofilter;
  SpeedButton3.Click;
  dm.tovar.First;
    while not dm.tovar.Eof
  do begin
      if roundto(dm.tovarNAL.AsFloat,-3)=0
       then
          begin
           if
           (dm.tovarPLU.AsInteger<>0) and
           ((dm.tovarEXPORT.AsInteger=0) or
           (integer(dm.ExecuteSQL('select nvl(round(sysdate-max(data),0),999) from tmp.kniga where otkat=0 and rashod>0 and plu='+dm.tovarPLU.AsString))>120)
            )
            then
                begin
                 try

                  dm.ExecuteSQL('update tmp.tkatalog set export=0 where plu='+dm.tovarPLU.AsString);
                  dm.ExecuteSQL('delete from pos.tovar where plu='+dm.tovarPLU.AsString);
                 dm.commit;

                   except
                   dm.addmemo('ошибка удаления товара '+dm.tovarPLU.AsString);
                    dm.rollback;

                   end;
                 end;
          end;

       dm.tovar.Next;
     end;
    end;
end;

procedure TKartForm.HistMenuPopup(Sender: TObject);
var user:string;
begin
  user:=string(dm.ExecuteSQL('select upper(user) from dual'));
  n15.Enabled:=((user='ALEX') and (dmunit.repedit)) ;



 end;

procedure TKartForm.filtrbuttonClick(Sender: TObject);
var xPoint:TPoint;
begin
 wesfiltered:=false;
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
 FiltrMenu.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do FiltrMenu.Popup(x,y);
end;




procedure TKartForm.SpeedButton4Click(Sender: TObject);
begin
filtrCaption.Caption:='штрихкод';
fbarcode.Text:=dm.barcodeBARCODE.Value;
DM.setfilter(dm.findkart(dm.barcodeBARCODE.Value));
end;

procedure TKartForm.tovarcounterRecalcAll(Sender: TObject);
begin
 if not dm.tovar.Filtered then filtrCaption.Caption:='';
tovarLabel.Caption:='Товаров -  '+floattostr(tovarcounter.SumCollection.Items[0].SumValue);
end;

procedure TKartForm.N02Click(Sender: TObject);
begin
filtrCaption.Caption:='наличие';
dm.setfilter('nal<>0');
end;

procedure TKartForm.N21Click(Sender: TObject);
begin
   dm.ExecuteSQL('update tmp.toptions set value='+dm.tovarPLU.AsString+' where parametr='+chr(39)+'plu'+chr(39));
   dm.commit;
   AboutBox.cheksummreport.Close;
   AboutBox.topten.Close;
   AboutBox.setreport(AboutBox.cheksummreport,AboutBox.topten,nil,nil,'\reports\cheksum.frf');


end;

procedure TKartForm.N23Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Инвентаризации '+dm.tovarNAME.Value;
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.OnActivate(child);
child.movbut.Visible:=false;
child.invreport.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.invreport.Open;
child.chDs.DataSet:=child.invreport;
child.DBSum.SumCollection[1].FieldName:='';
child.DBSum.SumCollection[0].FieldName:='';
child.DBSum.DataSet:=nil;
//child.DBSum.Activate(true);


child.Show;
end;

procedure TKartForm.N24Click(Sender: TObject);
var child:TchekForm;
begin
child:=TchekForm.Create(Application,tsform(self).mybar);
child.Caption:='Движение товара '+dm.tovarNAME.Value;
child.OnActivate(child);
child.Top:=KartForm.Top;
child.Left:=kartform.Left;
child.movreport.SetVariable('plu',dm.tovarPLU.AsInteger);
child.plu:=dm.tovarPLU.AsInteger;
child.movreport.Open;
child.chDs.DataSet:=child.movreport;
child.DBSum.SumCollection[1].FieldName:='kol_vo';
child.DBSum.SumCollection[0].FieldName:='kol_vo';
child.DBSum.DataSet:=child.movreport;
child.DBSum.Activate(true);
child.Show;

end;

procedure TKartForm.postboxClick(Sender: TObject);
begin
dm.Qpostav.Refresh;
end;

procedure TKartForm.postboxDropDown(Sender: TObject);
begin
postbox.Width:=300;
end;


//----------------------------------------------------------
procedure TKartForm.N25Click(Sender: TObject);
 var newpost:integer;
begin
 if not dm.tovar.Filtered then
  begin
   dm.addmemo('Товар не выбран !');
   exit;
 end;
   if  MessageDlg('Изменить Поставщика ?',
        mtWarning, [mbYes, mbNo], 0) = mrYes
   then
begin
    If not assigned(postsprav)  then
  begin
    postsprav:=Tpostsprav.Create(kartform,tsform(self).mybar);
      postsprav.setds(dm.postds,postsprav);
      postsprav.Caption:='Поставщики';
       newpost:=postsprav.ShowModal-100;
      tform(self).OnActivate(self);
    if (newpost<=0) or (newpost=2) or (not editkart.Checked)  then exit;
try
  dm.tovar.First;
 while not dm.tovar.Eof do
  begin
    if dm.tovarPOST.AsInteger<>newpost then
       begin
         dm.tovar.Edit;
         dm.tovarPOST.AsInteger:=newpost;
         dm.tovar.Post;

       end;
    dm.tovar.Next;
  end;
 dm.commit;
 except
 dm.rollback;

   end;

  end;

end;
end;
 //-----------------------------------
 procedure TKartForm.RebuildTree;
 begin
       Tree.Items.Clear;

    // Принудительное раскрытие самого верхнего уровня
    ExpandLevel(nil);
    Tree.Selected:=Tree.Items[0];

 end;
 //-------------------------------------------
Procedure TKartForm.ExpandLevel( Node : TTreeNode);
Var ID , i   : Integer;
    TreeNode : TTreeNode;
Begin

  IF Node = nil Then ID:=0
    Else ID:=Node.Level+1;
if id=0 then
begin
  dm.Qrazdel.Open;
  dm.Qrazdel.Filtered:=false;
  dm.Qrazdel.First;
  Tree.Items.BeginUpdate;
     For i:=1 To dm.Qrazdel.RecordCount Do
        Begin
             // Запишем в поле Data ветки ее идентификационный номер(ID) в таблице

       if  DM.QrazdelPARENT.AsString =''
         then begin

           TreeNode:=Tree.Items.AddChildObject(Node ,
                                  dm.QrazdelNAME.AsString ,
                                  Pointer(dm.QrazdelKAT.AsInteger));
         treenode.ImageIndex:=0;
          TreeNode.SelectedIndex:=0;
       // Добавим фиктивную (пустую) дочернюю ветвь только для того,
       // чтобы был отрисован [+] на ветке и ее можно было бы раскрыть
       Tree.Items.AddChildObject(TreeNode , '' , nil);
         end;
       dm.Qrazdel.Next;

        end;

   Tree.Items.EndUpdate;

  end;
  if id=1 then
begin
  dm.Qrazdel.Open;
  dm.Qrazdel.Filtered:=false;
  dm.Qrazdel.Filter:='parent='+inttostr(integer(node.Data));
  dm.Qrazdel.Filtered:=True;
  dm.Qrazdel.First;

  Tree.Items.BeginUpdate;
   if dm.Qrazdel.RecordCount>0 then
    begin
     For i:=1 To dm.Qrazdel.RecordCount Do
        Begin
             TreeNode:=Tree.Items.AddChildObject(Node ,
                               dm.QrazdelNAME.AsString ,
                               Pointer(dm.QrazdelKAT.AsInteger));
           treenode.ImageIndex:=0;
            TreeNode.SelectedIndex:=0;
             Tree.Items.AddChildObject(TreeNode , '' , nil);
       dm.Qrazdel.Next;

        end;
     end else begin
          dm.Qrazdel.Filtered:=false;
          dm.Qrazdel.Locate('kat',integer(node.Data),[]);
                    TreeNode:=Tree.Items.AddChildObject(Node ,
                                dm.QrazdelNAME.AsString,
                               node.Data);
                     treenode.ImageIndex:=0;
                      TreeNode.SelectedIndex:=0;
                     Tree.Items.AddChildObject(TreeNode , '' , nil);
               end;
   dm.Qrazdel.Filtered:=false;
   Tree.Items.EndUpdate;

  end;











  if id=2 then
begin
  qprotree.Close;
  qprotree.SetVariable('kat',Integer(Node.Data));

  qprotree.Open;
  qprotree.Filtered:=false;
  qprotree.First;
  Tree.Items.BeginUpdate;
     For i:=1 To qprotree.RecordCount Do
        Begin

           TreeNode:=Tree.Items.AddChildObject(Node ,
                                  qprotreeNAME.AsString ,
                                  Pointer(qprotreePROIZW.AsInteger));


         treenode.ImageIndex:=1;
         TreeNode.SelectedIndex:=1;
       Tree.Items.AddChildObject(TreeNode , '' , nil);

       qprotree.Next;

        end;

   Tree.Items.EndUpdate;
   qprotree.Close;
  end;

 if id=3 then
begin
  qposttree.Close;
  qposttree.SetVariable('kat',Integer(Node.Parent.Data));
  qposttree.SetVariable('proizw',Integer(Node.Data));
  qposttree.Open;
  qposttree.Filtered:=false;
  qposttree.First;
  Tree.Items.BeginUpdate;
     For i:=1 To qposttree.RecordCount Do
        Begin

           TreeNode:=Tree.Items.AddChildObject(Node ,
                                  qposttreeNAME.AsString,
                                  Pointer(qposttreeCOD.AsInteger));


        treenode.ImageIndex:=2;
        TreeNode.SelectedIndex:=2;
     //  Tree.Items.AddChildObject(TreeNode , '' , nil);

       qposttree.Next;

        end;

   Tree.Items.EndUpdate;
   qposttree.Close;
  end;




end;
//------------------------------------------
procedure TKartForm.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  IF Node = nil Then Exit;

  // Если первая дочерняя ветвь той, которую мы хотим раскрыть, пустая
  // значит это фиктивная ветвь, дерево еще не достраивалось по этой ветви.
  // Удаляем фиктивную ветвь и "разворачиваем" дерево вглубь той ветки,
  // на которой стоим
  IF Node.getFirstChild.Data = nil
  Then Begin
          Node.DeleteChildren;
          ExpandLevel(Node);
       End;

end;

procedure TKartForm.TreeChange(Sender: TObject; Node: TTreeNode);
Var ID : Integer;
 temp:string;
begin

   IF TTreeView(Sender).Selected <> nil Then
   Begin
     {  // ID родительской ветки , для нее и ищем все дочерние
       ID:=Integer(TTreeView(Sender).Selected.Data);

       qCompanies.Close;
       qCompanies.ParamByName('ParentID').AsInteger:=ID;
       qCompanies.Open;   }
     id:=TTreeView(Sender).Selected.Level;
     if  (id=1) or (id=0) then
     begin
      filtrCaption.Caption:='категория';
      dm.settip(integer(TTreeView(Sender).Selected.Data));
      end;
      if  id=2 then
     begin
       filtrCaption.Caption:='категория и производитель';

       temp:='(kat='+inttostr(integer(TTreeView(Sender).Selected.Parent.Data))
                        +') and (proizw='+inttostr(integer(TTreeView(Sender).Selected.Data))+')';

      dm.tovar.Filter:=temp;
      dm.tovar.Filtered:=true;

      end;
     if  id=3 then
     begin

      filtrCaption.Caption:='категория и производитель и поставщик';
       temp:='(kat='+inttostr(integer(TTreeView(Sender).Selected.Parent.Parent.Data))
                        +') and (proizw='+inttostr(integer(TTreeView(Sender).Selected.Parent.Data))
                        +') and (post='+inttostr(integer(TTreeView(Sender).Selected.Data))+')';

      dm.tovar.Filter:=temp;
      dm.tovar.Filtered:=true;

      end;



    tform(self).OnActivate(self);
   End;

end;

procedure TKartForm.DBGrid1CellClick(Column: TColumn);
var i:integer;
begin
//
  if tree.Width=0 then exit;

 for i:=0 TO tree.Items.Count-1 do  tree.Items.Item[i].Collapse(false);


  for i:=0 TO tree.Items.Count-1 do
    begin
//dm.addmemo(inttostr(tree.Items.Item[i].Level)+' '+tree.Items.Item[i].Text);
    if  (tree.Items.Item[i].Level=0) and
        (integer(tree.Items.Item[i].data)=dm.tovarKAT.AsInteger)
        then begin
         tree.Items.Item[i].Expand(false);
         break;
              end;
    end;

    for i:=0 TO tree.Items.Count-1 do
    begin
//dm.addmemo(inttostr(tree.Items.Item[i].Level)+' '+tree.Items.Item[i].Text);
    if  (tree.Items.Item[i].Level=1) and
        (integer(tree.Items.Item[i].data)=dm.tovarPROIZW.AsInteger)
        then begin
         tree.Items.Item[i].Expand(false);
         break;
              end;
    end;




end;

procedure TKartForm.TreeDblClick(Sender: TObject);
begin
TreeChange(sender,nil);
end;

procedure TKartForm.Panel5Click(Sender: TObject);
begin

if tree.Width=0 then
  begin
   panel5.Caption:='<';
   tree.Width:=240;

  end
  else
  begin
    panel5.Caption:='>';
   tree.Width:=0;
  end;
end;


procedure TKartForm.postboxCloseUp(Sender: TObject; Accept: Boolean);
begin

postbox.Width:=135;

end;

procedure TKartForm.postbuttonClick(Sender: TObject);
var temp:integer;
begin
 if dm.tovar.ReadOnly=true then exit;
 if not assigned(postsprav) then
   begin
    postsprav:=Tpostsprav.Create(self,myBar);
    end;
  temp:=postsprav.ShowModal;
  if   temp>100
  then
      begin
       postbox.Value:=temp-100;

      end;

end;

procedure TKartForm.shButtonClick(Sender: TObject);
begin
if TRadioButton(sender).Checked  then
  begin
      shButton.enabled:=false;
   kgButton.enabled:=false;

      if not DM.tovar.Filtered  then
          dm.tovar.Filter:='shtuka='+chr(39)+inttostr(TRadioButton(sender).Tag)+chr(39)
       else dm.tovar.Filter:='('+dm.tovar.Filter+') and ('+
        'shtuka='+chr(39)+inttostr(TRadioButton(sender).Tag)+chr(39)+')';
    dm.tovar.Filtered:=true;

  // dm.addmemo(dm.tovar.Filter);
  end;

 end;

end.
