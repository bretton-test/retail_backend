unit dmunit;

interface

uses
   Classes, Oracle, DB, OracleData,Dialogs,Controls,SysUtils,forms,DBGridEh,
  ImgList,StrUtils,math, SUnit,StdCtrls,variants,windows;
type Pstr =^string;
type Pint =^integer;

type
  TDM = class(TDataModule)
    OraBase: TOracleSession;
    tovar: TOracleDataSet;
    tovds: TDataSource;
    plu: TOracleDataSet;
    tovarNAME: TStringField;
    tovarECRNAME: TStringField;
    tovarSHTUKA: TIntegerField;
    tovarPRICE: TFloatField;
    Qedizm: TOracleDataSet;
    edds: TDataSource;
    Qrazdel: TOracleDataSet;
    razdds: TDataSource;
    tovarLIFE: TIntegerField;
    tovarCENNIK1: TStringField;
    tovarCENNIK2: TStringField;
    tovarCENNIK3: TStringField;
    tovarCENNIK4: TStringField;
    tovarED_IZM: TStringField;
    barcode: TOracleDataSet;
    bards: TDataSource;
    tovarKAT: TIntegerField;
    tovarPROIZW: TIntegerField;
    tovarPLU: TFloatField;
    QedizmED_IZM: TStringField;
    QrazdelKAT: TIntegerField;
    QrazdelNAME: TStringField;
    barcodeBARCODE: TStringField;
    barcodePLU: TFloatField;
    Qprzwd: TOracleDataSet;
    QprzwdPROIZW: TIntegerField;
    QprzwdNAME: TStringField;
    QprzwdSTRANA: TStringField;
    przwds: TDataSource;
    barcodeKODPR: TStringField;
    findplu: TOracleQuery;
    qsetbar: TOracleQuery;
    delbar: TOracleQuery;
    kodproizw: TOracleQuery;
    Qpostav: TOracleDataSet;
    QpostavCOD: TIntegerField;
    QpostavNAME: TStringField;
    QpostavYR_ADR: TStringField;
    QpostavFAKT_ADR: TStringField;
    QpostavTEL: TStringField;
    QpostavRAS_SCH: TStringField;
    QpostavN_BANK: TStringField;
    QpostavKOR_SCH: TStringField;
    QpostavBIK: TStringField;
    QpostavCITY: TStringField;
    QpostavINN: TStringField;
    QpostavOKONX: TStringField;
    QpostavOKPO: TStringField;
    QpostavDATE_ZAP: TDateTimeField;
    postds: TDataSource;
    qperiod: TOracleDataSet;
    qperiodBEGIN: TStringField;
    qperiodEND: TStringField;
    periodds: TDataSource;
    qsklad: TOracleDataSet;
    qskladSKLAD: TStringField;
    qskladSKLADID: TIntegerField;
    skladds: TDataSource;
    tovarNDS: TStringField;
    Qnakltemp: TOracleDataSet;
    tempds: TDataSource;
    QnakltempNN: TIntegerField;
    QnakltempPOST: TIntegerField;
    QnakltempPOKUP: TIntegerField;
    QnakltempDATA: TDateTimeField;
    QnakltempNAME: TStringField;
    QnakltempED_IZM: TStringField;
    QnakltempMEST: TIntegerField;
    QnakltempKOL_UP: TFloatField;
    QnakltempROSSIP: TFloatField;
    QnakltempKOL_VO: TFloatField;
    QnakltempCENABNDS: TFloatField;
    QnakltempCENASNDS: TFloatField;
    QnakltempCENAREAL: TFloatField;
    QnakltempTOTAL: TFloatField;
    QnakltempSKLADID: TIntegerField;
    QnakltempPLU: TFloatField;
    qtotal: TOracleQuery;
    QnakltempCENAWZALE: TFloatField;
    qinsertnakl: TOracleQuery;
    qInsertJournal: TOracleQuery;
    Qprihj: TOracleDataSet;
    prihjds: TDataSource;
    QprihjREG: TIntegerField;
    QprihjNN: TIntegerField;
    QprihjTIME: TStringField;
    QprihjDATA: TStringField;
    QprihjNAME: TStringField;
    QprihjSKLAD: TStringField;
    QprihjPRIM: TStringField;
    QprihjSUM: TFloatField;
    QprihjNOM: TFloatField;
    updatetime: TOracleQuery;
    insertTemp: TOracleQuery;
    Qprovodka: TOracleQuery;
    selkniga: TOracleQuery;
    Qostatok: TOracleDataSet;
    OstDs: TDataSource;
    Qnakltempostatok: TFloatField;
    QprihjPART: TFloatField;
    QprihjTIP: TStringField;
    Qinsertrashod: TOracleQuery;
    QinsrasNakl: TOracleQuery;
    QpartOst: TOracleDataSet;
    QpartOstPARTIA: TFloatField;
    QpartOstPARTOST: TFloatField;
    Qrashj: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    rashjDS: TDataSource;
    QpartOstID: TFloatField;
    InsertTempRas: TOracleQuery;
    updateOstatok: TOracleQuery;
    qaltost: TOracleDataSet;
    QInsertPart: TOracleQuery;
    QpartOstCENA: TFloatField;
    QpartOstNOM: TFloatField;
    QselPart: TOracleQuery;
    QselRashod: TOracleQuery;
    qFullj: TOracleDataSet;
    fulljds: TDataSource;
    qFulljTIP: TStringField;
    qFulljREG: TFloatField;
    qFulljNN: TFloatField;
    qFulljTIME: TStringField;
    qFulljDATA: TStringField;
    qFulljNAME: TStringField;
    qFulljSKLAD: TStringField;
    qFulljPRIM: TStringField;
    qFulljSUM: TFloatField;
    qFulljNOM: TFloatField;
    qFulljPART: TFloatField;
    QInsertPerem: TOracleQuery;
    QinsperJ: TOracleQuery;
    Qperemj: TOracleDataSet;
    peremjds: TDataSource;
    QperemjNN: TIntegerField;
    QperemjREG: TIntegerField;
    QperemjTIP: TStringField;
    QperemjTIME: TStringField;
    QperemjDATA: TStringField;
    QperemjNAME: TStringField;
    QperemjSKLADOUT: TIntegerField;
    QperemjSKLAD: TStringField;
    QperemjSKLADIN: TIntegerField;
    QperemjPRIM: TStringField;
    QperemjSUM: TFloatField;
    QperemjNOM: TFloatField;
    QinsperTemp: TOracleQuery;
    QperemNakl: TOracleDataSet;
    QperemNaklNN: TIntegerField;
    QperemNaklDATA: TDateTimeField;
    QperemNaklPLU: TFloatField;
    QperemNaklNAME: TStringField;
    QperemNaklED_IZM: TStringField;
    QperemNaklMEST: TIntegerField;
    QperemNaklKOL_UP: TFloatField;
    QperemNaklROSSIP: TFloatField;
    QperemNaklKOL_VO: TFloatField;
    QtipNakl: TOracleQuery;
    SelPrihod: TOracleDataSet;
    SelPrihodPLU: TFloatField;
    SelPrihodKOL_VO: TFloatField;
    SelPrihodCENAREAL: TFloatField;
    SelPrihodPART: TFloatField;
    SelPrihodDATA: TDateTimeField;
    SelPrihodSKLADID: TIntegerField;
    SelRashod: TOracleDataSet;
    SelRashodPLU: TFloatField;
    SelRashodKOL_VO: TFloatField;
    SelRashodCENA: TFloatField;
    SelRashodDATA: TDateTimeField;
    SelRashodSKLADID: TIntegerField;
    SelPerem: TOracleDataSet;
    SelPeremPLU: TFloatField;
    SelPeremKOL_VO: TFloatField;
    SelPeremDATA: TDateTimeField;
    SelPeremSKLADIN: TIntegerField;
    SelPeremSKLADOUT: TIntegerField;
    GetOst: TOracleDataSet;
    GetOstOSTATOK: TFloatField;
    QSelDoc: TOracleDataSet;
    tovarNAL: TFloatField;
    GetFullOst: TOracleDataSet;
    GetFullOstOSTATOK: TFloatField;
    qTipKontr: TOracleDataSet;
    qTipKontrTIP: TIntegerField;
    qTipKontrNAME: TStringField;
    qMaxtip: TOracleQuery;
    QpostavTIP: TIntegerField;
    QBalans: TOracleDataSet;
    BalDS: TDataSource;
    QBalansNAME: TStringField;
    QBalansNOM: TFloatField;
    QBalansDATA: TDateTimeField;
    QBalansRASHOD: TFloatField;
    QBalansPRIHOD: TFloatField;
    QBalansDOLG: TFloatField;
    Qselfrec: TOracleDataSet;
    selfds: TDataSource;
    qFulljD: TDateTimeField;
    qInsKas: TOracleQuery;
    qkassorder: TOracleDataSet;
    kassds: TDataSource;
    qkassjourn: TOracleDataSet;
    KJds: TDataSource;
    ImageList1: TImageList;
    Qinvent: TOracleDataSet;
    InvDS: TDataSource;
    QskladJ: TOracleDataSet;
    SkladJds: TDataSource;
    QinventPLU: TFloatField;
    QinventNAME: TStringField;
    QinventED_IZM: TStringField;
    QinventKOL_SKLAD: TFloatField;
    QinventKOL_FAKT: TFloatField;
    QinventRAZN: TFloatField;
    QinventPRICE: TFloatField;
    QinventSUM_SKL: TFloatField;
    QinventSUM_FAKT: TFloatField;
    QinventNOM: TFloatField;
    QsafeInv: TOracleQuery;
    QfsklJ: TOracleDataSet;
    Fsklds: TDataSource;
    Qtmc: TOracleDataSet;
    tmzDS: TDataSource;
    QtmzJ: TOracleDataSet;
    TMZJDS: TDataSource;
    QtmcPLU: TFloatField;
    QtmcNAME: TStringField;
    QtmcED_IZM: TStringField;
    QtmcKOL_FAKT: TFloatField;
    QtmcNOM: TFloatField;
    QostatokPLU: TFloatField;
    QostatokED_IZM: TStringField;
    QostatokPRICE: TFloatField;
    QostatokOSTATOK: TFloatField;
    SelSpisanie: TOracleDataSet;
    SelSpisaniePLU: TFloatField;
    SelSpisanieCENA: TFloatField;
    SelSpisanieDATA: TDateTimeField;
    SelSpisanieSKLADID: TIntegerField;
    SelSpisanieKOL_VO: TFloatField;
    QtmcPRICE: TFloatField;
    QtmcSUM_FAKT: TFloatField;
    SelSpisaniePART: TFloatField;
    QsumOst: TOracleDataSet;
    QsumOstSUM: TFloatField;
    tovarCENAPRIH: TFloatField;
    Qpricej: TOracleDataSet;
    prJds: TDataSource;
    Qprice: TOracleDataSet;
    prDS: TDataSource;
    QpricePLU: TFloatField;
    QpriceOLDPRICE: TFloatField;
    QpriceNEWPRICE: TFloatField;
    QpriceKOLVO: TFloatField;
    QpriceSUM: TFloatField;
    QpriceNOM: TFloatField;
    QpriceNAME: TStringField;
    Qsafeprice: TOracleQuery;
    InsertAll: TOracleQuery;
    tovarKASSA: TFloatField;
    qFulljOWNER: TStringField;
    QinsertPlu: TOracleQuery;
    insprint: TOracleQuery;
    showcennik: TOracleDataSet;
    showcennikNAME: TStringField;
    showcennikPRICE: TFloatField;
    showcennikBARCODE: TStringField;
    showcennikSHTUKA: TIntegerField;
    showcennikPLU: TFloatField;
    showcennikED_IZM: TStringField;
    DS15: TDataSource;
    QpostavKODIFIK: TFloatField;
    qSelReport: TOracleDataSet;
    QInsReport: TOracleQuery;
    QprihjOWNER: TStringField;
    QrashjOWNER: TStringField;
    QperemjOWNER: TStringField;
    Logon: TOracleLogon;
    QpriceOSN: TFloatField;
    tplu: TOracleDataSet;
    QBalansTIP: TStringField;
    QnakltempNAL: TFloatField;
    QfindPost: TOracleDataSet;
    QfindPostPLU: TFloatField;
    QnakltempWESY: TFloatField;
    tovarWESY: TFloatField;
    QnakltempID: TFloatField;
    qaltostNOM: TFloatField;
    qaltostCENA: TFloatField;
    qaltostPLU: TFloatField;
    qaltostNAME: TStringField;
    qaltostDATA: TDateTimeField;
    qaltostPRIHOD: TFloatField;
    qaltostRASHOD: TFloatField;
    qaltostOSTATOK: TFloatField;
    qaltostPRNOM: TFloatField;
    qaltostKLIENT: TStringField;
    QnakltempNDS: TStringField;
    InsertKat: TOracleQuery;
    UpdateKat: TOracleQuery;
    UpdateKat2: TOracleQuery;
    SelPlu: TOracleDataSet;
    DeletePlu: TOracleQuery;
    qPEROZj: TOracleDataSet;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField13: TStringField;
    perds: TDataSource;
    qPEROZjNN: TFloatField;
    qaltostSUM_PRIHOD: TFloatField;
    qaltostSUM_RASHOD: TFloatField;
    tovarEXPORT: TIntegerField;
    QnakltempKRASN_ID: TStringField;
    SelUser: TOracleDataSet;
    QselDouble: TOracleDataSet;
    QrazdelREPORT: TIntegerField;
    QpartOstNAME: TStringField;
    QedizmOKEI: TIntegerField;
    QrashjD: TDateTimeField;
    QprihjD: TDateTimeField;
    QperemjD: TDateTimeField;
    qPEROZjD: TDateTimeField;
    KKM: TOracleDataSet;
    KKM_ds: TDataSource;
    tovarNSP: TStringField;
    qRealPrice: TOracleDataSet;
    QrashjREG: TFloatField;
    QrashjNN: TFloatField;
    SelKKm: TOracleDataSet;
    SelKKmPLU: TFloatField;
    SelKKmKOLVO: TFloatField;
    SelKKmCENA: TFloatField;
    SelKKmDATA: TDateTimeField;
    SelKKmSKLADID: TIntegerField;
    Ftovar: TOracleDataSet;
    FtovarPLU: TFloatField;
    FtovarNAME: TStringField;
    FtovarPRICE: TFloatField;
    FtovarSHTUKA: TIntegerField;
    SelAct: TOracleDataSet;
    qPEROZjREG: TFloatField;
    QinventID: TFloatField;
    Getsumost: TOracleDataSet;
    getsumostatok: TFloatField;
    qinsertkatalog: TOracleQuery;
    QtmcNAL: TFloatField;
    QnakltempPtotal: TCurrencyField;
    GetFullOstSklad: TOracleDataSet;
    GetFullOstSkladOSTATOK: TFloatField;
    Qnakltemprow: TIntegerField;
    qskladNAME: TStringField;
    QselMinus: TOracleDataSet;
    QminKniga: TOracleDataSet;
    qInsMinpart: TOracleQuery;
    qselMinpart: TOracleDataSet;
    QselPeresort: TOracleDataSet;
    selinventar: TOracleDataSet;
    barcodeCENNIK: TStringField;
    showcennikCENNIK: TStringField;
    QpriceData: TOracleDataSet;
    QminKnigaID: TFloatField;
    QminKnigaPLU: TFloatField;
    QminKnigaDATA: TDateTimeField;
    QminKnigaPRIHOD: TFloatField;
    QminKnigaRASHOD: TFloatField;
    QminKnigaOSTATOK: TFloatField;
    QminKnigaCENA: TFloatField;
    QminKnigaSKLADID: TIntegerField;
    QminKnigaOTKAT: TIntegerField;
    QminKnigaNOM: TFloatField;
    QminKnigaPARTIA: TFloatField;
    QminKnigaSUM: TFloatField;
    QminKnigaPARTOST: TFloatField;
    SelPrihodCENASNDS: TFloatField;
    QpartOstPPRICE: TFloatField;
    tovarMINOST: TFloatField;
    tovarDISCOUNT: TFloatField;
    QnakltempLIFE: TDateTimeField;
    SelPrihodLIFE: TDateTimeField;
    SelKKmSUMDISCOUNT: TFloatField;
    tovarWES: TIntegerField;
    tovarPOST: TIntegerField;
    QrazdelPARENT: TIntegerField;
 //   procedure tovarBeforeOpen(DataSet: TDataSet);
//    procedure razdelAfterScroll(DataSet: TDataSet);
    procedure tovarBeforePost(DataSet: TDataSet);
    procedure QrazdelAfterPost(DataSet: TDataSet);
    procedure barcodeAfterScroll(DataSet: TDataSet);
    procedure tovarBeforeDelete(DataSet: TDataSet);
    procedure tovarNewRecord(DataSet: TDataSet);
    procedure tovarAfterPost(DataSet: TDataSet);
    procedure tovarAfterEdit(DataSet: TDataSet);
    procedure tovarAfterCancel(DataSet: TDataSet);
    procedure QprzwdNewRecord(DataSet: TDataSet);
    procedure QpostavNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
