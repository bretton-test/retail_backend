unit kkmUNIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, Mask, DBCtrlsEh, DB,
  OracleData,main,math, Oracle, Buttons, Menus,sunit, FiltrUnit, SpeedForm,
  DBLookupEh;

type
  TKkmForm = class(TsForm)
    Panel1: TPanel;
    kkmpanel: TPanel;
    dbgrid: TDBGridEh;
    Label1: TLabel;
    kassanom: TDBComboBoxEh;
    Label2: TLabel;
    numderdoc: TDBNumberEditEh;
    datadoc: TDBDateTimeEditEh;
    Label3: TLabel;
    Label4: TLabel;
    lentnom: TDBEditEh;
    Label5: TLabel;
    komment: TDBEditEh;
    Label6: TLabel;
    KKMJ: TOracleDataSet;
    KKMJDOC: TFloatField;
    KKMJKKM: TIntegerField;
    KKMJSKLADID: TIntegerField;
    KKMJDATA: TDateTimeField;
    KKMJLENTA: TStringField;
    KKMJTOTAL: TFloatField;
    KKMJSUMDISCOUNT: TFloatField;
    KKMJSUMNDS: TFloatField;
    KKMJSUMNSP: TFloatField;
    KKMJKOMMENT: TStringField;
    KKMDS: TDataSource;
    KKM: TOracleDataSet;
    KKMPLU: TFloatField;
    KKMNAME: TStringField;
    KKMED_IZM: TStringField;
    KKMKOLVO: TFloatField;
    KKMPRICE: TFloatField;


    KKMREALPRICE: TFloatField;
    KKMSUMDISCOUNT: TFloatField;
    KKMTOTAL: TFloatField;
    KKMNDS: TFloatField;
    KKMSUMNDS: TFloatField;
    KKMNSP: TFloatField;
    KKMSUMNSP: TFloatField;
    QInsReport: TOracleQuery;
    BitBtn1: TBitBtn;
    ok: TSpeedButton;
    cancel: TSpeedButton;
    chekdoc: TOracleDataSet;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    KKMJREG: TIntegerField;
    Label7: TLabel;
    PrintB: TBitBtn;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Labelread: TLabel;
    KKMNAL: TFloatField;
    BitBtn4: TBitBtn;
    Panel4: TPanel;
    KKMTPRICE: TFloatField;
    KKMWES: TFloatField;
    KKMDOC: TFloatField;
    splashform: TSpeedForm;
    outlabel: TLabel;
    sklad: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure KKMJAfterPost(DataSet: TDataSet);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
    procedure dbgridColumns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure KKMAfterPost(DataSet: TDataSet);
    procedure KKMBeforePost(DataSet: TDataSet);
    procedure dbgridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure KKMAfterInsert(DataSet: TDataSet);
    procedure kassanomChange(Sender: TObject);
  private
    { Private declarations }
  Filtr:TFiltrform;
  nulPRICE: TFloatField;
  nom:integer;
  reg:byte;
  reportload,reportsaved,reportedit:boolean;
  reportdata:Tdatetime;
  procedure  ProcReport(const data:TDateTime;const kassa :integer);
  procedure setedit(const edit:boolean);
  public
    { Public declarations }
   procedure newdoc;
   procedure Opendoc(const doc:integer;const plu:integer);
  end;

var
  KkmForm: TKkmForm;

implementation

uses dmunit, Spisunit, messageunit, tranzUnit, kartunit, about;

{$R *.dfm}

procedure TKkmForm.Opendoc(const doc:integer;const plu:integer);
// var i:integer;
 begin

 kkmj.SetVariable('nom',doc);
 kkmj.Open;
 reg:=0;
  if kkmj.RecordCount>0 then
   begin
    reg:=KKMJREG.AsInteger;
    nom:=doc;
     kassanom.ItemIndex:=kassanom.KeyItems.IndexOf(KKMJKKM.AsString);
      numderdoc.Text:=KKMJDOC.AsString;
     datadoc.Value:=KKMJDATA.AsDateTime;
     reportdata:=datadoc.Value+StrtoTime('23:59');
     sklad.ItemIndex:=sklad.KeyItems.IndexOf(KKMJSKLADID.AsString);
     komment.Text:=KKMJKOMMENT.Value;
     lentnom.Text:=KKMJLENTA.Value;
     setedit(true);
     komment.ReadOnly:=true;
     lentnom.ReadOnly:=true;
      if reg=1 then
        begin
         bitbtn2.Enabled:=false;
         kkm.ReadOnly:=true;
         labelread.Visible:=true;

         end;
     bitbtn1.Visible:=false;
  end;
  kkmj.Close;
    kkm.SetVariable('nom',doc);
 kkm.Open;

 if plu<>0 then kkm.Locate('plu',plu,[]);

  end;

