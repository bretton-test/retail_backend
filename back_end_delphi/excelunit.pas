unit excelunit;

interface
 uses Classes,sysutils, OpExcel,forms;
 const inifile:string='excel.ini';
 type rBook = record
 tovar:string;
 price:string;
 pricebnds:string;
 kolvo:string;
 wes:string;
 edizm:string;
 firstrow:integer;
  end;

 type  TloadExcel= class

private
 Excel: TopExcel;
 book:rBook;
 loadString:Tstringlist;
 koords:integer;
 curKoord:integer;
 endKoord:boolean;
 endBook:boolean;
 BookLoaded:boolean;
 CurRow:integer;
 Rng : TOpExcelRange;
 procedure SetVizible(Value:boolean);
 function  GetVisible:boolean;
 function LoadKoord:boolean;
 function decodekoords:boolean;
 procedure firstCoord;
 procedure nextCoord;
 function test:boolean;
 function convertvalue(const  val:variant):string;

public
 function open(const execelfile:string):boolean;
 property visible :boolean read GetVisible write SetVizible;
 property EOF:boolean read endbook;
 procedure close;
 procedure next;
 function Tovar:string;
 function kolvo:double;
 function price:currency;
 function pricebnds:currency;
 function edizm:string;
 end;

 implementation



   function testval(const val:variant):boolean;
        var temp:string;
            n:double;
        begin
         result:=true;
         try
          temp:=trim(string(val));

          if temp='' then
            begin
             result:=false;
             exit;
            end;
          n:=strtofloat(temp[1]);
        // if  ord(temp[1])  >57  then exit ;

          except
           result:=false;
          end;
        end;
 //-----------------------------------------------------------------------

  function  TloadExcel.GetVisible:boolean;
   begin

     result:=excel.Visible;

   end;
 //---------------------------------------------------------------------
  procedure TloadExcel.SetVizible(Value:boolean);
    begin
    excel.Visible:=VALUE;

    end;

   //---------------------------------------------------------------------

 function TloadExcel.open(const execelfile:string):boolean;
  begin


    excel:=TopExcel.Create(nil);
    result:=false;
    BookLoaded:=false;
    excel.Workbooks.Add;
    excel.Workbooks[0].Filename:=execelfile;
    try
    excel.Connected:=true;
    Rng := Excel.Workbooks[0].Worksheets[0].Ranges.Add;
    if (LoadKoord)
     and (DecodeKoords)  then
      begin
       while not endKoord do  if not test then
          begin

            nextCoord;
            if not DecodeKoords then exit;
          end  else
           begin
           result:=true;
           endBook:=false;
           BookLoaded:=true;
           currow:=book.firstrow;

           break;
          end;


      end;

    except
     bookLoaded:=false;
     
    end;

  end;
  //------------------------------------------------------------------------
    procedure TloadExcel.close;
    begin
    if assigned(rng) then rng.Free;
    if assigned(excel) then
    begin
     excel.Connected:=false;
     excel.Free;
    end;
    if assigned(loadstring) then loadstring.Free;


    end;
  //--------------------------------------------------------------------------
   function TloadExcel.LoadKoord:boolean;
    begin
      result:=false;
      try
      loadstring:=Tstringlist.Create;
      loadstring.LoadFromFile(ExtractFilePath(Application.ExeName)+inifile);
      koords:=loadstring.Count-1;
      if koords=0 then exit;
      curkoord:=0;
      endKoord:=false;
       result:=true;
      except
       koords:=0;

      end;

    end;
 //--------------------------------------------------------------------------
 function TloadExcel.decodekoords:boolean;
    var temp,nakopitel:string;
        i,count:integer;

    begin
     count:=0;
     nakopitel:='';
     result:=false;
     if koords=0 then exit;

     temp:=loadstring.Strings[curkoord];
     if copy(temp,1,2)='//' then
     begin
      result:=true;
      exit;
     end;
     if (temp='') or (length(temp)<8) then exit;
      for i:=1 to length(temp) do
        begin
        If temp[i]<>';'  then  nakopitel:=nakopitel+temp[i]
                  else  begin
                        inc(count);
                         case count of
                         1:book.tovar:=nakopitel;
                         2:book.wes:=nakopitel;
                         3:book.kolvo:=nakopitel;
                         4:book.price:=nakopitel;
                         5:book.pricebnds:=nakopitel;
                         6:book.edizm:=nakopitel;
                         7:book.firstrow:=strtoint(nakopitel);
                         end;

                        If count=7 then break
                        else nakopitel:='';
                        end;

      end;
     result:=true;
    end;
 //--------------------------------------------------------------------------
  procedure TloadExcel.firstCoord;
   begin
    if koords>0 then curKoord:=0;
    endKoord:=false;
   end;