//    procedure qpokupNewRecord(DataSet: TDataSet);
    procedure QnakltempNewRecord(DataSet: TDataSet);
    procedure QprzwdAfterOpen(DataSet: TDataSet);
    procedure QnakltempBeforePost(DataSet: TDataSet);
    procedure QnakltempAfterPost(DataSet: TDataSet);
    procedure QnakltempAfterOpen(DataSet: TDataSet);
    procedure QprihjBeforeOpen(DataSet: TDataSet);
    procedure QnakltempCalcFields(DataSet: TDataSet);
    procedure getOstatokBeforeQuery(Sender: TOracleQuery);
    procedure tovarAfterDelete(DataSet: TDataSet);
    procedure QselfrecAfterEdit(DataSet: TDataSet);
    function newkod(const sequence:string):integer;
    procedure QinventNewRecord(DataSet: TDataSet);
    procedure QinventBeforePost(DataSet: TDataSet);
    procedure QtmcNewRecord(DataSet: TDataSet);
    procedure QostatokBeforeOpen(DataSet: TDataSet);
    procedure QtmcBeforePost(DataSet: TDataSet);
    procedure QsumOstBeforeOpen(DataSet: TDataSet);
    procedure QpriceNewRecord(DataSet: TDataSet);
    procedure QpriceBeforePost(DataSet: TDataSet);
    procedure QnakltempBeforeEdit(DataSet: TDataSet);
    procedure QnakltempBeforeInsert(DataSet: TDataSet);
    procedure tovarAfterOpen(DataSet: TDataSet);
    procedure tovarBeforeEdit(DataSet: TDataSet);
    procedure barcodeBeforePost(DataSet: TDataSet);
    procedure barcodeBeforeEdit(DataSet: TDataSet);
    procedure tovarDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure barcodeAfterInsert(DataSet: TDataSet);
    procedure barcodeNewRecord(DataSet: TDataSet);
    procedure tovarAfterScroll(DataSet: TDataSet);
    procedure tovarAfterInsert(DataSet: TDataSet);
    procedure tovarEXPORTChange(Sender: TField);
    procedure QtmcAfterPost(DataSet: TDataSet);
    procedure QinventAfterPost(DataSet: TDataSet);
    procedure QnakltemprowGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);

  private
    { Private declarations }

  function getnewproizw:string; //новый код производителя



  public
    { Public declarations }
    function FullostatokSklad(const plu:integer;const Sklad:integer):double;
  function realprice(const data:Tdatetime;const plu:integer):currency;
   procedure UserRights(const nom:integer;var mreg:byte);
  function ExecuteSQL(const SQLText: string):variant; //выполнить sql команду
  procedure UpdateRashPart(const plu,rash:integer);
  procedure updateOst(const kolvo:double;plu,sklad,nom:integer;data:TdateTime) ;
  function ostatok(const plu,sklad:integer;data:Tdatetime):double;
  function Fullostatok(const plu:integer):double;
  procedure editkatalog(const flag: boolean);
  procedure closekatalog;
  procedure openkatalog;
  procedure openproizw;
  function locproizw(const barcode:string):boolean; //ищем произв по штрихкоду
  procedure closeproizw;
  function getnewplu:string;//свободный код товара
  procedure setfilter(const filter:string);//ставим фильтр  на карточки
  function getkod:integer; //код производителя
  procedure settip(const filter:integer);//фильтр по типу
  procedure setwes(const flag:integer); //фильтр по вес.товару
  procedure insbarcode(const kod:string;Const plu:integer); //занести штрихкод
  procedure nofilter; //отменить фильтр карточек
  function findkart(const barcode:string):string; //найти карточку по штрихкоду
  procedure locname(const name:string); //найти произв по имени
  procedure setproizw(const kod:integer;const name:string); //занести код произв в карточку
  procedure tovargetmark; //ищем карточку по bookmark
  procedure delbarcode; //удалить штрихкоды
  procedure createproizw(const barcode:string); //генерим производителя код из штрихкода
  function newbarcode:string; //генерим штрихкод на основе изготовителя
  procedure postopen;
  procedure postclose;
  procedure setperiod(const bg,ed:shortstring;const sklad:integer=1;const report:boolean=false);

  procedure rollback;
  procedure opentemp(const plu:integer);
  procedure closetemp;
  function setedit:boolean; //редактируем ?
  procedure inserttovar; //занести из карточки
  procedure delnakl; //удалить накл
  function locatetovar(const name:string):boolean;overload;//найти товар
  procedure seteditnakl; //накладная прих едит
  procedure insertnakl(const Prim:string;const ppost:integer=0); //обработка прих накладной
  function  findpost(const ind:integer):string;
  function  showtime:boolean; //установка времени документа
  function  calc(const x,y:integer;init:double):double; //калькулятор
  procedure editnds1(const x,y:integer);
  procedure editnds2(const x,y:integer);
  procedure  commit;
  procedure editcena(const x,y:integer);
  procedure  PrihJournal(const grid:TDBGrideh);
  procedure  PrihNakl(const nom,reg:integer);
  procedure  findtovar;
  procedure tempPost;
//  function   provodka:boolean;
  procedure setreg(const reg:byte; nom:integer);

  procedure setnom(const DataSet: TDataSet);
  function  getreg(const DataSet: TDataSet):integer;
  procedure  opensklad(const tip,skladid:Integer;kat,name :string);
  procedure openprihod(const nom,reg,part,plu:integer);
  procedure  insertrashod(const prim:string);
  function est:boolean;
//   function  findpokup(const ind:integer):string;
//  function rashprovodka:boolean;
  procedure  RashJournal(const grid:TDBGrideh);
  procedure openrashod(const nom,reg,plu:integer);
  procedure  RashNakl(const nom,reg:integer);
  procedure  FullJournal(const grid:TDBGrideh);
  procedure insertPerem(const prim:string);
  procedure  PeremJournal(const grid:TDBGrideh);
  procedure openperem(const nom,reg:integer);
  function  TipNakl(const nom:integer):byte;
//  procedure peremprovodka;
  procedure RefreshJournal;
  procedure  addmemo(const Mssage:string);
  function   findtip(const name:string):integer;
  procedure insertTip(const name:string);
  procedure RenameTip(const name:string);
  procedure Gettip;
  procedure selfrecv(const res:integer);
  procedure  insKassa(const kont,nom,tip,doc:integer;data:Tdatetime;osn,prim:string;sum,nds,nsp:double);
  procedure  openkassprih(const nom:integer);
  function  openinvent(const nom:integer;data:boolean=false):TdataSource;
  procedure  insertinvent(var mylabel:tlabel);
 function  insertinvline:boolean;
  procedure invedit(ds:Tdataset);
  procedure  safeinvent(const komment:string;sum:currency);
  procedure  InvJournal(const grid:TDBGrideh);
  procedure  inventf(const nom:integer;const plu:integer=0);
  function opentmz(const nom,tip:integer):TdataSource;
  procedure  insertspisanie(const tip:byte);
//  procedure  downbut(const numb:byte;const Capt:string;const myform:Tobject);
  function insertspisline:boolean;
  procedure safespis(const komment:string;tip:byte;sum:currency);
  procedure spisanief(const nom,tip:integer);
  function  OpenPereozenka(const nom:integer):TdataSource;
  function insertpriceline:boolean;
  procedure  safePereozenka(const komment:string;sum:currency);
  procedure   pereozenkashow(const nom:integer);
  procedure editnewprice(const x,y:integer);
  procedure  PrintPrihod(const nomb:integer);
  function   ExportNakl(const nom:integer):integer;
  procedure  InsReport(const data:TdateTime);
  function   Get_Rekvizit(var rec1,rec2:string):boolean;
  function   InsertLoadedString(const tovname,ed_izm,krasnId:string;
                                const inPrice,OutPrice,inpriceBnds:currency;
                                const Mest:integer;
                                const kolvo,kolvomest:double):boolean;

 function   InsertPereozenka(const nom:integer;nplu:integer=0):boolean;
 procedure openbeznal(const nom:integer);
 procedure CreateKart(const Barcode:string);
 function FindTpost(const Post:integer):string;
 function FindLoadNakl(const nn:integer;const data:TdateTime):boolean;
 function InsertPosTovar(const plu,kat,proizw:integer):boolean;
 function StayConnect:boolean;
 function LocateTovar(const plu:integer):boolean;overload;
 function LocateTovar(const plu:double):boolean;overload;
 function Sumostatok(const plu,sklad:integer;data:Tdatetime):double;
 function PriceFromDate(const plu:integer;const data:Tdatetime):currency;
 function delplu(const plu:integer):boolean;
 end;

var
  DM: TDM;
  postname:string='';
  osntext:string='';
  datadok :Tdatetime;
  skladnom:integer=0;
  post:integer=0;
  part:integer=0;
  tipdok:integer;
  nom:integer=0;
  nomerdok:integer=0;
  osndoc:integer=0;  //nomer osnovania
  tmznom:integer=0; //nomer tmz
  pricenom:integer=0;//nomer pereozenki
  reg:byte=0;
  skladinv:byte=0; //sklad invent
  skladtmz:byte=0; //sklad списания - прихода
  sklad:byte=0;
  skladin:byte=0;
  sortkat,nameed: boolean;
  sort: integer=1;
  parent: integer=0;
  BOOKMARK:INTEGER;
  pbegin,pend :TDateTime;
  posttip:integer=0;
  repedit:boolean=false;
  edited:boolean=false;
  Ir:boolean=false;
   
  izmeneno:boolean=false;

  implementation

uses barcodeunit, MAIN, Timeunit, naklunit, rashunit, peremunit,
  kassunit, invunit, about, Spisunit, priceunit, messageunit, kartunit,
  bprihunit, mycalc, selunit, ViewUnit, RViewUnit, FindCompare;
//function  Showcalc(x,y:integer;init:double):double;stdcall;external 'mydll.dll';
//procedure init(app:tapplication); stdcall;external 'mydll.dll';
//procedure term ; stdcall;external 'mydll.dll';



{$R *.dfm}


    function tdm.delplu(const plu:integer):boolean;
    var temp:variant;
    begin
     result:=false;
     if roundto(dm.Fullostatok(plu),-3)<>0 then
     begin
       dm.addmemo('У товара есть остаток');
      exit;
     end;
      temp:= dm.ExecuteSQL('select export from tmp.tkatalog where plu='+floattostr(plu));
      if temp=null then exit;
      if integer(temp)=1 then
      begin
       dm.addmemo('Флаг Экспорт должен быть убран');
       exit;
      end;

      try
      dm.ExecuteSQL('delete from pos.tovar where plu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.tpart where plu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.minpart where plu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.kniga where plu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.tinvent where plu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.kkmreport where plu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.tprice where plu='+floattostr(plu));
      dm.ExecuteSQL('update tmp.tprihnakl set plu=0 where plu='+floattostr(plu));
      dm.ExecuteSQL('update tmp.trashnakl set plu=0 where plu='+floattostr(plu));
      dm.ExecuteSQL('update tmp.tperemnakl set plu=0 where plu='+floattostr(plu));
      dm.ExecuteSQL('update tmp.actprice set oldplu=0 where oldplu='+floattostr(plu));
      dm.ExecuteSQL('update tmp.actprice set newplu=0 where newplu='+floattostr(plu));
      dm.ExecuteSQL('delete from tmp.tbarcode where plu='+floattostr(plu));
      //dm.ExecuteSQL('delete from tmp.tkatalog where plu='+floattostr(plu));



      dm.commit;
      result:=true;
      except
       dm.rollback;
       raise;
      end;

    end;


function TDM.realprice(const data:Tdatetime;const plu:integer):currency;
  begin
   result:=0;
   dm.nofilter;
   if LocateTovar(plu) then result:=dm.tovarprice.AsCurrency;
      dm.qRealPrice.Close;
      dm.qRealPrice.SetVariable('plu',plu);
      dm.qRealPrice.SetVariable('data',data);
      dm.qRealPrice.Open;
      if dm.qRealPrice.RecordCount=0 then exit;
      dm.qRealPrice.First;
      result:=currency(dm.qRealPrice.FieldValues['oldprice']);


  end;

function Tdm.LocateTovar(const plu:integer):boolean;
 begin

     result:=dm.tovar.Locate('plu',plu,[]);
 end;
function Tdm.LocateTovar(const plu:double):boolean;
 begin

     result:=dm.tovar.Locate('plu',round(plu),[]);
 end;



function tdm.StayConnect:boolean;
begin
result:=false;
if not dm.OraBase.Connected then
if not   dm.Logon.Execute  then exit;

dm.OraBase.Connected:=true;
dm.SelUser.Open;
if dm.SelUser.Locate('usr',dm.OraBase.LogonUsername,[loCaseInsensitive])
   then if dm.SelUser.FieldByName('kolvo').AsInteger>1
        then begin
              showmessage('Пользователь '+dm.SelUser.FieldValues['usr']
                          +' уже зарегистрирован!');
              dm.SelUser.Close;
              dm.OraBase.Connected:=false;
              exit;


             end;

dm.SelUser.Close;
dm.tovar.Open;
dm.Qedizm.Open;
dm.Qrazdel.Open;
dm.Qpostav.Open;
dm.qTipKontr.Open;
dm.Qselfrec.Open;
dm.barcode.Open;
dm.Qprzwd.Open;
dm.qsklad.Open;




dm.qperiod.Open;
if dm.qperiod.RecordCount=0
 then
  begin
   dm.ExecuteSQL('insert into tmp.toptions (parametr,value) values ('+chr(39)+ 'begin'+chr(39)+','+chr(39)+datetostr(date-30)+chr(39)+')') ;
   dm.ExecuteSQL('insert into tmp.toptions (parametr,value) values ('+chr(39)+ 'end'+chr(39)+','+chr(39)+datetostr(date)+chr(39)+')') ;

  dm.OraBase.Commit;
  dm.qperiod.Refresh;
  end;
dmunit.pbegin:=dm.qperiodBEGIN.AsDateTime;
dmunit.pend:=dm.qperiodEND.AsDateTime;
dm.qperiod.Close;
result:=true;


