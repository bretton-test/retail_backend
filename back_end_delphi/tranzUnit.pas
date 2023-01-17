unit tranzUnit;

interface
 uses
   Classes,forms, Oracle, DB,Variants, OracleData,Dialogs,Controls,SysUtils,buttons,math,StdCtrls;
  type  table  = array of array of double;
   function PrihProvodka (const nom,sklad :integer;const  data:TdateTime;const tab :table;
  const perem:boolean;
   const minus:boolean=false ):boolean;
  function OstatokPartii(const plu,part:double;const data :TdateTime):double;
  procedure Prihod(const nom :integer);
  procedure otmena(const nom:integer);
  procedure Unreg(const nom:integer);
  function   RashProvodka(const nom,sklad :integer;const data:TdateTime;const tab :table;const perem:boolean;output:tlabel;
   const minus:boolean=false ):boolean;
  procedure  Rashod(const nom:integer;output:tlabel;const lifo:boolean=false);
  procedure  Perem(const nom:integer);
  procedure SetDelete(const nom:integer);
  procedure DeleteAll;
  procedure NoDelete(const nom:integer);
   procedure  Spisanie(const nom:integer;output:Tlabel;const minus:boolean=false);
  procedure Priemka(const nom :integer;const minus:boolean=false);
  procedure regprice(const nom:integer);
  procedure unregprice(const nom:integer);
  procedure  InsertAllKatalog;
  procedure  ProcReport(const data:TDateTime;myBut:TBitBtn);
  procedure  KkmRashod(const nom:integer;output:tlabel);
  procedure ActPereozenky(const nom:integer);
  function ActPeresortiza(const nom:integer):boolean;
  procedure OtkatPeresort(const nom:integer);
  const minkassa:byte=1;
  const maxkassa:byte=4;
  function updateminus(const nom:integer;
                       const sklad:integer;
                        const  data:TDateTime;
                        const plu:integer;
                        const kolvo:double):boolean;

 

 implementation

uses dmunit, MAIN, messageunit, Spisunit, testunit;
 //------------------------------------------------------------

//--------------------------------------------------------------
procedure  ProcReport(const data:TDateTime;myBut:TBitBtn);
 var kassa:byte;
     vozvrat:boolean;
     report:array [0..4] of array of double;
     chek:array [0..3] of array of double;
     rtable:array [0..2] of array of double;
     j,i,index,size:integer;
         {-----------------------------------------------------}
        function  CopyChek(var ind,max:integer):integer;
        var nom,i,j:integer;
        begin
        i:=0;
        result:=ind;
    try
    //   If ind>=length(report[0])  then ;

         nom:=round(report[4,ind]);
         while nom=round(report[4,ind]) do
           begin
            for j := Low(chek) to High(chek) do   SetLength(chek[j],i+1);
            chek[0,i]:=report[0,ind];
            chek[1,i]:=report[1,ind];
            chek[2,i]:=report[2,ind];
             chek[3,i]:=report[3,ind];
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
            procedure  addplu(const plu,kolvo,sum:double);
              var i,j:integer;
              begin
               i:=LocPlu(round(plu));
               If i<>-1  then
                 begin
                  rtable[1,i]:=rtable[1,i]+kolvo;
                  rtable[2,i]:=rtable[2,i]+sum;
                  end else
                  begin
                  inc(size);
                  for j := Low(rtable) to High(rtable) do   SetLength(rtable[j],size);
                  rtable[0,size-1]:=plu;
                  rtable[1,size-1]:=kolvo;
                  rtable[2,size-1]:=sum;
                  end;


              end;

            {-----------------------------------------------------}
          begin
           start:=0;
           for j:=0 to length(chek[0])-1 do
              If chek[0,j]=56  then start:=j;
           for j:=start to length(chek[0])-1 do
            begin
             case round(chek[0,j]) of
             11,12,13,14: addplu(chek[1,j],chek[2,j],chek[3,j]);
             end;


            end;

          end;
 {-----------------------------------------------------}
 function  InsertRep(const data:tdatetime):boolean;
 var j:integer;
  begin
   result:=false;
    try
    // dm.tovar.Refresh;
     for j:=0 to length(rtable[0])-1 do
       begin
         application.ProcessMessages;
         If rtable[1,j]<0  then
                  begin
                  vozvrat:=true;
                  continue;
                  end;
         If rtable[1,j]=0  then
                  continue;
         dm.QInsReport.SetVariable('data',data);
         dm.QInsReport.SetVariable('plu',round(rtable[0,j]));
         dm.QInsReport.SetVariable('kol_vo',rtable[1,j]);
         dm.QInsReport.SetVariable('total',roundTo(rtable[2,j],-2));
         dm.QInsReport.SetVariable('nn',dmunit.nomerdok);
         dm.QInsReport.SetVariable('sklad',dmunit.sklad);
         dm.QInsReport.SetVariable('post',dmunit.post);
         dm.QInsReport.Execute;
       end;
   result:=true;
   except
   exit;
   end;

  end;
   {-----------------------------------------------------}
 begin
  size:=0;
  vozvrat:=false;
 for j := Low(rtable) to High(rtable) do   SetLength(rtable[j],size);
  for kassa:=minkassa to maxkassa
   do begin
    dm.addmemo('Обработка кассы '+inttostr(kassa));
    application.ProcessMessages;
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
        index:=0;
         while index<i do
          begin
           index:=copychek(index,i);
           If not If55  then  continue;
           ProcChek;
           end;
       end;

   end;
  If insertrep(data)   then  dm.commit else dm.rollback;
  dm.ExecuteSQL('update tnakltemp set kol_vo=rossip where kol_vo>rossip');
 // dm.ExecuteSQL('update tnakltemp set total=kol_vo*cenareal');

  dm.commit;

   dm.Qnakltemp.Refresh;

   dm.Qnakltemp.First;
  while not dm.Qnakltemp.Eof
  do begin
//  application.ProcessMessages;
  if dm.Qnakltempostatok.AsFloat<dm.QnakltempKOL_VO.AsFloat then
        begin
           dm.Qnakltemp.Edit;
           dm.QnakltempKOL_VO.AsFloat :=dm.Qnakltempostatok.AsFloat;
           dm.Qnakltemp.Post;
        end;
  dm.Qnakltemp.Next;
  end;
  dm.ExecuteSQL('update tnakltemp set total=round(kol_vo*cenasnds,2)');
  dm.ExecuteSQL('delete from tmp.kniga where otkat=1');

  dm.commit;
   dm.Qnakltemp.Refresh;
   dm.Qnakltemp.First;
   if vozvrat then
   begin
    if assigned(spform) then  spform.Close;
    while  assigned(spform) do application.ProcessMessages;
   mainform.PrimTMZExecute(application);
    while  not assigned(spform) do application.ProcessMessages;
   spform.dataed.Value:=data;
   spform.Skladed.KeyValue:=dmunit.sklad;
     for j:=0 to length(rtable[0])-1 do
       begin
         application.ProcessMessages;
         dm.nofilter;
         If rtable[1,j]>=0  then   continue;
          dm.Qtmc.Insert;
           dm.QtmcPLU.AsFloat:=rtable[0,j];
           //if not dm.tovar.Locate('plu',rtable[0,j],[])
            if dm.locatetovar(round(rtable[0,j]))
               then dm.QtmcED_IZM.AsString:='?'
           else   dm.QtmcED_IZM.AsString:=dm.tovarED_IZM.Value;
           dm.QtmcKOL_FAKT.AsFloat:=rtable[1,j]*-1;
           dm.QtmcPRICE.AsCurrency:=rtable[2,j]/(rtable[1,j]);
           dm.Qtmc.Post;

       end;
      dm.Qtmc.Refresh;
   end;
 // dm.OraBase.ApplyUpdates([dm.Qnakltemp],true);
