object rashform: Trashform
  Left = 183
  Top = 151
  Width = 772
  Height = 467
  AlphaBlendValue = 2
  Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1053#1072#1082#1083#1072#1076#1085#1072#1103
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 764
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
      OnClick = SpeedButton1Click
    end
    object Labelread: TLabel
      Left = 263
      Top = 73
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
    object numbered: TEdit
      Left = 184
      Top = 5
      Width = 73
      Height = 19
      TabOrder = 0
      OnChange = numberedChange
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
      OnChange = datanaklChange
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
      OnChange = skladChange
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
    object last: TCheckBox
      Left = 368
      Top = 56
      Width = 177
      Height = 17
      Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1087#1086#1089#1090#1072#1074#1082#1080
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 408
    Width = 764
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
      OnClick = BitBtn1Click
    end
    object ok: TSpeedButton
      Left = 600
      Top = 4
      Width = 81
      Height = 19
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
      Left = 688
      Top = 3
      Width = 70
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
      OnClick = BitBtn3Click
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
      OnClick = PrintBClick
    end
    object SpeedButton5: TSpeedButton
      Left = 213
      Top = 3
      Width = 64
      Height = 21
      Caption = #1055#1086#1076#1073#1086#1088
      OnClick = SpeedButton5Click
    end
    object provlabel: TLabel
      Left = 344
      Top = 8
      Width = 3
      Height = 13
    end
    object BitBtn2: TBitBtn
      Left = 512
      Top = 5
      Width = 75
      Height = 19
      Caption = #1086#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = BitBtn2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 764
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid: TDBGridEh
      Left = 0
      Top = 0
      Width = 764
      Height = 319
      Align = alClient
      AutoFitColWidths = True
      Ctl3D = False
      DataSource = DM.tempds
      Flat = True
      FooterColor = clMoneyGreen
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      FooterRowCount = 1
      FrozenCols = 1
      OptionsEh = [dghHighlightFocus, dghClearSelection]
      ParentCtl3D = False
      RowHeight = 2
      RowLines = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      OnCellClick = DBGridCellClick
      OnDrawColumnCell = DBGridDrawColumnCell
      OnKeyPress = DBGridKeyPress
      OnTitleBtnClick = DBGridTitleBtnClick
      Columns = <
        item
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = DBGridColumns0EditButtons0Click
            end>
          FieldName = 'NAME'
          Footer.FieldName = 'NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          ReadOnly = True
          Title.TitleButton = True
          Width = 215
        end
        item
          EditButtons = <>
          FieldName = 'ostatok'
          Footers = <>
          Title.Caption = #1042' '#1085#1072#1083#1080#1095#1080#1080
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'ED_IZM'
          Footers = <>
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'MEST'
          Footer.FieldName = 'MEST'
          Footer.ValueType = fvtSum
          Footers = <>
          Visible = False
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'KOL_VO'
          Footer.FieldName = 'KOL_VO'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = DBGridColumns6EditButtons0Click
            end>
          FieldName = 'CENABNDS'
          Footers = <>
          Title.Caption = #1094#1077#1085#1072
          Width = 54
        end
        item
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = DBGridColumns6EditButtons0Click
            end>
          FieldName = 'CENASNDS'
          Footers = <>
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'TOTAL'
          Footer.FieldName = 'TOTAL'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Width = 61
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
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = DBGridColumns9EditButtons0Click
            end>
          FieldName = 'KOL_UP'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093'.'#1076#1086#1082'.'
          Width = 61
        end>
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
      Caption = #1060#1086#1088#1084#1072' 12 ('#1087#1086#1089#1083'.'#1087#1086#1089#1090#1072#1074#1082#1072')'
      OnClick = N123Click
    end
    object N124: TMenuItem
      Caption = #1060#1086#1088#1084#1072' 12 ('#1087#1086#1089#1090#1072#1074#1082#1072' '#1091#1082#1072#1079#1072#1085#1072')'
      OnClick = N124Click
    end
  end
end