procedure TKkmForm.setedit(const edit:boolean);
begin
 kassanom.ReadOnly:=edit;
 datadoc.ReadOnly:=edit;
 //sklad.ReadOnly:=edit;
 numderdoc.ReadOnly:=edit;

 end;
procedure TKkmForm.newdoc;
 begin
  nom:=dm.newkod('PRIHSEQ');
  numderdoc.Text:=inttostr(nom);
  numderdoc.ReadOnly:=true;
  datadoc.Value:=date;
 komment.text:='-';
 reportload:=false;
 reportsaved:=false;
 reportedit:=false;
 reg:=0;
 bitbtn2.Enabled:=false;
 end;

procedure TKkmForm.FormCreate(Sender: TObject);
begin


  reportload:=true;
 reportsaved:=true;
 reportedit:=false;
  dm.KKM.Open;
  kassanom.KeyItems.Clear;
  kassanom.Items.Clear;
  dm.KKM.First;
  while not dm.KKM.Eof do
  begin
   kassanom.KeyItems.Add(dm.KKM.FieldValues['id']);
    kassanom.Items.Add(dm.KKM.FieldValues['name']);

   dm.KKM.Next;
  end;
  dm.KKM.close;

  sklad.KeyItems.Clear;
  sklad.Items.Clear;
  dm.qsklad.First;
  while not dm.qsklad.Eof do
  begin
 //  sklad.KeyItems.Add(dm.qskladSKLADID.AsString);
 //   sklad.Items.Add(dm.qskladSKLAD.AsString);
       sklad.KeyItems.Add(DM.qsklad.FieldValues['skladid']);
       sklad.Items.Add(DM.qsklad.FieldValues['sklad']);


   dm.qsklad.Next;
  end;
  sklad.ItemIndex:=0;
  kassanom.ItemIndex:=0;


filtr:=TFiltrform.Create(tform(self));
Filtr.SetKoords(panel4);



end;

procedure TKkmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if assigned(filtr) then  filtr.Close;
ACTION:=caFree;
end;