// dm.Qnakltemp.CachedUpdates:=false;

 //dm.qnakltemp.AutoCalcFields:=true;

 myBut.OnClick(myBut);


 end;

//------------------------------------------------------------------------
procedure  InsertAllKatalog;
  begin
 try
 dm.ExecuteSQL('delete from pos.tovar');
{ dm.ExecuteSQL(' insert into pos.tovar (plu,barcode,name,parentplu,sortfield,isgoods) select distinct b.kat*1e9,0,b.name,0,1,'+chr(39)+'K'+chr(39)+' from tmp.tkat b where b.kat<>0');
 dm.Qrazdel.Open;
 dm.Qrazdel.First;
 while not dm.Qrazdel.Eof do
 begin
 if dm.QrazdelKAT.AsInteger<>0 then
  begin
  dm.InsertKat.SetVariable('kat',dm.QrazdelKAT.AsInteger);
  dm.InsertKat.Execute;
  end;
 dm.Qrazdel.Next;
 end;  }
dm.InsertAll.Execute;
dm.ExecuteSQL('insert into pos.tovar (plu) values(3e12)');

 dm.commit;
  dm.addmemo(messageunit.m7);
 except
 dm.rollback;
 dm.addmemo(messageunit.m8);
 Raise;
 end;
 end;

//------------------------------------------------------------------------
 procedure  unregprice(const nom:integer);
  var temp:boolean;
 begin
 temp:=dm.tovar.ReadOnly;
 try
  decimalseparator:='.';
   dm.nofilter;
   dm.tovar.ReadOnly:=false;
  dm.Qprice.Close;
  dm.Qprice.SetVariable('nom',nom);
  dm.Qprice.Open;
  dm.Qprice.First;
  if dm.tovar.State<>dsBrowse then dm.tovar.Cancel;
  while not dm.Qprice.Eof do
   begin
  //dm.ExecuteSQL('update tmp.tkatalog set price='+floattostr(dm.QpriceOLDPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsInteger));
   if (dm.QpricePLU.AsInteger>0) and (dm.QpriceOLDPRICE.AsCurrency>0) then
   begin

    //if dm.tovar.Locate('plu',dm.QpricePLU.AsInteger,[])

   if dm.locatetovar(dm.QpricePLU.AsInteger)  then
                begin
                if dm.QpriceNEWPRICE.AsCurrency<>dm.tovarPRICE.AsCurrency
                  then begin
                       dm.addmemo(dm.tovarNAME.Value+' уже переоценен.Отменить нельзя');
                       abort;
                       end;

                  dm.tovar.Edit;
                  dm.tovarPRICE.AsCurrency:=dm.QpriceOldPRICE.AsCurrency;
                  dm.tovar.Post;
                end;



    dm.ExecuteSQL('update pos.tovar set price='+floattostr(dm.QpriceOLDPRICE.AsCurrency)+',plu=plu+3e12'+',quantityout=0.5'+' where plu='+floattostr(dm.QpricePLU.AsInteger));
    dm.ExecuteSQL('update tmp.tprihnakl set cenawzale='+floattostr(dm.QpriceOLDPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsInteger)+' and nom='+dm.QpriceOSN.AsString);
   end;

 // dm.addmemo('update tmp.tkatalog set price='+floattostr(dm.QpriceNEWPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsCurrency));
  dm.Qprice.Next;
   end;
  dm.Qprice.Close;
  dm.setreg(0,nom);
  dm.commit;
 dm.tovar.ReadOnly:=temp;
 //dm.tovar.Refresh;
 decimalseparator:=',';
 except
 decimalseparator:=',';
 dm.rollback;
 dm.addmemo(messageunit.m9);
 dm.tovar.ReadOnly:=temp;
 raise;
 end;
end;



//-------------------------------------------------------------------------
procedure  regprice(const nom:integer);
 var temp:boolean;
 begin
 temp:=dm.tovar.ReadOnly;
 try
  decimalseparator:='.';
    dm.nofilter;
   dm.tovar.ReadOnly:=false;
  dm.Qprice.Close;
  dm.Qprice.SetVariable('nom',nom);
  dm.Qprice.Open;
  dm.Qprice.First;
  if dm.tovar.State<>dsBrowse then dm.tovar.Cancel;
  while not dm.Qprice.Eof do
   begin
  //dm.ExecuteSQL('update tmp.tkatalog set price='+floattostr(dm.QpriceNEWPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsInteger));
   if dm.QpricePLU.AsInteger>0 then
   begin
    //if dm.tovar.Locate('plu',dm.QpricePLU.AsInteger,[])
     if dm.locatetovar(dm.QpricePLU.AsInteger) then
                begin
                  dm.tovar.Edit;
                  dm.tovarPRICE.AsCurrency:=dm.QpriceNEWPRICE.AsCurrency;
                  dm.tovar.Post;
                end;
    dm.ExecuteSQL('update pos.tovar set price='+floattostr(dm.QpriceNEWPRICE.AsCurrency)+',plu=plu+3e12'+',quantityout=0.5'+' where plu='+floattostr(dm.QpricePLU.AsInteger));
    dm.ExecuteSQL('update tmp.tprihnakl set cenawzale='+floattostr(dm.QpriceNEWPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsInteger)+' and nom='+dm.QpriceOSN.AsString);
    dm.ExecuteSQL('update tnakltemp set cenawzale='+floattostr(dm.QpriceNEWPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsInteger));

   end;
 // dm.addmemo('update tmp.tkatalog set price='+floattostr(dm.QpriceNEWPRICE.AsCurrency)+' where plu='+floattostr(dm.QpricePLU.AsCurrency));
  dm.Qprice.Next;
   end;
  dm.Qprice.refresh;
  dm.setreg(1,nom);
  dm.commit;
  dm.tovar.ReadOnly:=temp;
 //dm.tovar.Refresh;
 decimalseparator:=',';
 dm.RefreshJournal;
 except
 decimalseparator:=',';
 dm.rollback;
 dm.addmemo(messageunit.m9);
 dm.tovar.ReadOnly:=temp;
 raise;
 end;