end;

 function TDM.InsertPosTovar(const plu,kat,proizw:integer):boolean;

 begin
     result:=true;
  if plu=0 then exit;

  try

   dm.SelPlu.Close;
   dm.SelPlu.SetVariable('plu',floattostr(plu+3e12));
   dm.SelPlu.Open;
   if dm.SelPlu.RecordCount>0 then
   begin
   dm.SelPlu.Close;
   exit;
   end;

   if roundto(double(dm.ExecuteSQL('select nvl(sum(sum),0) from tmp.kniga where otkat=0 and plu='+floattostr(plu))),-1)<=0
   then begin
          dm.addmemo('товара с кодом '+floattostr(plu)  + ' нет в наличии');
          exit;
        end;
   dm.ExecuteSQL('delete from pos.tovar where plu='+floattostr(plu));
{  if kat>0 then
  begin


 //  dm.DeletePlu.SetVariable('plu',);
  // dm.DeletePlu.Execute;
   dm.SelPlu.Close;
   dm.SelPlu.SetVariable('plu',floattostr(kat*1e9+3e12));
   dm.SelPlu.Open;
   if (dm.SelPlu.RecordCount=0) and (kat>0) then
       begin
         dm.ExecuteSQL('delete from pos.tovar where plu='+floattostr(kat*1e9));
         dm.UpdateKat.SetVariable('kat',kat);
         dm.UpdateKat.Execute;
        end;
   dm.SelPlu.Close;
   dm.SelPlu.SetVariable('plu',floattostr(KAT*1e8+PROIZW+3e12));
   dm.SelPlu.Open;
   if (dm.SelPlu.RecordCount=0) and (KAT*1e8+PROIZW>0) then
       begin
         dm.ExecuteSQL('delete from pos.tovar where plu='+floattostr(KAT*1e8+PROIZW));
         dm.UpdateKat2.SetVariable('kat',KAT);
         dm.UpdateKat2.SetVariable('proizw',proizw);
         dm.UpdateKat2.Execute;
     end;

   dm.SelPlu.Close;
end;          }
   dm.QinsertPlu.SetVariable('plu',plu);

   dm.QinsertPlu.Execute;
  // dm.commit;

  except
   result:=false;
  dm.addmemo('ошибка');
 // dm.rollback;

  end;
 end;
{----------------------------------------------------------------------------}
  function TDM.FindLoadNakl(const nn:integer;const data:TdateTime):boolean;
   var temp:integer;
   begin
     result:=false;
     temp:=0;
     if dm.qFullj.Active then temp:=dm.qFulljNOM.AsInteger
                         else dm.qFullj.Open;
     if dm.qFullj.Locate('nn',nn,[]) then
        if formatdatetime('dd.mm.yyyy',dm.qFulljD.AsDateTime)=formatdatetime('dd.mm.yyyy',data)
         then result:=true;
    if temp<>0 then dm.qFullj.Locate('NOM',temp,[])
     else dm.qFullj.Close;


   end;

 procedure  TDM.CreateKart(const Barcode:string);
  var temp:integer;
    s1,s2,s3,s4,s5:string;
 begin
      if copy(barcode,1,1)='2' then exit;
      if (AnsiLowerCase(dm.QnakltempED_IZM.AsString)='кг')
        or (AnsiLowerCase(dm.QnakltempED_IZM.AsString)='кг.')
       then begin
            addmemo(messageunit.m25);
            exit;
            end;

      if dm.Qnakltemp.State=dsBrowse then dm.Qnakltemp.Edit;
      if not assigned(KartForm) then
          KartForm:=TKartForm.Create(mainform,mainform.mybar);
           KartForm.Show;
      if MessageDlg(messageunit.m24,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

      temp:=strtoint(dm.getnewplu);
      dm.editkatalog(false);
      kartform.editkart.Checked:=true;
      if dm.tovar.State<>dsBrowse then dm.tovar.Cancel;
      dm.tovar.Insert;
      dm.tovarPLU.AsInteger:=temp;
      dmunit.BOOKMARK:=temp;
      if barcode<>'' then dm.insbarcode(barcode,temp);
      dm.tovarNAME.Value:=dm.QnakltempNAME.Value;
      dm.tovarECRNAME.Value:=copy(dm.QnakltempNAME.Value,1,25);
      dm.tovarED_IZM.Value:=dm.QnakltempED_IZM.Value;
      dm.tovarPRICE.AsCurrency:=dm.QnakltempCENAREAL.AsCurrency;
      dm.tovarMINOST.Value:=1;
      Kartform.tovgrid.Visible:=false;

        kartform.CreateArray(dm.tovarNAME.AsString,s1,s2,s3,s4,s5);
        dm.tovarCENNIK1.AsString:=s1;
        dm.tovarCENNIK2.AsString:=s2;
        dm.tovarCENNIK3.AsString:=s3;
        dm.tovarCENNIK4.AsString:=s4;


     // if (AnsiLowerCase(dm.QnakltempED_IZM.AsString)='кг')
    //     or (AnsiLowerCase(dm.QnakltempED_IZM.AsString)='кг.')
    //   then dm.tovarSHTUKA.AsInteger:=1
      dm.tovarSHTUKA.AsInteger:=0;
      if  (dm.QnakltempCENABNDS.AsCurrency<>0) and ( dm.QnakltempCENASNDS.AsCurrency<>0) then
      temp:=round(((dm.QnakltempCENASNDS.AsCurrency/dm.QnakltempCENABNDS.AsCurrency)-1)*100)
      else temp:=0;
      case temp of
       9,10,11:dm.tovarNDS.AsInteger:=10;
       19,20,21:dm.tovarNDS.AsInteger:=20;
       else dm.tovarNDS.AsInteger:=0;
       end;

      end;
 end;
//----------------------------------------------------------------------




 function   TDM.InsertLoadedString(const tovname,ed_izm,krasnId:string;
                                const inPrice,OutPrice,inpriceBnds:currency;
                                const Mest:integer;
                                const kolvo,kolvomest:double):boolean;
begin
dm.Qnakltemp.ReadOnly:=false;
result:=false;
If dmunit.reg=1  then exit;
dm.tovar.Filtered:=false;

If dm.Qnakltemp.State=dsBrowse  then  dm.Qnakltemp.Insert;
//if dm.tovar.Locate('name',tovname,[]) then
// begin
 //dm.QnakltempNAME.AsString:=tovname;
 //dm.QnakltempPLU.AsInteger:=dm.tovarPLU.AsInteger;
//  dm.inserttovar;
// end else
 dm.QnakltempNAME.AsString:=tovname;
 dm.QnakltempPLU.AsInteger:=0;
 dm.QnakltempKRASN_ID.AsString:=KrasnId;
 dm.QnakltempED_IZM.AsString:=copy(ed_izm,1,5);
 dm.QnakltempMEST.AsInteger:=Mest;
 dm.QnakltempKOL_UP.AsFloat:=kolvomest;
 dm.QnakltempKOL_VO.AsFloat:=kolvo;
 dm.QnakltempCENABNDS.AsCurrency:=inpriceBnds;
 dm.QnakltempCENASNDS.AsCurrency:=inPrice;
 dm.QnakltempCENAREAL.AsCurrency:=OutPrice;

dm.Qnakltemp.Post;
end;

//-------------------------------------------------------------------
 function     TDM.Get_Rekvizit(var rec1,rec2:string):boolean;
   begin
  result:=false;
  try
  //rec1^:=dm.Qselfrec.FieldValues['name'];
  //rec2^:=dm.Qselfrec.FieldValues['podrazd'];
  rec1:=dm.Qselfrec.FieldValues['name'];
  rec2:=dm.Qselfrec.FieldValues['podrazd'];
  result:=true;
  except
  exit;
  end;
   end;
//----------------------------------------------------------------------
 procedure  TDM.InsReport(const data:TdateTime);
  begin

  end;
 //-----------------------------------------------------------------------
function   TDM.ExportNakl(const nom:integer):integer;
 var count:integer;
 begin
  count:=0;
  result:=0;
  
  dm.SelPrihod.Close;
  dm.SelPrihod.SetVariable('nom',nom);
  dm.SelPrihod.Open;
  If dm.SelPrihod.RecordCount=0  then begin dm.SelPrihod.Close;dm.addmemo(messageunit.m8);exit;end;
  dm.nofilter;
  dm.SelPrihod.First;
   while not dm.SelPrihod.Eof do
   begin
   inc(count);


   if (dm.SelPrihodPLU.AsInteger<>0) and (dm.LocateTovar(dm.SelPrihodPLU.AsInteger))
     then
     begin
     if (dm.tovarSHTUKA.AsInteger=0) and (dm.barcode.RecordCount=0) then
        begin
          dm.addmemo('У товара '+dm.tovarNAME.AsString+' нет штрихкода' );
          dec(count);
        end else
          if not  dm.InsertPosTovar(dm.tovarPLU.AsInteger,dm.tovarKAT.AsInteger,dm.tovarPROIZW.AsInteger)
             then
              begin
                dm.OraBase.Rollback;
                 dm.addmemo('ошибка экспорта '+dm.tovarNAME.AsString);
                  dec(count);
                  break;
                  dm.SelPrihod.Close;
                 result:=count;
                exit;
                end;
     end;
   dm.SelPrihod.Next;
   end;
 dm.OraBase.Commit;
 dm.SelPrihod.Close;
 result:=count;
 end;
//---------------------------------------------------------------------
  // procedure  TDM.downbut(const numb:byte;const Capt:string;const myform:Tobject);
 //   begin
   //  mainform.downbutton(numb,capt,myform);
 //   end;
//-----------------------------------------------------------------------
procedure  TDM.pereozenkashow(const nom:integer);
 begin
If not assigned(Priceform)  then
  begin
  Priceform:=tPriceform.Create(mainform,mainform.mybar);

  Priceform.Setnom(nom,now);
  Priceform.OnResize(Priceform);
  end;
  Priceform.Show;
 end;

 //-------------------------------------------------------------------------
  procedure  tdm.spisanief(const nom,tip:integer);
   begin
  If assigned(spform)  then  spform.Close;
  while assigned(spform) do application.ProcessMessages;

    spform:=tspform.Create(mainform,mainform.mybar);
   If tip=3  then begin
    spform.Caption:='Прием ТМЦ №';
   Spform.Label5.Caption:=spform.Caption;
   spform.OnActivate(spform);
   end;

   spform.Setnom(nom,tip);
  
   spform.Show;

   end;



 //-------------------------------------------------------------------------
  procedure  tdm.inventf(const nom:integer;const plu:integer=0);
   begin
  If not assigned(invform)   then
  begin
   invform:=tinvform.Create(mainform,mainform.mybar);

   invform.Setnom(nom);
  // invform.OnResize(invform);

  end;
  invform.Show;
   if plu>0 then Tdatasource(invform.dbgrid.DataSource).DataSet.locate('plu',plu,[]);
   end;
//------------------------------------------------------------------------
procedure  TDM.safePereozenka(const komment:string;sum:currency);
 begin
  If dm.Qprice.state <> dsBrowse  then  dm.Qprice.Post;
  dm.ExecuteSQL('delete from tmp.tpricej where nom='+inttostr(dmunit.pricenom));
  dm.Qsafeprice.SetVariable('nom',dmunit.pricenom);
  dm.Qsafeprice.SetVariable('data',dmunit.datadok);
  dm.Qsafeprice.SetVariable('sum',sum);
  dm.Qsafeprice.SetVariable('komment',komment);
  dm.Qsafeprice.Execute;
  dm.commit;
  dm.RefreshJournal;
 end;

 //------------------------------------------------------------------------
  procedure  TDM.safespis(const komment:string;tip:byte;sum:currency);
   begin
   If dm.Qtmc.state <> dsBrowse  then  dm.Qtmc.Post;
    dm.ExecuteSQL('delete from tmp.tskladj where nom='+inttostr(dmunit.tmznom));
    dm.QsafeInv.SetVariable('nom',dmunit.tmznom);
    dm.QsafeInv.SetVariable('tip',tip);
    dm.QsafeInv.SetVariable('skladid',dmunit.skladtmz);
    dm.QsafeInv.SetVariable('data',dmunit.datadok);
    dm.QsafeInv.SetVariable('osnov',osndoc);
    dm.QsafeInv.SetVariable('reg',0);
    If komment<>''  then dm.QsafeInv.SetVariable('komment',komment)
                    else dm.QsafeInv.SetVariable('komment','-');
    case tip of
    2: begin
         dm.QsafeInv.SetVariable('sum',0);
         dm.QsafeInv.SetVariable('part',0);
       end;
    3: begin
         dm.QsafeInv.SetVariable('sum',sum);
         dm.QsafeInv.SetVariable('part',dm.newkod('partseq'));
       end;
    end;

    dm.QsafeInv.Execute;
  end;





//------------------------------------------------------------------------
  procedure  TDM.safeinvent(const komment:string;sum:currency);
   begin
   If dm.Qinvent.state <> dsBrowse  then  dm.Qinvent.Post;
    dm.ExecuteSQL('delete from tmp.tskladj where nom='+inttostr(dmunit.skladnom));
    dm.QsafeInv.SetVariable('nom',dmunit.skladnom);
    dm.QsafeInv.SetVariable('tip',1);
    dm.QsafeInv.SetVariable('skladid',dmunit.skladinv);
    dm.QsafeInv.SetVariable('data',dmunit.datadok);
    dm.QsafeInv.SetVariable('osnov',0);
    dm.QsafeInv.SetVariable('reg',0);
    If komment<>''  then  dm.QsafeInv.SetVariable('komment',komment)
                    else  dm.QsafeInv.SetVariable('komment','-');
    dm.QsafeInv.SetVariable('sum',sum);
    dm.QsafeInv.SetVariable('part',0);
    dm.QsafeInv.SetVariable('owner','-');
    dm.QsafeInv.Execute;
  end;
//------------------------------------------------------------------------
 procedure TDM.invedit(ds:Tdataset);
   begin
    If ds.State=dsBrowse  then ds.edit;
    //If dm.Qinvent.State=dsBrowse  then dm.Qinvent.edit;
   end;
//-------------------------------------------------------------------------
  function TDM.insertpriceline:boolean;
  var   plu:integer;
        kolvo:double;

  begin
   result:=false;
   If not dm.Qprice.Active  then exit;
    If dm.Qprice.State=dsBrowse  then dm.Qprice.Insert;
    plu:=dm.tovarPLU.AsInteger;
    dm.QpricePLU.AsInteger:=plu;
    dm.QpriceOLDPRICE.AsCurrency:=dm.tovarPRICE.AsCurrency;
    kolvo:=dm.Fullostatok(plu);
    if kolvo<0 then kolvo:=0;
    dm.Qpricekolvo.AsFloat:=kolvo;
    dm.QpriceNEWPRICE.AsCurrency:=dm.tovarCENAPRIH.AsCurrency;
    if  dm.tovarCENAPRIH.AsCurrency=0 then  dm.QpriceNEWPRICE.AsCurrency:=
    dm.tovarPRICE.AsCurrency;
   If dm.Qprice.State<>dsBrowse  then  dm.Qprice.Post;
    dm.Qprice.Refresh;
      If plu<>0  then dm.Qprice.Locate('plu',plu,[]);
    result:=true;
     if assigned(Priceform) then Priceform.Show;
  end;

 //-------------------------------------------------------------------------
function   TDM.InsertPereozenka(const nom:integer;nplu:integer=0):boolean;
 begin
  dm.nofilter;

dm.tovar.Refresh;
  result:=false;
 if dm.Qprice.ReadOnly then exit;
  dm.SelPrihod.Close;
  dm.SelPrihod.SetVariable('nom',nom);
  dm.SelPrihod.Open;
  If dm.SelPrihod.RecordCount=0  then exit;
  If not dm.Qprice.Active  then exit;
 if nplu=0 then
  while not dm.SelPrihod.Eof do
  begin

    If (not dm.LocateTovar(dm.SelPrihodPLU.AsInteger)) or
     //(dm.SelPrihodCENAREAL.AsCurrency=dm.tovarKASSA.AsCurrency)
    // or (dm.tovarKASSA.AsInteger=-1)
    (dm.tovarPRICE.AsCurrency=dm.SelPrihodCENAREAL.AsCurrency)

       then
     begin
      dm.SelPrihod.Next;
      continue;
     end;




   If dm.Qprice.State=dsBrowse  then dm.Qprice.Insert;
    dm.QpricePLU.AsInteger:=dm.SelPrihodPLU.AsInteger;
    dm.QpriceOLDPRICE.AsCurrency:=dm.tovarPRICE.AsCurrency;
    dm.Qpricekolvo.AsFloat:=dm.Fullostatok(dm.SelPrihodPLU.AsInteger)-dm.SelPrihodKOL_VO.AsFloat;
    dm.QpriceNEWPRICE.AsCurrency:=dm.SelPrihodCENAREAL.AsCurrency;
    dm.QpriceOSN.AsInteger:=nom;
    dm.Qprice.Post;

  dm.SelPrihod.Next;
  end else
  begin

      if (dm.LocateTovar(nplu)) and

     (dm.tovarCENAPRIH.AsCurrency<>dm.tovarKASSA.AsCurrency)
     and (dm.tovarKASSA.AsInteger<>-1)
       then
               If (dm.Qprice.State=dsBrowse) and (not dm.Qprice.Locate('plu',nplu,[]) )
               then
               begin


               If dm.Qprice.State=dsBrowse  then  dm.Qprice.Insert;
                dm.QpricePLU.AsInteger:=dm.TovarPLU.AsInteger;
                dm.QpriceOLDPRICE.AsCurrency:=dm.tovarKassa.AsCurrency;
                dm.Qpricekolvo.AsFloat:=dm.Fullostatok(nplu);
                dm.QpriceNEWPRICE.AsCurrency:=dm.tovarCENAPRIH.AsCurrency;
                dm.QpriceOSN.AsInteger:=nom;
                dm.Qprice.Post;


            end;
  end;
 dm.Qprice.Refresh;
 result:=true;

 end;

 //-------------------------------------------------------------------------
 function TDM.insertinvline:boolean;
  var ost:double;
      plu:integer;
  begin
    result:=false;

    If not dm.Qinvent.Active  then exit;
    If dmunit.skladinv=0  then begin
     dm.addmemo(messageunit.m15);
    exit;
    end;
     plu:=dm.tovarPLU.AsInteger;
    If (dm.Qinvent.State=dsBrowse) and (not dm.Qinvent.Locate('plu',plu,[]))  then
       dm.Qinvent.Insert;



     // dm.Qinvent.Insert;
     if dm.Qinvent.State<>dsBrowse  then
     begin
       dm.QinventPLU.AsInteger:=plu;
       dm.QinventED_IZM.Value:=dm.tovarED_IZM.AsString;
       ost:=dm.sumostatok(dm.tovarPLU.AsInteger,dmunit.skladinv,dmunit.datadok);
       dm.QinventKOL_SKLAD.Value:=ost;
      if dm.Qinvent.State=dsInsert then dm.QinventKOL_FAKT.Value:=0;
      dm.QinventPRICE.AsCurrency:=dm.PriceFromDate(plu,dmunit.datadok);  //dm.tovarPRICE.AsCurrency;
       dm.QinventSUM_SKL.AsCurrency:=dm.tovarPRICE.AsCurrency*ost;
     dm.Qinvent.Post;
     dm.Qinvent.Refresh;
    end;
     If plu<>0  then dm.Qinvent.Locate('plu',plu,[]);
    result:=true;
    if assigned(invform) then invform.Show;
  end;
//----------------------------------------------------------------------------
//-------------------------------------------------------------------------
 function TDM.insertspisline:boolean;
  var
      plu:integer;
  begin
    result:=false;

    If not dm.Qtmc.Active  then exit;
    If dmunit.skladtmz=0  then exit;
    If dm.Qtmc.State=dsBrowse  then dm.Qtmc.Insert;
       plu:=dm.tovarPLU.AsInteger;
       dm.QtmcPLU.AsInteger:=plu;
       dm.QtmcED_IZM.Value:=dm.tovarED_IZM.AsString;
       dm.QtmcPRICE.AsCurrency:=dm.tovarPRICE.AsCurrency;
       dm.QtmcKOL_FAKT.Value:=0;
       dm.Qtmc.Post;
     dm.Qtmc.Refresh;
     If plu<>0  then dm.Qtmc.Locate('plu',plu,[]);
    result:=true;
   if assigned(Spform) then Spform.Show;
  end;
//----------------------------------------------------------------------------


procedure  TDM.insertspisanie(const tip:byte);
begin
  If not dm.Qinvent.Active  then exit;
   If not dm.Qtmc.Active  then exit;
  try
   dm.Qinvent.First;
   If dm.Qtmc.State<>dsBrowse  then dm.Qtmc.Cancel;
    while not dm.Qinvent.Eof do
       begin
         If (dm.QinventRAZN.AsFloat>0) and (tip=2)  then
           begin
           dm.Qtmc.Insert;
           dm.QtmcPLU.AsInteger:=dm.QinventPLU.AsInteger;
           dm.QtmcED_IZM.AsString:=dm.QinventED_IZM.AsString;
           dm.QtmcKOL_FAKT.AsFloat:=dm.QinventRAZN.AsFloat;
           dm.QtmcPRICE.AsCurrency:=0;
           dm.Qtmc.Post;

           end;
          If (dm.QinventRAZN.AsFloat<0) and (tip=3)  then
           begin
           dm.Qtmc.Insert;
           dm.QtmcPLU.AsInteger:=dm.QinventPLU.AsInteger;
           dm.QtmcED_IZM.AsString:=dm.QinventED_IZM.AsString;
           dm.QtmcPRICE.AsCurrency:=dm.QinventPRICE.AsCurrency;
           IF dm.QinventKOL_SKLAD.Value>=0 then
           dm.QtmcKOL_FAKT.AsFloat:=-1*dm.QinventRAZN.AsFloat
           else dm.QtmcKOL_FAKT.AsFloat:=-1*(dm.QinventKOL_SKLAD.Value-dm.QinventKOL_Fakt.Value);
           if (dm.QtmcKOL_FAKT.Value>0) {or (dm.QinventKOL_SKLAD.Value<0)} then  dm.Qtmc.Post
           else dm.Qtmc.Cancel;

           end;





         dm.Qinvent.Next;
       end;
 finally
 dm.Qtmc.Refresh;
 dm.Qtmc.Last;
 dm.Qinvent.Close;
end;
 end;
//---------------------------------------------------------------------------
procedure  TDM.insertinvent(var mylabel:tlabel);
   var counter:integer;
   begin
     If not dm.Qostatok.Active  then exit;
     If not dm.Qinvent.Active  then exit;
     If dm.Qinvent.State<>dsBrowse  then dm.Qinvent.Cancel;
     dm.Qostatok.First;
    counter:=0;
     while not dm.Qostatok.Eof do
       begin
       dm.Qinvent.Insert;
       dm.QinventPLU.AsInteger:=dm.QostatokPLU.AsInteger;
       dm.QinventED_IZM.Value:=dm.QostatokED_IZM.AsString;
       dm.QinventKOL_SKLAD.Value:=dm.QostatokOSTATOK.Value;
       dm.QinventKOL_FAKT.Value:=0;
       dm.QinventPRICE.AsCurrency:=dm.QostatokPRICE.AsCurrency;
       dm.QinventSUM_SKL.AsCurrency:=dm.QostatokPRICE.AsCurrency*dm.QostatokOSTATOK.Value;
       dm.Qinvent.Post;
       dm.Qostatok.Next;
      inc(counter);
      mylabel.Caption:=inttostr(counter);
     Application.ProcessMessages;
       end;
     //dm.Qkat.Close;
     dm.Qostatok.Close;
    dm.Qinvent.Refresh;
   end;
//-----------------------------------------------------------------------
function  tdm.opentmz(const nom,tip:integer):TdataSource;
  var flag:boolean;
  begin
    dm.Qtmc.Close;
    dm.Qtmc.SetVariable('nom',nom);
    dm.Qtmc.Open;
    dm.QtmzJ.Close;
    dm.QtmzJ.SetVariable('nom',nom);
    dm.QtmzJ.SetVariable('tip',tip);
    dm.QtmzJ.Open;
    dmunit.tmznom:=nom;
    dm.Qtmc.ReadOnly:=false;
    if dm.QtmzJ.RecordCount>0 then
      begin
          result:=dm.TMZJDS;
          If dm.QtmzJ.FieldByName('reg').AsInteger=1  then flag:=true else flag:=false;

                             dm.Qtmc.ReadOnly:=flag;
                             dm.QtmzJ.ReadOnly:=flag;


                            end else result:=nil;

  end;
//-----------------------------------------------------------------------
function  tdm.openinvent(const nom:integer;data:boolean):TdataSource;
  var flag:boolean;
      temp:string;
  begin

    dm.Qinvent.Close;
    dm.Qinvent.DeleteVariables;
           if data then
       begin

          temp:=dm.ExecuteSQL('select to_char(data,'+chr(39)+'dd.mm.yyyy'+chr(39)+ ') from tmp.tskladj where tip=1 and nom='+inttostr(nom));
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-9]:='k.ed_izm,';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-7]:='sum(i.KOL_FAKT) KOL_FAKT,i.KOL_SKLAD -sum(i.KOL_FAKT) razn,';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-6]:='i.price PRICE,0 SUM_SKL,0 SUM_FAKT,0 nom,0 id';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-2]:='and j.tip=1 and j.skladid=:sklad and j.nom=i.nom and j.reg=1 and to_char(j.data,'+chr(39)+'dd.mm.yyyy'+chr(39)+ ')=:data';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-4]:='from tmp.tinvent i,tmp.tkatalog k,tmp.tskladj j';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-1]:='group by i.plu,k.name,k.ed_izm,i.kol_sklad,i.price order by k.name';
          dm.Qinvent.DeclareVariable('sklad',otInteger);
          dm.Qinvent.DeclareVariable('data',otString);
            dm.Qinvent.SetVariable('sklad',dmunit.skladtmz);
            dm.Qinvent.SetVariable('data',temp);
       end else
       begin
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-9]:=' i.ed_izm,';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-7]:='i.KOL_FAKT,i.KOL_SKLAD-i.KOL_FAKT razn,';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-6]:='i.PRICE,i.SUM_SKL,i.SUM_FAKT,i.rowid,i.nom,i.id';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-4]:='from tmp.tinvent i,tmp.tkatalog k';
          dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-2]:='and nom=:nom';
           dm.Qinvent.SQL.Strings[dm.Qinvent.SQL.Count-1]:='order by id';

          dm.Qinvent.DeclareVariable('nom',otInteger);
          dm.Qinvent.SetVariable('nom',nom);
       end;
   // dm.addmemo(dm.Qinvent.SQL.Text);
    dm.Qinvent.Open;
    dm.QskladJ.Close;
    dm.QskladJ.SetVariable('nom',nom);
    dm.QskladJ.SetVariable('tip',1);
    dm.QskladJ.Open;
    dmunit.skladnom:=nom;
    dm.Qinvent.ReadOnly:=false;
    if dm.QskladJ.RecordCount>0 then
      begin
          result:=dm.SkladJds;
          If dm.QskladJ.FieldByName('reg').AsInteger=1  then flag:=true else flag:=false;

                             dm.Qinvent.ReadOnly:=flag;
                             dm.QskladJ.ReadOnly:=flag;


                            end else result:=nil;

  end;
