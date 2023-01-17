unit aktunit;

interface

uses
  Windows, Messages,sunit, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh, Buttons, DB, mySQLDbTables,
  jpeg, Grids, DBGridEh, SpeedForm, DBLookupEh, CheckLst;

type
  Taktform = class(TSForm)
    userlabel: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    clientname: TDBEditEh;
    clientadr: TDBEditEh;
    clienttel: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    custQuery: TmySQLQuery;
    custQueryid: TAutoIncField;
    custQueryname: TStringField;
    custQueryadres: TStringField;
    custQuerytel: TStringField;
    Bevel3: TBevel;
    Label5: TLabel;
    tovnameedit: TDBEditEh;
    tovnumbedit: TDBEditEh;
    Label6: TLabel;
    Label7: TLabel;
    dataselledit: TDBDateTimeEditEh;
    Label8: TLabel;
    BitBtn2: TBitBtn;
    tovarquery: TmySQLQuery;
    sellQuery: TmySQLQuery;
    tovarqueryid: TAutoIncField;
    tovarqueryname: TStringField;
    tovarqueryserialnum: TStringField;
    tovarqueryinuse: TWordField;
    tovarqueryclient: TSmallintField;
    sellQueryid: TAutoIncField;
    sellQuerytovar: TIntegerField;
    sellQuerydata: TDateField;
    sellQuerygarantia: TDateField;
    sellQueryprice: TFloatField;
    sellQuerymag: TStringField;
    sellQueryowner: TStringField;
    enddate: TDBDateTimeEditEh;
    Label9: TLabel;
    primedit: TDBEditEh;
    Label12: TLabel;
    klientchek: TCheckBox;
    Memo1: TMemo;
    Label10: TLabel;
    OpenDialog1: TOpenDialog;
    BitBtn3: TBitBtn;
    Label11: TLabel;
    BitBtn4: TBitBtn;
    podmenaname: TDBEditEh;
    ok: TBitBtn;
    insertRemQuery: TmySQLQuery;
    insertSellQuery: TmySQLQuery;
    updTovarQuery: TmySQLQuery;
    insPodmenaQuery: TmySQLQuery;
    remidQuery: TmySQLQuery;
    remidQueryid: TAutoIncField;
    inspictQuery: TmySQLQuery;
    podmQuery: TmySQLQuery;
    podmQueryid: TAutoIncField;
    podmQuerytovarid: TIntegerField;
    podmQueryremontid: TIntegerField;
    podmQueryendid: TIntegerField;
    Label14: TLabel;
    selpictquery: TmySQLQuery;
    pds: TDataSource;
    selpictqueryid: TAutoIncField;
    selpictqueryremont: TIntegerField;
    selpictqueryFILENAME: TStringField;
    selpictqueryFILE: TBlobField;
    BitBtn6: TBitBtn;
    pictform: TSpeedForm;
    DBGridEh1: TDBGridEh;
    Image1: TImage;
    Button1: TButton;
    delpict: TmySQLQuery;
    updremQuery: TmySQLQuery;
    delpodmena: TmySQLQuery;
    updMesto: TmySQLQuery;
    Label15: TLabel;
    magdb: TmySQLQuery;
    magdbid: TAutoIncField;
    magdbname: TStringField;
    magdbadres: TStringField;
    magdbtel: TStringField;
    magdbservis: TSmallintField;
    magds: TDataSource;
    servbox: TDBLookupComboboxEh;
    chekbox: TCheckListBox;
    kompedit: TDBEditEh;
    Label13: TLabel;
    tovarquerytip: TIntegerField;
    selcomplect: TmySQLQuery;
    selcomplectname: TStringField;
    videdit: TDBEditEh;
    Label16: TLabel;
    print: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure clientnameChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure klientchekClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure selpictqueryAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure chekboxClickCheck(Sender: TObject);
    procedure printClick(Sender: TObject);
  private


    { Private declarations }
  function Checkparametr:boolean;
  function insertRemont:boolean;
  function insertSell:boolean;
  function updatetovar:boolean;
  function GetRemontId:integer;
  procedure insertPictures;
  function tovarVpodmene(const tovid:Integer):boolean;
  function updateRemont:boolean;

  public
    { Public declarations }
   username:string;
   userid:integer;
   
   magname:string;
   magid:integer;
   clientid:integer;
   tovarid:integer;
   podmenaid:integer;
   newakt:boolean;
   sellid:integer;
   remontid:integer;
   remdata:TDateTime;
  procedure loadrekv;

  end;

