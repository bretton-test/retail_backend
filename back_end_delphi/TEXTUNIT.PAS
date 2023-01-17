unit textunit;

interface
 uses SysUtils,classes,strutils,ComCtrls,forms;
 type
Tspravstring = record
 cod,factorplu,parentplu:string[13];
 barcode:string;
 name:string[52];
 ecrname:string[26];
 price:currency;
 quantity,factor:double;
 shtuka,SortField,Department:byte;
 isGoods:string[1];
 end;
 {------------------------}
 Tsavestring = class
 private
   spisok :tstringlist;
 //  QselBarcode: TOracleQuery;
  function convertstr(sprstroka:Tspravstring):string;

 public
 function savespisok(const myarray: array of integer;
                     const savepath : string;
                      prBar:TProgressBar;
                      const all:boolean=false):boolean;

 constructor Create;
 destructor Destroy;override;

 end;
{---------------------------}
 const
  deleteall:string='$$$DELETEALLWARES';
  zamena:string='$$$REPLACEQUANTITY';
  dobavit:string='$$$ADDQUANTITY';
  zamenabp:string='$$$REPLACEQUANTITYWITHOUTSALE';
  deletewares:string='$$$DELETEWARESBYWARECODE';
 var spisok :tstringlist;
{------------------------------------------------------------}


 implementation

uses dmunit, DB;

 function Tsavestring.convertstr(sprstroka:Tspravstring):string;
   var temp:string;
   begin
   try
    temp:=sprstroka.cod+';'+sprstroka.barcode+';'+sprstroka.name+';';
    temp:=temp+sprstroka.ecrname+';'+formatfloat('0.00',sprstroka.price)+';';
    temp:=temp+formatfloat('0.000',sprstroka.quantity)+';0;';
    temp:=temp+inttostr(sprstroka.shtuka)+';0;0;0;0;0;'+floattostr(sprstroka.factor)+';';
    temp:=temp+sprstroka.factorplu+';'+sprstroka.parentplu+';'+sprstroka.isGoods+';';
    temp:=temp+inttostr(sprstroka.SortField)+';'+inttostr(sprstroka.Department);
    result:=temp;
   except
    result:='error';
   end;
   end;
{----------------------------------------------------------------}

 constructor Tsavestring.Create;
 begin
 inherited create;
  spisok:=TStringList.Create;


 end;
{-----------------------------------------------------------------}
 destructor Tsavestring.Destroy;
 begin
 spisok.Free;
  inherited Destroy;

 end;
{------------------------------------------------------------------}
 function Tsavestring.savespisok(const myarray: array of integer;
                                 const savepath : string;
                                 prBar:TProgressBar;
                                 const all:boolean):boolean;
 var i:integer;
 var stroka:Tspravstring;
     temp:string;
   function   clearstring(const str:string):string;
       var i:integer;
           temp:string;
       begin
        temp:=str;
        for i:=1 to length(temp) do
         If temp[i]=';'  then  temp:=StuffString(temp,i,1,'.');//;temp[i]:='.';

        result:=temp;
       end;
 begin
  if prBar<>nil then prbar.Max:=round(high(myarray)/100);
  result:=false;
  spisok.Clear;
  spisok.Add('##@@&&');
  spisok.Add('#');
  if all then
  begin
   spisok.Add(deleteall);
   spisok.Add(dobavit);

  end else  spisok.Add(zamena);
  dm.nofilter;
  for i:=low(myarray) to high(myarray)-1 do
   begin
   if prBar<>nil then prbar.Position:=round(i/100);
   application.ProcessMessages;

    if (myarray[i]<>0) and (dm.LocateTovar(myarray[i]))
      then
        begin
          if (dm.tovarPRICE.AsInteger=0) or
              (dm.tovarEXPORT.Value=0) or (dm.barcode.RecordCount=0)   then continue;
               with stroka do
             begin
             cod:=inttostr(myarray[i]);
             barcode:='';
             dm.barcode.First;
             while not dm.barcode.Eof do
             begin

             barcode:=barcode+dm.barcodeBARCODE.AsString+',';
             dm.barcode.Next;
             end;

             if barcode='' then barcode:='01';
             delete(barcode,length(barcode),1);
             name:=clearstring(dm.tovarNAME.Value);
             ecrname:=clearstring(dm.tovarECRNAME.Value);
             price:=dm.tovarPRICE.AsCurrency;
             quantity:=dm.tovarNAL.AsFloat;
             if (dm.tovarSHTUKA.AsInteger=1) or (dm.tovarNSP.AsInteger=1)
             then shtuka:=1 else shtuka:=0;
             factor:=1;
             factorplu:='0';
             parentplu:='0';
               isgoods:='1';
             sortfield:=1;
             department:=1;
            temp:=convertstr(stroka);
           if temp<>'error' then spisok.Add(temp);

            end;


        end;
    end;
     try
     if spisok.Count>3 then
       begin


        spisok.SaveToFile(savepath);
        result:=true;
      end;

       except
         raise;
       end;

 end;

 end.