//-------------------------------------------------------------------------
function  tdm.OpenPereozenka(const nom:integer):TdataSource;
  var flag:boolean;
  begin
    dm.Qpricej.Close;
    dm.Qpricej.SetVariable('nom',nom);
    dm.Qpricej.Open;
    dm.Qprice.Close;
    dm.Qprice.SetVariable('nom',nom);
    dm.Qprice.Open;
    dmunit.pricenom:=nom;
    dm.Qprice.ReadOnly:=false;
    if dm.Qpricej.RecordCount>0 then
      begin
          result:=dm.prJds;
          If dm.Qpricej.FieldByName('reg').AsInteger=1  then flag:=true else flag:=false;

                             dm.Qpricej.ReadOnly:=flag;
                             dm.Qprice.ReadOnly:=flag;


                            end else result:=nil;

  end;
  //------------------------------------------------------------------------
procedure tdm.openbeznal(const nom:integer);
var temp:Tbprihform;
begin
temp:=Tbprihform.Create(mainform,mainform.mybar);

temp.settip(3,nom);
temp.Show;

end;

  //-------------------------------------------------------------------------

procedure  tdm.openkassprih(const nom:integer);
  var tip:byte;
  begin
If not assigned(kassform)  then
begin
    dm.qkassorder.Close;
    dm.qkassorder.SetVariable('nom',nom);
    dm.qkassorder.Open;
    If dm.qkassorder.RecordCount=0  then exit;
    kassunit.reg:=dm.qkassorder.FieldByName('reg').AsInteger;
    If kassunit.reg=1  then dm.qkassorder.ReadOnly:=true
                                                     else dm.qkassorder.ReadOnly:=false;
     tip:=dm.qkassorder.FieldByName('tip').AsInteger;
     kassform:=tkassform.Create(mainform,mainform.mybar);
     kassunit.tip:=3;
     If tip=2  then  mainform.createrash;


     kassunit.doc:=dm.qkassorder.FieldValues['doc'];
     kassunit.nom:=dm.qkassorder.FieldValues['nom'];
     kassunit.kontragent:=dm.qkassorder.FieldValues['kontragent'];
     with kassform do
     begin
     datadok.DataSource:=dm.kassds;
     datadok.DataField:='data';
     datanakl.DataSource:=dm.kassds;
     datanakl.DataField:='d';
     docnom.DataSource:=dm.kassds;
     docnom.DataField:='nn';
     kontrname.DataSource:=dm.kassds;
     kontrname.DataField:='name';
     tipoplaty.DataSource:=dm.kassds;
     tipoplaty.DataField:='osnov';
     sumedit.DataSource:=dm.kassds;
     sumedit.DataField:='sum';
     nds.DataSource:=dm.kassds;
     nds.DataField:='nds';
     nsp.DataSource:=dm.kassds;
     nsp.DataField:='nsp';
     komment.DataSource:=dm.kassds;
     komment.DataField:='prim';
     end;




end;
  end;
 //-------------------------------------------------------------------------------------
procedure  TDM.insKassa(const kont,nom,tip,doc:integer;data:Tdatetime;osn,prim:string;sum,nds,nsp:double);
  begin
    dm.qInsKas.SetVariable('nom',nom);
    dm.qInsKas.SetVariable('data',data);
    dm.qInsKas.SetVariable('kontragent',kont);
    dm.qInsKas.SetVariable('osnov',osn);
    dm.qInsKas.SetVariable('sum',sum);
    dm.qInsKas.SetVariable('doc',doc);
    dm.qInsKas.SetVariable('nds',nds);
    dm.qInsKas.SetVariable('nsp',nsp);
    dm.qInsKas.SetVariable('tip',tip);
    dm.qInsKas.SetVariable('prim',prim);
    dm.qInsKas.SetVariable('reg',1);
    dm.qInsKas.Execute;
    dm.commit;

  end;

//---------------------------------------------------------------------------------
 procedure TDM.selfrecv(const res:integer);
  begin
  If dm.Qselfrec.State in [dsEdit,dsInsert]  then

   case res of
      1:dm.Qselfrec.Post;
      else dm.Qselfrec.Cancel;

   end;
    mainform.Caption:=dm.qselfrec.FieldValues['name']+' '+
              dm.qselfrec.FieldValues['podrazd']+' Пользователь: '+
              dm.qselfrec.FieldValues['user'];

   if GetSystemMetrics($1000)=1 then mainform.Caption:=
   mainform.Caption+' терминальная сессия' ;

  end;

//---------------------------------------------------------------------
procedure  TDM.addmemo(const Mssage:string);
 begin
 mainform.addmemo(Mssage);
 end;
 //----------------------------------------------------------------------
  procedure TDM.Gettip;
   begin
    dm.Qpostav.Filter:='tip='+inttostr(dmunit.posttip);
    dm.Qpostav.Filtered:=true;

   end;

 //-------------------------------------------------------------------
procedure TDM.RenameTip(const name:string);
  begin
    dm.qTipKontr.Edit;
    dm.qTipKontrNAME.AsString:=name;
    dm.qTipKontr.Post;
    dm.commit;

  end;
//--------------------------------------------------------------

 procedure TDM.insertTip(const name:string);
   var i:integer;
   begin
    i:=0;
    dm.qMaxtip.Execute;
    while not dm.qMaxtip.Eof
    do begin
      i:=dm.qMaxtip.Field('tip');
    dm.qMaxtip.Next;
    end;
    inc(i);
    If i<999  then  dm.ExecuteSQL('insert into tmp.kontrtip  VALUES ('+chr(39)+name+chr(39)+','+inttostr(i)+')');
    dm.commit;
    dm.qTipKontr.Refresh;
   end;

 //--------------------------------------------------------------
function   TDM.findtip(const name:string):integer;
  begin
    If dm.qTipKontr.Locate('name',name,[])  then result:=dm.qTipKontrTIP.Value
    else result:=0;


  end;
//---------------------------------------------------------------
  procedure TDM.RefreshJournal;
     procedure refr(const ds:TOracleDataSet);
      var nom:variant;
        begin
         If ds.Active  then
             begin
              nom:=ds.FieldValues['nom'];
               ds.Refresh;
               ds.Locate('nom',nom,[]);
             end;
         end;

    begin
      refr(dm.qFullj);
      refr(dm.Qprihj);
      refr(dm.Qrashj);
      refr(dm.Qperemj);
      refr(dm.QfsklJ);
     refr(dm.qPEROZj);
    end;
 //----------------------------------------------------------------
   function  TDM.TipNakl(const nom:integer):byte;
    var temp:byte;
    begin
     temp:=0;
      dm.QtipNakl.SetVariable('nom',nom);
      dm.QtipNakl.Execute;
      while not dm.QtipNakl.Eof do
       begin
        temp:=dm.QtipNakl.Field('tip');
        dm.QtipNakl.Next;
       end;
      result:=temp;

    end;

//--------------------------------------------------------------
  function TDM.est:boolean;
  begin
   If dm.Qnakltempostatok.AsFloat<dm.QnakltempKOL_VO.AsFloat
   then result:=true
   else result:=false;


   end;
//----------------------------------------------------------------------
procedure TDM.openperem(const nom,reg:integer);
  var journopen:boolean;
     temp:byte;
  begin
If assigned(naklform)  then naklform.Close;
while  assigned(naklform) do application.ProcessMessages;
If assigned(rashform)  then rashform.Close;
while  assigned(rashform) do application.ProcessMessages;
     If assigned(peremform)  then peremform.Close;;
  while  assigned(peremform) do application.ProcessMessages;
  try
   dmunit.tipdok:=6;
   peremform:=tPeremform.Create(mainform,mainform.mybar);
   temp:=byte(reg) ;
    if temp=0 then
      begin
      dm.UserRights(nom,temp);

      end;
   peremform.reg:=temp;
   dmunit.reg:=temp;
   dmunit.nom:=nom;
   dm.delnakl;
   dm.Qnakltemp.Close;
   dm.QinsperTemp.SetVariable('nom',nom);
   dm.QinsperTemp.Execute;

   dm.commit;
   journopen:=dm.Qperemj.Active;
   if not journopen then  dm.Qperemj.Open;
   If dm.Qperemj.Locate('nom',nom,[])  then
   begin
   peremform.numbered.Text:=dm.QperemjNN.AsString;
   //dmunit.nomerdok:=dm.QperemjNN.AsInteger;
   dmunit.skladin:=dm.QperemjSKLADIN.AsInteger;
   dmunit.sklad:=dm.QperemjSKLADOUT.AsInteger;
   end;
   If not journopen  then dm.Qperemj.Close;

   dm.opentemp(0);
   peremform.Show;
   peremform.OnResize(peremform);
  
   while not dm.Qnakltemp.Active do application.ProcessMessages;
     peremform.getold;
     dm.Qnakltemp.Refresh;
except
  dm.rollback;

end;

 end;
   //---------------------------------------------------------------
procedure TDM.openrashod(const nom,reg,plu:integer);
  var mreg:byte;
      child:TRViewForm;

  begin
     mreg:=reg;
    if mreg<>1 then
              If  (assigned(rashform)) or
                  (assigned(naklform)) or
                  (assigned(peremform)) then  mreg:=1;




    if reg=3 then
              begin
                addmemo('Документ открыт на редактирование');
                mreg:=1;

              end;
   if   mreg<>1 then
    begin
     UserRights(nom,mreg);

    end;




   if mreg=1 then
      begin
      child:=TRViewForm.Create(application,mainform.myBar);
      child.LoadData(nom,plu,reg);
      exit;
     end;



   // If assigned(naklform)   then  exit;
   //  If assigned(rashform)  then rashform.Close;
   //   while  assigned(rashform) do application.ProcessMessages;

    dmunit.tipdok:=4;
    rashform:=tRashform.Create(mainform,mainform.mybar);
    dm.RashNakl(nom,mreg);
    dm.opentemp(plu);
    rashform.Show;
    rashform.OnResize(rashform);

     while not dm.Qnakltemp.Active do application.ProcessMessages;
     rashform.getold;
     dm.RefreshJournal;
    // dm.Qnakltemp.Refresh;
  end;
//--------------------------------------------------------------
procedure TDM.openprihod(const nom,reg,part,plu:integer);
   var mreg:byte;
       child:TViewForm;

   begin
   mreg:=reg;



   if mreg<>1 then
              If  (assigned(rashform)) or
                  (assigned(naklform)) or
                  (assigned(peremform)) then  mreg:=1;
  
   if reg=3 then
              begin
                addmemo('Документ открыт на редактирование');
                mreg:=1;

              end;
    if   mreg<>1 then
    begin
       UserRights(nom,mreg);

    end;
    if mreg=1 then
      begin
      child:=TViewForm.Create(application,mainform.myBar);
      child.LoadData(nom,plu);

      exit;
     end;




   // while  assigned(naklform) do application.ProcessMessages;
    dmunit.tipdok:=2;
     naklform:=Tnaklform.Create(mainform,MainForm.myBar);

     naklform.Caption:='Редактирование Приходной Накладной';
     naklform.osnedit.Text:=string(dm.ExecuteSQL('select prim from tmp.tprihj where nom='+inttostr(nom)));

     dmunit.part:=part;
     dm.PrihNakl(nom,mreg);
     dm.opentemp(plu);
     naklform.Show;
    // naklform.OnResize(nil);

     while not dm.Qnakltemp.Active do application.ProcessMessages;

     naklform.getold;
  //  dm.Qnakltemp.Refresh;

  // showmessage(inttostr(dmunit.sklad));
   end;
//--------------------------------------------------------------
procedure  Tdm.PrintPrihod(const nomb:integer);
begin
 aboutbox.prihnakl.Close;
 aboutbox.prihnakl.SetVariable('nom',nomb);
 aboutbox.prihnakl.open;
 if aboutbox.prihnakl.RecordCount=0 then
 begin
    dm.addmemo(messageunit.m33);
    aboutbox.prihnakl.Close;
    exit;
 end;
 aboutbox.setreport(aboutbox.prihnakl,nil,nil,nil,'\reports\frPrixodnOrderM-4.frf');

end;