var
  aktform: Taktform;

implementation

uses dmunit, custunit, tovarunit;

{$R *.dfm}

procedure Taktform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=caFree;
end;

procedure Taktform.FormCreate(Sender: TObject);
begin
clientid:=0;
tovarid:=0;
podmenaid:=0;
newakt:=false;
sellid:=0;
remontid:=0;
end;

procedure Taktform.BitBtn1Click(Sender: TObject);
var temp:Tcustform;
    cid:integer;
begin
temp:=Tcustform.Create(tform(self));
temp.FormStyle:=fsNormal;
temp.Visible:=false;
temp.Position:=poOwnerFormCenter;
cid:=temp.ShowModal;
if cid >200
  then begin
        custQuery.Close;
        custQuery.ParamByName('id').AsInteger:=cid-200;
        custQuery.Open;
        if custQuery.RecordCount>0
        then begin
               clientid:=custQueryid.Value;
               clientname.Text:=custQueryname.Value;
               clientadr.Text:=custQueryadres.Value;
               clienttel.Text:=custQuerytel.Value;

               custQuery.Close;

             end;
       end;


end;

procedure Taktform.BitBtn2Click(Sender: TObject);

 var temp:Ttovarform;
    tid:integer;
begin
temp:=Ttovarform.Create(tform(self));
temp.FormStyle:=fsNormal;
temp.Visible:=false;
temp.Position:=poOwnerFormCenter;
tid:=temp.ShowModal;
if tid >200
  then begin
        tovarQuery.Close;
        tovarQuery.ParamByName('id').AsInteger:=tid-200;
        tovarQuery.Open;
        if tovarQuery.RecordCount>0
        then begin
               if tovarqueryinuse.Value=1 then
                      begin
                        ShowMessage('товар в ремонте');
                        exit;
                      end;
               if tovarVpodmene(tovarqueryid.Value)  then
                                 begin
                                  ShowMessage('товар в подмене');
                                  exit
                                 end;
               tovnameedit.Text:=tovarqueryname.Value;
               tovnumbedit.Text:=tovarqueryserialnum.Value;
               tovarid:=tovarqueryid.Value;
               selcomplect.Close;
               selcomplect.ParamByName('tip').AsInteger:=tovarquerytip.Value;
               selcomplect.Open;
               chekbox.Items.Clear;
               while not selcomplect.Eof do
               begin
                chekbox.Items.Add(selcomplectname.Value);
                selcomplect.Next;
               end;
               selcomplect.Close;
               tovarquery.Close;
               sellQuery.Close;
                sellQuery.ParamByName('id').AsInteger:=tid-200;
                sellQuery.Open;
               if sellquery.RecordCount>0 then
                       begin
                          sellquery.Last;
                          dataselledit.Value:=sellQuerydata.AsDateTime;
                          enddate.Value:=sellQuerygarantia.AsDateTime;

                          sellid:=sellQueryid.Value;
                       end
                       else begin
                       dataselledit.ReadOnly:=false;
                          enddate.ReadOnly:=false;
                        end;

             end;
       end;

end;

procedure Taktform.clientnameChange(Sender: TObject);
begin
if tedit(sender).Text<>'' then
  begin
  dataselledit.Enabled:=true;
  enddate.Enabled:=true;
  klientchek.Checked:=true;
  end;
end;

procedure Taktform.BitBtn3Click(Sender: TObject);
begin
if OpenDialog1.Execute then
memo1.Lines.Add(OpenDialog1.FileName) ;


end;
//-----------------------------------------------------------------------------
procedure Taktform.BitBtn4Click(Sender: TObject);
 var temp:Ttovarform;
    tid:integer;