end;
//-------------------------------------------------------------------------
procedure  Perem(const nom:integer);
 var tab :table;
         l,j,i,sklad:integer;
         data:Tdatetime;
         total:Currency;
begin
try
DecimalSeparator:='.';
 SetLength(tab,5);
 dm.SelPerem.Close;
 dm.SelPerem.SetVariable('nom',nom);
 dm.SelPerem.Open;
 dm.SelPerem.First;
 l:=dm.SelPerem.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
      sklad:=dm.SelPeremSKLADOUT.Value;
      data:=dm.SelPeremDATA.Value;
          j:=0;
    while not dm.SelPerem.Eof do
      begin
       tab[1,j]:=dm.SelPeremPLU.AsInteger;
       tab[2,j]:=dm.SelPeremKOL_VO.AsFloat;
       tab[3,j]:=0;
       tab[4,j]:=0;

       inc(j);
       dm.SelPerem.Next;
      end;
     DM.SelPerem.First;
   IF not  RashProvodka(nom,sklad,data,tab,true,nil,false) then
       begin
       tab:=nil;
       dm.rollback;
       exit;
       end;
    tab:=nil;
    SetLength(tab,5);
    sklad:=dm.SelPeremSKLADIN.Value;
     j:=0;
     l:=1;
     total:=0;
     while not dm.SelPerem.Eof do
      begin
       dm.QselRashod.SetVariable('rash',nom);
       dm.QselRashod.SetVariable('plu',dm.SelPeremPLU.AsInteger);
       dm.QselRashod.Execute;
          while not dm.QselRashod.Eof do
           begin
            for i := Low(tab) to High(tab) do   SetLength(tab[i], l);
               tab[1,j]:=dm.SelPeremPLU.AsInteger;
               tab[2,j]:=dm.QselRashod.Field('kolvo');
               tab[3,j]:=dm.QselRashod.Field('cena');
               tab[4,j]:=dm.QselRashod.Field('partia');
  tab[0,j]:=dm.ExecuteSQL('select nvl(cenasnds,0)  from tmp.tprihnakl n,tmp.tprihj  j  where n.plu='+floattostr(tab[1,j])+ ' and rownum=1 and  n.nom=j.nom and j.part='+floattostr(tab[4,j]));
   ///if tab[0,j]=null then tab[0,j]:=0;
                total:=total+(tab[2,j]*tab[3,j]);
             inc(l);
             inc(j);
            dm.QselRashod.Next;
           end;
       dm.SelPerem.Next;
      end;
dm.SelPerem.Close;
   If  not   PrihProvodka(nom,sklad,data,tab,true) then
      begin
       tab:=nil;
       dm.rollback;
       exit;
      end;
     tab:=nil;
dm.setreg(1,nom);
dm.ExecuteSQL('update tmp.tperemj set sum='+floattostr(total)+' where nom='+inttostr(nom));

dm.commit;
DM.RefreshJournal;

DecimalSeparator:=',';
except
  dm.rollback;
  mainform.addmemo(messageunit.m10);
 DecimalSeparator:=',';
end;

end;
//---------------------------------------------------------------------------------------
procedure Priemka(const nom :integer;const minus:boolean=false);
  var tab :table;
      l,j,sklad:integer;
      data:Tdatetime;
  begin
      SetLength(tab,5);
     dm.SelSpisanie.Close;
     dm.SelSpisanie.SetVariable('nom',nom);
     dm.SelSpisanie.Open;
     dm.SelSpisanie.First;
     l:=dm.SelSpisanie.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
       sklad:=dm.SelSpisanieSKLADID.AsInteger;
       data:=dm.SelSpisanieDATA.Value;
     j:=0;
     while not dm.SelSpisanie.Eof do
      begin
       tab[0,j]:=0;
       tab[1,j]:=dm.SelSpisaniePLU.AsFloat;
       tab[2,j]:=dm.SelSpisanieKOL_VO.AsFloat;
       tab[3,j]:=dm.SelSpisanieCENA.AsCurrency;
       tab[4,j]:=dm.SelSpisaniePart.asFloat;
       inc(j);
       dm.SelSpisanie.Next;
      end;
     dm.SelSpisanie.Close;
     dm.setreg(1,nom);

     If      PrihProvodka(nom,sklad,data,tab,false,minus) then dm.commit
     else dm.rollback;

      tab:=nil;

     DM.RefreshJournal;
  end;
//---------------------------------------------------------------------------
   procedure ActPereozenky(const nom:integer);
       var tab :table;
         l,j,sklad:integer;
         data:Tdatetime;

     begin
     DecimalSeparator:='.';
         SetLength(tab,5);
          dm.SelAct.Close;
      dm.SelAct.SetVariable('nom',nom);
      dm.SelAct.Open;
      dm.SelAct.First;
      l:=dm.SelAct.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
      sklad:=dm.SelAct.FieldValues['skladid'];
      data:=dm.SelAct.FieldValues['data'];
      j:=0;
    while not dm.SelAct.Eof do
      begin
       tab[1,j]:=dm.SelAct.FieldValues['oldplu'];
       tab[2,j]:=dm.SelAct.FieldValues['kolvo'];
       tab[3,j]:=0;
        tab[4,j]:=0;
       inc(j);
       dm.SelAct.Next;
      end;
     dm.SelAct.First;
       IF not  RashProvodka(nom,sklad,data,tab,false,nil,false) then
       begin
       tab:=nil;
       dm.rollback;
       dm.SelAct.Close;
        DecimalSeparator:=',';
       exit;
       end;
      tab:=nil;
      SetLength(tab,5);
      l:= dm.SelAct.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);

     j:=0;
     while not  dm.SelAct.Eof do
      begin
       tab[0,j]:=0;
       tab[1,j]:=dm.SelAct.FieldValues['newplu'];
       tab[2,j]:=dm.SelAct.FieldValues['kolvo'];
       tab[3,j]:=dm.SelAct.FieldValues['newprice'];
       tab[4,j]:=dm.SelAct.FieldValues['part'];
       inc(j);
       dm.SelAct.Next;
      end;
      dm.SelAct.Close;
      dm.setreg(1,nom);
     If PrihProvodka(nom,sklad,data,tab,false) then dm.commit
     else dm.rollback;

      tab:=nil;

     DM.RefreshJournal;
     DecimalSeparator:=',';

     end;
