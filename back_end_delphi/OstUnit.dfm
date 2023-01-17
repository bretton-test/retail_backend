object OstForm: TOstForm
  Left = 284
  Top = 218
  Width = 722
  Height = 467
  AlphaBlendValue = 5
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074' '#1087#1086' '#1089#1082#1083#1072#1076#1091
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 341
      Top = 8
      Width = 132
      Height = 17
      BevelOuter = bvNone
      TabOrder = 0
    end
    object filtrCombo: TDBComboBoxEh
      Left = 176
      Top = 6
      Width = 161
      Height = 20
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Flat = True
      Items.Strings = (
        #1087#1086#1083#1085#1099#1081' '
        #1082#1088#1072#1090#1082#1080#1081
        #1085#1077#1090' '#1087#1088#1086#1076#1072#1078
        #1087#1088#1086#1076#1072#1085#1086
        #1087#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
        #1073#1077#1079' '#1085#1086#1083#1077#1081)
      ParentFont = False
      TabOrder = 1
      Text = #1060#1080#1083#1100#1090#1088
      Visible = True
      OnChange = filtrComboChange
    end
    object Edit1: TEdit
      Left = 14
      Top = 6
      Width = 155
      Height = 19
      TabOrder = 2
      OnKeyDown = Edit1KeyDown
      OnKeyPress = Edit1KeyPress
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 29
    Width = 714
    Height = 379
    Align = alClient
    AutoFitColWidths = True
    DataSource = DM.OstDs
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghTraceColSizing]
    RowHeight = 2
    RowLines = 1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = DBGridDblClick
    OnDrawColumnCell = DBGridDrawColumnCell
    OnGetCellParams = DBGridGetCellParams
    OnKeyDown = DBGridKeyDown
    OnKeyPress = DBGridKeyPress
    OnTitleBtnClick = DBGridTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footer.Value = #1089#1090#1088#1086#1082
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 179
      end
      item
        EditButtons = <>
        FieldName = 'PRNOM'
        Footers = <>
        Title.Caption = #8470' '#1085#1072#1082#1083'.'
        Visible = False
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'KLIENT'
        Footer.FieldName = 'PLU'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1082#1083#1080#1077#1085#1090
        Width = 88
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATA'
        Footers = <>
        Title.Caption = #1076#1072#1090#1072
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072' '#1088#1077#1072#1083'.'
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'PRIHOD'
        Footer.FieldName = 'PRIHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1088#1080#1093#1086#1076
        Title.TitleButton = True
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'RASHOD'
        Footer.FieldName = 'RASHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1088#1072#1089#1093#1086#1076
        Title.TitleButton = True
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'OSTATOK'
        Footer.FieldName = 'OSTATOK'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1086#1089#1090#1072#1090#1086#1082
        Title.TitleButton = True
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'SUM_PRIHOD'
        Footer.FieldName = 'SUM_PRIHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1055#1088#1080#1093'.'#1057#1091#1084#1084#1072
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'SUM_RASHOD'
        Footer.FieldName = 'SUM_RASHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1072#1089#1093'.'#1057#1091#1084#1084#1072
        Title.TitleButton = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 408
    Width = 714
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 440
      Top = 8
      Width = 175
      Height = 13
      Caption = #1042#1089#1077#1075#1086' '#1085#1072' '#1089#1082#1083#1072#1076#1077' '#1058#1086#1074#1072#1088#1072' '#1085#1072' '#1057#1091#1084#1084#1091
    end
    object Label2: TLabel
      Left = 624
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object BitBtn1: TBitBtn
      Left = 13
      Top = 3
      Width = 75
      Height = 22
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 88
      Top = 3
      Width = 75
      Height = 22
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 163
      Top = 3
      Width = 75
      Height = 22
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object partq: TOracleQuery
    SQL.Strings = (
      'update tmp.toptions'
      
        'set value=(select min(partia) from tmp.kniga where nom=:nom and ' +
        'plu=:plu and prihod>0 and otkat=0)'
      'where parametr='#39'part'#39)
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D03000000000000000000000004000000
      3A504C55030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 120
    Top = 128
  end
end