begin
if not klientchek.Checked  then exit;
temp:=Ttovarform.Create(tform(self));
temp.FormStyle:=fsNormal;
temp.Visible:=false;
temp.Position:=poOwnerFormCenter;
tid:=temp.ShowModal;
if tid >200
  then begin
        tovarQuery.Close;
        tovarQuery.ParamByName('id').AsInteger:=tid-200;
        tovarQuery.Open;
        if tovarQuery.RecordCount>0
        then begin
               if tovarqueryclient.Value=1
               then begin
                     ShowMessage('товар клиента');
                      exit;
                    end;
              if tovarVpodmene(tovarqueryid.Value)  then
                                 begin
                                  ShowMessage('товар в подмене');
                                  exit
                                 end;
                if tovarqueryinuse.Value=1 then
                                begin
                                  ShowMessage('товар в ремонте');
                                  exit
                                 end;

               podmenaname.Text:=tovarqueryname.Value;

               podmenaid:=tovarqueryid.Value;
               tovarquery.Close;

            end;
       end;
 if tid=200
     then begin
          if (not newakt) and (remontid>0)
            then begin
                  podmenaid:=0;
                  podmenaname.Text:='';
                  

                 end;
         end;
end;
//-----------------------------------------------------------------------------
procedure Taktform.okClick(Sender: TObject);

