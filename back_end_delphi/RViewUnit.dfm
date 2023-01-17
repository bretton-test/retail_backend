object rViewForm: TrViewForm
  Left = 186
  Top = 119
  Width = 775
  Height = 530
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'rViewForm'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 169
      Height = 16
      Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 264
      Top = 8
      Width = 15
      Height = 16
      Caption = #1086#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 440
      Top = 4
      Width = 73
      Height = 16
      Caption = #1089#1086' '#1057#1082#1083#1072#1076#1072' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 89
      Height = 16
      Caption = #1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 8
      Top = 58
      Width = 81
      Height = 16
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 56
      Width = 23
      Height = 19
      Caption = '...'
    end
    object Labelread: TLabel
      Left = 375
      Top = 53
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
    end
    object Label7: TLabel
      Left = 373
      Top = 69
      Width = 8
      Height = 16
      Caption = '1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 553
      Top = 54
      Width = 83
      Height = 13
      Caption = #1074#1099#1073#1086#1088' '#1094#1077#1085#1085#1080#1082#1086#1074
    end
    object numbered: TEdit
      Left = 184
      Top = 5
      Width = 73
      Height = 19
      TabOrder = 0
    end
    object datanakl: TDateTimePicker
      Left = 288
      Top = 4
      Width = 129
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 37305.025575451400000000
      Time = 37305.025575451400000000
      DateFormat = dfLong
      TabOrder = 1
    end
    object sklad: TDBLookupComboboxEh
      Left = 520
      Top = 3
      Width = 121
      Height = 17
      EditButtons = <>
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListSource = DM.skladds
      TabOrder = 2
      Visible = True
    end
    object osnedit: TEdit
      Left = 112
      Top = 32
      Width = 553
      Height = 19
      TabOrder = 3
    end
    object postname: TEdit
      Left = 112
      Top = 56
      Width = 225
      Height = 19
      ReadOnly = True
      TabOrder = 4
    end
    object wesbox: TCheckBox
      Left = 524
      Top = 54
      Width = 14
      Height = 17
      Hint = #1042#1099#1073#1086#1088' '#1094#1077#1085#1085#1080#1082#1086#1074
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = wesboxClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 471
    Width = 767
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton4: TSpeedButton
      Left = 8
      Top = 3
      Width = 65
      Height = 21
      Caption = #1062#1077#1085#1085#1080#1082
      OnClick = SpeedButton4Click
    end
    object cancel: TSpeedButton
      Left = 682
      Top = 3
      Width = 78
      Height = 20
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
    object SpeedButton2: TSpeedButton
      Left = 149
      Top = 3
      Width = 64
      Height = 21
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 73
      Top = 3
      Width = 76
      Height = 21
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = SpeedButton3Click
    end
    object provlabel: TLabel
      Left = 344
      Top = 8
      Width = 3
      Height = 13
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 89
    Width = 767
    Height = 382
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
    FrozenCols = 1
    OptionsEh = [dghHighlightFocus, dghClearSelection]
    ParentCtl3D = False
    RowHeight = 2
    RowLines = 1
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnCellClick = DBGridCellClick
    OnDrawColumnCell = DBGridDrawColumnCell
    OnTitleBtnClick = DBGridTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footer.FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Title.Caption = #1090#1086#1074#1072#1088
        Title.TitleButton = True
        Width = 215
      end
      item
        EditButtons = <>
        FieldName = 'ED_IZM'
        Footers = <>
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'MEST'
        Footer.FieldName = 'MEST'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1084#1077#1089#1090
        Visible = False
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'ROSSIP'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1082#1072#1089#1089#1077
        Title.TitleButton = True
        Visible = False
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'KOL_VO'
        Footer.FieldName = 'KOL_VO'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086
        Title.TitleButton = True
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'CENABNDS'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072
        Width = 54
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'CENASNDS'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072' '#1089' '#1085#1076#1089
        Width = 56
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'TOTAL'
        Footer.FieldName = 'TOTAL'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1048#1090#1086#1075#1086
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'KOL_UP'
        Footers = <>
        Title.Caption = #1087#1088#1080#1093'.'#1076#1086#1082'.'
      end>
  end
  object DataSource1: TDataSource
    DataSet = ClientDS
    Left = 200
    Top = 152
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 256
    Top = 152
  end
  object QgetOld: TOracleDataSet
    SQL.Strings = (
      'select   n.nn,'
      #9'n.data,'
      #9'n.prim,'
      #9'n.owner,'
      #9'n.skladid,'
      #9'nvl(k.name,'#39'?'#39') pok_name,'
      #9'nvl(n.prim,'#39'-'#39') osn,'
      #9'n.nom'
      'from tmp.trashj n,tmp.tpostav k'
      'where n.nom=:nom'
      #9'and k.cod(+)=n.pokup')
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
    Cursor = crDefault
    ReadOnly = True
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
    Left = 520
    Top = 144
  end
  object Qnakl: TOracleDataSet
    SQL.Strings = (
      'select nn,'
      #9'post,'
      #9'pokup,'
      #9'data,'
      #9'n.name,'
      #9'n.ed_izm,'
      #9'mest,'
      #9'kol_up,'
      #9'rossip,'
      #9'n.kol_vo,'
      #9'cenabnds,'
      #9'cenasnds,'
      #9'total,'
      #9'skladid,'
      #9'n.plu,'
      #9'n.id'
      #9
      'from tmp.trashnakl n'
      #9'where '
      #9
      #9' n.nom=:nom'
      ''
      #9
      'order by n.id')
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
      0300000016000000020000004E4E010000000004000000504F53540100000000
      05000000504F4B5550010000000004000000444154410100000000040000004E
      414D4501000000000600000045445F495A4D0100000000040000004D45535401
      00000000060000004B4F4C5F5550010000000006000000524F53534950010000
      0000060000004B4F4C5F564F01000000000800000043454E41424E4453010000
      00000800000043454E41534E445301000000000800000043454E415245414C01
      0000000005000000544F54414C010000000007000000534B4C41444944010000
      000003000000504C5501000000000900000043454E41575A414C450100000000
      04000000574553590100000000030000004E414C010000000002000000494401
      00000000030000004E44530100000000080000004B5241534E5F494401000000
      00}
    Cursor = crDefault
    ReadOnly = True
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
    Left = 584
    Top = 144
    object QnaklNN: TIntegerField
      FieldName = 'NN'
      Required = True
      Visible = False
    end
    object QnaklPOST: TIntegerField
      FieldName = 'POST'
      Required = True
      Visible = False
    end
    object QnaklPOKUP: TIntegerField
      FieldName = 'POKUP'
      Required = True
      Visible = False
    end
    object QnaklDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
      Visible = False
    end
    object QnaklNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QnaklED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object QnaklMEST: TIntegerField
      FieldName = 'MEST'
    end
    object QnaklKOL_UP: TFloatField
      FieldName = 'KOL_UP'
      Required = True
    end
    object QnaklROSSIP: TFloatField
      FieldName = 'ROSSIP'
      Required = True
      Visible = False
    end
    object QnaklKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object QnaklCENABNDS: TFloatField
      FieldName = 'CENABNDS'
      Required = True
    end
    object QnaklCENASNDS: TFloatField
      FieldName = 'CENASNDS'
      Required = True
    end
    object QnaklTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object QnaklSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
      Visible = False
    end
    object QnaklPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QnaklID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 201
    object N121: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 12'
      OnClick = N121Click
    end
    object N122: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 12 '#1089' '#1094#1077#1085#1072#1084#1080
      OnClick = N122Click
    end
    object N131: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 13'
      OnClick = N131Click
    end
    object N1161: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 116'
      OnClick = N1161Click
    end
    object N123: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 12 ('#1087#1086#1089#1083'. '#1087#1086#1089#1090#1072#1074#1082#1072')'
      OnClick = N123Click
    end
    object N124: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 12 ('#1087#1086#1089#1090#1072#1074#1082#1072' '#1091#1082#1072#1079#1072#1085#1072')'
      OnClick = N124Click
    end
  end
end
