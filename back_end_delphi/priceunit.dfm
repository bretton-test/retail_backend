object priceform: Tpriceform
  Left = 283
  Top = 160
  Width = 640
  Height = 413
  AlphaBlendValue = 2
  BorderIcons = [biSystemMenu]
  Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1072
  Color = clWindow
  Ctl3D = False
  ParentFont = True
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888
    8888888888888888888888888888888888888888888888888888888888888888
    8888888888888888888888888888888880000000000000000000000888888888
    80000000000000000000000888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFFFFFFFF00888888888
    800FFFFFFFFFFFFFFFFFF00888888888800FFFFFFFFFFFF00000000888888888
    800FFFFFFFFFFFF00000000888888888800FFFFFFFFFFFF00FF0088888888888
    800FFFFFFFFFFFF00FF0088888888888800FFFFFFFFFFFF00008888888888888
    800FFFFFFFFFFFF0000888888888888880000000000000000888888888888888
    8000000000000000088888888888888888888888888888888888888888888888
    8888888888888888888888888888888888888888888888888888888888880000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 107
      Height = 16
      Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1072'  '#8470
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 345
    Width = 632
    Height = 34
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
      Width = 70
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
    object SpeedButton1: TSpeedButton
      Left = 91
      Top = 3
      Width = 62
      Height = 23
      Caption = #1062#1077#1085#1085#1080#1082
      OnClick = SpeedButton1Click
    end
    object prbut: TBitBtn
      Left = 16
      Top = 3
      Width = 75
      Height = 23
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = prbutClick
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
    end
    object BitBtn2: TBitBtn
      Left = 153
      Top = 3
      Width = 69
      Height = 23
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 0
      OnClick = BitBtn2Click
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 73
    Width = 632
    Height = 272
    Align = alClient
    AutoFitColWidths = True
    DataSource = DM.prDS
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    Columns = <
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridColumns0EditButtons0Click
          end>
        FieldName = 'NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1090#1086#1074#1072#1088
        Width = 273
      end
      item
        EditButtons = <>
        FieldName = 'OLDPRICE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1090#1072#1088#1072#1103' '#1094#1077#1085#1072
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridColumns2EditButtons0Click
          end>
        FieldName = 'NEWPRICE'
        Footers = <>
        Title.Caption = #1085#1086#1074#1072#1103' '#1094#1077#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'KOLVO'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1085#1072' '#1089#1082#1083#1072#1076#1072#1093
      end
      item
        EditButtons = <>
        FieldName = 'SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1091#1084#1084#1072' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080
      end>
  end
  object selsklad: TOracleDataSet
    SQL.Strings = (
      'select nvl('
      
        '(select  k.skladid from tmp.kniga  k where k.plu=:plu  and k.pri' +
        'hod>0  '
      
        'and k.data=(select nvl(max(data),sysdate) from tmp.kniga where p' +
        'lu=:plu and prihod>0)'
      'and rownum=1),0) sklad from dual')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000000800000000000000}
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
    Master = DM.Qprice
    MasterFields = 'plu'
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
    Left = 192
    Top = 168
  end
end