//---------------------------------------------------------------
 procedure  TDM.opensklad(const tip,skladid:Integer;kat,name :string);
   var filt:string;
    j:integer;
   procedure wyborkategorii;
   begin
       if kat='%' then
     begin
     dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+kat+chr(39)+ ' where parametr='+chr(39)+'kat'+chr(39));

     end else
     begin
     If AboutBox.Qkat.Active  then  AboutBox.Qkat.Close;
     AboutBox.kkmreport.Close;

     AboutBox.Qkat.SetVariable('name',kat);
     AboutBox.Qkat.Open;

     dm.ExecuteSQL('update tmp.toptions set value='+AboutBox.QkatKAT.AsString+ ' where parametr='+chr(39)+'kat'+chr(39));
     end;
     dm.commit;



   end;
   begin
     filt:='name='+chr(39)+'*'+name+'*'+chr(39);

    case tip of
   1:  begin
    AboutBox.kkmreport.Close;
    about.katvisible:=true;
    j:=AboutBox.kkmreport.SQL.Count;
     AboutBox.kkmreport.SQL.Strings[j-1]:=name;
     wyborkategorii;

     aboutbox.QselKat.Close;

     //AboutBox.kkmreport.SetVariable('kat',AboutBox.QkatKAT.Value);
     aboutbox.setreport(AboutBox.kkmreport,AboutBox.QselKat,nil,nil,'\reports\kkmreport.frf');

     end;

    2:
     begin
         dm.QsumOst.Close;
         dm.qAltOst.Close;
         dm.qsumOst.SetVariable('sklad',skladid);


         if not dm.Qrazdel.Active then dm.Qrazdel.Open;
      if kat='%' then begin

      dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+kat+chr(39)+' where parametr='+chr(39)+'kat'+chr(39));
       dm.commit;


      end else
        if not  dm.Qrazdel.Locate('name',kat,[])  then
      begin
      // dm.qaltost.SetVariable('name','%');
      dm.addmemo('укажите категорию');
      exit;
      end else  begin

      // dm.qAltOst.SetVariable('name',dm.QrazdelKAT.AsInteger);
       dm.ExecuteSQL('update tmp.toptions set value='+dm.QrazdelKAT.AsString+ ' where parametr='+chr(39)+'kat'+chr(39));
       dm.commit;

      end;

         dm.qAltOst.SetVariable('sklad',skladid);
         dm.qAltOst.Filtered:=false;
         dm.QsumOst.Open;
         dm.qAltOst.Open;
     end;
     3:
       begin
           try
       dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-3]:='having sum(k.partost)<>0';

       dm.qinsertkatalog.DeleteVariable('kat');
        if (kat<>'%') and (dm.Qrazdel.Locate('name',kat,[]))
        then begin
           dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-4]:='and t.kat=:kat';
           dm.qinsertkatalog.DeclareVariable('kat',otInteger);
          dm.qinsertkatalog.SetVariable('kat',dm.QrazdelKAT.AsInteger)
             end
        else begin
          if name='' then  dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-4]:=''
                     else dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-4]:=' and t.shtuka=1';
             end;
             dm.qinsertkatalog.SetVariable('nom',dmunit.skladnom);
             dm.qinsertkatalog.SetVariable('sklad',skladid);
             dm.qinsertkatalog.SetVariable('DATA',DMUNIT.DATADOK);
             dm.qinsertkatalog.Execute;
             dm.commit;
             dm.Qinvent.Refresh;
        except
          dm.rollback;
          raise;
        end;

       //    dm.Qostatok.SQL.Strings[12]:='having sum(k.partost)>0';

       end;

        4:
       begin

       try
       dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-3]:='';

       dm.qinsertkatalog.DeleteVariable('kat');
        if (kat<>'%') and (dm.Qrazdel.Locate('name',kat,[]))
        then begin
           dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-4]:='and t.kat=:kat';
           dm.qinsertkatalog.DeclareVariable('kat',otInteger);
          dm.qinsertkatalog.SetVariable('kat',dm.QrazdelKAT.AsInteger)
             end
        else begin
              if name='' then  dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-4]:=''
                     else dm.qinsertkatalog.sql.Strings[dm.qinsertkatalog.sql.Count-4]:=' and t.shtuka=1';
              end;
             dm.qinsertkatalog.SetVariable('nom',dmunit.skladnom);
             dm.qinsertkatalog.SetVariable('sklad',skladid);
             dm.qinsertkatalog.SetVariable('DATA',DMUNIT.DATADOK);
             dm.qinsertkatalog.Execute;
             dm.commit;
             dm.Qinvent.Refresh;
        except
          dm.rollback;
          raise;
        end;



       end;
      5:begin
         wyborkategorii;
        if name='0' then begin
          aboutbox.qpostplu.SQL.Strings[4]:='k.prihod>0 ';
          aboutbox.qpostall.SQL.Strings[4]:='where ';
          aboutbox.qpostallkat.SQL.Strings[5]:='where ';
                         end
         else begin
          aboutbox.qpostplu.SQL.Strings[4]:='k.prihod>0 and t.shtuka=1 ';
          aboutbox.qpostall.SQL.Strings[4]:='where t.shtuka=1 and ';
          aboutbox.qpostallkat.SQL.Strings[5]:='where t.shtuka=1 and ';
              end;
         AboutBox.qpostall.Open;
         aboutbox.qpostallkat.Open;
         aboutbox.setreport(AboutBox.Qpostkat,AboutBox.qpostplu,AboutBox.Qpostavki,AboutBox.Qpostplusum,'\reports\post.frf');
          AboutBox.qpostall.Close;
         aboutbox.qpostallkat.Close;
       end;
    6:begin
       wyborkategorii;
       about.tempdata:=dm.ExecuteSQL('select to_date(('+chr(39)+'+23:59'+chr(39)+ '||value) ,'+chr(39)+'hh24:mi dd.mm.yyyy'+chr(39)+') from tmp.toptions where parametr='+chr(39)+'end'+chr(39));

         AboutBox.nal.Close;

         if name<>'' then AboutBox.nal.SQL.Strings[AboutBox.nal.SQL.Count-3]:='and k.skladid=:skladid having sum(k.sum)<>0'
                     else  AboutBox.nal.SQL.Strings[AboutBox.nal.SQL.Count-3]:='and k.skladid=:skladid';
          AboutBox.nal.SetVariable('skladid',skladid);
          AboutBox.nal.Open;
          aboutbox.setreport(AboutBox.nal,nil,nil,nil,'\reports\nal.frf');

         AboutBox.nal.Close;

     end;

    end;




   end;
//--------------------------------------------------------------
  function  TDM.getreg(const DataSet: TDataSet):integer;
   begin
   result:=dataset.Fields[1].AsInteger;
   end;
//--------------------------------------------------------------
procedure TDM.setnom(const DataSet: TDataSet);
  begin
   dmunit.nom:=dataset.Fields[9].AsInteger;
  end;
  //-----------------------------------------------------------------
     function TDM.Fullostatok(const plu:integer):double;

     begin

       dm.GetFullOst.Close;
       dm.getFullOst.SetVariable('plu',plu);
       dm.GetFullOst.Open;
       result:=dm.GetFullOstOSTATOK.AsFloat;
       dm.GetFullOst.Close;
     end;
  //---------------------------------------------------------------
   //-----------------------------------------------------------------
     function TDM.FullostatokSklad(const plu:integer;const Sklad:integer):double;

     begin

       dm.GetFullOstSklad.Close;
       dm.getFullOstSklad.SetVariable('plu',plu);
       dm.getFullOstSklad.SetVariable('sklad',sklad);

       dm.GetFullOstSklad.Open;
       result:=dm.GetFullOstSkladOSTATOK.AsFloat;
       dm.GetFullOstSklad.Close;
     end;
  //---------------------------------------------------------------







   function TDM.Sumostatok(const plu,sklad:integer;data:Tdatetime):double;

     begin

       dm.GetsumOst.Close;
       dm.getsumOst.SetVariable('plu',plu);
       dm.getsumOst.SetVariable('data',data);
       dm.getsumOst.SetVariable('sklad',sklad);
       dm.GetsumOst.Open;
       result:=dm.GetsumOSTATOK.AsFloat;
       dm.GetsumOst.Close;


     end;






  //---------------------------------------------------------------
   function TDM.ostatok(const plu,sklad:integer;data:Tdatetime):double;

     begin

       dm.GetOst.Close;
       dm.getOst.SetVariable('plu',plu);
       dm.getOst.SetVariable('data',data);
       dm.getOst.SetVariable('sklad',sklad);
       dm.GetOst.Open;
       result:=dm.GetOstOSTATOK.AsFloat;
       dm.GetOst.Close;


     end;
//---------------------------------------------------------------------------
   procedure TDM.updateOst(const kolvo:double;plu,sklad,nom:integer;data:TdateTime) ;
   // var nal:double;
  //  temp:boolean;
    begin
    dm.updateOstatok.SetVariable('prihod',kolvo);
    dm.updateOstatok.SetVariable('plu',plu);
    dm.updateOstatok.SetVariable('data',data);
    dm.updateOstatok.SetVariable('sklad',sklad);
    dm.updateOstatok.SetVariable('nom',nom);
    dm.updateOstatok.Execute;
   { nal:=dm.FullostatokSklad(plu,sklad);
    temp:=dm.tovar.ReadOnly;
    try
    if dm.LocateTovar(plu) then
     begin
     dm.tovar.CommitOnPost:=false;
     if dm.tovar.State<>dsbrowse then dm.tovar.Cancel;
     dm.tovar.ReadOnly:=false;
     dm.tovar.Edit;
     dm.tovarNAL.Value:=nal;
     dm.tovar.Post;


     end;
    finally
     dm.tovar.ReadOnly:=temp;
     dm.tovar.CommitOnPost:=true;

    end;}
    end;
//----------------------------------------------------------------------------
  procedure TDM.setreg(const reg:byte; nom:integer);
     begin
       dm.ExecuteSQL('update tmp.Tprihj set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.Trashj set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.Tperemj set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.Tkassa set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.Tskladj set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.Tpricej set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.Tbeznal set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.KKMj set reg='+inttostr(reg)+' where doc='+inttostr(nom));
       dm.ExecuteSQL('update tmp.actpricej set reg='+inttostr(reg)+' where nom='+inttostr(nom));
       dm.ExecuteSQL('update tmp.tminusj set reg='+inttostr(reg)+' where nom='+inttostr(nom));


     end;
//-----------------------------------------------------------------------------


  //-------------------------------------------------------------------
  procedure TDM.tempPost;
   begin
    If dm.Qnakltemp.State in [dsEdit,dsInsert]  then dm.Qnakltemp.Post;
   end;

//--------------------------------------------------------------
 procedure  TDM.findtovar;
  var temp:string;
     n1,n2:string;
     w1,w2,w3:string;
     i,c,j:integer;
     plu40,plu30: array of integer;

 procedure podbor(const n2:string;
                  const w1:string;
                  const w2:string;
                  const w3:string);
 var n1:string;
 begin

    n1:='*'+w1+'*'+w2+'*'+w3;
    if assigned(kartform) then kartform.NameEdit.Text:=n1;
    dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
   if tovar.RecordCount=0  then
         begin
          n1:='*'+copy(w1,1,3)+'*'+copy(w2,1,4)+'*'+copy(w3,1,4);
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
    if tovar.RecordCount=0  then
         begin
          n1:='*'+w1+'*'+w3+'*'+w2;
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
   if tovar.RecordCount=0  then
         begin
          n1:='*'+copy(w1,1,3)+'*'+copy(w3,1,4)+'*'+copy(w2,1,4);
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
   if tovar.RecordCount=0  then
         begin
          n1:='*'+w1+'*'+w2;
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
   if tovar.RecordCount=0  then
         begin
          n1:='*'+copy(w1,1,3)+'*'+copy(w2,1,4);
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
  if tovar.RecordCount=0  then
         begin
          n1:='*'+w1+'*'+w3;
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
  if tovar.RecordCount=0  then
         begin
          n1:='*'+copy(w1,1,3)+'*'+copy(w3,1,4);
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
   if tovar.RecordCount=0  then
         begin
          n1:='*'+w1;
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;
 if tovar.RecordCount=0  then
         begin
          n1:='*'+copy(w1,1,4);
           if assigned(kartform) then kartform.NameEdit.Text:=n1;
          dm.setfilter('(name='+chr(39)+n1+'*'+chr(39)+') and '+n2);
         end else exit;




end;




  begin
 If dm.Qnakltemp.Active  then
 if assigned(kartform) then  kartform.Caption:=dm.QnakltempNAME.AsString+' '+dm.QnakltempCENAREAL.AsString;
 If dm.Qnakltemp.state=dsbrowse  then
  begin

   dm.nofilter;
   temp:=trimleft(dm.QnakltempNAME.AsString);

   If (dm.QnakltempPLU.AsString<>'0') and

    (dm.LocateTovar(dm.QnakltempPLU.AsInteger))  then exit;

    if not dm.LocateTovar(temp)


       then
       begin
         decimalseparator:='.';
        findcompare.ModifiName(temp);
        findcompare.CreateArray(temp,w1,w2,w3);
        //dm.addmemo(w1);
        //dm.addmemo(w2);
        // dm.addmemo(w3);
       // n1:=FindCompare.CreateFilter(temp);





        if assigned(kartform) then
                               begin
                                kartform.NameEdit.OnChange:=nil;
                                kartform.NameEdit.Text:=n1;
                                kartform.NameEdit.OnChange:=KartForm.NameEditChange;
                                kartform.DBGrid1.DataSource:=nil;
                               end;
        if dm.QnakltempCENAREAL.AsString<>'0' then
        n2:=('(price>'+floattostr(roundto(dm.QnakltempCENAREAL.AsCurrency/1.15,-2))+') and (price<'+floattostr(roundto(dm.QnakltempCENAREAL.AsCurrency*1.25,-2))+')')
        else

       n2:=('(price>'+dm.QnakltempCENASNDS.AsString+') and (price<'+floattostr(roundto(dm.QnakltempCENASNDS.AsCurrency*1.4,-2))+')');
       if AnsiUpperCase(copy(dm.QnakltempED_IZM.AsString,1,2))<>'КГ' then n2:=n2+' and (shtuka=0)'
                                                                     else n2:=n2+' and (shtuka=1)';
       podbor(n2,w1,w2,w3);

       if assigned(kartform) then
                                    begin

                                  kartform.NameEdit.OnChange:=KartForm.NameEditChange;
                                  kartform.DBGrid1.DataSource:=dm.tovds;
                                    end;

        if (tovar.RecordCount=0) and
          (AnsiUpperCase(copy(dm.QnakltempED_IZM.AsString,1,2))='КГZ')
         then
        begin
        i:=0;
        c:=0;
        n1:='(plu=';
       temp:=dm.Qnakltempname.AsString;
        decimalseparator:='.';



       //addmemo(n2);

        dm.Ftovar.Filter:=n2;
        dm.Ftovar.Filtered:=true;
        dm.Ftovar.Open;

       {
      n2:='';
        if pos(' ',temp)>0 then
                 begin
                   n2:=copy(temp,1,pos(' ',temp))+' ';
                    Delete(temp,1,pos(' ',temp));

                 end;
          if pos(' ',temp)>0 then
                 begin
                   n2:=n2+copy(temp,1,pos(' ',temp));


                 end else n2:= n2+temp;
       if n2<>'' then    temp:=n2;    }

        dm.ftovar.First;

        while not dm.ftovar.Eof
        do
            begin
            if   FindCompare.IndistinctMatching(3,temp,dm.ftovarNAME.AsString)>40
              then begin
                    inc(c);
                     setlength(plu40,c);
                     plu40[c-1]:=dm.ftovarPLU.AsInteger;

                   end;


        if   FindCompare.IndistinctMatching(3,temp,dm.ftovarNAME.AsString)>30
              then begin
                    inc(i);
                     setlength(plu30,i);
                     plu30[i-1]:=dm.ftovarPLU.AsInteger;

                   end;
             dm.ftovar.Next;
            end;
         //  dm.tovds.DataSet:=dm.tovar;
         //  dm.barcode.Open;
           
           if c>0 then
              begin
                if high(plu40)>10 then i:=10 else i:=high(plu40);
                for j:=low(plu40) to i do
                   n1:=n1+inttostr(plu40[j])+') or  (plu=';

                   delete(n1,length(n1)-9,10);
                  // addmemo(n1);
                 dm.setfilter(n1);
              end else 


           if i>0 then
              begin
                if high(plu30)>15 then i:=15 else i:=high(plu30);
                for j:=low(plu30) to i do
                   n1:=n1+inttostr(plu30[j])+') or  (plu=';

                   delete(n1,length(n1)-9,10);
                 //  addmemo(n1);
                 dm.setfilter(n1);
              end ;
          plu30:=nil;
          plu40:=nil;
         decimalseparator:=',';
       end;
      end;
     end;
    decimalseparator:=',';
  end;

//-------------------------------------------------------------
   procedure  TDM.RashNakl(const nom,reg:integer);
     begin
       try
       if reg=0 then setreg(3,nom);
       dmunit.reg:=reg;//dm.QprihjREG.AsInteger;
       dm.delnakl;
       dm.insertTempRas.SetVariable('nom',nom{dm.QprihjNOM.AsInteger});
       dm.insertTempRas.Execute;
       dmunit.nom:=nom;//dm.QprihjNOM.AsInteger;
       dm.RefreshJournal;
       dm.commit;
       except
       dm.rollback;
       end;

     end;

 //-------------------------------------------------------------

