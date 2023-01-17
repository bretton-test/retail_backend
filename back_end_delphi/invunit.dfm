object invform: Tinvform
  Left = 275
  Top = 230
  Width = 640
  Height = 444
  Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 113
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 133
      Height = 16
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103'  '#8470
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
      Left = 415
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
      Left = 160
      Top = 8
      Width = 65
      Height = 20
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
    object Skladed: TDBLookupComboboxEh
      Left = 104
      Top = 32
      Width = 121
      Height = 18
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      KeyField = 'skladid'
      ListField = 'sklad'
      ListSource = DM.skladds
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnChange = SkladedChange
    end
    object dataed: TDBDateTimeEditEh
      Left = 273
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
      TabOrder = 2
      Visible = True
      OnChange = dataedChange
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
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 56
      Width = 673
      Height = 49
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 4
      object katselect: TDBLookupComboboxEh
        Left = 8
        Top = 18
        Width = 153
        Height = 20
        DropDownBox.Rows = 14
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'KAT'
        ListField = 'NAME'
        ListSource = DM.razdds
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object Button2: TButton
        Tag = 3
        Left = 192
        Top = 16
        Width = 121
        Height = 25
        Caption = #1054#1089#1090#1072#1090#1082#1072#1084#1080
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Tag = 4
        Left = 312
        Top = 16
        Width = 121
        Height = 25
        Caption = #1058#1086#1074#1072#1088#1072#1084#1080
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 432
        Top = 16
        Width = 145
        Height = 25
        Caption = #1057#1095#1080#1090#1072#1090#1100' '#1080#1079' '#1090#1077#1088#1084#1080#1085#1072#1083#1072
        TabOrder = 3
        OnClick = Button4Click
      end
      object weschek: TCheckBox
        Left = 584
        Top = 20
        Width = 41
        Height = 17
        Caption = #1074#1077#1089
        TabOrder = 4
        OnClick = weschekClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 376
    Width = 632
    Height = 34
    Align = alBottom
    TabOrder = 1
    object ok: TSpeedButton
      Left = 480
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
      Left = 570
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
    object BitBtn1: TBitBtn
      Left = 74
      Top = 4
      Width = 75
      Height = 24
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object PrintB: TBitBtn
      Left = 2
      Top = 4
      Width = 72
      Height = 24
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
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
    object BitBtn2: TBitBtn
      Left = 148
      Top = 4
      Width = 109
      Height = 24
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1086#1089#1090#1072#1090#1082#1080
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object Panel4: TPanel
      Left = 264
      Top = 3
      Width = 185
      Height = 24
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 113
    Width = 632
    Height = 263
    Align = alClient
    AutoFitColWidths = True
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DM.InvDS
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghHighlightFocus, dghClearSelection]
    ParentCtl3D = False
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    UseMultiTitle = True
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PLU'
        Footer.Value = #1089#1090#1088#1086#1082':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1076
        Width = 52
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridColumns0EditButtons0Click
          end>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1086#1074#1072#1088
        Width = 189
      end
      item
        EditButtons = <>
        FieldName = 'ED_IZM'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'KOL_SKLAD'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1085#1072' '#1089#1082#1083#1072#1076#1077
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'KOL_FAKT'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080
      end
      item
        EditButtons = <>
        FieldName = 'RAZN'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1088#1072#1079#1085#1080#1094#1072
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'SUM_SKL'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1091#1084#1084#1072' '#1087#1086' '#1089#1082#1083#1072#1076#1091
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'SUM_FAKT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1091#1084#1084#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103
        Width = 72
      end>
  end
  object splashForm: TSpeedForm
    Left = 288
    Top = 176
    Width = 257
    Height = 81
    Position = poDesktopCenter
    Caption = 'splashForm'
    TabOrder = 3
    BorderStyle = bsNone
    StayOnTop = True
    ParentColor = False
    Color = clSkyBlue
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 8
      Height = 14
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 8
      Width = 233
      Height = 17
      Smooth = True
      TabOrder = 0
    end
  end
  object doublePlu: TOracleDataSet
    SQL.Strings = (
      'SELECT I.PLU,'
      '             t.name '
      '  FROM TMP.TINVENT i,'
      '            tmp.tkatalog t'
      'WHERE NOM=:nom'
      '            and i.plu=t.plu '
      'HAVING COUNT(i.PLU)>1'
      'GROUP BY i.PLU,t.name')
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
    Left = 640
    Top = 8
  end
  object selkat: TOracleDataSet
    SQL.Strings = (
      'select distinct t.kat'
      ' from tmp.tkatalog t,tmp.tinvent i'
      'where i.plu=t.plu'
      'and i.nom=:nom')
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
    Left = 64
    Top = 216
  end
  object PM: TPopupMenu
    Left = 136
    Top = 296
    object ds1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1074#1089#1105
      OnClick = ds1Click
    end
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1060#1072#1081#1083' '#1058#1077#1088#1084#1080#1085#1072#1083#1072
      OnClick = N2Click
    end
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 192
  end
end
