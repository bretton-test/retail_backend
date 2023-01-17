unit messageunit;

interface
 uses Math, SysUtils;
const m1:string='������ ��������� ����������';
const m2:string='�� ������! ����������.';
      m3:string='��� �� ������';
      m4:string='�������� ��� ����������� ';
      m5:string='��� ��������� ���� ����� ������� ����������';
      m6:string='�������� ���������';
      m7:string='������� ������� �������������';
      m8:string='������ � �������� ��������';
      m9:string='������ � ����������';
      m10:string='������ � �����������';
      m11:string='������ � �������';
      m12:string='������ � �������';
      m13:string='�������� ���������';
      m14:string='������ ��������';
      m15:string='�������� �����';
      m16:string='�������� ��������� ��������������';
      m17:string='��������� ������ ���� ���������';
      m18:string='��������� ���������?';
      m19:string='�������� ���������?';
      m20:string='�������� ���������? ��� ����������� ��������� ����� �������� !!';
      m21:string='�������� ����� �� ��������';
      m22:string='�������� �������� �� ����? ����� ��������� ������ ��������� ������.';
      m23:string='������� ��������� ���������� ?';
      m24:string='�������� �� ������. ������� �������� ?';
      m25:string='������� �����.�������� �� �����';
      m26:string='������� ��������� ?';
      m27:string='������� ��������� �����?';
      m28:string='���������,����� ��������� � ����� ������ ���� ���������';
      m29:string='�������� ��������';
      m30:string='������';
      m31:string='�������� ��� ���������';
      m32:string='������� ����� ���������';
      m33:string='��������� ����� ���������';
      m34:string='��������������� ������� ������. ��������� ��������� ������ ������.';
     m35:string='������ ��� �� �������.';
        Edinizi  : array [ 1..19 ] of ShortString =
        ( '����','���','���','������','����','�����','����','������','������',
          '������','�����������','����������','����������','������������',
          '����������','�����������','����������','������������','������������');
        Desjatki : array [ 1..8 ] of ShortString =
         ( '��������','��������','�����','���������','����������',
           '���������','�����������','���������' );
        Sotni    : array [ 1..9 ] of ShortString =
         ( '���','������','������','���������','�������','��������',
           '�������','���������','���������' );
        Mess1    : array [ 1..9 ] of ShortString =
         ( '������','������','�����','�������','��������','���������',
           '��������','���������','����������' );
        Rubli    : array [ 1..7 ] of ShortString =
         ( '','�����','�����','������',' �������',' �������',' ������' );
        Finansy  : array [ 1..7 ] of ShortString =
         ('', '','','','','','' );
  VAR     iEdinizi          : array [ 1..2 ] of ShortString;
        function  Perevod ( Tshislo : LongInt; var Wybor_Ediniz : Word ):string;
        function  SummaPropis ( cN : Real; Val : ShortString ): string;
         function  RusUpperCase  (ch : Char): Char;

  implementation




    function Perevod ( Tshislo : LongInt; var Wybor_Ediniz : Word  ):String;
var     Dlina_Stroki : SmallInt;
        Rabota       : Boolean;
begin
        Result :=  '';  Rabota := TRUE;  Wybor_Ediniz := 3;
 while  Rabota   do  begin
        Dlina_Stroki := Length( IntToStr(Tshislo)); {���������� ����� ������}
  case  Dlina_Stroki of
        1,2 : begin
               if ( Tshislo >= 1 ) and ( Tshislo <= 19 ) then begin  {����� �� 1 �� 19 }
                       if  ( Tshislo = 1 )or ( Tshislo = 2 ) then begin
                         if iEdinizi[1] <> '' then
                          Result := Result + ' ' + iEdinizi[ Tshislo ] {+ ' '}
                         else
                          Result := Result + ' ' + Edinizi[ Tshislo ] {+ ' '};
                       end
                       else
                          Result := Result + ' ' + Edinizi[ Tshislo ] {+ ' '};
                  case Tshislo of
                      1     : Wybor_Ediniz := 1;
                      2,3,4 : Wybor_Ediniz := 2;
                  else        Wybor_Ediniz := 3;
                  end;{case}

                Rabota := FALSE;
               end   //if
               else  begin                                       { ����� �� 20 �� 99}
                  Result  := Result + ' ' + Desjatki[ (Tshislo div 10) - 1 ] {+ ' '};
                  Tshislo := Tshislo - ( Tshislo div 10 )*10;
                    if Tshislo = 0 then Rabota := FALSE;
               end; {Tshislo}
              end;
        3:    begin                                        {����� �� 100 �� 999}
                Result  := Result + ' ' + Sotni[ (Tshislo div 100) ] {+ ' '};
                Tshislo := Tshislo - ( Tshislo div 100 )*100;
                if Tshislo = 0 then  Rabota := FALSE;
              end;
        else  Rabota := FALSE;
  end;{case}
 end;{while}