procedure  TKkmForm.ProcReport(const data:TDateTime;const kassa :integer);
 var
     vozvrat:boolean;
     report:array [0..4] of array of Extended	;
     chek:array [0..4] of array of Extended	;
     rtable:array [0..3] of array of Extended	;
     j,i,index,size:integer;
         {-----------------------------------------------------}
        function  CopyChek(var ind,max:integer):integer;
        var nom,i,j:integer;
        begin
        i:=0;
        result:=ind;
    try


       nom:=round(report[4,ind]);
         while nom=round(report[4,ind]) do
   //   while  (round(report[0,ind])<>55)  or (round(report[0,ind])<>56)  do
           begin
            for j := Low(chek) to High(chek) do   SetLength(chek[j],i+1);
            chek[0,i]:=report[0,ind];
            chek[1,i]:=report[1,ind];
            chek[2,i]:=report[2,ind];
             chek[3,i]:=report[3,ind];
             chek[4,i]:=0;
            inc(i);
            inc(ind);
            If ind>=max   then break;
            end;
          result:=ind;
    except
    dm.addmemo(inttostr(ind));

    end;
    end;
 {-----------------------------------------------------}
  function procent:double;
        var j:integer;

          begin
          result:=0;


           for j:=0 to length(chek[0])-1 do
            begin
             If chek[0,j]=37  then result:=chek[2,j]*-1;
              If chek[0,j]=38  then result:=chek[2,j];


            end;
          end;



 {-----------------------------------------------------}
  {-----------------------------------------------------}
  function summa:double;
        var j,i,start:integer;
            temp:double;
          begin
          result:=0;
           temp:=0;
           start:=0;
           i:=0;
           for j:=0 to length(chek[0])-1 do
              If chek[0,j]=56  then start:=j;


           for j:=start to length(chek[0])-1 do
            begin
              If chek[0,j]=11  then inc(i);
             If chek[0,j]=35  then temp:=chek[2,j]*-1;
              If chek[0,j]=36  then temp:=chek[2,j];
            end;
          if i>0 then result:=temp/i;

          end;



 {-----------------------------------------------------}
  {-----------------------------------------------------}
  procedure addsumma(const skidka:double;const summa:double);
        var j,start:integer;
              temp:Extended;
          begin
           start:=0;
          
           for j:=0 to length(chek[0])-1 do
              If chek[0,j]=56  then start:=j;




         temp:=0;
           for j:=start to length(chek[0])-1 do
            begin
              if skidka<>0 then
                    begin
                       case round(chek[0,j]) of
                         1,11,2,12:   temp:=chek[3,j]+(chek[3,j]*(skidka/100));
                        // 2,12:   temp:=chek[3,j]+(chek[3,j]*(skidka/100));

                       end;
                       chek[4,j]:=chek[3,j]-temp;
                       chek[3,j]:=temp;
                    end;
              if summa<>0 then
               begin
                       case round(chek[0,j]) of
                         1,11,2,12:   temp:=chek[3,j]+summa;
                        // 2,12:   temp:=chek[3,j]+summa;

                       end;
                  chek[4,j]:=chek[4,j]+chek[3,j]-temp;
                  chek[3,j]:=temp;

               end;

            end;
          end;



 {-----------------------------------------------------}


         function  if55:boolean;
          var j:integer;
          begin
          result:=false;
           for j:=0 to length(chek[0])-1 do
             If chek[0,j]=55  then result:=true;

          end;

 {-----------------------------------------------------}
         procedure  ProcChek;
          var j,start:integer;
           {-----------------------------------------------------}
           function  LocPlu(const plu:integer):integer;
            var i:integer;
            begin
            result:=-1;
            If size=0  then exit;
              for i:=0 to length(rtable[0])-1 do
               If round(rtable[0,i])=plu then
                 begin
                  result:=i;
                  exit;
                 end;
             end;
   //--------------------------------------------------------
            procedure  addplu(const plu,kolvo,sum,discount:extended);
              var i,j:integer;
              begin
               i:=LocPlu(round(plu));
               If i<>-1  then
                 begin
                  rtable[1,i]:=rtable[1,i]+kolvo;
                  rtable[2,i]:=rtable[2,i]+sum;
                  rtable[3,i]:=rtable[3,i]+discount;
                  end else
                  begin
                  inc(size);
                  for j := Low(rtable) to High(rtable) do   SetLength(rtable[j],size);
                  rtable[0,size-1]:=plu;
                  rtable[1,size-1]:=kolvo;
                  rtable[2,size-1]:=sum;
                  rtable[3,size-1]:=discount;
                  end;


              end;

            {-----------------------------------------------------}
         var pos56:integer;
             pos55:integer;
             finish:integer;
          begin
           start:=0;
           pos56:=0;
           pos55:=0;
           finish:=length(chek[0])-1;
           for j:=0 to length(chek[0])-1 do
             If round(chek[0,j])=56  then pos56:=j;//start:=j;
           for j:=0 to pos56 do
             If round(chek[0,j])=55  then pos55:=j;
           if (pos56>0) and (pos55=0) then  start:=pos56;
           if (pos56>0) and (pos55>0) then finish:=pos55;



           for j:=start to finish do
            begin
             case round(chek[0,j]) of
             11,12,13,14: addplu(chek[1,j],chek[2,j],chek[3,j],chek[4,j]);
             end;


            end;

          end;
 {-----------------------------------------------------}
 function  InsertRep(const data:tdatetime):boolean;
 var j,i:integer;
   //   plu:integer;
   //   kolvo:double;
  //   total:currency;
  begin
   result:=false;
     i:=0;
    try
    // dm.tovar.Refresh;
     for j:=0 to length(rtable[0])-1 do
       begin
         i:=j;
         application.ProcessMessages;
         If rtable[1,j]<0  then
                  begin
                  vozvrat:=true;
                  continue;
                  end;
         If rtable[1,j]=0  then
                  continue;
      //   plu:=round(rtable[0,j]);
      //   kolvo:=rtable[1,j];
     //    total:=roundTo(rtable[2,j],-2);
     //    dm.addmemo(inttostr(plu)+'  '+floattostr(kolvo)+'  '+floattostr(total)  );
     {    dm.addmemo(inttostr(round(rtable[0,j])));
         dm.addmemo(floattostr(rtable[1,j]));
          dm.addmemo(floattostr(rtable[2,j]));
           dm.addmemo(floattostr(rtable[3,j]));  }
         QInsReport.SetVariable('plu',round(rtable[0,j]));
         QInsReport.SetVariable('kol_vo',rtable[1,j]);
         QInsReport.SetVariable('total',rtable[2,j]);
         QInsReport.SetVariable('nn',nom);
          QInsReport.SetVariable('discount',rtable[3,j]);
         QInsReport.Execute;
       end;
   result:=true;
   except

   dm.addmemo('ќшибка в записи . товар с кодом є '+inttostr(round(rtable[0,i])));


   end;

  end;
   {-----------------------------------------------------}

 procedure renamechek(const max:integer);
