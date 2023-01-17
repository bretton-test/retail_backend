object BalForm: TBalForm
  Left = 260
  Top = 208
  Width = 724
  Height = 439
  AlphaBlendValue = 5
  Caption = #1042#1079#1072#1080#1084#1086#1088#1072#1089#1095#1077#1090#1099
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
    Top = 0
    Width = 716
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 176
      Top = 8
      Width = 23
      Height = 19
      Caption = '...'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 216
      Top = 8
      Width = 23
      Height = 19
      Caption = 'X'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Postname: TEdit
      Left = 8
      Top = 8
      Width = 169
      Height = 19
      ReadOnly = True
      TabOrder = 0
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 33
    Width = 716
    Height = 372
    Align = alClient
    AutoFitColWidths = True
    Ctl3D = False
    DataSource = DM.BalDS
    EditActions = [geaCopyEh, geaPasteEh]
    FooterColor = clMoneyGreen
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghTraceColSizing]
    ParentCtl3D = False
    RowHeight = 4
    RowLines = 1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    OnDblClick = DBGridDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TIP'
        Footers = <>
        Title.Caption = #1090#1080#1087
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1050#1083#1080#1077#1085#1090
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'DATA'
        Footers = <>
        Title.Caption = #1076#1072#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'RASHOD'
        Footer.FieldName = 'RASHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1088#1072#1089#1093#1086#1076
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'PRIHOD'
        Footer.FieldName = 'PRIHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1088#1080#1093#1086#1076
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'DOLG'
        Footer.FieldName = 'DOLG'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1073#1072#1083#1072#1085#1089
        Width = 82
      end>
  end
end