//---------------------------------------------------------------------------
   procedure TloadExcel.nextCoord;
   begin
    if (koords>0) and (curKoord<koords) then inc(curKoord);
    if  curKoord>=koords then  endKoord:=true;

   end;
//---------------------------------------------------------------------------
  function TloadExcel.test:boolean;


   begin
    result:=false;
      if (book.tovar='')
      or (book.price='')
      or ((book.wes='') and (book.kolvo='')) then exit;

     if not assigned(excel)
        or (not excel.Connected) then exit;

     rng.Address:=book.tovar+inttostr(book.firstRow);
     if (rng.Value='') or (length(trim(rng.Value))<5) then exit;

     rng.Address:=book.pricebnds+inttostr(book.firstRow);
     if string(rng.Value)='' then exit;
     if not testval(rng.Value) then exit;


     rng.Address:=book.price+inttostr(book.firstRow);
     if string(rng.Value)='' then exit;
     if not testval(rng.Value) then exit;

     rng.Address:=book.wes+inttostr(book.firstRow);
     if (STRING(rng.Value)='') or
      (not testval(rng.Value)) then
      begin
       rng.Address:=book.kolvo+inttostr(book.firstRow);
       if string(rng.Value)='' then exit;
       if not testval(rng.Value) then exit;
      end;
     result:=true;

   end;
//---------------------------------------------------------------------------
 procedure TloadExcel.next;
  var
  temp:string;
  i:integer;
  propusk:integer;
  begin
   if endBook then exit;
   i:=curRow;
   propusk:=0;
  // n:=i;
   while  propusk<25 do
   begin
   rng.Address:=book.tovar+inttostr(i);
   temp:=ansilowercase(string(rng.Value));

   inc(i);
  rng.Address:=book.wes+inttostr(i);

   if not testval(rng.Value) then  rng.Address:=book.kolvo+inttostr(i);
     if testval(rng.Value)
        then
        begin
        rng.Address:=book.price+inttostr(i);
          if  testval(rng.Value) then
              begin
                rng.Address:=book.tovar+inttostr(i);
                if temp<>ansilowercase(string(rng.Value))
                 then
                     begin
                     curRow:=i;
                     break;
                     end;
              end;

        end;




    inc(propusk);

   end;


   if propusk=5 then  endBook:=true;
   if currow-book.firstrow>250 then endBook:=true;


  end;
//---------------------------------------------------------------------------
  function TloadExcel.Tovar:string;
    
    begin
      result:='';
      if not bookloaded then exit;
      rng.Address:=book.tovar+inttostr(curRow);
      result:=ansilowercase(string(rng.Value));


    end;
//---------------------------------------------------------------------------

   function TloadExcel.kolvo:double;
    var temp :string;
    begin
      result:=0;
      if not bookloaded then exit;
      rng.Address:=book.kolvo+inttostr(curRow);
      if not  testval(rng.Value) then rng.Address:=book.wes+inttostr(curRow);
      temp:=convertvalue(rng.Value);
     try

      result:=strtofloat(temp);
    except
    decimalseparator:='.';
      result:=strtofloat(temp);
    decimalseparator:=',';
    end;
    end;
//---------------------------------------------------------------------------
    function TloadExcel.price:currency;
      var temp :string;
    begin
      result:=0;
      if not bookloaded then exit;
      rng.Address:=book.price+inttostr(curRow);
       temp:=convertvalue(rng.Value);
     try
      result:=strtocurr(temp);
       except
    decimalseparator:='.';
      result:=strtocurr(temp);
    decimalseparator:=',';
    end;

    end;
//-----------------------------------------------------------------------
     function TloadExcel.pricebnds:currency;
      var temp :string;
    begin
      result:=0;
      if not bookloaded then exit;
      rng.Address:=book.pricebnds+inttostr(curRow);
       temp:=convertvalue(rng.Value);
     try
      result:=strtocurr(temp);
       except
    decimalseparator:='.';
      result:=strtocurr(temp);
    decimalseparator:=',';
    end;

    end;
//-----------------------------------------------------------------------



function TloadExcel.edizm:string;
  begin
   result:='øò';
   if not bookloaded then exit;
    rng.Address:=book.edizm+inttostr(curRow);
    if  rng.Value='' then
    begin
      rng.Address:=book.kolvo+inttostr(curRow);
        if not  testval(rng.Value) then result:='êã';

    end else result:=copy(ansilowercase(rng.Value),1,2);
  end;
 //---------------------------------------------------------------------------
  function TloadExcel.convertvalue(const  val:variant):string;
    var temp:string;
    begin
      result:='0';
      temp:=string(val);

    //  while ansipos(temp,'.')>0 do   temp[ansipos(temp,'.')]:=',';
      result:=temp;
      end;


  end.