//-------------------------------------------------------------
   procedure  TDM.PrihNakl(const nom,reg:integer);
     begin
       try

       if reg=0 then setreg(3,nom);

       dmunit.reg:=reg;//dm.QprihjREG.AsInteger;
       dm.delnakl;
       dm.insertTemp.SetVariable('nom',nom{dm.QprihjNOM.AsInteger});
       dm.insertTemp.Execute;
       dmunit.nom:=nom;//dm.QprihjNOM.AsInteger;
       dm.commit;
       dm.RefreshJournal;
       except
       dm.rollback;
       raise;
       end;

     end;

 //------------------------------------------------
 procedure  TDM.PeremJournal(const grid:TDBGrideh);
    begin
    dm.Qperemj.close;
    dm.Qperemj.Open;
    TDBgrideh(grid).DataSource:=dm.peremjds;

     //dmunit.tipdok:=6;
    end;
   //-------------------------------------------------------------
  procedure  TDM.FullJournal(const grid:TDBGrideh);
    begin
   if   dm.Qfullj.Active then dm.RefreshJournal;
     dm.Qfullj.Open;
     TDBgrideh(grid).DataSource:=dm.fulljds;
    //dm.Qperemj.Open;
    //TDBgrideh(grid).DataSource:=dm.peremjds;

   //  dmunit.tipdok:=0;
    end;
 //-------------------------------------------------------------
  procedure  TDM.RashJournal(const grid:TDBGrideh);
    begin
     dm.Qrashj.close;
     dm.Qrashj.Open;
     TDBgrideh(grid).DataSource:=dm.rashjds;
    // dmunit.tipdok:=4;
    end;
 //--------------------------------------------------------------
    procedure  TDM.InvJournal(const grid:TDBGrideh);
    begin
     dm.Qfsklj.Close;
     dm.Qfsklj.Open;
     TDBgrideh(grid).DataSource:=dm.fsklds;
     end;
 //-------------------------------------------------------------
  procedure  TDM.PrihJournal(const grid:TDBGrideh);
    begin
     dm.Qprihj.close;
     dm.Qprihj.Open;
     TDBgrideh(grid).DataSource:=dm.prihjds;
    // dmunit.tipdok:=2;
    end;
   //-------------------------------------------------------------
  procedure TDM.editcena(const x,y:integer);
    var temp:currency;
    begin
    temp:=dm.calc(x,y,dm.QnakltempCENAREAL.AsCurrency);
    If temp=dm.QnakltempCENAREAL.AsCurrency  then exit;
    If dm.Qnakltemp.State=dsBrowse   then dm.Qnakltemp.Edit;
    dm.QnakltempCENAREAL.AsCurrency:=temp;
    end;
//-----------------------------------------------------------


//-------------------------------------------------------------
  procedure TDM.editnds2(const x,y:integer);
    var temp:currency;
    begin
    temp:=dm.calc(x,y,dm.QnakltempCENASNDS.AsCurrency);
    If temp=dm.QnakltempCENASNDS.AsCurrency  then exit;
    If dm.Qnakltemp.State=dsBrowse   then dm.Qnakltemp.Edit;
    dm.QnakltempCENASNDS.AsCurrency:=temp;
    end;
//-----------------------------------------------------------
    procedure  TDM.commit;
      begin
      dm.OraBase.Commit;
      end;
//-------------------------------------------------------------
   procedure TDM.editnewprice(const x,y:integer);
    var temp:currency;
    begin
    temp:=dm.calc(x,y,dm.QpriceNEWPRICE.AsCurrency);
    If temp=dm.QpriceNEWPRICE.AsCurrency  then exit;
    If dm.qprice.State=dsBrowse   then dm.Qprice.Edit;
    dm.QpriceNEWPRICE.AsCurrency:=temp;
    dm.Qprice.Post;
    end;


//-------------------------------------------------------------
  procedure TDM.editnds1(const x,y:integer);
    var temp:currency;
    begin
    temp:=dm.calc(x,y,dm.QnakltempCENABNDS.AsCurrency);
    If temp=dm.QnakltempCENABNDS.AsCurrency  then exit;
    If dm.Qnakltemp.State=dsBrowse   then dm.Qnakltemp.Edit;
    dm.QnakltempCENABNDS.AsCurrency:=temp;
    end;
//-----------------------------------------------------------

 function  TDM.calc(const x,y:integer;init:double):double;
   begin
 try
 result:=0;
 calcform:=Tcalcform.Create(mainform);
 calcform.x:=x;
 calcform.y:=y;
 calcform.init:=init;
 calcform.ShowModal;
 finally
 if assigned(calcform) then result:=calcform.output;
 calcform.Close;
 end;

 {  try
     dmunit.init(application);
     result:=dmunit.Showcalc(x,y,init);
     finally
     dmunit.term;
    end; }
   end;
//-----------------------------------------------------------
function  TDM.showtime:boolean;
begin
  try
   Timeform:=Ttimeform.Create(mainform);
   If Timeform.ShowModal=mrYes  then
    begin
       result:=true;
       dmunit.datadok:=Timeform.datep.Date+StrtoTime(Timeform.timeed.Text);

 //  showmessage(formatdatetime('hh.mi.ss dd.mm.yyyy',dmunit.datadok));

    end else result:=false;
    finally
       Timeform.Close;
    end;
end;
//------------------------------------------------------------
 function  TDM.findpost(const ind:integer):string;
  begin
     dm.postopen;
      If dm.Qpostav.Locate('cod',ind,[])
            then  result:=dm.QpostavNAME.AsString
            else result:=' ';
     dm.postclose;

  end;

//-------------------------------------------------------------

{function  TDM.findpokup(const ind:integer):string;
  begin
     dm.qpokup.Open;
      If dm.qpokup.Locate('cod',ind,[])
            then  result:=dm.qpokupNAME.AsString
            else result:=' ';
     dm.qpokup.Close;

  end;  }
 //-----------------------------------------------------------------
  procedure  TDM.insertrashod(const prim:string);
    var i:currency;
    begin
     i:=0;
   try
           dm.qtotal.Execute;
    while not dm.qtotal.Eof do
     begin
     i:=dm.qtotal.Field('total');
     dm.qtotal.Next;
     end;
    dm.updatetime.SetVariable('data',datadok);
    dm.updatetime.Execute;
   If dmunit.tipdok=4  then begin
    nom:=dmunit.nom;
    dm.ExecuteSQL('delete from tmp.trashnakl where nom='+inttostr(nom));
    dm.ExecuteSQL('delete from tmp.trashj where nom='+inttostr(nom));
  //  part:=dmunit.part;
 end else
  begin
   nom:=dm.newkod('PRIHSEQ');
   //part:=dm.newkod('partseq');
  // dmunit.part:=part;
  end;
    dmunit.nom:=nom;
    dm.qInsertRashod.SetVariable('nom',nom);
    dm.qInsertRashod.SetVariable('DATA',datadok);
    dm.qInsertRashod.SetVariable('POST',0);
    dm.qInsertRashod.SetVariable('SUM',i);
    dm.qInsertRashod.SetVariable('Prim',prim);
    dm.qInsertRashod.SetVariable('POKUP_NAME',dm.findpost(post));
    dm.qInsertRashod.SetVariable('SKLADID',sklad);
    dm.qInsertRashod.SetVariable('POKUP',post);
    dm.qInsertRashod.SetVariable('NN',dmunit.nomerdok);
    dm.qInsertRashod.SetVariable('part',0);
    dm.qInsertRashod.Execute;

    dm.QinsrasNakl.SetVariable('nom',nom);
    dm.QinsrasNakl.SetVariable('nn',dmunit.nomerdok);

    dm.QinsrasNakl.Execute;
    dm.commit;
    if dmunit.tipdok=3 then dmunit.tipdok:=4;
    dm.RefreshJournal;
    izmeneno:=false;
    except
     dm.rollback;
    raise;
    end;
   end;
 //-------------------------------------------------------------
procedure TDM.insertnakl(const Prim:string;const ppost:integer);
   var i:currency;
      nom,part:integer;

   begin
   i:=0;
try

       dm.qtotal.Execute;
    while not dm.qtotal.Eof do
     begin
     i:=dm.qtotal.Field('total');
     dm.qtotal.Next;
     end;
    dm.updatetime.SetVariable('data',datadok);
    dm.updatetime.Execute;
    dm.ExecuteSQL('update tnakltemp set post='+inttostr(dmunit.post));
    dm.ExecuteSQL('update tnakltemp set skladid='+inttostr(dmunit.sklad));
 nom:=0;
 part:=0;   
 If dmunit.tipdok=2  then begin
    nom:=dmunit.nom;

    part:=dmunit.part;
 end;

 If dmunit.tipdok=1  then
  begin
   nom:=dm.newkod('PRIHSEQ');
   part:=dm.newkod('partseq');
   dmunit.part:=part;
  end;
  If dmunit.tipdok>2  then
  begin
    dm.addmemo('ошибка типа документа');
    dm.OraBase.Rollback;
    exit;

  end;
    dm.ExecuteSQL('delete from tmp.tprihnakl where nom='+inttostr(nom));
    dm.ExecuteSQL('delete from tmp.tprihj where nom='+inttostr(nom));
    dmunit.nom:=nom;
    dm.qInsertJournal.SetVariable('nom',nom);
    dm.qInsertJournal.SetVariable('DATA',datadok);
    dm.qInsertJournal.SetVariable('POST',post);
    dm.qInsertJournal.SetVariable('SUM',i);
    dm.qInsertJournal.SetVariable('Prim',prim);
    dm.qInsertJournal.SetVariable('POST_NAME',dm.findpost(post));
    dm.qInsertJournal.SetVariable('SKLADID',sklad);
    dm.qInsertJournal.SetVariable('POKUP',0);
    dm.qInsertJournal.SetVariable('NN',dmunit.nomerdok);
    dm.qInsertJournal.SetVariable('part',part);
    dm.qInsertJournal.SetVariable('ppost',ppost);
    dm.qInsertJournal.Execute;

    dm.qinsertnakl.SetVariable('NN',dmunit.nomerdok);
    dm.qinsertnakl.SetVariable('NOM',NOM);
   // dm.qinsertnakl.SetVariable('PART',PART);
    dm.qinsertnakl.Execute;
    dm.OraBase.Commit;
    dm.RefreshJournal;
    dm.Qnakltemp.Refresh;
  if dmunit.tipdok=1 then dmunit.tipdok:=2;
  izmeneno:=false;
  except
   dm.OraBase.Rollback;
   raise;
 end;
end;
//-----------------------------------------------------------------------
   procedure TDM.insertPerem(const prim:string);
    var nom:integer;
     begin
  try
    If dm.Qnakltemp.State<>dsBrowse then dm.Qnakltemp.Post;
    dm.updatetime.SetVariable('data',dmunit.datadok);
    dm.updatetime.Execute;

 If dmunit.tipdok=6  then begin
    nom:=dmunit.nom;
    dm.ExecuteSQL('delete from tmp.tperemnakl where nom='+inttostr(nom));
    dm.ExecuteSQL('delete from tmp.tperemj where nom='+inttostr(nom));
     end else   nom:=dm.newkod('PRIHSEQ');
    dmunit.nom:=nom;
    dm.QInsertPerem.SetVariable('nom',nom);
    dm.QInsertPerem.SetVariable('skladin',dmunit.skladin);
    dm.QInsertPerem.SetVariable('skladout',dmunit.sklad);
    dm.QInsertPerem.Execute;

    dm.QinsperJ.SetVariable('nn',dmunit.nomerdok);
    dm.QinsperJ.SetVariable('data',dmunit.datadok);
    dm.QinsperJ.SetVariable('nom',nom);
    dm.QinsperJ.SetVariable('prim',prim);
    dm.QinsperJ.SetVariable('skladin',dmunit.skladin);
    dm.QinsperJ.SetVariable('skladout',dmunit.sklad);
    dm.QinsperJ.Execute;
    dm.OraBase.Commit;


  except
   dm.OraBase.Rollback;
    raise;
   end;

     end;
//------------------------------------------------------------
procedure TDM.seteditnakl;
  begin
     if dm.Qnakltemp.State=dsbrowse then dm.Qnakltemp.Edit;

  end;
//------------------------------------------------------------
   function TDM.locatetovar(const name:string):boolean;
    begin
    result:=dm.tovar.Locate('name',name,[loCaseInsensitive, loPartialKey]);


    end;
//-------------------------------------------------------------
  procedure TDM.delnakl;
    begin
      dm.ExecuteSQL('truncate table tnakltemp');

     { try
       dm.ExecuteSQL('delete  from tnakltemp');
       dm.OraBase.Commit;
      except
       dm.OraBase.Rollback;
       raise;
      end;  }
    end;
 //--------------------------------------------------------------
  procedure TDM.inserttovar;

      begin
  //if dm.tovar.RecordCount=0 then exit;
  if dm.Qnakltemp.State=dsBrowse then
     dm.Qnakltemp.Edit;
    
    // dm.Qnakltemp.Fields.Fields[15].Value
     dm.QnakltempPLU.Value:=dm.tovarPLU.Value;
     dm.QnakltempNAME.Value:=dm.tovarNAME.Value;
     dm.QnakltempED_IZM.Value:=dm.tovarED_IZM.Value;
  If not dmunit.edited  then
   begin
     dm.QnakltempMEST.AsInteger:=0;
     dm.QnakltempKOL_UP.Value:=0;
     dm.QnakltempROSSIP.Value:=0;
     dm.QnakltempKOL_VO.Value:=0;
  end;
    If dmunit.tipdok in [1,2]  then
     begin
     dm.QnakltempCENAWZALE.AsCurrency:=dm.tovarPRICE.AsCurrency;
  //If not dmunit.edited  then  dm.QnakltempCENAREAL.AsCurrency:=dm.tovarPRICE.AsCurrency;
     end;
    If dmunit.tipdok in [3,4]  then
     begin
     dm.QnakltempCENASNDS.AsCurrency:=dm.tovarPRICE.AsCurrency;
     //dm.QnakltempCENAREAL.AsCurrency:=dm.tovarPRICE.AsCurrency;
     dm.QnakltempCENAWZALE.AsInteger:=dm.tovarNDS.AsInteger;
     end;
     If dmunit.tipdok in [5,6]  then
     begin
     dm.QnakltempCENAREAL.AsCurrency:=dm.tovarPRICE.AsCurrency;

     end;

   if assigned(naklform) then naklform.Show;
   if assigned(rashform) then rashform.Show;
    if assigned(peremform) then peremform.Show;

  end;
//-------------------------------------------------------------
 Function TDM.setedit:boolean;
   begin
   result:=false;
   If dmunit.tipdok<5  then
    if (dmunit.post=0) or (dmunit.sklad=0) or (dmunit.nomerdok=0) or (dmunit.reg=1)
    then
        begin
        result:=false ;
        dm.Qnakltemp.ReadOnly:=true;
       // if dmunit.reg=0 then dm.addmemo('поставщик,номер документа и склад должны быть заполнены');
        end else
            begin
            result:=true;
            dm.Qnakltemp.ReadOnly:=false;
            end;

    If dmunit.tipdok in [5,6]  then
     if  (dmunit.sklad=dmunit.skladin) or (dmunit.sklad=0) or (dmunit.skladin=0) or(dmunit.nomerdok=0) or (dmunit.reg=1) then
       begin result:=false ;dm.Qnakltemp.ReadOnly:=true;
       end else begin result:=true; dm.Qnakltemp.ReadOnly:=false;end;

   
   end;
//--------------------------------------------------------------

procedure TDM.closetemp;
  begin
  dm.Qnakltemp.Close;

  end;
//---------------------------------------------------------------
procedure TDM.opentemp(const plu:integer);
 begin
izmeneno:=false;
 dm.Qnakltemp.Close;
 dm.Qnakltemp.Open;
 if plu<>0 then dm.Qnakltemp.Locate('plu',plu,[]) else dm.Qnakltemp.Refresh;
 end;
//---------------------------------------------------------------
 procedure TDM.rollback;
  begin
    dm.OraBase.Rollback;
  end;
//-----------------------------------------------------------------
//procedure TDM.addform(const f:tform);
 //  begin
  // mainform.addform(f);
 //  end;
//-----------------------------------------------------------------
//  procedure TDM.delform(const f:tform);
//    begin
   // mainform.delform(f);
//    end;
//-----------------------------------------------------------------
procedure TDM.postopen;
   begin
   dm.Qpostav.Open;
   end;
//-----------------------------------------------------------------
 procedure TDM.postclose;
   begin
   dm.Qpostav.close;
   end;
//-------------------------------------------------------------------
function TDM.FindTPost(const Post:integer):string;
 var temp:string;
      i:integer;
  begin
   temp:='(plu=';
   i:=0;
   dm.QfindPost.Close;
   dm.QfindPost.SetVariable('post',Post);
   dm.QfindPost.Open;
   while not dm.QfindPost.Eof do
     begin
     temp:=temp+dm.QfindPostPLU.AsString+') or (plu=';

     inc(i);
     dm.QfindPost.Next;
     end;
     if i>0 then  begin delete(temp,length(temp)-7,8);
                        result:=temp ;
                        end else result:='';



  end;
//поиск по штрихкоду
function TDM.findkart(const barcode:string):string;
  var temp:string;
      i:integer;
  begin
   temp:='(plu=';
   i:=0;
if copy(barcode,1,2)<>'21' then
  begin
   dm.findplu.SetVariable('barcode',barcode);
   dm.findplu.Execute;
   while not dm.findplu.Eof do
     begin
     temp:=temp+dm.findplu.Field('plu')+') or (plu=';

     inc(i);
     dm.findplu.Next;
     end;
   end else
   begin
    dm.nofilter;

   if dm.LocateTovar(strtoint(copy(barcode,3,5))) then
    begin
    temp:=temp+dm.tovarPLU.AsString+') or (plu=';
    inc(i);
    end;
   end;

     if i>0 then  begin delete(temp,length(temp)-7,8);
                        result:=temp ;
                        end else result:='';


  end;
