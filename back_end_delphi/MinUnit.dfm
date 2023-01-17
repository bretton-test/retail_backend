object MinForm: TMinForm
  Left = 289
  Top = 186
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1084#1080#1085#1091#1089#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 178
      Height = 16
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1087#1077#1088#1077#1089#1086#1088#1090#1080#1094#1099'  '#8470
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 288
      Top = 11
      Width = 19
      Height = 16
      Caption = #1086#1090' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 70
      Height = 16
      Caption = #1087#1086' '#1057#1082#1083#1072#1076#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 248
      Top = 32
      Width = 89
      Height = 16
      Caption = #1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Labelread: TLabel
      Left = 519
      Top = 8
      Width = 115
      Height = 16
      Caption = #1058#1086#1083#1100#1082#1086' '#1087#1088#1086#1089#1084#1086#1090#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      Visible = False
    end
    object numbedit: TDBNumberEditEh
      Left = 208
      Top = 8
      Width = 65
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
    end
    object dataed: TDBDateTimeEditEh
      Left = 345
      Top = 8
      Width = 119
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object Sklad: TDBLookupComboboxEh
      Left = 104
      Top = 32
      Width = 121
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListFieldIndex = 1
      ListSource = DM.skladds
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object primed: TDBEditEh
      Left = 344
      Top = 30
      Width = 289
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 688
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ok: TSpeedButton
      Left = 520
      Top = 4
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = okClick
    end
    object cancel: TSpeedButton
      Left = 610
      Top = 4
      Width = 70
      Height = 23
      Cursor = crHandPoint
      Caption = #1054#1090#1084#1077#1085#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = cancelClick
    end
    object SelBut: TSpeedButton
      Left = 3
      Top = 5
      Width = 86
      Height = 22
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      OnClick = SelButClick
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 81
    Width = 688
    Height = 335
    Align = alClient
    AutoFitColWidths = True
    Ctl3D = False
    DataSource = ds
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghHighlightFocus, dghClearSelection]
    ParentCtl3D = False
    ParentFont = False
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MPLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1076
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'ONAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1090#1086#1074#1072#1088' '#1074' '#1084#1080#1085#1091#1089#1077
        Width = 143
      end
      item
        EditButtons = <>
        FieldName = 'PPLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1087'.'#1082#1086#1076
        Width = 49
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridColumns3EditButtons0Click
          end>
        FieldName = 'NNAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1090#1086#1074#1072#1088' '#1074' '#1087#1083#1102#1089#1077
        Width = 171
      end
      item
        EditButtons = <>
        FieldName = 'MPRICE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1094#1077#1085#1072' '#1084#1080#1085#1091#1089
      end
      item
        EditButtons = <>
        FieldName = 'PPRICE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1094#1077#1085#1072' '#1087#1083#1102#1089
      end
      item
        EditButtons = <>
        FieldName = 'KOLVO'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1083'-'#1074#1086
      end
      item
        EditButtons = <>
        FieldName = 'SUM'
        Footer.FieldName = 'SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1091#1084#1084#1072
      end>
  end
  object ds: TDataSource
    DataSet = ClientDS
    Left = 440
    Top = 56
  end
  object qMinus: TOracleDataSet
    SQL.Strings = (
      'select   '
      #9'a.mplu,'
      #9'o.name oname,'
      #9'a.pplu,'
      #9'n.name nname,  '#9
      #9'a.mprice,'
      #9'a.pprice,'
      #9'a.kolvo,'
      #9'a.sum'
      #9
      'from     tmp.tminus a,'
      #9'tmp.tkatalog o,'
      #9'tmp.tkatalog n'
      'where  nom=:nom'
      #9'and a.mplu=o.plu'
      #9'and a.pplu=n.plu'
      ''
      'order by oname')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      03000000080000000200000049440100000000030000004E4F4D010000000004
      0000004D504C550100000000060000004D505249434501000000000600000050
      50524943450100000000050000004B4F4C564F01000000000300000053554D01
      000000000400000050504C550100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 480
    Top = 56
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = ClientDSBeforePost
    AfterDelete = ClientDSAfterDelete
    Left = 400
    Top = 56
    object ClientDSmPLU: TFloatField
      FieldName = 'MPLU'
      Required = True
    end
    object ClientDSONAME: TStringField
      FieldName = 'ONAME'
      Required = True
      Size = 52
    end
    object ClientDSPPLU: TFloatField
      FieldName = 'PPLU'
      Required = True
    end
    object ClientDSNNAME: TStringField
      FieldName = 'NNAME'
      Required = True
      Size = 52
    end
    object ClientDSMPRICE: TFloatField
      FieldName = 'MPRICE'
      Required = True
      currency = True
    end
    object ClientDSPPRICE: TFloatField
      FieldName = 'PPRICE'
      Required = True
      currency = True
    end
    object ClientDSKOLVO: TFloatField
      FieldName = 'KOLVO'
      Required = True
    end
    object ClientDSSUM: TFloatField
      FieldName = 'SUM'
      Required = True
      currency = True
    end
  end
  object Qselmin: TOracleDataSet
    SQL.Strings = (
      'select k.plu,t.name,k.cena,sum(k.partost) sum'
      'from tmp.kniga k,tmp.tkatalog t'
      'where otkat=0'
      'and k.plu=t.plu'
      'and partost<0'
      'and k.data<:data'
      'group by k.plu,k.cena,t.name'
      'order by t.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000050000003A444154410C0000000700000078670501010101
      00000000}
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
      030000000400000003000000504C550100000000040000004E414D4501000000
      000400000043454E4101000000000300000053554D0100000000}
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
    Left = 544
    Top = 56
    object QselminPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QselminNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QselminCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object QselminSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object Qsafeact: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tminus'
      'values('
      '0,'
      ':nom,'
      ':mplu,'
      ':mprice,'
      ':pprice,'
      ':kolvo,'
      ':sum,'
      ':pplu'
      ')')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000007000000040000003A4E4F4D03000000000000000000000005000000
      3A4D504C55030000000000000000000000070000003A4D505249434504000000
      0000000000000000070000003A50505249434504000000000000000000000006
      0000003A4B4F4C564F040000000000000000000000040000003A53554D040000
      000000000000000000050000003A50504C55030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 590
    Top = 56
  end
  object Qsafeprice: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tminusj'
      'values('
      ':nom,'
      ':data,'
      ':sum,'
      #39'-'#39','
      ':komment,'
      '0,'
      ':sklad)')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000040000003A4E4F4D03000000000000000000000005000000
      3A444154410C0000000000000000000000040000003A53554D04000000000000
      0000000000080000003A4B4F4D4D454E54050000000000000000000000060000
      003A534B4C4144030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 624
    Top = 56
  end
  object Qjourn: TOracleDataSet
    SQL.Strings = (
      'select * from tmp.tminusj '
      'where nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D050000000000000000000000}
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
    Left = 352
    Top = 56
  end
end
