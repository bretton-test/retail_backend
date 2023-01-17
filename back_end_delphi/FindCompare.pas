unit FindCompare;

interface

//------------------------------------------------------------------------------
//Функция нечеткого сравнения строк БЕЗ УЧЕТА РЕГИСТРА
//------------------------------------------------------------------------------
//MaxMatching - максимальная длина подстроки (достаточно 3-4)
//strInputMatching - сравниваемая строка
//strInputStandart - строка-образец

// Сравнивание без учета регистра
// if IndistinctMatching(4, "поисковая строка", "оригинальная строка  - эталон") > 40 then ...

function IndistinctMatching(MaxMatching     : Integer;
                            strInputMatching: WideString;
                            strInputStandart: WideString): Integer;
function IndistinctMatching2(A,B: String): Real;
function CreateFilter(const Inputstr:string):string;
function CreateArray(const Inputstr:string;
                      var word1:string;
                      var word2:string;
                      var word3:string): integer;
procedure ModifiName(var Inputstr:string);

implementation

Uses SysUtils,strUtils;

Type
     TRetCount = packed record
                 lngSubRows   : Word;
                 lngCountLike : Word;
                end;

//------------------------------------------------------------------------------
function Matching(StrInputA: WideString;
                  StrInputB: WideString;
                  lngLen: Integer) : TRetCount;
Var
    TempRet   : TRetCount;
    PosStrB   : Integer;
    PosStrA   : Integer;
    StrA      : WideString;
    StrB      : WideString;
    StrTempA  : WideString;
    StrTempB  : WideString;
begin
    StrA := String(StrInputA);
    StrB := String(StrInputB);

    For PosStrA:= 1 To Length(strA) - lngLen + 1 do
    begin
       StrTempA:= System.Copy(strA, PosStrA, lngLen);

       PosStrB:= 1;
       For PosStrB:= 1 To Length(strB) - lngLen + 1 do
       begin
          StrTempB:= System.Copy(strB, PosStrB, lngLen);
          If SysUtils.AnsiCompareText(StrTempA,StrTempB) = 0 Then
          begin
             Inc(TempRet.lngCountLike);
             break;
          end;
       end;

       Inc(TempRet.lngSubRows);
    end; // PosStrA

    Matching.lngCountLike:= TempRet.lngCountLike;
    Matching.lngSubRows  := TempRet.lngSubRows;
end; { function }

//------------------------------------------------------------------------------
function IndistinctMatching(MaxMatching     : Integer;
                            strInputMatching: WideString;
                            strInputStandart: WideString): Integer;
Var
    gret     : TRetCount;
    tret     : TRetCount;
    lngCurLen: Integer   ; //текущая длина подстроки
begin
    //если не передан какой-либо параметр, то выход
    If (MaxMatching = 0) Or (Length(strInputMatching) = 0) Or
       (Length(strInputStandart) = 0) Then
    begin
        IndistinctMatching:= 0;
        exit;
    end;

    gret.lngCountLike:= 0;
    gret.lngSubRows  := 0;
    // Цикл прохода по длине сравниваемой фразы
    For lngCurLen:= 1 To MaxMatching do
    begin
        //Сравниваем строку A со строкой B
        tret:= Matching(strInputMatching, strInputStandart, lngCurLen);
        gret.lngCountLike := gret.lngCountLike + tret.lngCountLike;
        gret.lngSubRows   := gret.lngSubRows + tret.lngSubRows;
        //Сравниваем строку B со строкой A
        tret:= Matching(strInputStandart, strInputMatching, lngCurLen);
        gret.lngCountLike := gret.lngCountLike + tret.lngCountLike;
        gret.lngSubRows   := gret.lngSubRows + tret.lngSubRows;
    end;

    If gret.lngSubRows = 0 Then
    begin
        IndistinctMatching:= 0;
        exit;
    end;

    IndistinctMatching:= Trunc((gret.lngCountLike / gret.lngSubRows) * 100);
end;

