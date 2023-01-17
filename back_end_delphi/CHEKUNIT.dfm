object CHEKFORM: TCHEKFORM
  Left = 310
  Top = 166
  BorderStyle = bsToolWindow
  Caption = 'CHEKFORM'
  ClientHeight = 446
  ClientWidth = 469
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 469
    Height = 406
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 469
      Height = 406
      Align = alClient
      Ctl3D = False
      DataSource = chDs
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 406
    Width = 469
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 16
      Width = 65
      Height = 24
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 136
      Top = 0
      Width = 31
      Height = 13
      Caption = 'Label1'
      Visible = False
    end
    object movbut: TSpeedButton
      Left = 64
      Top = 16
      Width = 69
      Height = 24
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077
      Visible = False
      OnClick = movbutClick
    end
  end
  object SaleReport: TOracleDataSet
    SQL.Strings = (
      'select  (to_char(data,'#39'dd.mm.yyyy'#39')) data1,'
      #9'PRICE ,'
      #9'count(1) count1,'
      #9'sum(quantity) sumkolvo,'
      #9'sum(sum) sumall '
      'from pos.arc_report'
      'where id in (11,12)'
      '--and stornoflag=999'
      'and plu=:plu'
      
        'and data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toption' +
        's where parametr='#39'begin'#39')'
      
        'and data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yyy' +
        'y'#39') from tmp.toptions where parametr='#39'end'#39')'
      'group by  to_char(data,'#39'dd.mm.yyyy'#39'),PRICE'
      'having sum(quantity)<>0'
      'ORDER BY TO_DATE( to_char(data,'#39'dd.mm.yyyy'#39'))')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000000100000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000005000000040000004441544101000000000500000050524943450100
      00000005000000434F554E5401000000000800000053554D4B4F4C564F010000
      00000600000053554D414C4C0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = SaleReportBeforeOpen
    AfterOpen = SaleReportAfterOpen
    Left = 32
    Top = 24
    object SaleReportDATA: TStringField
      DisplayLabel = #1076#1072#1090#1072
      FieldName = 'DATA1'
      Size = 10
    end
    object SaleReportPRICE: TFloatField
      DisplayLabel = #1094#1077#1085#1072
      FieldName = 'PRICE'
      currency = True
    end
    object SaleReportCOUNT: TFloatField
      DisplayLabel = #1095#1077#1082#1080
      FieldName = 'COUNT1'
    end
    object SaleReportSUMKOLVO: TFloatField
      DisplayLabel = #1082#1086#1083'_'#1074#1086
      FieldName = 'SUMKOLVO'
    end
    object SaleReportSUMALL: TFloatField
      DisplayLabel = #1089#1091#1084#1084#1072
      FieldName = 'SUMALL'
      currency = True
    end
  end
  object chDs: TDataSource
    DataSet = SaleReport
    Left = 128
    Top = 24
  end
  object PrintDB: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = []
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 176
    Top = 24
  end
  object postReport: TOracleDataSet
    SQL.Strings = (
      
        'select nvl(to_char(sj.nom),(nvl(to_char(j.nn),('#39#1072#1087' '#8470#39'||to_char(a' +
        '.nom))))) nn'
      ' ,(to_char(k.data,'#39'dd.mm.yyyy'#39')) ,k.cena,'
      'sum(k.prihod) KOL_VO,k.partost,k.nom,s.sklad'
      
        ' from tmp.kniga k,tmp.tsklad s,tmp.tprihj j,tmp.actpricej a,tmp.' +
        'tskladj sj'
      'where '
      'k.otkat=0 '
      'and k.nom=j.nom(+)'
      'and k.nom=a.nom(+) '
      'and k.nom=sj.nom(+)'
      'and k.prihod>0'
      'and k.skladid=s.skladid'
      'and k.plu=:plu'
      
        '--and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.top' +
        'tions where parametr='#39'begin'#39')'
      
        '--and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm' +
        '.yyyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      
        'group by  nvl(to_char(sj.nom),(nvl(to_char(j.nn),('#39#1072#1087' '#8470#39'||to_cha' +
        'r(a.nom))))) ,to_char(k.data,'#39'dd.mm.yyyy'#39'),k.cena,k.partost,k.no' +
        'm,s.sklad'
      'ORDER BY TO_DATE( to_char(k.data,'#39'dd.mm.yyyy'#39'))')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C550300000004000000C00B010000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      03000000070000000400000043454E410100000000060000004B4F4C5F564F01
      0000000007000000504152544F53540100000000030000004E4F4D0100000000
      1E00000028544F5F43484152284B2E444154412C2744442E4D4D2E5959595927
      2929010000000005000000534B4C41440100000000020000004E4E0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = SaleReportBeforeOpen
    AfterOpen = SaleReportAfterOpen
    Left = 32
    Top = 64
    object postReportNN: TStringField
      DisplayLabel = #1085#1086#1084#1077#1088
      FieldName = 'NN'
      Size = 10
    end
    object postReportTO_CHARDATADDMMYYYY: TStringField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = '(TO_CHAR(k.DATA,'#39'DD.MM.YYYY'#39'))'
      Size = 10
    end
    object postReportCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'CENA'
      Required = True
      currency = True
    end
    object postReportKOL_VO: TFloatField
      DisplayLabel = #1050#1086#1083'_'#1074#1086
      DisplayWidth = 7
      FieldName = 'KOL_VO'
    end
    object postReportPARTOST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 7
      FieldName = 'PARTOST'
      Required = True
    end
    object postReportNOM: TFloatField
      DisplayWidth = 1
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object postReportSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
  end
  object DBSum: TDBSumList
    Active = False
    DataSet = SaleReport
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'sumkolvo'
        GroupOperation = goSum
      end
      item
        FieldName = 'sumall'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    OnAfterRecalcAll = DBSumAfterRecalcAll
    Left = 128
    Top = 64
  end
  object rashreport: TOracleDataSet
    SQL.Strings = (
      'select to_date(j.data,'#39'dd.mm.yyyy'#39') data1,'
      #9'r.cenasnds PRICE ,'
      #9'j.nn,'
      #9'kol_vo sumkolvo,'
      #9'total sumall,'
      #9'j.nom '
      ''
      'from tmp.trashnakl r,tmp.trashj j'
      'where '
      'j.reg=1'
      'and j.nom=r.nom'
      'and  r.plu=:plu'
      
        'and j.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and j.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      ''
      'union all'
      ''
      'select  to_date(j.data,'#39'dd.mm.yyyy'#39')   data1,'
      #9'r.PRICE ,'
      #9'j.doc nn,'
      #9'r.kolvo sumkolvo,'
      #9'r.total sumall,'
      #9'j.doc nom '
      ''
      'from tmp.kkmreport r,tmp.kkmj j'
      'where '
      ' j.doc=r.doc'
      'and  r.plu=:plu'
      
        'and j.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and j.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      ''
      ''
      ''
      'ORDER BY  data1')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000000100000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000000600000005000000505249434501000000000800000053554D4B4F4C
      564F01000000000600000053554D414C4C010000000005000000444154413101
      00000000020000004E4E0100000000030000004E4F4D0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = SaleReportBeforeOpen
    AfterOpen = SaleReportAfterOpen
    Left = 32
    Top = 104
    object rashreportNN: TFloatField
      DisplayLabel = #1085#1072#1082#1083' '#8470'.'
      FieldName = 'NN'
    end
    object rashreportDATA1: TDateTimeField
      DisplayLabel = #1076#1072#1090#1072
      FieldName = 'DATA1'
    end
    object FloatField1: TFloatField
      DisplayLabel = #1094#1077#1085#1072
      FieldName = 'PRICE'
      currency = True
    end
    object FloatField3: TFloatField
      DisplayLabel = #1082#1086#1083'_'#1074#1086
      FieldName = 'SUMKOLVO'
    end
    object FloatField4: TFloatField
      DisplayLabel = #1089#1091#1084#1084#1072
      FieldName = 'SUMALL'
      currency = True
    end
    object rashreportNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
  end
  object priceRep: TOracleDataSet
    SQL.Strings = (
      'select j.owner, '
      '        j.data,'
      '        p.oldprice,'
      '        p.newprice,'
      #9'j.nom'
      'from tmp.tprice p,tmp.tpricej j'
      'where plu=:plu'
      '         and p.nom=j.nom'
      '         and j.reg=1'
      
        '         and j.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from ' +
        'tmp.toptions where parametr='#39'begin'#39')'
      
        '         and j.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:m' +
        'i dd.mm.yyyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      ' ORDER BY TO_DATE( to_char(j.data,'#39'dd.mm.yyyy'#39'))')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A504C55030000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000005000000050000004F574E4552010000000004000000444154410100
      000000080000004F4C4450524943450100000000080000004E45575052494345
      0100000000030000004E4F4D0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 32
    Top = 152
    object priceRepOWNER: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 10
      FieldName = 'OWNER'
      Required = True
      Size = 15
    end
    object priceRepDATA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
      Required = True
    end
    object priceRepOLDPRICE: TFloatField
      DisplayLabel = #1089#1090'. '#1094#1077#1085#1072
      FieldName = 'OLDPRICE'
      Required = True
      currency = True
    end
    object priceRepNEWPRICE: TFloatField
      DisplayLabel = #1085#1086#1074'. '#1094#1077#1085#1072
      FieldName = 'NEWPRICE'
      Required = True
      currency = True
    end
    object priceRepNOM: TFloatField
      DisplayWidth = 1
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
  end
  object partq: TOracleQuery
    SQL.Strings = (
      'update tmp.toptions'
      
        'set value=(select min(partia) from tmp.kniga where nom=:nom and ' +
        'plu=:plu and prihod>0 and otkat=0)'
      'where parametr='#39'part'#39)
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D03000000000000000000000004000000
      3A504C55030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 32
    Top = 208
  end
  object knigarashod: TOracleDataSet
    SQL.Strings = (
      'select  (to_char(k.data,'#39'dd.mm.yyyy'#39'))  data,k.cena,'
      'sum(k.rashod) KOL_VO,k.nom,s.sklad,sum(k.discount)'
      ' from tmp.kniga k,tmp.tsklad s'
      'where '
      'k.otkat=0 and'
      'k.rashod>0'
      'and k.skladid=s.skladid'
      'and k.plu=:plu'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'group by  to_char(k.data,'#39'dd.mm.yyyy'#39'),k.cena,k.nom,s.sklad'
      'ORDER BY TO_DATE( to_char(k.data,'#39'dd.mm.yyyy'#39'))')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C550300000004000000C30D000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000006000000040000004441544101000000000400000043454E41010000
      0000060000004B4F4C5F564F0100000000030000004E4F4D0100000000050000
      00534B4C414401000000000F00000053554D284B2E444953434F554E54290100
      000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 32
    Top = 264
    object knigarashodDATA: TStringField
      DisplayLabel = #1076#1072#1090#1072
      FieldName = 'DATA'
      Size = 10
    end
    object knigarashodCENA: TFloatField
      DisplayLabel = #1094#1077#1085#1072
      FieldName = 'CENA'
      Required = True
    end
    object knigarashodKOL_VO: TFloatField
      DisplayLabel = #1082#1086#1083'-'#1074#1086
      FieldName = 'KOL_VO'
    end
    object knigarashodNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object knigarashodSUMKDISCOUNT: TFloatField
      DisplayLabel = #1089#1082#1080#1076#1082#1072
      FieldName = 'SUM(K.DISCOUNT)'
    end
    object knigarashodSKLAD: TStringField
      DisplayLabel = #1089#1082#1083#1072#1076
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
  end
  object invreport: TOracleDataSet
    SQL.Strings = (
      'select to_char(j.data,'#39'dd.mm.yy'#39') data,'
      #9'j.reg,'
      #9'j.owner,'
      #9'i.nom,'
      #9'kol_sklad,'
      #9'kol_fakt,'
      #9'price from tmp.tinvent i,'
      #9#9#9'tmp.tskladj j'
      'where plu=:plu'
      'and i.nom=j.nom and j.tip=1'
      
        'and j.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and j.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'order by j.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000000C0B000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000007000000040000004441544101000000000500000050524943450100
      000000030000005245470100000000050000004F574E45520100000000030000
      004E4F4D0100000000090000004B4F4C5F534B4C41440100000000080000004B
      4F4C5F46414B540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = SaleReportBeforeOpen
    AfterOpen = SaleReportAfterOpen
    Left = 32
    Top = 312
    object invreportDATA: TStringField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
      Size = 8
    end
    object invreportREG: TIntegerField
      DisplayLabel = #1087#1088#1086#1074#1077#1076#1077#1085#1086
      DisplayWidth = 5
      FieldName = 'REG'
      Required = True
    end
    object invreportOWNER: TStringField
      DisplayLabel = #1072#1074#1090#1086#1088
      FieldName = 'OWNER'
      Required = True
      Size = 15
    end
    object invreportNOM: TFloatField
      DisplayLabel = #1085#1086#1084#1077#1088
      DisplayWidth = 8
      FieldName = 'NOM'
      Required = True
    end
    object invreportKOL_SKLAD: TFloatField
      DisplayLabel = #1089#1082#1083#1072#1076
      DisplayWidth = 5
      FieldName = 'KOL_SKLAD'
      Required = True
    end
    object invreportKOL_FAKT: TFloatField
      DisplayLabel = #1092#1072#1082#1090
      DisplayWidth = 5
      FieldName = 'KOL_FAKT'
      Required = True
    end
    object invreportPRICE: TFloatField
      DisplayLabel = #1094#1077#1085#1072
      FieldName = 'PRICE'
      Required = True
      currency = True
    end
  end
  object movreport: TOracleDataSet
    SQL.Strings = (
      
        'select  (to_char(k.data,'#39'dd.mm.yyyy'#39'))  data,k.cena,k.prihod,k.r' +
        'ashod,'
      'k.sum KOL_VO,k.nom,s.sklad'
      ' from tmp.kniga k,tmp.tsklad s'
      'where '
      'k.otkat=0 and'
      'k.skladid=s.skladid'
      'and k.plu=:plu'
      'ORDER BY k.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C550300000004000000C30D000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000007000000040000004441544101000000000400000043454E41010000
      0000060000004B4F4C5F564F0100000000030000004E4F4D0100000000050000
      00534B4C4144010000000006000000505249484F440100000000060000005241
      53484F440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 128
    Top = 104
    object movreportDATA: TStringField
      DisplayLabel = #1076#1072#1090#1072
      FieldName = 'DATA'
      Size = 10
    end
    object movreportCENA: TFloatField
      DisplayLabel = #1094#1077#1085#1072
      FieldName = 'CENA'
      Required = True
    end
    object movreportNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object movreportPRIHOD: TFloatField
      DisplayLabel = #1087#1088#1080#1093#1086#1076
      FieldName = 'PRIHOD'
      Required = True
    end
    object movreportRASHOD: TFloatField
      DisplayLabel = #1088#1072#1089#1093#1086#1076
      FieldName = 'RASHOD'
      Required = True
    end
    object movreportKOL_VO: TFloatField
      DisplayLabel = #1082#1086#1083'_'#1074#1086
      FieldName = 'KOL_VO'
      Required = True
    end
    object movreportSKLAD: TStringField
      DisplayLabel = #1089#1082#1083#1072#1076
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
  end
  object naklreport: TOracleDataSet
    SQL.Strings = (
      'select to_char(j.nn) nn'
      ' ,(to_char(j.data,'#39'dd.mm.yyyy'#39')) ,n.cenasnds,n.cenareal,'
      'n.KOL_VO,j.nom'
      ' from tmp.tprihj j,tmp.tprihnakl n'
      'where '
      'n.plu=:plu '
      'and j.nom=n.nom and j.reg=1'
      'order by j.data desc')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C550300000004000000920B010000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000006000000060000004B4F4C5F564F0100000000030000004E4F4D0100
      000000020000004E4E01000000001E00000028544F5F43484152284A2E444154
      412C2744442E4D4D2E5959595927292901000000000800000043454E41534E44
      5301000000000800000043454E415245414C0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = SaleReportBeforeOpen
    AfterOpen = SaleReportAfterOpen
    Left = 128
    Top = 176
    object naklreportNN: TStringField
      DisplayLabel = #8470
      DisplayWidth = 10
      FieldName = 'NN'
      Size = 40
    end
    object naklreportTO_CHARJDATADDMMYYYY: TStringField
      DisplayLabel = #1076#1072#1090#1072
      FieldName = '(TO_CHAR(J.DATA,'#39'DD.MM.YYYY'#39'))'
      Size = 10
    end
    object naklreportCENASNDS: TFloatField
      DisplayLabel = #1074#1093'.'#1094#1077#1085#1072
      FieldName = 'CENASNDS'
      Required = True
    end
    object naklreportCENAREAL: TFloatField
      DisplayLabel = #1094#1077#1085#1072'.'#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'CENAREAL'
      Required = True
    end
    object naklreportKOL_VO: TFloatField
      DisplayLabel = #1082#1086#1083'-'#1074#1086
      FieldName = 'KOL_VO'
      Required = True
    end
    object naklreportNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
  end
end