//------------------------------------------------------

 procedure TDM.openproizw;
   begin
   dm.Qprzwd.Open;
   end;
//-------------------------------------------------------
   procedure TDM.closeproizw;
   begin
   dm.Qprzwd.Close;
   end;

//-------------------------------------------------------
procedure TDM.insbarcode(const kod:string;Const plu:integer);
 begin
   if (plu>0)and (not dm.tovar.ReadOnly) {and (dm.tovarSHTUKA.AsInteger=0)}  then
        begin
         try
         
         dm.qsetbar.SetVariable('plu',plu);
          dm.qsetbar.SetVariable('barcode',kod);
           dm.qsetbar.Execute;
if dm.tovar.State=dsBrowse then

      if dm.LocateTovar(plu) then
        begin
         dm.tovar.Edit;
          // dm.OraBase.Commit;
         if dm.tovarPROIZW.AsInteger=0 then dm.tovarPROIZW.AsString:=copy(kod,1,7);
        end;
         dm.Qprzwd.Open;
         if not dm.Qprzwd.Locate('proizw',copy(kod,1,7),[]) then
            begin
             if dm.Qprzwd.State=dsbrowse then  dm.Qprzwd.Insert;
             dm.QprzwdPROIZW.AsString:=copy(kod,1,7);
             dm.Qprzwd.Post;
            end;
           dm.OraBase.Commit;
           dm.barcode.Master:=nil;
           dm.barcode.Close;
           dm.barcode.SetVariable('plu',PLU);
           dm.barcode.Open;
               if dm.tovarEXPORT.AsInteger=0   then  exit;

               if dm.tovarPRICE.AsCurrency=0 then      exit;

                if (dm.barcode.RecordCount=0)
                and (dm.tovarSHTUKA.AsInteger=0) then    exit;


                dm.InsertPosTovar(dm.tovarPLU.AsInteger,dm.tovarKAT.AsInteger,dm.tovarPROIZW.AsInteger) ;


           except
            dm.OraBase.Rollback;
            end;
         end;
     end;
//---------------------------------------------------------------------
procedure TDM.setwes(const flag:integer);
  begin
   dm.tovar.Filter:='shtuka='+chr(39)+inttostr(flag)+chr(39);
   dm.tovar.Filtered:=true;
  end;
//------------------------------------------------------------
procedure TDM.editkatalog(const flag: boolean);
  begin
  dm.tovar.ReadOnly:=flag;
  
  end;
//-------------------------------------------------------------
  procedure TDM.setfilter(const filter:string);
    begin
      if Filter<>'' then
      begin
      dm.tovar.Filter:=FILTER;
      dm.tovar.Filtered:=true;
    

      end else
      dm.addmemo('Товар не Найден');

    end;
//-------------------------------------------------------------
    procedure TDM.settip(const filter:integer);
    begin
      dm.tovar.Filter:='kat='+chr(39)+inttostr(filter)+chr(39);
      dm.tovar.Filtered:=true;

    end;
//----------------------------------------------------------
    function TDM.getkod:integer;
     begin
     if dm.Qprzwd.Active then result:=dm.QprzwdPROIZW.AsInteger+100
     else result:=0;



     end;
    //--------------------------------------------------------
  procedure TDM.nofilter;
    begin

    if   dm.tovar.SQL.Strings[34]<>''
    then begin
    // dm.tovar.SQL.Strings[26]:='';
     dm.tovar.SQL.Strings[34]:='';
     bookmark:=dm.tovarPLU.AsInteger;
     dm.tovar.Close;
     dm.tovar.Open;

     end else  bookmark:=dm.tovarPLU.AsInteger;
     if assigned(kartform) then kartform.NameEdit.Clear;
      dm.tovar.Filtered:=false;
      DM.tovar.Filter:='';

    end;
//------------------------------------------------------
 procedure TDM.openkatalog;
    begin
   if not dm.tovar.Active then  dm.tovar.Open;

    end;
 //-----------------------------------------------------------------
  procedure TDM.closekatalog;
    begin
    dm.tovar.Close;
    end;
  //----------------------------------------------------------------
  function TDM.getnewplu:string;
   var i:integer;
       block:integer;
      min_new_plu:integer;
   begin
   try
   min_new_plu:=integer(dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'lastplu'+chr(39)))+1;
   block:=integer(dm.ExecuteSQL('select value from tmp.toptions where parametr='+chr(39)+'blockplu'+chr(39)));
   if block=min_new_plu then inc(min_new_plu);
   result:='0';
   dm.tplu.Open;
   dm.plu.Open;
   for i:=min_new_plu to 99999
   do
  begin
   if not plu.Locate('plu',inttostr(i),[]) then
   begin
      If (tplu.Locate('plu',inttostr(i),[])) or
      (tplu.Locate('plu',inttostr(3000000000000+i),[]))  then  continue;
        result:=inttostr(i);
       
       dm.ExecuteSQL('update tmp.toptions set value='+inttostr(i)+' where parametr='+chr(39)+'lastplu'+chr(39));
       dm.ExecuteSQL('update tmp.toptions set value='+inttostr(i)+' where parametr='+chr(39)+'blockplu'+chr(39));

       dm.commit;
        break;
   end;


  end;

    finally
    plu.Close;
    dm.tplu.Close;
   end;
   end;
//--------------------------------------------------------
function TDM.ExecuteSQL(const SQLText: string):variant;
var Q: TOracleQuery;
begin
  Q := TOracleQuery.Create(nil);
  result:=0;
  try

    Q.Session  := OraBase;
   // Q.Cursor   := crSQLWait;
    Q.SQL.Text := SQLText;
    Q.Execute;
  if q.FieldCount>0 then  result:=q.Field(0);
 
  finally
    Q.Free;
  end;
end;
//----------------------------------------------------
 function TDM.locproizw(const barcode:string):boolean;
   var temp :string;
   begin
     case length(barcode) of
     13 : temp:=copy(barcode,1,7);
     12 : temp:=copy(barcode,1,6);
     else  begin result:=false;exit;end;
     end;
     dm.Qprzwd.Filtered:=false;

     if dm.Qprzwd.Locate('proizw',temp,[])
     then result:=true else result:=false;


   end;
 //------------------------------------------------------------
  procedure TDM.setproizw(const kod:integer;const name:string);
   begin
     if dm.tovar.State=dsbrowse then
       dm.tovar.Edit;
       dm.tovarPROIZW.AsInteger:=kod;
      // dm.tovarNAME_1.AsString:=name;
      
   end;
//---------------------------------------------------------
 procedure TDM.locname(const name:string);
  begin
   dm.Qprzwd.Filter:='name='+chr(39)+'*'+name+'*'+chr(39);
   if name<>'' then dm.Qprzwd.Filtered:=true else dm.Qprzwd.Filtered:=false;
   // dm.Qprzwd.Locate('name',name,[loCaseInsensitive, loPartialKey]) ;
  end;
 //-------------------------------------------------------------


procedure TDM.tovarBeforePost(DataSet: TDataSet);
begin
if dm.tovarED_IZM.AsString='кг' then
       dm.tovarSHTUKA.AsInteger:=1
       else dm.tovarSHTUKA.AsInteger:=0;
if  dm.tovarSHTUKA.AsInteger=1
then dm.tovarNSP.AsInteger:=0;


end;

procedure TDM.QrazdelAfterPost(DataSet: TDataSet);
begin
dm.OraBase.Commit;
dm.Qrazdel.Refresh;
end;

procedure TDM.barcodeAfterScroll(DataSet: TDataSet);
begin
{if (qprzwd.Active) and (dm.barcodeBARCODE.AsString<>'')
 // and (copy(dm.barcodeBARCODE.AsString,1,2)<>'21')
 then
   begin
  if copy(dm.barcodeBARCODE.AsString,1,2)<>'21' then begin
   case length(dm.barcodeBARCODE.AsString)
    of 12 : if not qprzwd.Locate('proizw',copy(dm.barcodeBARCODE.AsString,1,6),[]) then qprzwd.Locate('proizw',0,[]);
       13 : if not qprzwd.Locate('proizw',copy(dm.barcodeBARCODE.AsString,1,7),[]) then qprzwd.Locate('proizw',0,[]);
    end;
  end ;


  end;
 }
 end;

procedure TDM.tovarBeforeDelete(DataSet: TDataSet);
begin
//dm.delbar.SetVariable('plu',dm.tovarPLU.AsInteger);
//dm.ExecuteSQL('update pos.tovar set plu=plu+4e12  where plu='+chr(39)+dm.tovarPLU.AsString+chr(39));
// dm.ExecuteSQL('delete from tmp.kniga where otkat=1 and plu='+dm.tovarPLU.AsString);
 //dm.ExecuteSQL('delete from pos.tovar where plu='+dm.tovarPLU.AsString);


if delplu(tovarPLU.AsInteger) then dm.ExecuteSQL('update tmp.toptions set value='+dm.tovarPLU.AsString+' where parametr='+chr(39)+'lastplu'+chr(39));

// dm.delbar.Execute;

end;

procedure TDM.tovarNewRecord(DataSet: TDataSet);
var temp:integer;
begin
temp:=strtoint(dm.getnewplu);
dm.tovarPLU.AsInteger:=temp;
dmunit.BOOKMARK:=temp;
end;

procedure TDM.tovarAfterPost(DataSet: TDataSet);
begin
if assigned(kartform) then
 begin
 kartform.DBEdit10.ReadOnly:=true;
 kartform.DBEdit2.ReadOnly:=true;
kartform.DBEdit3.ReadOnly:=true;


 kartform.tovgrid.Visible:=false;
  kartform.SelTovar.Close;
  dm.ExecuteSQL('update tmp.toptions set value='+inttostr(0)+' where parametr='+chr(39)+'blockplu'+chr(39));
  dm.ExecuteSQL('update pos.caslp set life='+dm.tovarlife.AsString+'   where icode='+dm.tovarPLU.AsString);

 end;
 dm.OraBase.Commit;
dm.tovar.RefreshRecord;
//if dm.tovarKASSA.AsInteger=0 then dm.setfilter('name='+chr(39)+dm.tovarNAME.AsString+chr(39));
//dm.barcode.Close;
//dm.barcode.SetVariable('plu',dm.tovarPLU.AsInteger);
//dm.barcode.Open;
if dm.barcode.Master=nil then dm.barcode.Master:=dm.tovar;
dm.barcode.Close;
dm.barcode.Open;
if dm.tovarPRICE.Value=0 then
begin
dm.addmemo('Цена равна нулю');
dm.tovar.Edit;
end else
begin
//dm.tovar.Refresh;
tovargetmark;
end;
end;

procedure TDM.tovarAfterEdit(DataSet: TDataSet);
//var user:string;
begin
if (dm.tovarPRICE.AsCurrency=0) or (dm.tovarKASSA.AsInteger=-1) then
  if assigned(kartform) then kartform.DBEdit10.ReadOnly:=false;
 //user:=string(dm.ExecuteSQL('select upper(user) from dual'));
  if {(user='ALEX') and }(assigned(kartform))  then
    begin
      kartform.DBEdit2.ReadOnly:=false;
      kartform.DBEdit3.ReadOnly:=false;

    end;
 bookmark:=dm.tovarPLU.AsInteger;
end;
//----------------------------------------------------------------------
procedure tdm.tovargetmark;
 begin
 dm.LocateTovar(bookmark);
 end;
//----------------------------------------------------------------------
procedure TDM.delbarcode;
  begin
  If dm.barcode.RecordCount<>0  then
  begin
  dm.barcode.Delete;
  dm.tovar.Edit;
 end;
  end;

//_________________________________________________________________________
 procedure TDM.tovarAfterCancel(DataSet: TDataSet);
begin
if dm.barcode.Master=nil then dm.barcode.Master:=dm.tovar;

dm.barcode.Close;
dm.barcode.Open;
dm.OraBase.Rollback;
if assigned(kartform) then
 begin
 kartform.DBEdit10.ReadOnly:=true;
 kartform.tovgrid.Visible:=false;
 kartform.SelTovar.Close;
   dm.ExecuteSQL('update tmp.toptions set value='+inttostr(0)+' where parametr='+chr(39)+'blockplu'+chr(39));
  dm.commit;
 end;


end;
//---------------------------------------------------------------------------
procedure TDM.createproizw(const barcode:string);
  begin
    if (dm.Qprzwd.State=dsbrowse) and (copy(barcode,1,2)<>'21') then
     begin
       dm.Qprzwd.Insert;
       case length(barcode) of
        13 : dm.QprzwdPROIZW.AsInteger:=strtoint(copy(barcode,1,7));
        12 : dm.QprzwdPROIZW.AsInteger:=strtoint(copy(barcode,1,6));
        else dm.Qprzwd.Cancel;
       end;
      if dm.Qprzwd.State=dsInsert then dm.Qprzwd.post;
     end;
  end;
//--------------------------------------------------------------------------
 function TDM.newbarcode:string;
   var kod,barcod:shortstring;
   begin
    kod:='22';
    result:='0';
    if dm.tovarPROIZW.AsString='0' then
       begin
        result:='Присвойте Производителя !';
        exit;
       end;
   if dm.tovarSHTUKA.AsInteger=1 then
       begin
       kod:='21';
        //result:='Для Весового Товара Штрихкод не нужен.';
        //exit;

       end else

    case length(dm.tovarPROIZW.AsString) of
      1: kod:=kod+'0000'+dm.tovarPROIZW.AsString;
      2: kod:=kod+'000'+dm.tovarPROIZW.AsString;
      3: kod:=kod+'00'+dm.tovarPROIZW.AsString;
      4: kod:=kod+'0'+dm.tovarPROIZW.AsString;
      5: kod:=kod+dm.tovarPROIZW.AsString;
      6: kod:=kod+copy(dm.tovarPROIZW.AsString,2,5);
      7: kod:=kod+copy(dm.tovarPROIZW.AsString,3,5);

      else begin
        result:='Код Производителя больше 7 знаков';
        exit;
      end;
    end;
    case length(dm.tovarPLU.AsString) of
      1:kod:=kod+'0000'+dm.tovarPLU.AsString;
      2:kod:=kod+'000'+dm.tovarPLU.AsString;
      3:kod:=kod+'00'+dm.tovarPLU.AsString;
      4:kod:=kod+'0'+dm.tovarPLU.AsString;
      5:kod:=kod+dm.tovarPLU.AsString;
     else begin
        result:='Код Товара больше 5 знаков';
        exit;
     end;
    end;
    if length(kod)=7 then kod:=kod+'00000';

    barcod:=barcodeunit.CalcBar(kod);
    if barcod<>'error' then dm.insbarcode(barcod,dm.tovarPLU.AsInteger);

   end;
//--------------------------------------------------------------------------
procedure TDM.QprzwdNewRecord(DataSet: TDataSet);
begin
  dm.QprzwdPROIZW.AsInteger:=strtoint(dm.getnewproizw);


end;
//--------------------------------------------------------------------------
 function TDM.getnewproizw:string;
    var i:integer;
    begin
      result:='error';
      i:=dm.newkod('proizseq');
      if i<>0 then
        begin
         case length(inttostr(i)) of
           1:result:='220000'+inttostr(i);
           2:result:='22000'+inttostr(i);
           3:result:='2200'+inttostr(i);
           4:result:='220'+inttostr(i);
           5:result:='22'+inttostr(i);
          end;

        end;
     end;
//----------------------------------------------------------------------
  function TDM.newkod(const sequence:string):integer;
     begin
       result:=0;
       dm.kodproizw.SQL.Text:='select tmp.'+sequence+'.nextval kod  from dual';
       dm.kodproizw.Execute;
      while not dm.kodproizw.Eof do
       begin
       result:=dm.kodproizw.Field('kod');
       dm.kodproizw.Next;
       end;

     end;
 //----------------------------------------------------------------------
procedure TDM.QpostavNewRecord(DataSet: TDataSet);
begin
  dmunit.posttip:=1;
  dm.QpostavCOD.AsInteger:=dm.newkod('postseq');
  dm.QpostavDATE_ZAP.AsDateTime:=date;
  dm.QpostavTIP.Value:=dmunit.posttip;
 end;
//----------------------------------------------------------------------
  procedure TDM.UpdateRashPart(const plu,rash:integer);
   var nom,part:integer;
       kolvo:double;
         sep:char;

  begin

    sep:=DecimalSeparator;
    DecimalSeparator:='.';
    dm.QselRashod.SetVariable('plu',plu);
    dm.QselRashod.SetVariable('rash',rash);
    dm.QselRashod.Execute;
   try
    while not dm.QselRashod.Eof do
    begin
     nom:=dm.QselRashod.Field('nom');
    // id:=dm.QselRashod.Field('id');
     part:=dm.QselRashod.Field('partia');
     kolvo:=dm.QselRashod.Field('kolvo');
// dm.addmemo(dm.ExecuteSQL('select count(1) from tmp.kniga  where nom='+inttostr(nom)+' and prihod>0 and plu='+inttostr(plu)+' and partia='+inttostr(part) )
// );
   if dm.ExecuteSQL('select count(1) from tmp.kniga  where nom='+inttostr(nom)+' and prihod>0 and plu='+inttostr(plu)+' and partia='+inttostr(part) )
   = 0 then

   begin
    dm.addmemo('период поставок закрыт.отмена невозможна.');
    abort;
   end;


 //   dm.addmemo('update tmp.kniga set partost=partost+'+floattostr(kolvo)+' where nom='+inttostr(nom)+' and prihod>0 and plu='+inttostr(plu) );
    dm.ExecuteSQL('update tmp.kniga set partost=partost+'+floattostr(kolvo)+' where nom='+inttostr(nom)+' and prihod>0 and plu='+inttostr(plu)+' and partia='+inttostr(part) );

     dm.QselRashod.Next;
    end;

   dm.ExecuteSQL('delete from tmp.tpart where nomrash='+inttostr(rash)+' and plu='+inttostr(plu));//+' and id='+floattostr(id));



   finally
   DecimalSeparator:=sep;
   end;
   end;