//---------------------------------------------------------------------------
  procedure  Spisanie(const nom:integer;output:Tlabel;const minus:boolean=false);
   var tab :table;
         l,j,sklad:integer;
         data:Tdatetime;
  begin
    SetLength(tab,5);
     dm.SelSpisanie.Close;
     dm.SelSpisanie.SetVariable('nom',nom);
     dm.SelSpisanie.Open;
     dm.SelSpisanie.First;
      l:=dm.SelSpisanie.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
      sklad:=dm.SelSpisanieSKLADID.AsInteger;
      data:=dm.SelSpisanieDATA.Value;
      j:=0;
    while not dm.SelSpisanie.Eof do
      begin
       tab[1,j]:=dm.SelSpisaniePLU.AsFloat;
       tab[2,j]:=dm.SelSpisanieKOL_VO.AsFloat;
       tab[3,j]:=0;//dm.SelSpisanieCENA.AsCurrency;
        tab[4,j]:=0;
       inc(j);
       dm.SelSpisanie.Next;
      end;
     dm.SelSpisanie.Close;
     dm.setreg(1,nom);
      If   RashProvodka(nom,sklad,data,tab,false,output,minus) then
      begin
     dm.ExecuteSQL('update tmp.tskladj set sum=(select sum(kolvo*cenazak) sum  from tmp.tpart where nomrash='+inttostr(nom)+') where nom='+inttostr(nom));
     dm.commit
     end else
      begin
      dm.rollback;
      raise exception.Create('ошибка списания');
      end;
      tab:=nil;
     DM.RefreshJournal;
  end;
  //------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------
  procedure  KkmRashod(const nom:integer;output:tlabel);
   var tab :table;
         l,j,sklad:integer;
         data:Tdatetime;
  begin
    SetLength(tab,5);
     dm.SelKKm.Close;
     dm.SelKKm.SetVariable('nom',nom);
     dm.SelKKm.Open;
     dm.SelKKm.First;
      l:=dm.SelKKm.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
      sklad:=dm.SelKKmSKLADID.AsInteger;
      data:=dm.SelKKmDATA.Value;
      j:=0;
    while not dm.SelKKm.Eof do
      begin
       tab[1,j]:=dm.SelKKmPLU.AsFloat;
       tab[2,j]:=dm.SelKKmKOLVO.AsFloat;
       tab[3,j]:=dm.SelKKmCENA.AsCurrency;
       tab[4,j]:=dm.SelKKmSUMDISCOUNT.AsCurrency;
       inc(j);
       dm.SelKKm.Next;
      end;
     dm.SelKKm.Close;
     dm.setreg(1,nom);
      If   RashProvodka(nom,sklad,data,tab,false,output,false) then
      begin


       dm.commit
     end
      else dm.rollback;

      tab:=nil;
     DM.RefreshJournal;
  end;
  //--------------------------------------------------------------------------------------












  //---------------------------------------------------------------------------
  procedure  Rashod(const nom:integer;output:tlabel;const lifo:boolean=false);
   var tab :table;
         l,j,sklad,counter:integer;
         data:Tdatetime;
  begin
  counter:=dm.QpartOst.SQL.Count;
  dm.QpartOst.Close;
 try
  if lifo then dm.QpartOst.SQL.Strings[counter-1]:='order by data desc';
    SetLength(tab,5);
     dm.SelRashod.Close;
     dm.SelRashod.SetVariable('nom',nom);
     dm.SelRashod.Open;
     dm.SelRashod.First;
      l:=dm.SelRashod.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
      sklad:=dm.SelRashodSKLADID.AsInteger;
      data:=dm.SelRashodDATA.Value;
      j:=0;
    while not dm.SelRashod.Eof do
      begin
       tab[1,j]:=dm.SelRashodPLU.AsFloat;
       tab[2,j]:=dm.SelRashodKOL_VO.AsFloat;
       tab[3,j]:=dm.SelRashodCENA.AsCurrency;
        tab[4,j]:=0;
       inc(j);
       dm.SelRashod.Next;
      end;
     dm.SelRashod.Close;
     dm.setreg(1,nom);
      If   RashProvodka(nom,sklad,data,tab,false,output,false) then
      begin
       dmunit.reg:=1;
       if dmunit.tipdok=3 then dmunit.tipdok:=4;
       dm.commit
     end
      else dm.rollback;

      tab:=nil;
     DM.RefreshJournal;
 finally
  dm.QpartOst.Close;
  dm.QpartOst.SQL.Strings[counter-1]:='order by data';

 end;
  end;
  //--------------------------------------------------------------------------------------
 procedure Prihod(const nom :integer);
  var tab :table;
      l,j,sklad:integer;
      data:Tdatetime;
  begin
      SetLength(tab,6);
     dm.QselDouble.Close;
     dm.SelPrihod.Close;
     dm.QselDouble.SetVariable('nom',nom);
     dm.SelPrihod.SetVariable('nom',nom);
     dm.SelPrihod.Open;
      dm.QselDouble.Open;
  if dm.SelPrihod.Locate('plu',0,[]) then
     begin
       dm.addmemo(messageunit.m21);
        dm.SelPrihod.Close;
        exit;

       end;  
    if dm.QselDouble.RecordCount>0 then
    begin
     dm.addmemo('найдены двойные товары');
    while not dm.QselDouble.Eof do
       begin
         dm.addmemo(floattostr(dm.QselDouble.FieldValues['plu']));
         dm.QselDouble.Next;
       end;
    dm.QselDouble.Close;
     dm.SelPrihod.Close;


    exit;
    end;
     dm.SelPrihod.First;
     l:=dm.SelPrihod.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
       sklad:=dm.SelPrihodSKLADID.AsInteger;
       data:=dm.SelPrihodDATA.Value;
     j:=0;
     while not dm.SelPrihod.Eof do
      begin
       tab[0,j]:=dm.SelPrihodCENASNDS.AsCurrency;
       tab[1,j]:=dm.SelPrihodPLU.AsFloat;
       tab[2,j]:=dm.SelPrihodKOL_VO.AsFloat;
       tab[3,j]:=dm.SelPrihodCENAREAL.AsCurrency;
       tab[4,j]:=dm.selprihodPart.asFloat;
       tab[5,j]:=dm.SelPrihodlife.Value;
       inc(j);
       dm.SelPrihod.Next;
      end;
     dm.SelPrihod.Close;
     dm.setreg(1,nom);

     If      PrihProvodka(nom,sklad,data,tab,false) then
     begin
     dm.commit;
     dmunit.reg:=1;
     if dmunit.tipdok=1 then dmunit.tipdok:=2;
     end else dm.rollback;

      tab:=nil;

     DM.RefreshJournal;
  end;
//---------------------------------------------------------------------------
   function OstatokPartii(const plu,part:double;const data :TdateTime):double;
      var partost:double;
      begin

        dm.QselPart.SetVariable('plu',plu);
                  dm.QselPart.SetVariable('nom',part);
                  dm.QselPart.SetVariable('data',data);
                  dm.QselPart.Execute;
                  partost:=0;
                  while not dm.QselPart.Eof do
                  begin
                   partost:=partost+dm.QselPart.Field('kolvo');

                   dm.QselPart.Next;
                  end;

      result:=partost;
      end;