end;
{------------------------------------------------------------------------------}


   function  {GetSummaOfString}SummaPropis( cN : Real; Val : ShortString ): string;
var     Dlina_Stroki    : SmallInt;    {����� ������}
        Ostatok_Tshisla : Real;        {������� ����� cN}
        Wypolnenie      : Boolean;
        Tshislo         : Longint;     {����� ����� ����� cN}
        kop             : integer;
        Ostatok,ost_kop : string;
        Wybor_Ediniz    : Word;
        Valuta          : array[1..6] of ShortString;
begin
       cn:=roundto( cn,-2);
        Valuta[1] := ''; Valuta[2] := ''; Valuta[3] := ''; Valuta[4] := '';
        Valuta[5] := ''; Valuta[6] := '';
        if Val = 'RU' then begin
          Valuta[1] :='�����'; Valuta[2] := '�����'; Valuta[3] :='������';
          Valuta[4] :=' �������';   Valuta[5] := ' �������'; Valuta[6] :=' ������';
        end;
        Tshislo         := Trunc( cN );               {  ����� ����� }
        Ostatok_Tshisla :=  cN - Tshislo;             { ������� �� ���������� �����}
        Result          := ' ';
        Wypolnenie      := TRUE;
        iEdinizi [ 1 ]  := '';
        iEdinizi [ 2 ]  := '';
    if  Tshislo < 0 then Exit;

 if   Tshislo > 0   then   begin
   while  Wypolnenie  do  begin
                Dlina_Stroki := Length( IntToStr( Tshislo ) );
    case  Dlina_Stroki of
     1,2,3: begin                                          { ����� �� 1 �� 999}
                Result := Result + Perevod(Tshislo,Wybor_Ediniz) + ' ' +  Valuta[ Wybor_Ediniz ];
                Wypolnenie := FALSE;
            end;
     4,5,6: begin                                     { ����� �� 1000 �� 999999}
                iEdinizi[ 1 ] := '����';
                iEdinizi[ 2 ] := '���';
                Result := Result + Perevod( (Tshislo div 1000 ), Wybor_Ediniz ) + ' '
                                                     + Mess1 [ Wybor_Ediniz ];
                iEdinizi[ 1 ] := '����';
                iEdinizi[ 2 ] := '���';
                Tshislo       := Tshislo - ( Tshislo div 1000 )*1000;
             if Tshislo = 0 then begin
                Wybor_Ediniz  := 3;
                Result        := Result + ' ' + Valuta[ Wybor_Ediniz ];
                Wypolnenie    := FALSE;
              end;//if
            end;
     7,8,9: begin
                Result := Result + Perevod( ( Tshislo div 1000000 ), Wybor_Ediniz ) + ' '
                                                  + Mess1 [ Wybor_Ediniz + 3 ];
               Tshislo := Tshislo - ( Tshislo div 1000000 )*1000000;
              if Tshislo = 0 then  begin
                Wybor_Ediniz := 3;
                Result := Result + ' ' + Valuta[ Wybor_Ediniz ];
                Wypolnenie := FALSE;
              end;//if
            end;
     10,11,13: begin
                Result := Result +
                      Perevod( (Tshislo div 1000000000 ), Wybor_Ediniz  ) + ' '
                                                  +  Mess1 [ Wybor_Ediniz + 6 ];
                Tshislo := Tshislo - ( Tshislo div 1000000000 )*1000000000;
               if Tshislo = 0 then begin
                 Wybor_Ediniz := 3;
                 Result := Result + ' ' + Valuta[ Wybor_Ediniz ];
                 Wypolnenie := FALSE
               end;//if
              end;
            else
                Wypolnenie := FALSE;
    end;//case
  end;//while
 end//if
 else   Result   := '����' + ' ' +  Valuta[ 3 ];

        Ostatok  := format( '%0.2f',[ Ostatok_Tshisla ] );
        kop      := StrToInt( Ostatok[ 3 ] + Ostatok[ 4 ] );
    case kop of
        1,21,31,41,51,61,71,81,91 : ost_kop := Valuta[ 4 ];
        2..4,22..24,32..34,42..44,52..54,62..64,72..74,82..84,92..94
                                                       : ost_kop := Valuta[ 5 ];
    else   ost_kop  := Valuta[ 6 ];
    end;//case
     if Valuta[ 1 ] = '' then
     else
        Result   := Result + ' ' + Ostatok[ 3 ] + Ostatok[ 4 ] + ost_kop;
        Result   := Trim( Result );
        Result[1]:= RusUpperCase( Result[1] );
end;

 function  RusUpperCase  (ch : Char): Char;
begin
        case ch of
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
                '�' : Result := '�';
        else  Result:= ch;
        end;//case
end;









end.