//----------------------------------------------------------------------
procedure TDM.DataModuleCreate(Sender: TObject);
begin

//dm.Qprovodka.DeclareVariable('sum',otFloat);
//dm.Qprovodka.DeclareVariable('partost',otFloat);
//dm.getOstatok.DeclareVariable('data',otDate);
dm.QpartOst.DeclareVariable('plu',otInteger);
dm.QpartOst.DeclareVariable('data',otDate);
dm.QpartOst.DeclareVariable('sklad',otInteger);
dm.QInsertPart.DeclareVariable('nomrash',otInteger);
dm.QselRashod.DeclareVariable('plu',otInteger);
dm.QselRashod.DeclareVariable('rash',otInteger);
dm.QfindPost.DeclareVariable('post',otInteger);
dm.qinsertnakl.DeclareVariable('nn',otInteger);
dm.DeletePlu.DeclareVariable('plu',otString);
//end;
end;
//-----------------------------------------------------------------------
procedure TDM.setperiod(const bg,ed:shortstring;const sklad:integer=1;const report:boolean=false);
  begin
      try
      if not report then
      begin
        dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+bg+chr(39)+' where parametr='+chr(39)+'begin'+chr(39)) ;
        dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+ed+chr(39)+' where parametr='+chr(39)+'end'+chr(39)) ;
      end
      else begin
        dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+bg+chr(39)+' where parametr='+chr(39)+'from'+chr(39)) ;
        dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+ed+chr(39)+' where parametr='+chr(39)+'to'+chr(39)) ;


           end;
        dm.ExecuteSQL('update tmp.toptions set value='+chr(39)+inttostr(sklad)+chr(39)+' where parametr='+chr(39)+'sklad'+chr(39)) ;

        dm.OraBase.Commit;
      except
        dm.OraBase.Rollback;
      end;
  end;
//-----------------------------------------------------------------------
{procedure TDM.qpokupNewRecord(DataSet: TDataSet);
begin
  dm.qpokupCOD.AsInteger:=dm.newkod('pokupseq');
  dm.qpokupDATE_ZAP.AsDateTime:=date;
end;}
//----------------------------------------------------------------------------
procedure TDM.QnakltempNewRecord(DataSet: TDataSet);
begin

dm.QnakltempID.AsInteger:=dm.newkod('tempseq');
dm.QnakltempNN.Value:=dmunit.nomerdok;
dm.QnakltempPOST.Value:=dmunit.post;
dm.QnakltempDATA.Value:=dmunit.datadok;
dm.QnakltempPOKUP.Value:=0;
dm.QnakltempSKLADID.Value:=dmunit.sklad;
end;
//-------------------------------------------------------------------------
procedure TDM.QprzwdAfterOpen(DataSet: TDataSet);
begin
dm.barcode.AfterScroll(nil);
end;
//--------------------------------------------------------------------------
procedure TDM.QnakltempBeforePost(DataSet: TDataSet);
begin
if   dmunit.tipdok<5 then
begin
if  (dm.QnakltempKOL_VO.AsFloat>0) and
   (dm.QnakltempTOTAL.AsCurrency>0) and
   (dm.QnakltempCENABNDS.AsCurrency=0) and
    (dm.QnakltempCENASNDS.AsCurrency=0)
   and (dmunit.tipdok<5)
   then dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempTOTAL.AsCurrency/dm.QnakltempKOL_VO.AsFloat,-2);



 if (dm.QnakltempPLU.AsString<>'0') and (dm.LocateTovar(dm.QnakltempPLU.AsInteger))
 then begin
      if (dm.QnakltempCENABNDS.AsString='') or (dm.QnakltempCENABNDS.AsString='0') then
        begin
        case dm.tovarNDS.AsInteger of
        0:dm.QnakltempCENABNDS.AsCurrency:=dm.QnakltempCENASNDS.AsCurrency;
        10:dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/1.1,-2);
        20:dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/1.2,-2);
        else dm.QnakltempCENABNDS.AsCurrency:=roundto(dm.QnakltempCENASNDS.AsCurrency/(1+(dm.tovarNDS.AsInteger/100)),-2);
        end;
      end;

   if (dm.QnakltempCENASNDS.AsString='') or (dm.QnakltempCENASNDS.AsString='0') then
    begin
    case dm.tovarNDS.AsInteger of
    0: dm.QnakltempCENASNDS.AsCurrency:=dm.QnakltempCENABNDS.AsCurrency;
    10: dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempCENABNDS.AsCurrency*1.1,-2);
    20: dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempCENABNDS.AsCurrency*1.2,-2);
    else dm.QnakltempCENASNDS.AsCurrency:=roundto(dm.QnakltempCENABNDS.AsCurrency*(1+(dm.tovarNDS.AsInteger/100)),-2);
        end;
    end;

 end;
end;
If dm.QnakltempLIFE.Value=0 then
begin
if (dm.LocateTovar(dm.QnakltempPLU.AsInteger))
and (dm.tovarLIFE.AsInteger<>0)  then
 dm.QnakltempLIFE.Value:=dmunit.datadok+dm.tovarLIFE.AsInteger;




end;
If dmunit.tipdok in [1,2,3,4]  then
 begin
   
    dm.QnakltempTOTAL.AsCurrency:=dm.QnakltempKOL_VO.AsFloat*dm.QnakltempCENASNDS.AsCurrency;
 end;
If dmunit.tipdok in [5,6]  then  begin
dm.QnakltempKOL_VO.AsFloat :=dm.QnakltempMEST.AsFloat*dm.QnakltempKOL_UP.AsFloat+dm.QnakltempROSSIP.AsFloat;
dm.QnakltempTOTAL.AsCurrency:=dm.QnakltempKOL_VO.AsFloat*dm.QnakltempCENASNDS.AsCurrency;
end;
dm.QnakltempNN.Value:=dmunit.nomerdok;
dm.QnakltempPOST.Value:=dmunit.post;
dm.QnakltempDATA.Value:=dmunit.datadok;
dm.QnakltempSKLADID.Value:=dmunit.sklad;

end;

procedure TDM.QnakltempAfterPost(DataSet: TDataSet);
var ID:integer;
begin
  TOracleDataSet(DataSet).RefreshRecord;
  izmeneno:=true;
  if ir then
begin
  id:=dm.QnakltempID.AsInteger;
  dm.Qnakltemp.Refresh;
  dm.Qnakltemp.Locate('id',id,[]);
  ir:=false;
  end;
end;

procedure TDM.QnakltempAfterOpen(DataSet: TDataSet);
begin
If dmunit.reg=1   then dm.Qnakltemp.ReadOnly:=true
                  else dm.Qnakltemp.ReadOnly:=false;
if dm.QnakltempNN.AsString<>'' then
  begin
If dmunit.tipdok in [1,2]  then
   begin
    dm.Qpostav.Open;
    if  dm.Qpostav.Locate('cod',dm.QnakltempPOST.AsInteger,[]) then
    begin
    dmunit.postname:=dm.QpostavNAME.AsString;
    dmunit.post:=dm.QnakltempPOST.AsInteger;
   end;
  dmunit.sklad:=dm.QnakltempSKLADID.AsInteger;
end;
If dmunit.tipdok in [3,4]  then
  begin
   dm.Qpostav.Open;
   if  dm.Qpostav.Locate('cod',dm.QnakltempPOST.AsInteger,[]) then
   begin
   dmunit.postname:=dm.QpostavNAME.AsString;
   dmunit.post:=dm.QnakltempPOST.AsInteger;
   end;
   dmunit.sklad:=dm.QnakltempSKLADID.AsInteger;
end;
If dmunit.tipdok in [5,6]  then
  begin
   dm.qsklad.Open;
   If dm.qsklad.Locate('skladid',dmunit.sklad,[])  then
    dmunit.postname:=dm.qskladSKLAD.AsString;
   //dmunit.sklad:=dm.QnakltempSKLADID.AsInteger;
   dmunit.postname:='Перемещение';
   dmunit.post:=0;
end;



   dmunit.datadok:=dm.QnakltempDATA.AsDateTime;
   dmunit.nomerdok:=dm.QnakltempNN.AsInteger;

   end;
end;

procedure TDM.QprihjBeforeOpen(DataSet: TDataSet);
begin
//dm.addmemo(datetostr(dmunit.pbegin));
//dm.addmemo(datetostr(dmunit.pend));

TOracleDataSet(dataset).SetVariable('begin',dmunit.pbegin);
TOracleDataSet(dataset).SetVariable('end',dmunit.pend);

end;

procedure TDM.QnakltempCalcFields(DataSet: TDataSet);
begin
if dmunit.tipdok in [3,4,5,6]   then dm.Qnakltempostatok.AsFloat:=dm.ostatok(dm.QnakltempPLU.AsInteger,dmunit.sklad,dmunit.datadok)
else  dm.Qnakltempostatok.AsFloat:=0;
dm.QnakltempPtotal.AsCurrency:=dm.QnakltempKOL_VO.Value*dm.QnakltempCENAREAL.AsCurrency;
  // if dm.Qnakltemp.Bof then row:=dm.QnakltempID.AsInteger;
//  dm.Qnakltemprow.Value:= dm.QnakltempID.AsInteger-row+1;

//dm.Qnakltempostatok.AsFloat:=dm.ostatok(dm.QnakltempPLU.AsInteger,dmunit.sklad,dmunit.datadok);
end;

procedure TDM.getOstatokBeforeQuery(Sender: TOracleQuery);
begin
ToracleQuery(sender).SetVariable('sklad',dmunit.sklad);
end;

procedure TDM.tovarAfterDelete(DataSet: TDataSet);
begin
if dm.barcode.Master=nil then dm.barcode.Master:=dm.tovar;

dm.commit;
end;

procedure TDM.QselfrecAfterEdit(DataSet: TDataSet);
begin
dm.Qselfrec.FieldByName('date_zap').AsDateTime:=date;
end;

procedure TDM.QinventNewRecord(DataSet: TDataSet);
begin
TOracleDataSet(DataSet).FieldByName('nom').AsInteger:=dmunit.skladnom;
end;

procedure TDM.QinventBeforePost(DataSet: TDataSet);
begin
dm.QinventSUM_FAKT.AsCurrency:=dm.QinventPRICE.AsCurrency*dm.QinventKOL_FAKT.Value;
dm.QinventSUM_SKL.AsCurrency:=dm.QinventPRICE.AsCurrency*dm.QinventKOL_SKLAD.Value;
end;

procedure TDM.QtmcNewRecord(DataSet: TDataSet);
begin
TOracleDataSet(DataSet).FieldByName('nom').AsInteger:=dmunit.tmznom;
end;

procedure TDM.QostatokBeforeOpen(DataSet: TDataSet);
begin
 TOracleDataSet(DataSet).SetVariable('data',dmunit.datadok);
end;

procedure TDM.QtmcBeforePost(DataSet: TDataSet);
begin
dm.QtmcSUM_FAKT.AsCurrency:=dm.QtmcPRICE.AsCurrency*dm.QtmcKOL_FAKT.AsFloat;
end;

procedure TDM.QsumOstBeforeOpen(DataSet: TDataSet);
begin
TOracleDataSet(dataset).SetVariable('end',dmunit.pend);
end;

procedure TDM.QpriceNewRecord(DataSet: TDataSet);
begin
TOracleDataSet(DataSet).FieldByName('nom').AsInteger:=dmunit.pricenom;
end;

procedure TDM.QpriceBeforePost(DataSet: TDataSet);
begin
if dm.QpriceNEWPRICE.AsCurrency=0 then
  begin
   dm.nofilter;
    if dm.LocateTovar(dm.QpricePLU.AsFloat)
       then dm.QpriceNEWPRICE.AsCurrency:=dm.tovarPRICE.AsCurrency;
    dm.addmemo('Новая цена товара '+dm.tovarNAME.Value+' не может быть равна нолю.');

  end;
 if dm.QpriceKOLVO.AsFloat<0 then dm.QpriceKOLVO.AsFloat:=0;
  dm.QpriceSUM.AsCurrency:=(dm.QpriceNEWPRICE.AsCurrency-dm.QpriceOLDPRICE.AsCurrency)*dm.QpriceKOLVO.AsFloat;


 end;

procedure TDM.QnakltempBeforeEdit(DataSet: TDataSet);
begin
 If (dm.QnakltempKOL_VO.AsFloat<>0) or (dm.QnakltempROSSIP.AsFloat<>0)  then dmunit.edited:=true
                                        else dmunit.edited:=false;

//
end;

procedure TDM.QnakltempBeforeInsert(DataSet: TDataSet);
begin
dmunit.edited:=false;
end;

procedure TDM.tovarAfterOpen(DataSet: TDataSet);
begin
if not assigned(kartform) then
                 
begin

 if not dm.locatetovar(0) 
then
begin
dm.ExecuteSQL('insert into tmp.tkatalog (plu,name,price) values (0,'+chr(39)+'не введен'+chr(39)+',0)');
dm.commit;
end;
{ dm.setfilter('((price<>wesy) and (wesy>0)) or ((kassa<>price) and (kassa<>-1))');
if dm.tovar.RecordCount>0
then dm.addmemo('Разные цены у '+inttostr(dm.tovar.RecordCount)+' товаров');
dm.nofilter;}
end;
end;

procedure TDM.tovarBeforeEdit(DataSet: TDataSet);
begin
dm.tovar.RefreshRecord;
end;

procedure TDM.barcodeBeforePost(DataSet: TDataSet);
begin


if (length(dm.barcodeBARCODE.AsString)=13) and
 (not barcodeunit.Testbar(dm.barcodeBARCODE.AsString)) then
  begin
   dm.addmemo(messageunit.m29);
   dm.barcode.Cancel;

  end;

end;

procedure TDM.barcodeBeforeEdit(DataSet: TDataSet);
begin

dm.tovar.Edit;
end;

procedure TDM.tovarDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
dm.OraBase.Rollback;
end;

procedure TDM.barcodeAfterInsert(DataSet: TDataSet);
begin
{if dm.barcode.RecordCount=0 then
begin
dm.addmemo('Нажмите новый штрихкод');
dm.barcode.Cancel;
end; }
end;

procedure TDM.barcodeNewRecord(DataSet: TDataSet);
begin
dm.barcodePLU.AsInteger:=dm.tovarPLU.AsInteger;
end;

procedure TDM.tovarAfterScroll(DataSet: TDataSet);
begin
if assigned(kartform) then kartform.ExpBut.Enabled:=true;
end;

procedure TDM.tovarAfterInsert(DataSet: TDataSet);
begin
if assigned(kartform) then
begin
kartform.DBEdit10.ReadOnly:=false;
kartform.DBEdit2.ReadOnly:=false;
kartform.DBEdit3.ReadOnly:=false;

end;
 selform:=Tselform.Create(kartform);
 selform.Caption:='Категории Товаров';
 selform.DBGrid1.DataSource:=dm.razdds;
 try

   if selform.ShowModal<>mrCancel then
        begin
          // newkat:=selform.ModalResult-20;


          dm.tovarkat.AsInteger:=selform.ModalResult-20;
          


       end
    else  exit;


 finally
  selform.Free;
  selform:=nil;
 end;



end;

procedure TDM.tovarEXPORTChange(Sender: TField);
begin
 if dm.tovarEXPORT.AsInteger=1 then
 begin
  if assigned(kartform) then
  kartform.ExpBut.Click;


 end else
 begin
  try
  // dm.ExecuteSQL('update pos.tovar set plu=plu+4e12 where plu='+dm.tovarPLU.AsString);
     dm.ExecuteSQL('delete from pos.tovar where plu='+dm.tovarPLU.AsString);

   dm.commit;
   //dm.addmemo(' касс');
   except
   dm.rollback;
   end; 


 end;
end;

procedure TDM.QtmcAfterPost(DataSet: TDataSet);
begin
TOracleDataSet(DataSet).RefreshRecord;
end;

procedure TDM.QinventAfterPost(DataSet: TDataSet);
var id:variant;
begin
TOracleDataSet(DataSet).RefreshRecord;
id:=TOracleDataSet(DataSet).FieldValues['id'];
TOracleDataSet(DataSet).Refresh;
TOracleDataSet(DataSet).Locate('id',id,[]);
end;

 procedure TDM.UserRights(const nom:integer;var mreg:byte);
 { var   user,docowner:string;   }
   begin
{    user:=string(dm.ExecuteSQL('select upper(user) from dual'));
    docowner:=string(dm.ExecuteSQL('select upper(owner) from tmp.vfulljourn where nom='+inttostr(nom)));
    if (user<>'ALEX') and (user<>docowner) then mreg:=1;   }
   end;

procedure TDM.QnakltemprowGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
text:=inttostr(dm.Qnakltemp.RecNo);


end;

{--------------------------------------------------------------------}
function TDM.PriceFromDate(const plu:integer;const data:Tdatetime):currency;
 begin


 result:=0;
if data>=date then
    begin
     dm.LocateTovar(plu);
     result:=dm.tovarPRICE.AsCurrency;
     exit;
    end;
 with dm.QpriceData do
  begin
   close;
   SetVariable('data',data);
   SetVariable('plu',plu);
   open;
   if recordcount>0 then result:=FieldValues['price'];
   close;
 end;
end;









initialization

sortkat:=true;
nameed:=false;
ShortTimeFormat:='hh:mm';
end.