//------------------------------------------------------------------------------

  function PrihProvodka(const nom,sklad :integer;
  const  data:TdateTime;const tab :table;
  const perem:boolean;
  const minus:boolean=false):boolean;
   var i:integer;
       s,f:double;
       sep:char;

   begin
   result:=false;
  sep:=DecimalSeparator;
  DecimalSeparator:='.';
  try
    for i:=LOW(tab[1]) to HIGH(TAB[1]) do
     begin
     // minus:=(tab[2,i]<0);
     // if minus then   tab[2,i]:=tab[2,i]*-1;

     dm.selinventar.Close;
     dm.selinventar.SetVariable('plu',round(tab[1,i]));
     dm.selinventar.SetVariable('data',data);
     dm.selinventar.SetVariable('sklad',sklad);
     dm.selinventar.Open;
     if dm.selinventar.RecordCount>0 then
     begin
      dm.addmemo('Была инвентаризация.Проводка невозможна');
      dm.selinventar.Close;
      abort;
     end;
      dm.selinventar.Close;


         dm.Qprovodka.SetVariable('partia',tab[4,i]);
         s:=dm.sumostatok(round(tab[1,i]),sklad,data);
         If not perem  then
         begin
       //  f:=dm.Fullostatok(round(tab[1,i]));

         end;
         dm.Qprovodka.SetVariable('nom',nom);
         dm.Qprovodka.SetVariable('sum',tab[2,i]);
         dm.Qprovodka.SetVariable('plu',tab[1,i]);
         dm.Qprovodka.SetVariable('data',data);
         dm.Qprovodka.SetVariable('cena',tab[3,i]);
         dm.Qprovodka.SetVariable('skladid',sklad);
         dm.Qprovodka.SetVariable('prihod',tab[2,i]) ;
         dm.Qprovodka.SetVariable('ostatok',s+tab[2,i]) ;
         dm.Qprovodka.SetVariable('rashod',0);
         dm.Qprovodka.SetVariable('pprice',tab[0,i]);
         dm.Qprovodka.SetVariable('discount',0);
        if length(tab)=6 then  dm.Qprovodka.SetVariable('life',tab[5,i])
        else dm.Qprovodka.SetVariable('life',null);

       f:=0;
        if minus then begin

                       dm.QminKniga.Close;
                       dm.QminKniga.SetVariable('data',data);
                        dm.QminKniga.SetVariable('plu',round(tab[1,i]));
                        dm.QminKniga.SetVariable('sklad',sklad);
                        dm.QminKniga.Open;
                        while not dm.QminKniga.Eof do
                        begin
                          if roundto(f,-3)>roundto(f+(-1*dm.QminKniga.FieldValues['partost']),-3) then break
                          else f:=f+(-1*dm.QminKniga.FieldValues['partost']);

                          dm.QminKniga.Next;
                        end;
                        dm.QminKniga.Close;



                      end;
        if not minus then dm.Qprovodka.SetVariable('partost',tab[2,i]-OstatokPartii(tab[1,i],tab[4,i],data))
                     else dm.Qprovodka.SetVariable('partost',roundto(tab[2,i]-f,-3));
         dm.updateOst(tab[2,i],round(tab[1,i]),sklad,nom,data);
         dm.Qprovodka.Execute;
      if (minus) //and (f>0)
                then begin
                      if not   updateminus(nom,sklad,data,round(tab[1,i]),f)
                      then abort;
                    end;
      f:=dm.Fullostatok(round(tab[1,i]));
     dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f)+' where plu='+inttostr(round(tab[1,i])));



   end;



    result:=true;
    DecimalSeparator:=sep;
    except

       mainform.addmemo(messageunit.m11);
       DecimalSeparator:=sep;


    end;
   end;
//-----------------------------------------------------------------------------------------
   function   RashProvodka(const nom,sklad :integer;
                           const data:TdateTime;
                           const tab :table;
                           const perem:boolean;
                                 output:tlabel;
                           const minus:boolean=false):boolean;
     var s,f,tempkolvo,kolvo,ost,tsum:double;
         i,plu:integer;
          sep:char;
    begin
     result:=false;
      sep:=DecimalSeparator;
      DecimalSeparator:='.';
     try
    // dm.QpartOst.Optimize;
        for i:=LOW(tab[1]) to HIGH(TAB[1]) do
     begin
       s:=dm.sumostatok(round(tab[1,i]),sklad,data);
       f:=dm.FullostatokSklad(round(tab[1,i]),sklad);

           dm.selinventar.Close;
           dm.selinventar.SetVariable('plu',round(tab[1,i]));
            dm.selinventar.SetVariable('data',data);
            dm.selinventar.SetVariable('sklad',sklad);
            dm.selinventar.Open;
          if dm.selinventar.RecordCount>0 then
            begin
           dm.addmemo('Была инвентаризация.Проводка невозможна');
            dm.selinventar.Close;
             abort;
             end;
           dm.selinventar.Close;



      {  if (dm.ostatok(round(tab[1,i]),sklad,data)<tab[2,i]) or
        (f<tab[2,i]) then
         begin
          dm.nofilter;
        if dm.LocateTovar(round(tab[1,i])) then //  dm.tovar.Locate('plu',tab[1,i],[]);
          mainform.addmemo('Товара '+inttostr(round(tab[1,i]))+' '+dm.tovarNAME.Value+' нет нужного кол-ва');
          if dm.Qnakltemp.Active then dm.Qnakltemp.Locate('plu',tab[1,i],[]);
          abort;
         end;  }
          If not perem then
          begin

          dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f-tab[2,i])+' where plu='+inttostr(round(tab[1,i])));
          end;

          tempkolvo:=tab[2,i];
          If dm.QpartOst.Active  then dm.QpartOst.Close;
          plu:=round(tab[1,i]);

          dm.QpartOst.SetVariable('plu',round(tab[1,i]));
          dm.QpartOst.SetVariable('data',{strtodate('31.12.2999')}data);
          dm.QpartOst.SetVariable('sklad',sklad);
          dm.QpartOst.Open;
          dm.QpartOst.First;
         if dm.QpartOst.RecordCount>0 then
              begin
                                   //   dm.nofilter;
                                  //     if dm.LocateTovar(round(tab[1,i])) then
                                 //        mainform.addmemo('Товара '+inttostr(round(tab[1,i]))+' '+dm.tovarNAME.Value+' нет поставок ');
                                //      ABORT;


           if output<>nil then output.Caption:=inttostr(i)+ ' '+inttostr(plu)+ ' '+dm.QpartOstNAME.Value;
            application.ProcessMessages;
           tsum:=0;
            while tempkolvo>0 do
                begin

                 if dm.QpartOstPARTOST.AsFloat<=0 then dm.QpartOst.Next;
                  kolvo:=roundto(dm.QpartOstPARTOST.AsFloat-tempkolvo,-3);
                  if (kolvo>=0) or (dm.QpartOst.Eof) then
                  begin
                  kolvo:=tempkolvo;
                  tempkolvo:=0;
                  end else begin
                  kolvo:=dm.QpartOstPARTOST.AsFloat;
                  tempkolvo:=tempkolvo-kolvo;
                  end;
               if (dm.QpartOst.Eof) and (dm.QpartOstPARTOST.AsFloat>0) then
                ost:=-1*kolvo else
                ost:=dm.QpartOstPARTOST.AsFloat-kolvo;
                tsum:=tsum+(kolvo*dm.QpartOstPPRICE.AsCurrency);
                dm.ExecuteSQL('update tmp.kniga set partost='+floattostr(ost)+' where id='+inttostr(dm.QpartOstID.AsInteger));
                dm.QInsertPart.SetVariable('plu',round(tab[1,i]));
                dm.QInsertPart.SetVariable('nom',dm.QpartOstNOM.AsInteger);
                dm.QInsertPart.SetVariable('cenazak',dm.QpartOstCENA.asCurrency);
                dm.QInsertPart.SetVariable('cenareal',tab[3,i]);
                dm.QInsertPart.SetVariable('kolvo',kolvo);
                dm.QInsertPart.SetVariable('data',DATA);
                dm.QInsertPart.SetVariable('nomrash',nom);
                dm.QInsertPart.SetVariable('part',dm.QpartOstPARTIA.AsInteger);
                dm.QInsertPart.Execute;
                dm.QpartOst.Next;
           end;
                dm.QpartOst.Close;
         end else  begin
                       dm.nofilter;
                          if dm.LocateTovar(round(tab[1,i])) then
                           mainform.addmemo('Товара '+inttostr(round(tab[1,i]))+' '+dm.tovarNAME.Value+' нет поставок ');
                        tsum:=0;

          end;//partost>0
         dm.Qprovodka.SetVariable('partost',0);
         dm.Qprovodka.SetVariable('partia',0);
         dm.Qprovodka.SetVariable('nom',nom);
         dm.Qprovodka.SetVariable('sum',-1*tab[2,i]);
         dm.Qprovodka.SetVariable('plu',round(tab[1,i]));
         dm.Qprovodka.SetVariable('data',DATA);
         dm.Qprovodka.SetVariable('cena',tab[3,i]);
         dm.Qprovodka.SetVariable('skladid',sklad);
         dm.Qprovodka.SetVariable('prihod',0) ;
         dm.Qprovodka.SetVariable('rashod',tab[2,i]);
         dm.Qprovodka.SetVariable('ostatok',s-tab[2,i]) ;
         dm.Qprovodka.SetVariable('pprice',tsum) ;
         dm.Qprovodka.SetVariable('discount',tab[4,i]);
         dm.updateOst(-1*tab[2,i],round(tab[1,i]),sklad,nom,data);

         dm.Qprovodka.Execute;

          if (minus) //and (f>0)
                then begin
                      if not   updateminus(nom,sklad,data,round(tab[1,i]),f)
                      then abort;
                    end;
  if not perem
  then
  begin
        f:=dm.Fullostatok(round(tab[1,i]));
        dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f)+' where plu='+inttostr(round(tab[1,i])));

 end;



     end;
       if output<>nil then output.Caption:='';
     result:=true;
      DecimalSeparator:=sep;
    except
      if output<>nil then output.Caption:='';
       mainform.addmemo(messageunit.m12);
       dm.OraBase.Rollback;
       DecimalSeparator:=sep;
       

    end;


    end;