var j:integer;
    counter:integer;
 begin
//  memo1.Clear;
  counter:=1;
  for j:=0 to max-1 do
  begin
   report[4,j]:=counter;
   if round(report[0,j]) in [55,56,60,61]   then inc(counter);
  {  memo1.Lines.Add(inttostr(round(report[0,j]))+' '+
                   inttostr(round(report[1,j]))+' '+
                   floattostr(report[2,j])+' '+
                   floattostr(report[3,j])+' '+
                   inttostr(round(report[4,j])));    }

  end;
 end;


 begin
 try
  size:=0;
  vozvrat:=false;
 for j := Low(rtable) to High(rtable) do   SetLength(rtable[j],size);
    outlabel.Caption:='ќбработка кассы '+inttostr(kassa);
    splashform.Show;
  //  dm.addmemo('ќбработка кассы '+inttostr(kassa));
    //application.ProcessMessages;
    dm.QselReport.Close;
    dm.QselReport.SetVariable('kassa',kassa);
    dm.QselReport.SetVariable('data',data);
    dm.QselReport.Open;
    for j := Low(report) to High(report) do   SetLength(report[j],dm.qSelReport.RecordCount);
   i:=0;
    dm.qSelReport.First;
    while not dm.QselReport.Eof do
      begin
       report[0,i]:=dm.qSelReport.FieldValues['id'];
       report[1,i]:=dm.qSelReport.FieldValues['plu'];
       report[2,i]:=dm.qSelReport.FieldValues['quantity'];
       report[3,i]:=dm.qSelReport.FieldValues['sum'];
       report[4,i]:=dm.qSelReport.FieldValues['chek'];

      inc(i);
      dm.QselReport.Next;
      end;
     dm.qSelReport.Close;
     If i>0 then
       begin
        renamechek(i);
        index:=0;
        while index<i do
          begin
           index:=copychek(index,i);
        //   If not If55  then  continue;
           addsumma(procent,summa);

           ProcChek;
           end;
       end;


  If insertrep(data)
  then  dm.commit

  else dm.rollback;

   kkm.SetVariable('nom',nom);
   kkm.Open;
  reportload:=true;
   setedit(true);





   if vozvrat then
   begin
   dm.addmemo(messageunit.m34);

    if assigned(spform) then  spform.Close;
    while  assigned(spform) do application.ProcessMessages;
   mainform.PrimTMZExecute(application);
    while  not assigned(spform) do application.ProcessMessages;
   spform.dataed.Value:=data;
   spform.primed.Value:='возврат по кассе є'+inttostr(kassa);
   spform.Skladed.KeyValue:=sklad.KeyItems.Strings[sklad.ItemIndex];
     for j:=0 to length(rtable[0])-1 do
       begin
        // application.ProcessMessages;
         dm.nofilter;
         If rtable[1,j]>=0  then   continue;
          dm.Qtmc.Insert;
           dm.QtmcPLU.AsFloat:=rtable[0,j];
           //if not dm.tovar.Locate('plu',rtable[0,j],[])
            if  not dm.locatetovar(round(rtable[0,j]))
               then dm.QtmcED_IZM.AsString:='?'
           else   dm.QtmcED_IZM.AsString:=dm.tovarED_IZM.Value;
           dm.QtmcKOL_FAKT.AsFloat:=rtable[1,j]*-1;
           dm.QtmcPRICE.AsCurrency:=rtable[2,j]/(rtable[1,j]);
           dm.Qtmc.Post;

       end;
      dm.Qtmc.Refresh;
   end;

  finally
    splashform.Hide;
  end;

 end;