begin
if not Checkparametr then exit;
if not dm.test then exit;

  if newakt then
             begin
              if MessageDlg('Сохранить документ ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              if not insertRemont then exit;

              if (clientid>0) and (sellid=0) then
                        if not insertSell then exit;

              if not updatetovar then exit;

              remontid:=GetRemontId;
              if remontid=0 then ShowMessage('ошибка получения кода ремонта');
              if (podmenaid<>0) and  (remontid<>0)
              then             begin
                                delpodmena.ParamByName('id').Value:=remontid;
                                delpodmena.ExecSQL;

                               if clientid>0 then
                                          begin
                                           updMesto.ParamByName('mesto').Value:=clientname.Text;
                                           updMesto.ParamByName('id').Value:=podmenaid;
                                           updMesto.ExecSQL;
                                          end;
                                insPodmenaQuery.ParamByName('tovar').AsInteger:=podmenaid;
                                insPodmenaQuery.ParamByName('remont').AsInteger:=remontid;
                                insPodmenaQuery.ExecSQL;
                               end;

              if (remontid<>0) and (memo1.Lines.Count>0) then
                                        insertPictures;
                print.Enabled:=true;

               TBitBtn(sender).Enabled:=false;
             end;
          end;

    if not newakt then
       begin
         if MessageDlg('Сохранить документ ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              if not updateRemont then exit;

              if (clientid>0) and (sellid=0) then
                        if not insertSell then exit;

             // if not updatetovar then exit;



            {  if podmenaid=0 then
                              begin
                                delpodmena.ParamByName('id').Value:=remontid;
                                delpodmena.ExecSQL;
                              end;
              if (podmenaid<>0) and  (remontid<>0)
              then             begin

                                delpodmena.ParamByName('id').Value:=remontid;
                                delpodmena.ExecSQL;

                                insPodmenaQuery.ParamByName('tovar').AsInteger:=podmenaid;
                                insPodmenaQuery.ParamByName('remont').AsInteger:=remontid;
                                insPodmenaQuery.ExecSQL;
                               end;       }

              if (remontid<>0) and (memo1.Lines.Count>0) then
                                        insertPictures;


               TBitBtn(sender).Enabled:=false;

            end;
       end;
 end;
//---------------------------------------------------------------------------
procedure Taktform.klientchekClick(Sender: TObject);
begin
if clientid=0 then TCheckBox(sender).Checked:=false else TCheckBox(sender).Checked:=true;
//TCheckBox(sender).Checked:=(not clientid=0) ;
end;
//--------------------------------------------------------------------------

function Taktform.Checkparametr;
 begin
   result:=false;
    if tovarid=0 then begin
                    ShowMessage('не выбран товар');
                    exit;
                  end;
 if (klientchek.Checked) and  ((dataselledit.Value=null) or (enddate.Value=null))
                  then begin
                      ShowMessage('не введены даты гарантии');
                     exit;
                  end;
if (klientchek.Checked) and (dataselledit.Value>date) then
                         begin
                         ShowMessage('дата начала гарантии больше текущей даты');

                         exit;
                         end;

if (klientchek.Checked) and (dataselledit.Value>enddate.Value) then
                         begin
                         ShowMessage('дата начала гарантии больше даты окончания');

                         exit;
                         end;
 if primedit.Text=''  then
                         begin
                         ShowMessage('нужно описание дефекта');

                         exit;
                         end;
   if servbox.Value=null  then
                         begin
                         ShowMessage('нужно выбрать сервис-центр');

                         exit;
                         end;

     if kompedit.Text=''  then
                         begin
                         ShowMessage('нужно указать комплектацию');

                         exit;
                         end;

      if videdit.Text=''  then
                         begin
                         ShowMessage('нужно описание внешнего вида');

                         exit;
                         end;

   result:=true;
 end;


//---------------------------------------------------------------------------
function Taktform.insertRemont:boolean;
 begin
result:=false;
  try
    insertRemQuery.ParamByName('tovar').AsInteger:=tovarid;
    insertRemQuery.ParamByName('magid').AsInteger:=magid;
    insertRemQuery.ParamByName('userid').AsInteger:=userid;
    insertRemQuery.ParamByName('clientid').AsInteger:=clientid;
    insertRemQuery.ParamByName('data').AsDateTime:=now;
    insertRemQuery.ParamByName('podmena').AsInteger:=podmenaid;
    insertRemQuery.ParamByName('comment').AsString:=primedit.Text;
    insertRemQuery.ParamByName('sklad').AsInteger:=magid;
    insertRemQuery.ParamByName('scenter').AsInteger:=servbox.Value;
    if kompedit.Text='' then
    insertRemQuery.ParamByName('complect').AsString:='-'
    else insertRemQuery.ParamByName('complect').AsString:=kompedit.Text;
     if videdit.Text='' then
    insertRemQuery.ParamByName('vid').AsString:='-'
    else insertRemQuery.ParamByName('vid').AsString:=videdit.Text;


    insertRemQuery.ExecSQL;
    result:=true;
except
    ShowMessage('ошибка записи в таблицу ремонта');

end;

 end;
//---------------------------------------------------------------------------
 function Taktform.insertSell:boolean;
  begin
   result:=false;
  try
    insertSellQuery.ParamByName('tovar').AsInteger:=tovarid;
    insertSellQuery.ParamByName('data').AsDate:=dataselledit.Value;
     insertSellQuery.ParamByName('garantia').Asdate:=enddate.Value;
     insertSellQuery.ExecSQL;
    result:=true;
except
    ShowMessage('ошибка записи в таблицу продаж');

end;
  end;
//---------------------------------------------------------------------------
 function Taktform.updatetovar:boolean;
  begin
    result:=false;
     try
    updTovarQuery.ParamByName('inuse').AsInteger:=1;
    if clientid=0 then updTovarQuery.ParamByName('client').AsInteger:=0
                  else updTovarQuery.ParamByName('client').AsInteger:=1;

    updTovarQuery.ParamByName('id').AsInteger:=tovarid;
    updTovarQuery.ParamByName('sklad').AsString:=magname;
    updTovarQuery.ExecSQL;

    result:=true;
except
    ShowMessage('ошибка записи в таблицу товара');

end;



  end;
//----------------------------------------------------------------------------
   function Taktform.GetRemontId:integer;
  begin
   result:=0;
    remidQuery.Close;
    remidQuery.ParamByName('tovar').AsInteger:=tovarid;
    remidQuery.ParamByName('magid').AsInteger:=magid;
    remidQuery.ParamByName('data').AsDate:=date;
    remidQuery.Open;
    if remidQuery.RecordCount=1 then result:=remidQueryid.Value;
    remidQuery.Close;

  end;
//------------------------------------------------------------------------------
 procedure Taktform.insertPictures;
  var i:integer;
  begin
   for i:=0 to memo1.Lines.Count-1 do
    begin
     inspictQuery.ParamByName('remontid').AsInteger:=remontid;
     inspictQuery.ParamByName('filename').AsString:=ExtractFileName(memo1.Lines[i]);
     inspictQuery.ParamByName('file').LoadFromFile(memo1.Lines[i],ftBlob);
     inspictQuery.ExecSQL;
    end;
  end;
//------------------------------------------------------------------------------
  function taktform.tovarVpodmene(const tovid:Integer):boolean;
    begin
     result:=true;
     podmQuery.Close;
     podmQuery.ParamByName('tovar').AsInteger:=tovid;
     podmQuery.Open;
     if podmQuery.RecordCount=0 then result:=false;
     podmQuery.Close;


    end;
//------------------------------------------------------------------------------
  procedure taktform.loadrekv;
    begin
      if not newakt
          then begin
                if clientid<>0 then begin
                                     custQuery.Close;
                                     custQuery.ParamByName('id').Value:=clientid;
                                     custQuery.Open;
                                     clientname.Text:=custQueryname.Value;
                                     clientadr.Text:=custQueryadres.Value;
                                     clienttel.Text:=custQuerytel.Value;
                                     custQuery.Close;
                                    end;
                 tovarquery.Close;
                 tovarquery.ParamByName('id').Value:=tovarid;
                 tovarquery.Open;
                 tovnameedit.Text:=tovarqueryname.Value;
                 tovnumbedit.Text:=tovarqueryserialnum.Value;
                 tovarquery.Close;
                if klientchek.Checked
                       then
                           begin
                             sellQuery.Close;
                             sellQuery.ParamByName('id').Value:=tovarid;
                             sellQuery.Open;
                             sellQuery.Last;
                             sellid:=sellQueryid.Value;
                             dataselledit.Value:=sellQuerydata.AsDateTime;
                             enddate.Value:=sellQuerygarantia.AsDateTime;
                             sellQuery.Close;
                           end;

                 if podmenaid<>0 then
                               begin
                                 tovarquery.Close;
                                 tovarquery.ParamByName('id').Value:=podmenaid;
                                tovarquery.Open;
                                podmenaname.Text:=tovarqueryname.Value;
                                tovarquery.Close;

                               end;
                           
               end;
    end;
//------------------------------------------------------------------------------
 procedure Taktform.BitBtn6Click(Sender: TObject);
begin
if not newakt
           then begin
                selpictquery.Close;
                selpictquery.ParamByName('id').Value:=remontid;
                selpictquery.Open;
                if selpictquery.RecordCount>0 then
                pictform.ShowModal
                else ShowMessage('нет фотографий');


              end;
end;

procedure Taktform.selpictqueryAfterOpen(DataSet: TDataSet);
begin
if (selpictquery.Active) and (selpictquery.RecordCount>0)
 then begin
      Image1.Picture.Graphic.Assign(selpictqueryFILE);

      end;

end;
//--------------------------------------------------------------------------------
procedure Taktform.Button1Click(Sender: TObject);
begin
 if MessageDlg('Удалить фотографию ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   delpict.ParamByName('id').Value:=selpictqueryid.Value;
   delpict.ExecSQL;
   selpictquery.Refresh;




  end;
end;
 //---------------------------------------------------------------------------------
  function taktform.updateRemont:boolean;
    begin
     result:=false;
        try
    //updRemQuery.ParamByName('tovar').AsInteger:=tovarid;
    //updRemQuery.ParamByName('magid').AsInteger:=magid;
    //updRemQuery.ParamByName('userid').AsInteger:=userid;
    //updRemQuery.ParamByName('clientid').AsInteger:=clientid;
    //updRemQuery.ParamByName('data').AsDate:=remdata;
    updRemQuery.ParamByName('podmena').AsInteger:=podmenaid;
    updRemQuery.ParamByName('comment').AsString:=primedit.Text;
    updRemQuery.ParamByName('sc').AsInteger:=servbox.Value;
    updRemQuery.ParamByName('id').AsInteger:=remontid;
    updRemQuery.ExecSQL;
    result:=true;
    except
    ShowMessage('ошибка записи в таблицу ремонта');

      end;

     end;

 //---------------------------------------------------------------------------------
 procedure Taktform.chekboxClickCheck(Sender: TObject);
 var i:integer;
 begin
kompedit.Text:='';
for i:=0 to chekbox.Items.Count-1 do
    begin
    if chekbox.Checked[i] then
      kompedit.Text:=kompedit.Text+chekbox.Items.Strings[i]+';';

    end;
end;

procedure Taktform.printClick(Sender: TObject);
begin
dm.remontprint.ParamByName('remontid').Value:=remontid;
selpictquery.ParamByName('id').Value:=remontid;
if dataselledit.Value<>null then dm.selldata:=dataselledit.Value;
dm.setreport(dm.remontprint,selpictquery,nil,nil,'\kvit.frf');

end;

end.