//-------------------------------------------------------------------------------------
 procedure Unreg(const nom:integer);
  var prihod,rashod,f:double;
      plu,skladid,otkat,My_counter,i:integer;
      data:Tdatetime;
      perem:boolean;
        sep:char;
      plu_array :array of integer;



  begin

    my_counter:=0;
    sep:=DecimalSeparator;
    DecimalSeparator:='.';
  try
     If dm.TipNakl(nom)=3  then perem:=true
                           else perem:=false;
     dm.selkniga.SetVariable('nom',nom);
     dm.selkniga.Execute;
     while not dm.selkniga.Eof do
     begin
      setlength(plu_array,my_counter+1);

      prihod:=dm.selkniga.Field('prihod');
      rashod:=dm.selkniga.Field('rashod');

      plu:=dm.selkniga.Field('plu');


      skladid:=dm.selkniga.Field('skladid');
      data:=dm.selkniga.Field('data');

      plu_array[my_counter]:=plu;
      inc(My_counter);

      otkat:=dm.selkniga.Field('otkat');
     dm.selinventar.Close;
     dm.selinventar.SetVariable('plu',plu);
     dm.selinventar.SetVariable('data',data);
      dm.selinventar.SetVariable('sklad',skladid);
     dm.selinventar.Open;
     if dm.selinventar.RecordCount>0 then
     begin
      dm.addmemo('Была инвентаризация.Отмена невозможна');
      dm.selinventar.Close;
      abort;
     end;
      dm.selinventar.Close;
      If otkat<>0  then
           begin
           dm.selkniga.Next;
           continue;
           end;


     If prihod>0  then
          begin
            dm.updateOst(-1*prihod,plu,skladid,nom,data);
          end;
     If rashod>0  then
          begin
          dm.UpdateRashPart(plu,nom);
          dm.updateOst(rashod,plu,skladid,nom,data);
          end;

     dm.selkniga.Next;
     end;
  dm.ExecuteSQL('update tmp.kniga set otkat=1 where nom='+inttostr(nom));
  dm.setreg(0,nom);
 // dm.commit;

  except
 // dm.rollback;

   DecimalSeparator:=sep;
   raise;
  end;

 try
    for i:=0 to high(plu_array) do
     begin

    If not perem  then
        begin
         f:=DM.Fullostatok(plu_array[i]);
         dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f)+' where plu='+inttostr(plu_array[i]));

        end;

   end;
 //dm.commit;
  DecimalSeparator:=sep;
 
  except
 // dm.rollback;

   DecimalSeparator:=sep;
   raise;

  end;



