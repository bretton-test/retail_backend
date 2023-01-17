object SpForm: TSpForm
  Left = 254
  Top = 136
  Width = 706
  Height = 492
  Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1058#1052#1062
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
    Width = 698
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 117
      Height = 16
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1058#1052#1062' '#8470' '
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
      Left = 8
      Top = 58
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
      Left = 439
      Top = 58
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
      Left = 232
      Top = 35
      Width = 89
      Height = 16
      Caption = #1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 560
      Top = 32
      Width = 19
      Height = 18
      Caption = 'x'
      OnClick = SpeedButton1Click
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
      TabOrder = 1
      Visible = True
      OnChange = dataedChange
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
      TabOrder = 2
      Visible = True
      OnChange = SkladedChange
    end
    object primed: TDBEditEh
      Left = 104
      Top = 54
      Width = 225
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
    object osned: TDBEditEh
      Left = 328
      Top = 31
      Width = 225
      Height = 20
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = osnedEditButtons0Click
        end>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 426
    Width = 698
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ok: TSpeedButton
      Left = 533
      Top = 4
      Width = 57
      Height = 23
      Cursor = crHandPoint
      Caption = 'Ok'
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
      Left = 600
      Top = 4
      Width = 70
      Height = 22
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
    object Label6: TLabel
      Left = 296
      Top = 8
      Width = 4
      Height = 16
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object prbut: TBitBtn
      Left = 164
      Top = 5
      Width = 75
      Height = 23
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 3
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
    object Fillbtn: TBitBtn
      Left = 8
      Top = 4
      Width = 81
      Height = 24
      Caption = #1047#1072#1087'.'#1048#1085#1074#1077#1085#1090'.'
      TabOrder = 0
      OnClick = FillbtnClick
    end
    object Panel3: TPanel
      Left = 248
      Top = 4
      Width = 249
      Height = 23
      BevelOuter = bvNone
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 90
      Top = 4
      Width = 75
      Height = 24
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 80
    Width = 698
    Height = 346
    Align = alClient
    DataSource = DM.tmzDS
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGridKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Width = 46
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridColumns0EditButtons0Click
          end>
        FieldName = 'NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1086#1074#1072#1088
        Width = 295
      end
      item
        EditButtons = <>
        FieldName = 'ED_IZM'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'KOL_FAKT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1082#1086#1083'-'#1074#1086
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'SUM_FAKT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1089#1091#1084#1084#1072
      end
      item
        EditButtons = <>
        FieldName = 'NAL'
        Footers = <>
        Title.Caption = #1085#1072#1083'.'
      end>
  end
end
