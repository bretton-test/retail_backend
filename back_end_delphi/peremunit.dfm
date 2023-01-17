object Peremform: TPeremform
  Left = 314
  Top = 215
  Width = 638
  Height = 429
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
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
    Width = 630
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 194
      Height = 16
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#8470
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 288
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
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 80
      Height = 16
      Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
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
      Top = 59
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
    object Label5: TLabel
      Left = 224
      Top = 57
      Width = 66
      Height = 16
      Caption = #1085#1072' '#1057#1082#1083#1072#1076' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
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
    object numbered: TEdit
      Left = 208
      Top = 5
      Width = 73
      Height = 19
      TabOrder = 0
      OnChange = numberedChange
    end
    object datanakl: TDateTimePicker
      Left = 312
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
    object osnedit: TEdit
      Left = 96
      Top = 32
      Width = 345
      Height = 19
      TabOrder = 2
    end
    object skladout: TDBLookupComboboxEh
      Left = 90
      Top = 59
      Width = 121
      Height = 17
      EditButtons = <>
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListSource = DM.skladds
      TabOrder = 3
      Visible = True
      OnChange = skladoutChange
    end
    object skladin: TDBLookupComboboxEh
      Left = 298
      Top = 59
      Width = 121
      Height = 17
      EditButtons = <>
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListSource = DM.skladds
      TabOrder = 4
      Visible = True
      OnChange = skladinChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 630
    Height = 290
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgrid: TDBGridEh
      Left = 0
      Top = 0
      Width = 630
      Height = 290
      Align = alClient
      AutoFitColWidths = True
      DataSource = DM.tempds
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clMoneyGreen
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      FooterRowCount = 1
      FrozenCols = 1
      ParentFont = False
      RowHeight = 16
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      TitleHeight = 15
      TitleLines = 1
      OnKeyPress = dbgridKeyPress
      Columns = <
        item
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = dbgridColumns0EditButtons0Click
            end>
          FieldName = 'NAME'
          Footer.FieldName = 'NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 161
        end
        item
          EditButtons = <>
          FieldName = 'ED_IZM'
          Footers = <>
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'MEST'
          Footers = <>
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'KOL_UP'
          Footers = <>
          Width = 66
        end
        item
          EditButtons = <>
          FieldName = 'ROSSIP'
          Footers = <>
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'KOL_VO'
          Footer.FieldName = 'KOL_VO'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'ostatok'
          Footers = <>
          Title.Caption = #1042' '#1053#1072#1083#1080#1095#1080#1080
          Width = 56
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 371
    Width = 630
    Height = 24
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ok: TSpeedButton
      Left = 464
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
      Left = 545
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
    object PrintB: TBitBtn
      Left = 2
      Top = 3
      Width = 63
      Height = 20
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
    object BitBtn3: TBitBtn
      Left = 65
      Top = 3
      Width = 63
      Height = 20
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 0
      OnClick = BitBtn3Click
    end
  end
end
