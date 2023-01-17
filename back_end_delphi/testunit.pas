unit testunit;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle,math;

type
  Ttest = class(TDataModule)
    selsum: TOracleDataSet;
    selsumSUMMA: TFloatField;
    selsumPARTOST: TFloatField;
    selpartost: TOracleDataSet;
    selpartostID: TFloatField;
    selpartostPLU: TFloatField;
    selpartostDATA: TDateTimeField;
    selpartostPRIHOD: TFloatField;
    selpartostRASHOD: TFloatField;
    selpartostOSTATOK: TFloatField;
    selpartostCENA: TFloatField;
    selpartostSKLADID: TIntegerField;
    selpartostOTKAT: TIntegerField;
    selpartostNOM: TFloatField;
    selpartostPARTIA: TFloatField;
    selpartostSUM: TFloatField;
    selpartostPARTOST: TFloatField;
    updkolvo: TOracleQuery;
  private
    { Private declarations }
  public
    { Public declarations }
procedure testkniga(const plu:integer;
                    const sklad :integer;
                    const data:Tdatetime;
                    const proverka:boolean);

  end;

var
  test: Ttest;

implementation

uses dmunit;

{$R *.dfm}
procedure ttest.testkniga(const plu:integer;
                    const sklad :integer;
                    const data:Tdatetime;
                    const proverka:boolean);
var nal,temp: double;
     kerror:integer;
 begin
       selsum.Close;
              selsum.SetVariable('plu',plu);
              selsum.SetVariable('sklad',sklad);
              selsum.SetVariable('data',data);

              selsum.Open;
             if   selsumSUMMA.AsFloat<0
             then begin
                   exit;

                  end;




              if selsumSUMMA.AsFloat<>selsumPARTOST.AsFloat
              then
                begin

            // dm.addmemo('plu='+inttostr(plu)+' sum='+selsumSUMMA.AsString+' part='+selsumPARTOST.AsString);
               nal:=selsumPARTOST.AsFloat-selsumSUMMA.AsFloat;
                    selpartost.Close;
                     selpartost.SetVariable('plu',plu);
                     selpartost.SetVariable('sklad',sklad);
                      selpartost.SetVariable('data',data);

                     selpartost.Open;
                  kerror:=0;
                  WHILE NOT selpartost.Eof
                  do begin
                      if selpartostPARTOST.AsFloat<0 then
                      begin
                        kerror:=1;
                        // dm.addmemo(selpartostPARTOST.AsString);
                         break;
                      end;
                      selpartost.Next;
                     end;
                if  kerror>0
                then
                begin
                   exit;
                end;
                selpartost.First;
                while roundto(nal,-3)<>0  do
                   begin

                      if nal>0 then
                       begin
                        if  roundto(selpartostPARTOST.AsFloat,-3)=0 then
                        begin
                         selpartost.Next;
                         Continue;
                        end;
                        if  selpartostPARTOST.AsFloat>nal then
                                                          begin
                                                           temp:=nal;
                                                           nal:=0;
                                                           if not proverka then
                                                                   begin
                                                                       updkolvo.SetVariable('nal',selpartostPARTOST.AsFloat-temp);
                                                                       updkolvo.SetVariable('id',selpartostID.Value);
                                                                       updkolvo.Execute;
                                                                   end;
                                                          end
                                                          else begin
                                                                nal:=roundto(nal-selpartostPARTOST.AsFloat,-3);

                                                                 if not proverka then
                                                                   begin
                                                                       updkolvo.SetVariable('nal',0);
                                                                       updkolvo.SetVariable('id',selpartostID.Value);
                                                                       updkolvo.Execute;
                                                                   end;

                                                               end;

                       end else
                       begin
                        {if (selpartostPRIHOD.AsFloat-selpartostPARTOST.AsFloat)>(-1 *nal) then
                                                                                 begin

                                                                                   if not test then
                                                                                     begin
                                                                                     updkolvo.SetVariable('nal',selpartostPARTOST.AsFloat-nal);
                                                                                     updkolvo.SetVariable('id',selpartostID.Value);
                                                                                      updkolvo.Execute;
                                                                                        end;
                                                                                   nal:=0;
                                                                                 end else begin
                                                                                  temp:=selpartostPRIHOD.AsFloat-selpartostPARTOST.AsFloat;
                                                                                  nal:=roundto(nal+temp,-3);
                                                                                    
                                                                                   if not test then
                                                                                     begin
                                                                                     updkolvo.SetVariable('nal',selpartostPRIHOD.AsFloat);
                                                                                     updkolvo.SetVariable('id',selpartostID.Value);
                                                                                      updkolvo.Execute;
                                                                                        end;


                                                                                 end;   }

                           
                                                                                   if not proverka then
                                                                                     begin
                                                                                     updkolvo.SetVariable('nal',selpartostPARTOST.AsFloat-nal);
                                                                                     updkolvo.SetVariable('id',selpartostID.Value);
                                                                                      updkolvo.Execute;
                                                                                        end;
                                                                                   nal:=0;







                       end;
                   selpartost.Next;
                   end;




 end;
end;
end.