//------------------------------------------------------------------------












procedure TKkmForm.BitBtn1Click(Sender: TObject);
var temp:TDatetime;
begin
 if kkm.Active then exit;

 if sklad.KeyItems.Strings[sklad.ItemIndex]='' then
     begin
       dm.addmemo('”кажите склад');
       exit;

     end;
if kassanom.KeyItems.Strings[kassanom.ItemIndex]='' then
     begin
       dm.addmemo('”кажите кассу');
       exit;

     end;

 if lentnom.Text ='' then
     begin
      lentnom.Text:='0';
      // dm.addmemo('”кажите номер контрольной ленты');
       ///       exit;

     end;


temp:=StrtoTime('23:59')+int(datadoc.Value);
  reportdata:=StrtoTime('23:59')+int(datadoc.Value);
 //dm.addmemo('select nvl(doc,0) from tmp.kkmj where data=to_date('+datetostr(temp)+') and kkm='+kassanom.KeyItems.Strings[kassanom.ItemIndex]);

// exit;
  //if dm.ExecuteSQL('select nvl(doc,0) from tmp.kkmj where data=to_date('+chr(39)+datetostr(temp)+chr(39)+') and kkm='+kassanom.KeyItems.Strings[kassanom.ItemIndex])<>0
    chekdoc.Close;
    chekdoc.SetVariable('data',temp);
     chekdoc.SetVariable('kkm',strtoint(kassanom.KeyItems.Strings[kassanom.ItemIndex]));
    chekdoc.Open;
    if chekdoc.RecordCount>0
      then
       begin
       chekdoc.Close;
      dm.addmemo('ќтчет уже загружен');
      exit;
      end;
   chekdoc.Close;
if not reportload then procreport(temp,strtoint(kassanom.KeyItems.Strings[kassanom.ItemIndex]));


end;

procedure TKkmForm.KKMJAfterPost(DataSet: TDataSet);
begin
TOracleDataset(DataSet).RefreshRecord;
end;

procedure TKkmForm.okClick(Sender: TObject);
begin
if kkm.State<>dsbrowse then kkm.Post;
if reportedit then dm.commit;
//if (reportload) and(reportedit) then reportedit:=false;


if (reportload) and (not reportsaved)  then
  begin
  try
   kkmj.Close;
   kkmj.SetVariable('nom',nom);
   kkmj.Open;
   kkmj.insert;
      KKMJDOC.AsInteger:=nom;
      KKMJKKM.AsString:=kassanom.KeyItems.Strings[kassanom.ItemIndex];
      KKMJSKLADID.AsString:=sklad.KeyItems.Strings[sklad.ItemIndex];
      KKMJDATA.Value:=reportdata;
      KKMJLENTA.Value:=copy(lentnom.Text,1,20);
      KKMJKOMMENT.Value:=copy(komment.Text,1,30);
      KKMJTOTAL.AsCurrency:=dbgrid.SumList.SumCollection.Items[1].sumvalue;
      KKMJSUMDISCOUNT.AsCurrency:=dbgrid.SumList.SumCollection.Items[0].sumvalue;
      KKMJSUMNDS.AsCurrency:=0;//dbgrid.SumList.SumCollection.Items[2].sumvalue;
      KKMJSUMNSP.AsCurrency:=0;//dbgrid.SumList.SumCollection.Items[3].sumvalue;

  kkmj.Post;
  kkmj.Close;
  reportload:=false;
  reportsaved:=true;
  bitbtn2.Enabled:=true;
  dm.RefreshJournal;
  exit;
  except

  end;
  end;

 if reportedit  then
  begin
  try
   kkmj.Close;
   kkmj.SetVariable('nom',nom);
   kkmj.Open;
   kkmj.edit;
      KKMJDOC.AsInteger:=nom;
      KKMJKKM.AsString:=kassanom.KeyItems.Strings[kassanom.ItemIndex];
      KKMJSKLADID.AsString:=sklad.KeyItems.Strings[sklad.ItemIndex];
      KKMJDATA.Value:=reportdata;
      KKMJLENTA.Value:=copy(lentnom.Text,1,20);
      KKMJKOMMENT.Value:=copy(komment.Text,1,30);
      KKMJTOTAL.AsCurrency:=dbgrid.SumList.SumCollection.Items[1].sumvalue;
      KKMJSUMDISCOUNT.AsCurrency:=dbgrid.SumList.SumCollection.Items[0].sumvalue;
      KKMJSUMNDS.AsCurrency:=dbgrid.SumList.SumCollection.Items[2].sumvalue;
      KKMJSUMNSP.AsCurrency:=0;

  kkmj.Post;
  kkmj.Close;
  reportload:=false;
  reportsaved:=true;
  bitbtn2.Enabled:=true;
  dm.RefreshJournal;
  reportedit:=false;
  except

  end;
  end;






  end;

