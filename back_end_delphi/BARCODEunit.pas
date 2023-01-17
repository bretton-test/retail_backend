unit BARCODEunit;

interface
uses SysUtils,StrUtils;
function CalcBar(kod: string):string;
function Testbar(kod: string):boolean;
function codebar(kod:string):string;

implementation

//-------------------------------------------------------
FUNCTION CalcBar(kod: string):string;
 var s1,s2,c :byte;
     i       :integer;
     temp    :string;
 begin
 s1:=0;
 s2:=0;
 c:=length(kod);
 result:='error';
 if  (c<>12) and (c<>7) then exit;
 i:=c;
 repeat
 s1:=s1+strtoint(kod[i]);
 i:=i-2;
 until i<=0;
 s1:=s1*3;
 i:=c-1;
 repeat
 s2:=s2+strtoint(kod[i]);
 i:=i-2;
 until i<=0;
 s1:=s1+s2;
 temp:=inttostr(300-s1);
 result:=concat(kod,temp[length(temp)]);
 end;

//-------------------------------------------------------
 function Testbar(kod: string):boolean;
 var temp: string;
        c: byte;
 begin
 result:=false;
 c:=length(kod);
 if (c<>13) and (c<>8) then exit;
 temp:=kod;
 delete(temp,c,1);
 if kod<>calcbar(temp) then exit;
 result:=true;
 end;
//-------------------------------------------------------
function codebar(kod:string):string;
var a,b,c,p,temp :string;
    t12 :array[0..9] of string;
    i:integer;
    begin
//temp:=kod;
temp:='                           ';
a:='0123456789';
c:=chr(38)+chr(39)+'()*+,-./' ;
b:='ABCDEFGHIJ';
t12[0]:='aaaaaa';
t12[1]:='aababb';
t12[2]:='aabbab';
t12[3]:='aabbba';
t12[4]:='abaabb';
t12[5]:='abbaab';
t12[6]:='abbbaa';
t12[7]:='ababaa';
t12[8]:='ababba';
t12[9]:='abbaba';
i:=strtoint(copy(kod,1,1));
p:=t12[i];
result:='error';
try
temp:=StuffString(temp,1,1,'[');
temp:=StuffString(temp,8,1,'=');
for i:=8 to 13 do begin
//temp[i+1]:=copy(c,(1+strtoint(copy(kod,i,1))),1);
temp:=StuffString(temp,i+1,1,copy(c,(1+strtoint(copy(kod,i,1))),1));
end;
for i:=2 to 7 do begin
case p[i-1] of
//'a': temp[i]:=a[1+strtoint(copy(kod,i,1))];
//'b': temp[i]:=b[1+strtoint(copy(kod,i,1))];
'a': temp:=StuffString(temp,i,1,copy(a,(1+strtoint(copy(kod,i,1))),1));
'b': temp:=StuffString(temp,i,1,copy(b,(1+strtoint(copy(kod,i,1))),1));

end;
end;
temp:=StuffString(temp,15,1,']');
except

end;

result:=copy(temp,1,15);



end;
//---------------------------------------------------------

end.