end;
//----------------------------------------------------------------------------
{procedure Unreg(const nom:integer);
  var prihod,rashod,ostatok,cena,partost,f:double;
      plu,skladid,otkat,partia,My_counter,i:integer;
      data:Tdatetime;
      perem:boolean;
        sep:char;
      plu_array :array of integer;



  begin
    my_counter:=0;
    sep:=DecimalSeparator;
    DecimalSeparator:='.';
  try
     If dm.TipNakl(nom)=3  then perem:=true
                           else perem:=false;
     dm.selkniga.SetVariable('nom',nom);
     dm.selkniga.Execute;
     while not dm.selkniga.Eof do
     begin
      setlength(plu_array,my_counter+1);

      prihod:=dm.selkniga.Field('prihod');
      rashod:=dm.selkniga.Field('rashod');
      cena:=dm.selkniga.Field('cena');
      plu:=dm.selkniga.Field('plu');


      skladid:=dm.selkniga.Field('skladid');
      data:=dm.selkniga.Field('data');
      ostatok:=dm.selkniga.Field('ostatok');
      partost:=dm.selkniga.Field('partost');
      partia:=dm.selkniga.Field('partia');
      plu_array[my_counter]:=plu;
      inc(My_counter);
 //  If not perem  then    f:=dm.Fullostatok(plu)
//   else f:=0;
      
      otkat:=dm.selkniga.Field('otkat');
      If otkat<>0  then
           begin
           dm.selkniga.Next;
           continue;
           end;
          dm.Qprovodka.SetVariable('partia',partia);
          dm.Qprovodka.SetVariable('nom',nom);
          dm.Qprovodka.SetVariable('data',data);
          dm.Qprovodka.SetVariable('plu',plu);
          dm.Qprovodka.SetVariable('cena',cena);
          dm.Qprovodka.SetVariable('skladid',skladid);
     If prihod>0  then
          begin
          dm.Qprovodka.SetVariable('prihod',0);
          dm.Qprovodka.SetVariable('rashod',prihod);
          dm.Qprovodka.SetVariable('ostatok',ostatok-prihod);
          dm.Qprovodka.SetVariable('sum',-1*prihod);
          dm.Qprovodka.SetVariable('partost',partost-prihod);
          dm.updateOst(-1*prihod,plu,skladid,nom,dmunit.datadok);
 //  If not perem then dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f-prihod)+' where plu='+inttostr(plu));

          end;
     If rashod>0  then
          begin
          dm.Qprovodka.SetVariable('prihod',rashod);
          dm.Qprovodka.SetVariable('rashod',0);
          dm.Qprovodka.SetVariable('ostatok',ostatok+rashod);
          dm.Qprovodka.SetVariable('sum',rashod);
          dm.Qprovodka.SetVariable('partost',partost+rashod);
        //  f:=dm.Fullostatok(plu);



          dm.UpdateRashPart(plu,nom);
          dm.updateOst(rashod,plu,skladid,nom,data);
//  If not perem then dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f+rashod)+' where plu='+inttostr(plu));

          end;
          dm.Qprovodka.Execute;
   //  If not perem  then    f:=DM.Fullostatok(plu)
   //  else f:=0;
   //  dm.addmemo(floattostr(f));
   //  If not perem then dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f)+' where plu='+inttostr(plu));
     dm.selkniga.Next;
     end;
  dm.ExecuteSQL('update tmp.kniga set otkat=1 where nom='+inttostr(nom));
  dm.setreg(0,nom);
  dm.commit;

  except
  dm.rollback;
   DecimalSeparator:=sep;
  raise;

  end;

 try
    for i:=0 to high(plu_array) do
     begin

    If not perem  then
        begin
         f:=DM.Fullostatok(plu_array[i]);
         dm.ExecuteSQL('update tmp.tkatalog set nal='+floattostr(f)+' where plu='+inttostr(plu_array[i]));

        end;

   end;
 dm.commit;
  DecimalSeparator:=sep;
  except
  dm.rollback;
   DecimalSeparator:=sep;
  raise;

  end;



end;}
//----------------------------------------------------------------------------


procedure otmena(const nom:integer);
var Doc:integer;
procedure otmenaP(const nom:integer);
var Doc:integer;
begin
  dm.QselPeresort.Close;
   dm.QselPeresort.SetVariable('nom',nom);
   dm.QselPeresort.Open;
        If dm.QselPeresort.RecordCount>0  then
  begin


   while not dm.QselPeresort.Eof do
   begin
    try
      dm.addmemo('№ '+floattostr(dm.QselPeresort.FieldValues['nomrash']) );
    except

    end;
    doc:=dm.QselPeresort.FieldValues['nomrash'];
     otkatperesort(doc);
    // otmena(doc);
    dm.QselPeresort.Next;
   end;
  end;
   dm.QselPeresort.Close;

end;