procedure TKkmForm.cancelClick(Sender: TObject);
begin
 if (reportload) and (not reportsaved)  then
     if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
        ok.Click;
        exit;
        end
        else
        begin
           if (reportload) and (not reportsaved)  then
                  begin
                    dm.ExecuteSQL('delete from tmp.kkmreport where doc='+inttostr(nom));
                    dm.commit;
                    kkm.Close;
                    reportload:=false;
                  end;


        end;

   if reportedit then
    if MessageDlg(messageunit.m18,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin

        ok.Click;
        exit;
        end;

   dm.rollback;

   kkm.Close;
   kkmj.Close;
   tform(self).Close;

 end;

procedure TKkmForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if ((reportload) and (not reportsaved))
    then
                  begin
                  cancel.Click;
                  CanClose:= false;
                  end
  else  CanClose:= true;



 end;

procedure TKkmForm.BitBtn2Click(Sender: TObject);
begin
kkmj.Close;
kkmj.SetVariable('nom',nom);
 kkmj.Open;
 if (kkmj.RecordCount>0) and (KKMJREG.AsInteger=0) then
  begin
     splashform.Show;
     Dbgrid.Enabled:=false;
    // kkmform.BorderStyle:=bsNone;
    tranzunit.KkmRashod(nom,outlabel);
     splashform.Close;
       Dbgrid.Enabled:=true;
    //  kkmform.BorderStyle:=bsSizeable;

  end else Labelread.Visible:=true;
  kkmj.Close;
  end;

procedure TKkmForm.BitBtn3Click(Sender: TObject);
begin
 if not assigned(KartForm) then
        begin
         KartForm:=TKartForm.Create(application,tsform(self).mybar);

         end;

          KartForm.Show;
          dm.nofilter;
         if (kkm.Active) and (kkmplu.AsString<>'') then dm.LocateTovar(kkmplu.AsInteger);

end;

procedure TKkmForm.N1Click(Sender: TObject);
begin
if nom<>0 then aboutbox.printkm6(nom);
end;

procedure TKkmForm.N2Click(Sender: TObject);
begin
if nom<>0 then aboutbox.printko1(nom);
end;

procedure TKkmForm.PrintBClick(Sender: TObject);
var xPoint:TPoint;
begin
  GetParentForm(TWinControl(Sender)).SendCancelMode(nil);
  PM1.PopupComponent:= TWinControl(Sender);
  xPoint:= Point(-1, TWinControl(Sender).Height);

  with TWinControl(Sender).ClientToScreen(xPoint)
  do PM1.Popup(x,y);
end;



procedure TKkmForm.dbgridColumns1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
 if reg=1 then exit;
 if (kkm.Active) and (kkm.RecordCount>0) then
  begin
   if kkm.State=dsBrowse then   kkm.Edit;
     if not assigned(KartForm) then  KartForm:=TKartForm.Create(application,tsform(self).mybar);
      kartform.setvybor(kkmplu,kkmname,nulPrice,kkmed_izm,kkmnds,tform(self),kkmnsp);
       KartForm.Show;
    if kkmplu.AsString<>''
    then begin
       kartform.Caption:=KKMNAME.AsString+'  '+KKMREALPRICE.AsString;
          dm.nofilter;
          dm.LocateTovar(kkmplu.AsInteger);
    end;

  end;
end;

procedure TKkmForm.KKMAfterPost(DataSet: TDataSet);
begin
 TOracleDataset(DataSet).RefreshRecord;
 reportedit:=true;
 bitbtn2.Enabled:=false;
 end;

procedure TKkmForm.KKMBeforePost(DataSet: TDataSet);
begin
if kkm.State=dsInsert then
begin
 if dm.LocateTovar(KKMPLU.AsInteger) then
 begin
 KKMPRICE.AsCurrency:=dm.tovarPRICE.AsCurrency;
 KKMREALPRICE.AsCurrency:=dm.tovarPRICE.AsCurrency;
 KKMSUMDISCOUNT.AsCurrency:=0;
 KKMDOC.AsInteger:=KKM.GetVariable('nom');
   KKMTOTAL.AsCurrency:=KKMKOLVO.AsFloat*KKMPRICE.AsFloat;
 end;
end;
 if KKMTOTAL.AsCurrency<>KKMKOLVO.AsFloat*KKMPRICE.AsFloat
 then  KKMTOTAL.AsCurrency:=KKMKOLVO.AsFloat*KKMPRICE.AsFloat;
KKMSUMNDS.AsCurrency:=KKMTOTAL.AsCurrency-(KKMTOTAL.AsCurrency/(1+(KKMNDS.AsFloat/100)));
KKMSUMNSP.AsCurrency:=KKMTOTAL.AsCurrency-(KKMTOTAL.AsCurrency/(1+(KKMNSP.AsFloat/100)));


end;

procedure TKkmForm.dbgridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if column.FieldName='NAL'
   then
 if KKMkolvo.Value>KKMNAL.Value then TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF;

 if column.FieldName='PRICE'
  then begin
        if (KKMREALPRICE.AsCurrency-KKMTPRICE.AsCurrency)>0.09 then
                  TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF;
        if (KKMREALPRICE.AsCurrency-KKMTPRICE.AsCurrency)<(-0.09) then
                  TDBGridEh(Sender).Canvas.Brush.Color:=$00e0FFe0;


  end;
  if column.FieldName='KOLVO'
  then
        if (KKMKOLVO.Value<>round(KKMKOLVO.Value))
          and (KKMWES.AsInteger=0) then
                  TDBGridEh(Sender).Canvas.Brush.Color:=$00e0e0FF;

IF  gdSelected   IN State
        Then Begin
                TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
                TDBGridEh(Sender).Canvas.Font.Color := clHighLightText;
          end;
    TDBGridEh(Sender).Canvas.Brush.Color:=TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TKkmForm.BitBtn4Click(Sender: TObject);
var temp:variant;
begin
 if kkm.Active then
 begin
    temp:=KKMPLU.Value;
    kkm.Refresh;
    kkm.Locate('plu',temp,[]);

 end;
end;

procedure TKkmForm.dbgridKeyPress(Sender: TObject; var Key: Char);
var temp:string;
begin
 if
 (ord(key)>31) then
  begin

    temp:=filtr.PutChar(key);
    if temp<>'' then
        begin
        if dbgrid.SelectedField.FieldName='NAME' then
         begin
         kkm.Locate('name',temp,[loCaseInsensitive, loPartialKey]);
         end;
         if dbgrid.SelectedField.FieldName='PLU' then
         begin
         kkm.Locate('PLU',temp,[loCaseInsensitive]);
         end;

    end;
  end;
end;

procedure TKkmForm.KKMAfterInsert(DataSet: TDataSet);
begin
KKMKOLVO.AsFloat:=0;
end;

procedure TKkmForm.kassanomChange(Sender: TObject);
begin
DM.KKM.Open;
  if DM.KKM.Locate('id',kassanom.KeyItems.Strings[kassanom.ItemIndex],[])
    then   sklad.ItemIndex:=sklad.KeyItems.IndexOf(DM.KKM.FieldValues['skladid']);
 dm.KKM.Close;

end;

end.
