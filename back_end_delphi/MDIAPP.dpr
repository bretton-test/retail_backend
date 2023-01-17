program Mdiapp;

uses
  Forms,
  Windows,
  MAIN in 'MAIN.PAS' {Main-Form},
  CHILDWIN in 'CHILDWIN.PAS' {MDIChild},
  about in 'about.pas' {печатная форма},
  dmunit in 'dmunit.pas' {DM: TDataModule},
  kartunit in 'kartunit.pas' {KartForm},
  selunit in 'selunit.pas' {selform},
  przunit in 'przunit.pas' {przform},
  dialunit in 'dialunit.pas' {dialform},
  BARCODEunit in 'BARCODEunit.pas',
  postunit in 'postunit.pas' {postsprav},
  skladunit in 'skladunit.pas' {skladform},
  naklunit in 'naklunit.pas' {naklform},
  Timeunit in 'Timeunit.pas' {TimeForm},
  JurnUnit in 'JurnUnit.pas' {jurnform},
  repunit in 'repunit.pas' {repform},
  OstUnit in 'OstUnit.pas' {OstForm},
  rashunit in 'rashunit.pas' {rashform},
  peremunit in 'peremunit.pas' {Peremform},
  tranzUnit in 'tranzUnit.pas',
  Balunit in 'Balunit.pas' {BalForm},
  kassunit in 'kassunit.pas' {kassform},
  kassjunit in 'kassjunit.pas' {kassjform},
  invunit in 'invunit.pas' {invform},
  Spisunit in 'Spisunit.pas' {SpForm},
  priceunit in 'priceunit.pas' {priceform},
  cennikunit in 'cennikunit.pas' {печать ценников},
  Cennik in 'Cennik.pas' {CenForm},
  FiltrUnit in 'FiltrUnit.pas' {Filtrform},
  messageunit in 'messageunit.pas',
  loadunit in 'loadunit.pas',
  FindUnit in 'FindUnit.pas' {FindForm},
  Bankunit in 'Bankunit.pas' {Bankform},
  shetunit in 'shetunit.pas' {shetform},
  bprihunit in 'bprihunit.pas' {bprihform},
  MovUnit in 'MovUnit.pas' {MovForm},
  mycalc in 'MYCALC.PAS' {calcform},
  ubunit in 'ubunit.pas' {ubform},
  excelunit in 'excelunit.pas',
  posunit in 'posunit.pas' {кассовые смены},
  CHEKUNIT in 'CHEKUNIT.pas' {CHEKFORM},
  ViewUnit in 'ViewUnit.pas' {ViewForm},
  RViewUnit in 'RViewUnit.pas' {rViewForm},
  kkmUNIT in 'kkmUNIT.pas' {расход по кассе},
  FindCompare in 'FindCompare.pas',
  SUnit in 'SUnit.pas',
  ActUnit in 'ActUnit.pas' {ActForm},
  TermUnit in 'TermUnit.pas',
  MinUnit in 'MinUnit.pas' {MinForm},
  TEXTUNIT in 'TEXTUNIT.PAS',
  rfindunit in 'rfindunit.pas' {rfindform},
  testunit in 'testunit.pas' {test: TDataModule},
  kassrepUnit in 'kassrepUnit.pas' {анализ движ товара},
  masterunit in 'masterunit.pas' {отчет по продаже},
  aUnit in 'aUnit.pas' {анализ чеков},
  abcunit in 'abcunit.pas' {abc отчет},
  zakunit in 'zakunit.pas' {отчет для заказа},
  yearunit in 'yearunit.pas' {продажи за год},
  marketunit in 'marketunit.pas' {отчет маркетолога 1},
  m1unit in 'm1unit.pas' {отчет маркетолога 2};

{$R *.RES}
 Const AppID='my prog for mag80';
 Var Handle:THandle;

begin
  Handle:=CreateFileMapping($FFFFFFFF,Nil,PAGE_READONLY,0,1,AppID);
  If GetLastError=ERROR_ALREADY_EXISTS
     then MessageBox(0,'Запуск второй копии программы недопустим.',
                    AppID,MB_OK or MB_ICONSTOP or MB_TOPMOST)
    else

  begin
  Application.Initialize;
  Application.Title := 'Рабочее место оператора';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(Tdialform, dialform);
  Application.CreateForm(Ttest, test);
  Application.Run;
end;
CloseHandle(Handle);

end.
