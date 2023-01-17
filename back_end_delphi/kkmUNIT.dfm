object KkmForm: TKkmForm
  Left = 421
  Top = 176
  Width = 723
  Height = 466
  Caption = 'KkmForm'
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
    Width = 715
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 88
      Height = 16
      Caption = #1054#1090#1095#1077#1090' '#1050#1072#1089#1089#1099' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 240
      Top = 8
      Width = 16
      Height = 16
      Caption = #8470
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 409
      Top = 9
      Width = 19
      Height = 16
      Caption = #1086#1090' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 8
      Top = 29
      Width = 70
      Height = 16
      Caption = #1087#1086' '#1057#1082#1083#1072#1076#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 344
      Top = 56
      Width = 89
      Height = 16
      Caption = #1085#1086#1084#1077#1088' '#1083#1077#1085#1090#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 8
      Top = 54
      Width = 82
      Height = 16
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Labelread: TLabel
      Left = 343
      Top = 33
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
    object kassanom: TDBComboBoxEh
      Left = 104
      Top = 8
      Width = 129
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Flat = True
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = kassanomChange
    end
    object numderdoc: TDBNumberEditEh
      Left = 272
      Top = 8
      Width = 121
      Height = 19
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object datadoc: TDBDateTimeEditEh
      Left = 440
      Top = 8
      Width = 121
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Flat = True
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object lentnom: TDBEditEh
      Left = 440
      Top = 56
      Width = 169
      Height = 19
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object komment: TDBEditEh
      Left = 104
      Top = 50
      Width = 193
      Height = 19
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object Panel4: TPanel
      Left = 11
      Top = 72
      Width = 206
      Height = 15
      BevelOuter = bvNone
      TabOrder = 5
    end
    object sklad: TDBComboBoxEh
      Left = 104
      Top = 29
      Width = 193
      Height = 20
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Flat = True
      ParentFont = False
      TabOrder = 6
      Text = 'sklad'
      Visible = True
    end
  end
  object kkmpanel: TPanel
    Left = 0
    Top = 402
    Width = 715
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ok: TSpeedButton
      Left = 526
      Top = 2
      Width = 83
      Height = 20
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
      Left = 611
      Top = 2
      Width = 70
      Height = 20
      Cursor = crHandPoint
      BiDiMode = bdRightToLeftNoAlign
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
      ParentBiDiMode = False
      OnClick = cancelClick
    end
    object Label7: TLabel
      Left = 337
      Top = 7
      Width = 3
      Height = 13
      Caption = ':'
    end
    object BitBtn2: TBitBtn
      Left = 203
      Top = 3
      Width = 63
      Height = 19
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object PrintB: TBitBtn
      Left = 2
      Top = 3
      Width = 72
      Height = 19
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 3
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
    object BitBtn1: TBitBtn
      Left = 73
      Top = 3
      Width = 68
      Height = 19
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 140
      Top = 3
      Width = 63
      Height = 19
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 265
      Top = 3
      Width = 63
      Height = 19
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 4
      OnClick = BitBtn4Click
    end
  end
  object dbgrid: TDBGridEh
    Left = 0
    Top = 89
    Width = 715
    Height = 313
    Align = alClient
    AutoFitColWidths = True
    DataSource = KKMDS
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
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
    FrozenCols = 2
    ParentFont = False
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 12
    TitleLines = 1
    OnDrawColumnCell = dbgridDrawColumnCell
    OnKeyPress = dbgridKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1076
        Width = 38
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = dbgridColumns1EditButtons0Click
          end>
        FieldName = 'NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1090#1086#1074#1072#1088
        Width = 164
      end
      item
        EditButtons = <>
        FieldName = 'ED_IZM'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1077#1076'. '#1080#1079#1084'.'
      end
      item
        EditButtons = <>
        FieldName = 'NAL'
        Footers = <>
        Title.Caption = #1085#1072#1083'.'
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'KOLVO'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'TPRICE'
        Footers = <>
        Title.Caption = #1074' '#1082#1072#1089#1089#1077
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'REALPRICE'
        Footers = <>
        Title.Caption = #1073#1077#1079' '#1089#1082#1080#1076#1082#1080
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'SUMDISCOUNT'
        Footer.FieldName = 'SUMDISCOUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1089#1082#1080#1076#1082#1072
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'TOTAL'
        Footer.FieldName = 'TOTAL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1074#1089#1077#1075#1086
        Width = 60
      end>
  end
  object splashform: TSpeedForm
    Left = 63
    Top = 151
    Width = 578
    Height = 45
    BorderIcons = []
    Position = poMainFormCenter
    Caption = #1080#1076#1105#1090' '#1087#1088#1086#1074#1086#1076#1082#1072
    TabOrder = 3
    StayOnTop = True
    object outlabel: TLabel
      Left = 0
      Top = 1
      Width = 22
      Height = 16
      Caption = 'out'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object KKMJ: TOracleDataSet
    SQL.Strings = (
      'select j.*,j.rowid'
      'from tmp.kkmj j'
      'where doc=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D040000000000000000000000}
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
      030000000C00000003000000444F430100000000030000004B4B4D0100000000
      07000000534B4C41444944010000000004000000444154410100000000050000
      004C454E5441010000000005000000544F54414C01000000000B00000053554D
      444953434F554E5401000000000600000053554D4E4453010000000006000000
      53554D4E53500100000000070000004B4F4D4D454E5401000000000300000052
      45470100000000050000004F574E45520100000000}
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
    AfterPost = KKMJAfterPost
    Left = 584
    Top = 16
    object KKMJDOC: TFloatField
      FieldName = 'DOC'
    end
    object KKMJKKM: TIntegerField
      FieldName = 'KKM'
    end
    object KKMJSKLADID: TIntegerField
      FieldName = 'SKLADID'
    end
    object KKMJDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object KKMJLENTA: TStringField
      FieldName = 'LENTA'
    end
    object KKMJTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object KKMJSUMDISCOUNT: TFloatField
      FieldName = 'SUMDISCOUNT'
    end
    object KKMJSUMNDS: TFloatField
      FieldName = 'SUMNDS'
    end
    object KKMJSUMNSP: TFloatField
      FieldName = 'SUMNSP'
    end
    object KKMJKOMMENT: TStringField
      FieldName = 'KOMMENT'
      Size = 30
    end
    object KKMJREG: TIntegerField
      FieldName = 'REG'
    end
  end
  object KKMDS: TDataSource
    DataSet = KKM
    Left = 640
    Top = 56
  end
  object KKM: TOracleDataSet
    SQL.Strings = (
      'select j.*,'
      'nvl(t.nal,0) nal,'
      'nvl(t.price,0) tprice,'
      'nvl(t.shtuka,0) wes,'
      'j.rowid'
      'from tmp.kkmreport j,tmp.tkatalog t'
      'where j.doc=:nom'
      'and j.plu=t.plu(+)'
      'order by j.name')
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
      030000001100000003000000444F43010000000005000000544F54414C010000
      00000B00000053554D444953434F554E5401000000000600000053554D4E4453
      01000000000600000053554D4E53500100000000020000004944010000000003
      000000504C550100000000040000004E414D4501000000000600000045445F49
      5A4D0100000000050000004B4F4C564F01000000000500000050524943450100
      000000090000005245414C50524943450100000000030000004E445301000000
      00030000004E53500100000000030000004E414C010000000006000000545052
      4943450100000000030000005745530100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    FilterOptions = [foCaseInsensitive]
    AfterInsert = KKMAfterInsert
    BeforePost = KKMBeforePost
    AfterPost = KKMAfterPost
    Left = 584
    Top = 64
    object KKMPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object KKMNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 45
    end
    object KKMED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object KKMKOLVO: TFloatField
      FieldName = 'KOLVO'
      Required = True
    end
    object KKMTPRICE: TFloatField
      FieldName = 'TPRICE'
      ReadOnly = True
      currency = True
    end
    object KKMPRICE: TFloatField
      FieldName = 'PRICE'
      Required = True
      currency = True
    end
    object KKMREALPRICE: TFloatField
      FieldName = 'REALPRICE'
      Required = True
      currency = True
    end
    object KKMSUMDISCOUNT: TFloatField
      FieldName = 'SUMDISCOUNT'
      Required = True
      currency = True
    end
    object KKMTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
      currency = True
    end
    object KKMNDS: TFloatField
      FieldName = 'NDS'
      Required = True
    end
    object KKMSUMNDS: TFloatField
      FieldName = 'SUMNDS'
      Required = True
      currency = True
    end
    object KKMNSP: TFloatField
      FieldName = 'NSP'
      Required = True
    end
    object KKMSUMNSP: TFloatField
      FieldName = 'SUMNSP'
      Required = True
      currency = True
    end
    object KKMNAL: TFloatField
      FieldName = 'NAL'
      ReadOnly = True
    end
    object KKMWES: TFloatField
      FieldName = 'WES'
      ReadOnly = True
      Visible = False
    end
    object KKMDOC: TFloatField
      FieldName = 'DOC'
      Required = True
    end
  end
  object QInsReport: TOracleQuery
    SQL.Strings = (
      'insert into tmp.kkmreport'
      '('
      'plu,'
      'name,'
      'ed_izm,'
      'kolvo,'
      'price,'
      'total,'
      'doc,'
      'nds,'
      'nsp,'
      'sumnds,'
      'sumnsp,'
      'sumdiscount,'
      'realprice'
      ')'
      'select '
      ':plu,'
      'nvl((select name from tmp.tkatalog where plu=:plu),'#39'?'#39'),'
      'nvl((select ed_izm from tmp.tkatalog where plu=:plu),'#39'?'#39'),'
      ':kol_vo,'
      ':total/:kol_vo,'
      ':total,'
      ':nn,'
      '0, --nvl(t.nds,0),'
      '0,'
      '0, --:total-(:total/(1+(nvl(t.nds,0)/100))),'
      '0,'
      ':discount,'
      '(:total+:discount)/:kol_vo'
      'from dual --tmp.tkatalog t'
      '          --where t.plu(+)=:plu'
      ''
      ''
      ''
      ''
      '')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000040000003A504C5503000000000000000000000007000000
      3A4B4F4C5F564F040000000000000000000000060000003A544F54414C040000
      000000000000000000030000003A4E4E03000000000000000000000009000000
      3A444953434F554E54040000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 635
    Top = 16
  end
  object chekdoc: TOracleDataSet
    SQL.Strings = (
      'select doc  from tmp.kkmj '
      'where data=:data'
      ' and kkm=:kkm')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444154410C0000000000000000000000040000
      003A4B4B4D030000000000000000000000}
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
    Left = 456
    Top = 56
  end
  object PM1: TPopupMenu
    Left = 176
    Top = 240
    object N1: TMenuItem
      Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1088#1080#1093#1086#1076#1085#1080#1082
      OnClick = N2Click
    end
  end
end
