object ubform: Tubform
  Left = 261
  Top = 194
  Width = 696
  Height = 480
  AlphaBlendValue = 5
  Caption = #1055#1088#1086#1076#1072#1078#1080' '#1074' '#1091#1073#1099#1090#1086#1082
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF006666
    6600000066000000660000006666666666000000660000006600000066666666
    6666666666666666666666666666666666666666666666666666666666667700
    0000000000000000000000000077770000000000000000000000000000776600
    6699999966BBBBBB66CCCCCC666666006699999966BBBBBB66CCCCCC66667700
    6699999966BBBBBB66CCCCCC666677006699999966BBBBBB66CCCCCC66666600
    6699999966BBBBBB66CCCCCC666666006699999966BBBBBB66CCCCCC66667700
    7799999977BBBBBB77CCCCCC777777007799999977BBBBBB77CCCCCC77776600
    669999996600000066CCCCCC66666600669999996600000066CCCCCC66667700
    669999996666666666CCCCCC66667700669999996666666666CCCCCC66666600
    669999996666666666CCCCCC66666600669999996666666666CCCCCC66667700
    770000007777777777CCCCCC77777700770000007777777777CCCCCC77776600
    666666666666666666CCCCCC66666600666666666666666666CCCCCC66667700
    6666666666666666660000006666770066666666666666666600000066666600
    6666666666666666666666666666660066666666666666666666666666667700
    7777777777777777777777777777770077777777777777777777777777776666
    6666666666666666666666666666666666666666666666666666666666660000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
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
    Top = 424
    Width = 688
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 259
      Top = 4
      Width = 73
      Height = 23
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 169
      Top = 4
      Width = 91
      Height = 23
      Caption = #1088#1072#1089#1093'.'#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnClick = BitBtn3Click
    end
    object SpeedButton3: TSpeedButton
      Left = 78
      Top = 4
      Width = 92
      Height = 23
      Caption = #1087#1088#1080#1093'.'#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnClick = BitBtn2Click
    end
    object SpeedButton4: TSpeedButton
      Left = 8
      Top = 4
      Width = 71
      Height = 23
      Caption = #1082#1072#1088#1090#1086#1095#1082#1072
      OnClick = BitBtn1Click
    end
    object perButton: TSpeedButton
      Left = 331
      Top = 4
      Width = 77
      Height = 23
      Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1072
      Enabled = False
      OnClick = perButtonClick
    end
    object wybor: TCheckBox
      Left = 416
      Top = 8
      Width = 153
      Height = 17
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1083#1103' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080
      TabOrder = 0
      OnClick = wyborClick
    end
    object westovar: TCheckBox
      Left = 576
      Top = 8
      Width = 105
      Height = 17
      Caption = #1090#1086#1083#1100#1082#1086' '#1096#1090#1091#1095#1085#1099#1081
      TabOrder = 1
      OnClick = westovarClick
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 0
    Width = 688
    Height = 424
    Align = alClient
    AutoFitColWidths = True
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridCellClick
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyDown = DBGridKeyDown
  end
  object Qub: TOracleDataSet
    SQL.Strings = (
      'select distinct k.plu,k.name,'
      #9'k.shtuka,'
      '       to_date(to_char(p.data,'#39'dd.mm.yyyy'#39')),'
      '       p.nomrash,p.cenazak,p.cenareal,'
      #9'to_char(r.data,'#39'dd.mm.yyyy'#39'),'
      #9'r.nom,'
      #9'p.part '
      '  from tmp.tpart p,tmp.tkatalog k,tmp.kniga r '
      '  where cenazak-cenareal>0.02'
      '  '#9'and k.plu=p.plu'
      '            and cenareal<>0       '
      '            and r.plu=p.plu'
      ' '#9'and r.partia=p.part'
      #9'and r.prihod>0'
      #9'and r.otkat=0'
      
        '  '#9'and p.data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.top' +
        'tions where parametr='#39'begin'#39')'
      
        '  '#9'and p.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm' +
        '.yyyy'#39') from tmp.toptions where parametr='#39'end'#39') '
      'order by to_date(to_char(p.data,'#39'dd.mm.yyyy'#39'))')
    ReadBuffer = 25
    Optimize = True
    Debug = False
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
      030000000A00000003000000504C550100000000040000004E414D4501000000
      00070000004E4F4D5241534801000000000700000043454E415A414B01000000
      000800000043454E415245414C01000000001C000000544F5F4348415228522E
      444154412C2744442E4D4D2E5959595927290100000000030000004E4F4D0100
      0000001E000000544F5F4441544528544F5F4348415228502E444154412C2744
      442E4D4D2E01000000000400000050415254010000000006000000534854554B
      410100000000}
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
    Left = 24
    Top = 8
    object QubPLU: TFloatField
      DisplayLabel = #1082#1086#1076
      FieldName = 'PLU'
      Required = True
    end
    object QubNAME: TStringField
      DisplayLabel = #1090#1086#1074#1072#1088
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QubTO_DATETO_CHARPDATADDMM: TDateTimeField
      DisplayLabel = #1076#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
      DisplayWidth = 10
      FieldName = 'TO_DATE(TO_CHAR(P.DATA,'#39'DD.MM.'
    end
    object QubTO_CHARRDATADDMMYYYY: TStringField
      DisplayLabel = #1076#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
      FieldName = 'TO_CHAR(R.DATA,'#39'DD.MM.YYYY'#39')'
      Size = 10
    end
    object QubNOMRASH: TFloatField
      FieldName = 'NOMRASH'
      Required = True
      Visible = False
    end
    object QubCENAZAK: TFloatField
      DisplayLabel = #1074#1093'.'#1094#1077#1085#1072
      FieldName = 'CENAZAK'
      Required = True
      currency = True
    end
    object QubCENAREAL: TFloatField
      DisplayLabel = #1094#1077#1085#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'CENAREAL'
      Required = True
      currency = True
    end
    object QubNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object QubPART: TFloatField
      FieldName = 'PART'
      Required = True
      Visible = False
    end
    object QubSHTUKA: TIntegerField
      FieldName = 'SHTUKA'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = Qub
    Left = 72
    Top = 8
  end
end