begin
try

   otmenaP(nom);
   dm.QSelDoc.Close;
   dm.QSelDoc.SetVariable('nom',nom);
   dm.QSelDoc.Open;
  If dm.QSelDoc.RecordCount>0  then
  begin
   if MessageDlg('Будет отменено '+inttostr(dm.QSelDoc.RecordCount)+' документов. Всеравно продолжить ?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                                                       begin
                                                        dm.QSelDoc.Close;
                                                        abort;
                                                       end;
   dm.addmemo(messageunit.m13);
   while not dm.QSelDoc.Eof do
   begin
    try
      dm.addmemo('№ '+floattostr(dm.QSelDoc.FieldValues['doc'])+' от '+dm.QSelDoc.FieldValues['data'] );
    except

    end;
    doc:=dm.QSelDoc.FieldValues['nom'];
    otmenaP(doc);
    unreg(doc);
    dm.QSelDoc.Next;
   end;
  end;
  dm.QSelDoc.Close;
  otkatperesort(nom);
  unreg(nom);
 // dm.ExecuteSQL('delete from tmp.kniga  where otkat=1');
  dm.ExecuteSQL('update tmp.kniga set partost=prihod where prihod>0 and partost>prihod');
  dm.commit;
  dm.RefreshJournal;
  except
  dm.rollback;
  dm.QselPeresort.Close;
  raise;

  end;
 end;

//----------------------------------------------------------------------------
 procedure SetDelete(const nom:integer);
   begin
  dm.setreg(2,nom);
  dm.commit;
  end;
//----------------------------------------------------------------------------
procedure DeleteAll;

begin
try
dm.ExecuteSQL('delete from tmp.tprihnakl where nom in (select nom from tmp.tprihj where reg=2)');
dm.ExecuteSQL('delete from tmp.tprihj where reg=2');
dm.ExecuteSQL('delete from tmp.tperemnakl where nom in (select nom from tmp.tperemj where reg=2)');
dm.ExecuteSQL('delete from tmp.tperemj where reg=2');
dm.ExecuteSQL('delete from tmp.trashnakl where nom in (select nom from tmp.trashj where reg=2)');
dm.ExecuteSQL('delete from tmp.trashj where reg=2');
dm.ExecuteSQL('delete from tmp.tkassa where reg=2');
dm.ExecuteSQL('delete from tmp.tinvent where nom in (select nom from tmp.tskladj where reg=2)');
//dm.ExecuteSQL('delete from tmp.tinvent where nom NOT in (select nom from tmp.tskladj )');
dm.ExecuteSQL('delete from tmp.tskladj where reg=2');
dm.ExecuteSQL('delete from tmp.tprice where nom in (select nom from tmp.tpricej where reg=2)');
//dm.ExecuteSQL('delete from tmp.tprice where nom NOT in (select nom from tmp.tpricej)');
dm.ExecuteSQL('delete from tmp.tpricej where reg=2');
dm.ExecuteSQL('delete from tmp.tbeznal where reg=2');
dm.ExecuteSQL('delete from tmp.kniga  where otkat=1');
dm.ExecuteSQL('delete from tmp.kkmreport where doc in (select doc from tmp.kkmj where reg=2)');
dm.ExecuteSQL('delete from tmp.kkmj where reg=2');
dm.ExecuteSQL('delete from tmp.actprice where nom in (select nom from tmp.actpricej where reg=2)');
dm.ExecuteSQL('delete from tmp.actpricej where reg=2');
dm.ExecuteSQL('delete from tmp.tminus where nom in (select nom from tmp.tminusj where reg=2)');
dm.ExecuteSQL('delete from tmp.tminusj where reg=2');


dm.commit;
dm.RefreshJournal;
except
 dm.rollback;
 dm.addmemo(messageunit.m14);
 raise;
 end;

end;
//-----------------------------------------------------------------------------
//----------------------------------------------------------------------------
 procedure NoDelete(const nom:integer);
   begin
  dm.setreg(0,nom);
  dm.commit;
  end;
{--------------------------------------------------------------------}

function ActPeresortiza(const nom:integer):boolean;
       var tab :table;
         l,j,sklad:integer;
         data:Tdatetime;
//         temp:double;
     begin
  result:=false;
 try
     DecimalSeparator:='.';
         SetLength(tab,5);
          dm.QselMinus.Close;
      dm.QselMinus.SetVariable('nom',nom);
      dm.QselMinus.Open;
      dm.QselMinus.First;
      l:=dm.QselMinus.RecordCount;
      if l=0 then begin
                    dm.addmemo('пустая накладная ');
                    abort;
                  end;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);
      sklad:=dm.QselMinus.FieldValues['skladid'];
      data:=dm.QselMinus.FieldValues['data'];
      j:=0;
    while not dm.QselMinus.Eof do
      begin
       if  dm.QselMinus.FieldValues['pplu']=dm.QselMinus.FieldValues['mplu']
       then   begin
                  dm.addmemo('код товаров равен ');
                  abort;
              end;
       if dm.FullostatokSklad(dm.QselMinus.FieldValues['pplu'],sklad)<dm.QselMinus.FieldValues['kolvo']
          then begin

                  if dm.locatetovar(dm.QselMinus.FieldValues['pplu'])  then
                   dm.addmemo(dm.tovarNAME.AsString+' нет нужного кол-ва');
                   abort;
                end;
       tab[1,j]:=dm.QselMinus.FieldValues['pplu'];
       tab[2,j]:=dm.QselMinus.FieldValues['kolvo'];
       tab[3,j]:=0;
        tab[4,j]:=0;
       inc(j);
       dm.QselMinus.Next;
      end;
     dm.QselMinus.First;
       IF not  RashProvodka(nom,sklad,data,tab,false,nil,false) then   abort;

      tab:=nil;
      SetLength(tab,5);
      l:= dm.QselMinus.RecordCount;
    for j := Low(tab) to High(tab) do   SetLength(tab[j], l);

     j:=0;
     while not  dm.QselMinus.Eof do
      begin
       tab[0,j]:=0;
       tab[1,j]:=dm.QselMinus.FieldValues['mplu'];
       tab[2,j]:=dm.QselMinus.FieldValues['kolvo'];
       tab[3,j]:=dm.QselMinus.FieldValues['mprice'];
       tab[4,j]:=0;
       inc(j);
       dm.QselMinus.Next;
      end;
     // dm.QselMinus.Close;
      dm.setreg(1,nom);
     If PrihProvodka(nom,sklad,data,tab,false) then
     begin
      dm.QselMinus.First;
           while not  dm.QselMinus.Eof do
          begin
             if not updateminus(nom,sklad,data,
                                dm.QselMinus.FieldValues['mplu'],
                                dm.QselMinus.FieldValues['kolvo'])
               then abort;
            dm.QselMinus.Next;
           end;
       dm.ExecuteSQL('update tmp.kniga set partost=0 where nom='+inttostr(nom)) ;
      dm.commit;
      result:=true;
     end
     else dm.rollback;

      tab:=nil;
      dm.QselMinus.Close;
      dm.QminKniga.Close;
     DM.RefreshJournal;
      DecimalSeparator:=',';
   except
      dm.rollback;
      tab:=nil;
      dm.QselMinus.Close;
      dm.QminKniga.Close;
      DecimalSeparator:=',';
      raise;
   end;

  end;
{---------------------------------------------------------------------------}
 procedure OtkatPeresort(const nom:integer);
  begin

   try
   DecimalSeparator:='.';
   dm.qselMinpart.Close;
   dm.qselMinpart.SetVariable('nom',nom);
   dm.qselMinpart.Open;
    while not dm.qselMinpart.Eof do
    begin
      dm.ExecuteSQL('update tmp.kniga set partost=partost+'+floattostr(dm.qselMinpart.FieldValues['kolvo'])+' where prihod>0 and plu='+inttostr(dm.qselMinpart.FieldValues['plu'])+' and nom='+inttostr(dm.qselMinpart.FieldValues['nom']));



     dm.qselMinpart.Next;
     end;
    dm.qselMinpart.Close;
    dm.ExecuteSQL('delete from tmp.minpart where nomrash='+inttostr(nom));

    DecimalSeparator:=',';
   except
    dm.qselMinpart.Close;
    DecimalSeparator:=',';
    raise;
   end;
 end;
 function updateminus(const nom:integer;
                       const sklad:integer;
                        const  data:TDateTime;
                        const plu:integer;
                        const kolvo:double):boolean;
// var temp:double;
 begin
   result:=false;
//    temp:=0;
             dm.QminKniga.Close;
             dm.QminKniga.SetVariable('plu',plu);
             dm.QminKniga.SetVariable('data',data);
             dm.QminKniga.SetVariable('sklad',sklad);
         //    dm.addmemo(datetostr(data));
              dm.QminKniga.Open;
         //dm.addmemo(inttostr(dm.QminKniga.RecordCount));
      {       dm.QminKniga.Refresh;
             dm.QminKniga.First;
             while not dm.QminKniga.Eof do
                  begin
                 //   dm.addmemo(dm.QminKniganom.AsString);
                  temp:=temp+dm.QminKnigaPARTOST.AsFloat;
               //   dm.addmemo(dm.QminKnigaplu.AsString);
                  dm.QminKniga.Next;
                  end;
         {     if roundto(kolvo,-3)<>-1*roundto(temp,-3)
                   then begin
                          dm.addmemo('не равны суммы в пересортице');
                          exit;

                        end;    }
             dm.QminKniga.First;
                 while not dm.QminKniga.Eof do
                  begin
                    dm.qInsMinpart.SetVariable('plu',plu);
                    dm.qInsMinpart.SetVariable('data',data);
                    dm.qInsMinpart.SetVariable('nomrash',nom);
                    dm.qInsMinpart.SetVariable('kolvo',dm.QminKnigaPARTOST.AsFloat);
                    dm.qInsMinpart.SetVariable('nom',dm.QminKnigaNOM.AsInteger);
                    dm.qInsMinpart.Execute;
                    dm.ExecuteSQL('update tmp.kniga set partost=0 where id='+floattostr(dm.QminKnigaID.Value)) ;


                   dm.QminKniga.Next;
                  end;
 test.testkniga(plu,sklad,data,false);

  result:=true;

 end;
end.
