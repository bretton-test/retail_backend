unit loadunit;
 interface
 uses Classes,sysutils,math;
 const  DataIndex:byte=1;
 const  NomerIndex:byte=2;
 const  KodifIndex:byte=5;
 const  EdizmIndex:byte=9;
 const  KolvoIndex:byte=10;
 const  OutPriceIndex:byte=11;
 const  KolvMestIndex:byte=13;
 const  MestIndex:byte=16;
 const  NameIndex:byte=21;
 const  InPriceIndex:byte=24;
 const  krasn_id:byte=39;
 const ndsIndex:byte=18;
 type Tloadnakl = class

    private

     path:string;
     loadstr: TstringList;
     index:integer;
     size:integer;
     loaded:boolean;
     function  getVar(const ind:byte):string;
    public

     procedure  SetPath(const lpath:string);
     function   Load:boolean;
     procedure  First;
     procedure  Next;
     procedure  Prev;
     function   EOF:boolean;
     function   GetString:string;
     procedure  OnFree;
     function   Date:Tdatetime;
     function   nomer:string;
     function   kodifikator:string;
     function   ed_izm:string;
     function   kol_vo:double;
     function   OutPrice:currency;
     function   Mest:integer;
     function   nds:integer;
     function   tovName:string;
     function   InPrice:currency;
     function   KolvoVmeste:double;
      function  krasnId:string;
    end;


implementation
//------------------------------------------------------
function  Tloadnakl.getVar(const ind:byte):string;
var temp,resstr:string;
    i,count:integer;
 begin
result:='';
   count:=0;
   temp:='';
   resstr:='';
If not loaded  then exit;
try
temp:=loadstr.Strings[index];
for i:=1 to length(temp) do
 begin
 If temp[i]<>'@'  then  resstr:=resstr+temp[i]
                  else  begin
                        inc(count);
                        If count=ind then break
                        else resstr:='';
                        end;

 end;
result:=resstr;
except
exit;
end;
end;
// //-----------------------------------------------
 procedure  Tloadnakl.onFree;
 begin
 loadstr.Free;
 end;

//-----------------------------------------------
 procedure  Tloadnakl.setPath(const lpath:string);
    begin
     path:=lpath;
     loaded:=false;
     loadstr:=TstringList.Create;
    end;
//------------------------------------------------
function   Tloadnakl.Load:boolean;
 begin
  result:=false;
  try
  loadstr.LoadFromFile(path);
  size:=loadstr.Count;
  index:=0;
  If size=0  then  exit;
  loaded:=true;
  result:=true;
  except
   exit;
  end;
 end;
//----------------------------------------------------
 procedure  Tloadnakl.first;
  begin
    index:=0;
  end;
//----------------------------------------------------
procedure  Tloadnakl.next;
 begin
  inc(index);
 end;
//----------------------------------------------------
procedure  Tloadnakl.prev;
 begin
 If index>0  then  dec(index);
 end;
//----------------------------------------------------
 function   Tloadnakl.EOF:boolean;
  begin
   result:=size<index+1;
  end;
//----------------------------------------------------
function   Tloadnakl.GetString:string;
 begin
 If loaded  then  result:=loadstr.Strings[index]
 else result:='ошибка загрузки';
 end;
//------------------------------------------------------
function   Tloadnakl.Date:Tdatetime;

begin

result:=strtodate(trim(getvar(DataIndex)));

end;
//--------------------------------------------------------
function   Tloadnakl.nomer:string;
begin
result:=trim(getvar( NomerIndex));
end;
//-----------------------------------------------------------
function   Tloadnakl.kodifikator:string;
begin
result:=trim(getvar(KodifIndex));

end;
//-----------------------------------------------------------
function   Tloadnakl.ed_izm:string;
begin
result:=trim(getvar(edizmIndex));

end;
//-----------------------------------------------------------
function   Tloadnakl.kol_vo:double;
begin
result:=0;
 try
 result:=strtofloat(trim(getvar(KolvoIndex)));
 except
 exit;
 end;
end;
//-----------------------------------------------------------
 function   Tloadnakl.OutPrice:currency;
begin
   result:=0;
 try
 result:=strtofloat(trim(getvar(OutPriceIndex)));
 except
 exit;
 end;
end;
//-----------------------------------------------------------
function   Tloadnakl.Mest:integer;
begin
 result:=0;
 try
 result:=round(strtofloat(trim(getvar(MestIndex))));
 except
 exit;
 end;

end;
//-----------------------------------------------------------
function   Tloadnakl.tovName:string;
begin
result:=trim(getvar(NameIndex));
end;
//-----------------------------------------------------------
//-----------------------------------------------------------
 function   Tloadnakl.InPrice:currency;
begin
   result:=0;
 try
 result:=RoundTo(strtofloat(trim(getvar(InPriceIndex))),-2);

 except
 exit;
 end;
end;
//-----------------------------------------------------------
 function    Tloadnakl.KolvoVmeste:double;
 begin
   result:=0;
 try
 result:=strtofloat(trim(getvar(KolvMestIndex)));
 except
 exit;
 end;
end;
//-----------------------------------------------------------
 function    Tloadnakl.krasnId:string;
 begin
   result:='0';
 try
 result:=(trim(getvar(krasn_id)));
 except
 exit;
 end;
end;
//-------------------------------------------------------------
function   Tloadnakl.nds:integer;
begin
 result:=0;
 try
 result:=round(strtofloat(trim(getvar(ndsIndex))));
 except
 exit;
 end;

end;
//-----------------------------------------------------------
 end.