//------------------------------------------------------------------------------
function IndistinctMatching2(A,B: String): Real;

      function Match(i,j: Byte): integer;
      label _Loop;
      var GlobalSumm, Summ, Max: integer;
      begin
          GlobalSumm := 0;    Max := 0;
          _Loop:
             if(A[i]=B[j])then begin
               Inc(GlobalSumm);
               if(i<Byte(Length(A))) and (j<Byte(Length(B)))then begin
                 Inc(i);
                 Inc(j);
                 goto _Loop;
               end;
             end;
          if(i<Byte(Length(A))) and (j<Byte(Length(B)))then begin
             Summ := Match(i+1,j+1);
             if(Max < Summ)then
                Max := Summ;
          end;
          if(i<Byte(Length(A)))then begin
             Summ := Match(i+1,j);
             if(Max < Summ)then
                Max := Summ;
          end;
          if(j<Byte(Length(B)))then begin
             Summ := Match(i,j+1);
             if(Max < Summ)then
                Max := Summ;
          end;
          Match := GlobalSumm + Max;
      end;

begin
   IndistinctMatching2 := Match(1,1) * 2.0 / (Byte(Length(A)) + Byte(Length(B)));
end;
{-----------------------------------------------------------------------------}
function CreateFilter(const Inputstr:string):string;
 var temp:string;
     n1,n2,fname:string;
     i:integer;
     begin
        n1:='';
        n2:='';
        fname:='';
        temp:=Inputstr;
        temp:='*'+temp;
        if  pos('(',temp)>0 then
                               begin
                                 n1:=copy(temp,pos('(',temp)+1,length(temp));
                                 if  (pos(')',n1)>0) and (ord(n1[1])<57 )  then
                                      begin
                                      for i:=pos('(',temp) to pos(')',temp) do
                                      temp:=StuffString(temp,i,1,'*')   ;

                                      end;
                               end;
         while pos(')',temp)>0   do temp:=StuffString(temp,pos(')',temp),1,'*');
         while pos('(',temp)>0   do temp:=StuffString(temp,pos('(',temp),1,'*');
          while pos('/',temp)>0   do temp:=StuffString(temp,pos('/',temp),1,'*');
         while pos('\',temp)>0   do temp:=StuffString(temp,pos('\',temp),1,'*');


         n1:='';



        if  pos('"',temp)>0 then
         begin
         n2:=COPY(temp,(pos ('"',temp))+1,(length(temp)));
         n1:=COPY(temp,(pos ('"',temp))+1,4);
         //while pos(' ',n1)>0 do n1[pos(' ',n1)]:='*';
         while pos(' ',n1)>0 do n1:=StuffString(n1,pos(' ',n1),1,'*');

         fname:=COPY(temp,1,4)+'*'+n1;
         end else

        if (pos('.',temp)>0)
            and (pos(' ',temp)>0)
            and  (pos(' ',temp)>pos('.',temp))
              then
         begin
         n2:=COPY(temp,(pos ('.',temp))+1,(length(temp)));
         n1:=COPY(temp,(pos ('.',temp))+1,4);
         while pos(' ',n1)>0 do n1:=StuffString(n1,pos(' ',n1),1,'*');
         fname:=COPY(temp,1,4)+'*'+n1;
         end else



            begin

           fname:=COPY(temp,1,5);
            delete(temp,1,5);
            n2:=COPY(temp,pos(' ',temp)+1,4);
            delete(temp,1,pos(' ',temp)+4);
            if (pos('.',temp)>4) then  n1:=COPY(temp,(pos ('.',temp))+1,4);
           while pos(' ',n1)>0 do n1:=StuffString(n1,pos(' ',n1),1,'*');
            fname:= fname+'*'+n2+'*'+n1;
            end;


        while (pos(' ',n2)<3) and (pos(' ',n2)>0)   do n2:=StuffString(n2,pos(' ',n2),1,'*');//   n2[pos(' ',n2)]:='*';
        if pos(' ',n2)>2 then
        begin
        n1:=copy(n2,pos(' ',n2)+1,4);

        while pos('"',n1)>0 do n1:=StuffString(n1,pos('"',n1),1,'*');
        while pos(' ',n1)>0 do n1:=StuffString(n1,pos(' ',n1),1,'*');

        fname:= fname+'*'+n1;
        end;
        while pos(' ',fname)>0 do fname:=StuffString(fname,pos(' ',fname),1,'*');
 result:=fname;

 end;
{-----------------------------------------------------------------------------}

function CreateArray(const Inputstr:string;
                      var word1:string;
                      var word2:string;
                      var word3:string): integer;
 var dlinna:integer;
     i:integer;
     probel:integer;
     counter:integer;
     space:boolean;
     word4,word5:string;

function findkg(const temp:string):integer;
 var i:integer;
 begin
 result:=0;
 if temp='' then exit;
 for i:=1 to length(temp)
  do
  begin
   if (temp[i]='к') and (temp[i+1]='г') then result:=i;
   if (temp[i]='К') and (temp[i+1]='Г') then result:=i;
    if (temp[i]='к') and (temp[i+1]='Г') then result:=i;
     if (temp[i]='К') and (temp[i+1]='г') then result:=i;


  end;

 end;


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

   for i:=1 to 3 do
    begin
    case i of
    1:if findkg(word1)>0  then
         begin
          word1:=word2;word2:=word3;word3:=word4;
         end;

    2:if findkg(word2)>0 then
         begin
          word2:=word3;word3:=word4;
         end;
    3: if findkg(word3)>0 then
         begin
          word3:=word4;
         end;

    end;



    end;

  if (pos('"',word4)>0) or (pos(chr(39),word4)>0)
    then word3:=word4
    else if (pos('"',word5)>0) or (pos(chr(39),word5)>0)
    then word3:=word5;

   while pos(' ',word1)>0 do word1:=StuffString(word1,pos(' ',word1),1,'*');
   while pos(' ',word2)>0 do word2:=StuffString(word2,pos(' ',word2),1,'*');
   while pos(' ',word3)>0 do word3:=StuffString(word3,pos(' ',word3),1,'*');

   while pos('"',word1)>0 do word1:=StuffString(word1,pos('"',word1),1,'*');
   while pos('"',word2)>0 do word2:=StuffString(word2,pos('"',word2),1,'*');
   while pos('"',word3)>0 do word3:=StuffString(word3,pos('"',word3),1,'*');

   while pos(chr(39),word1)>0 do word1:=StuffString(word1,pos(chr(39),word1),1,'*');
   while pos(chr(39),word2)>0 do word2:=StuffString(word2,pos(chr(39),word2),1,'*');
   while pos(chr(39),word3)>0 do word3:=StuffString(word3,pos(chr(39),word3),1,'*');



  result:=counter;


 end;
{-----------------------------------------------------------------------------}

 procedure ModifiName(var Inputstr:string);
 var i,s1,s2,counter:integer;
 temp:string;
 begin
 counter:=0;
 temp:=Inputstr;
 s1:=pos('(',temp);
 s2:=pos(')',temp);

 while (s1>0)
       and (s2>0)
       and ((s2-s1)>0) do
       begin

       delete(temp,s1,s2-s1+1);
        s1:=pos('(',temp);
        s2:=pos(')',temp);

       end;

 while pos('(',temp)>0 do temp:=StuffString(temp,pos('(',temp),1,'*');
 while pos(')',temp)>0 do temp:=StuffString(temp,pos(')',temp),1,'*');
 while pos('.',temp)>0 do temp:=StuffString(temp,pos('.',temp),1,'*');
 while pos(',',temp)>0 do temp:=StuffString(temp,pos(',',temp),1,'*');
 while pos('-',temp)>0 do temp:=StuffString(temp,pos('-',temp),1,'*');
 while pos('/',temp)>0 do temp:=StuffString(temp,pos('/',temp),1,'*');
 while pos('\',temp)>0 do temp:=StuffString(temp,pos('\',temp),1,'*');


 s1:=0;
 s2:=0;

 if (pos('"',temp)>0) or (pos(chr(39),temp)>0) then
  begin
   for i:=1 to length(temp)
    do begin
        if (Inputstr[i]='"') or (Inputstr[i]=chr(39)) then
             begin
               inc(counter);
               if counter=1 then s1:=i;
               if counter=2 then s2:=i;

             end;
       end;
  end;
  if counter>1 then
   begin
    for i:=s1 to s2 do
       if temp[i]=' ' then  temp:=StuffString(temp,i,1,'*');

   end;
  inputstr:=temp;


 end;

end.

