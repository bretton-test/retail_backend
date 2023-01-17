object ActForm: TActForm
  Left = 348
  Top = 286
  Width = 640
  Height = 404
  Caption = 'ActForm'
  Color = clWindow
  Ctl3D = False
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 135
      Height = 16
      Caption = #1040#1082#1090' '#1055#1077#1088#1077#1086#1094#1077#1085#1082#1080'  '#8470
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 240
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
    object Label3: TLabel
      Left = 8
      Top = 37
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
      Left = 415
      Top = 40
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
    object Label4: TLabel
      Left = 416
      Top = 8
      Width = 42
      Height = 16
      Caption = #1057#1082#1083#1072#1076
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 15
      Top = 72
      Width = 238
      Height = 16
      Caption = #1040#1082#1090' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080' - '#1094#1077#1085#1091' '#1085#1077' '#1084#1077#1085#1103#1077#1090' !'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object numbedit: TDBNumberEditEh
      Left = 160
      Top = 8
      Width = 65
      Height = 19
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
    end
    object dataed: TDBDateTimeEditEh
      Left = 274
      Top = 8
      Width = 119
      Height = 18
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      Kind = dtkDateEh
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object primed: TDBEditEh
      Left = 104
      Top = 38
      Width = 289
      Height = 19
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object sklad: TDBLookupComboboxEh
      Left = 472
      Top = 8
      Width = 121
      Height = 17
      EditButtons = <>
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListSource = DM.skladds
      TabOrder = 3
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 342
    Width = 632
    Height = 28
    Align = alBottom
    TabOrder = 1
    object ok: TSpeedButton
      Left = 427
      Top = 4
      Width = 86
      Height = 22
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
      Left = 514
      Top = 4
      Width = 79
      Height = 22
      Cursor = crHandPoint
      Caption = #1047#1072#1082#1088#1099#1090#1100
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
    object PrintB: TBitBtn
      Left = 2
      Top = 3
      Width = 79
      Height = 24
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = PrintBClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 97
    Width = 632
    Height = 245
    Align = alClient
    AutoFitColWidths = True
    Ctl3D = False
    DataSource = DataSource1
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghHighlightFocus, dghClearSelection]
    ParentCtl3D = False
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OLDPLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1076
        Width = 43
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridColumns1EditButtons0Click
          end>
        FieldName = 'ONAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1090#1086#1074#1072#1088
        Width = 143
      end
      item
        EditButtons = <>
        FieldName = 'NEWPLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1091#1094'.'#1082#1086#1076
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
        Title.Caption = #1091#1094#1077#1085#1077#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
        Width = 171
      end
      item
        EditButtons = <>
        FieldName = 'OLDPRICE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1090#1072#1088#1072#1103' '#1094#1077#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'NEWPRICE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1085#1086#1074#1072#1103' '#1094#1077#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'KOLVO'
        Footers = <>
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
  object selAct: TOracleDataSet
    SQL.Strings = (
      'select   '
      #9'a.oldplu,'
      #9'o.name oname,'
      #9'a.newplu,'
      #9'n.name nname,  '#9
      #9'a.oldprice,'
      #9'a.newprice,'
      #9'a.kolvo,'
      #9'a.sum'
      #9
      'from     tmp.actprice a,'
      #9'tmp.tkatalog o,'
      #9'tmp.tkatalog n'
      'where  nom=:nom'
      #9'and a.oldplu=o.plu'
      #9'and a.newplu=n.plu'
      ''
      'order by id')
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
    QBEDefinition.QBEFieldDefs = {
      0300000009000000030000004E4F4D0100000000060000004F4C44504C550100
      000000050000004F4E414D450100000000060000004E4557504C550100000000
      050000004E4E414D450100000000080000004F4C445052494345010000000008
      0000004E455750524943450100000000050000004B4F4C564F01000000000300
      000053554D0100000000}
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
    Left = 560
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ClientDS
    Left = 536
    Top = 96
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = ClientDSBeforePost
    OnNewRecord = ClientDSNewRecord
    Left = 496
    Top = 96
    object ClientDSOLDPLU: TFloatField
      FieldName = 'OLDPLU'
      Required = True
    end
    object ClientDSONAME: TStringField
      FieldName = 'ONAME'
      Required = True
      Size = 52
    end
    object ClientDSNEWPLU: TFloatField
      FieldName = 'NEWPLU'
      Required = True
    end
    object ClientDSNNAME: TStringField
      FieldName = 'NNAME'
      Required = True
      Size = 52
    end
    object ClientDSOLDPRICE: TFloatField
      FieldName = 'OLDPRICE'
      Required = True
      currency = True
    end
    object ClientDSNEWPRICE: TFloatField
      FieldName = 'NEWPRICE'
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
  object Qsafeact: TOracleQuery
    SQL.Strings = (
      'insert into tmp.actprice'
      'values('
      '0,'
      ':nom,'
      ':oldplu,'
      ':oldprice,'
      ':newprice,'
      ':kolvo,'
      ':sum,'
      ':newplu'
      ')')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000007000000040000003A4E4F4D05000000000000000000000007000000
      3A4F4C44504C55050000000000000000000000090000003A4F4C445052494345
      040000000000000000000000090000003A4E4557505249434504000000000000
      0000000000060000003A4B4F4C564F040000000000000000000000040000003A
      53554D040000000000000000000000070000003A4E4557504C55050000000000
      000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 590
    Top = 32
  end
  object Qjourn: TOracleDataSet
    SQL.Strings = (
      'select * from tmp.actpricej '
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
    Left = 624
    Top = 32
  end
  object Qsafeprice: TOracleQuery
    SQL.Strings = (
      'insert into tmp.actpricej'
      'values('
      ':nom,'
      ':data,'
      ':sum,'
      #39'-'#39','
      ':komment,'
      '0,'
      ':sklad,'
      ':part)')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000006000000040000003A4E4F4D03000000000000000000000005000000
      3A444154410C0000000000000000000000040000003A53554D04000000000000
      0000000000080000003A4B4F4D4D454E54050000000000000000000000060000
      003A534B4C4144030000000000000000000000050000003A5041525403000000
      0000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 656
    Top = 32
  end
end
