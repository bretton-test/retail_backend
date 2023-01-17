object aform: Taform
  Left = -8
  Top = 4
  Width = 812
  Height = 568
  Caption = #1040#1085#1072#1083#1080#1079' '#1095#1077#1082#1086#1074
  Color = clBtnFace
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 5
      Width = 157
      Height = 19
      Caption = #1072#1085#1072#1083#1080#1079' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 267
      Top = 5
      Width = 24
      Height = 19
      Caption = #1087#1086' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 417
      Top = 4
      Width = 94
      Height = 19
      Caption = #1087#1072#1088#1072#1084#1077#1090#1088#1099' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 590
      Top = 4
      Width = 5
      Height = 19
      Caption = '-'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object datafrom: TDBDateTimeEditEh
      Left = 173
      Top = 4
      Width = 84
      Height = 19
      BorderStyle = bsNone
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
      OnChange = datafromChange
      EditFormat = 'DD/MM/YYYY'
    end
    object datato: TDBDateTimeEditEh
      Left = 293
      Top = 4
      Width = 84
      Height = 19
      BorderStyle = bsNone
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Flat = True
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnChange = datatoChange
    end
    object lpar: TDBNumberEditEh
      Left = 512
      Top = 4
      Width = 65
      Height = 18
      BorderStyle = bsNone
      Ctl3D = False
      currency = False
      EditButtons = <>
      Flat = True
      MaxValue = 1000.000000000000000000
      ParentCtl3D = False
      TabOrder = 2
      Visible = True
      OnChange = lparChange
    end
    object hpar: TDBNumberEditEh
      Left = 608
      Top = 3
      Width = 65
      Height = 18
      BorderStyle = bsNone
      Ctl3D = False
      currency = False
      EditButtons = <>
      Flat = True
      MaxValue = 2000.000000000000000000
      ParentCtl3D = False
      TabOrder = 3
      Visible = True
      OnChange = hparChange
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 41
    Width = 345
    Height = 459
    Align = alLeft
    DataSource = ds
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dd'
        Footers = <>
        Title.Caption = #1076#1072#1090#1072
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'hh'
        Footers = <>
        Title.Caption = #1074#1088#1077#1084#1103
        Title.TitleButton = True
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'chek'
        Footer.FieldName = 'chek'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '#1095#1077#1082#1072
        Title.TitleButton = True
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'kassa'
        Footers = <>
        Title.Caption = #8470' '#1082#1072#1089#1089#1099
        Title.TitleButton = True
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'sum'
        Footer.FieldName = 'sum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072
        Title.TitleButton = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'count'
        Footer.FieldName = 'count'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1087#1086#1082'.'
        Title.TitleButton = True
        Width = 37
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 500
    Width = 804
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = #1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 360
      Top = 8
      Width = 89
      Height = 25
      Caption = #1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 522
      Top = 8
      Width = 75
      Height = 25
      Caption = #1075#1088#1072#1092#1080#1082
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 597
      Top = 8
      Width = 116
      Height = 25
      Caption = #1058#1086#1074#1072#1088#1099' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084
      TabOrder = 4
      OnClick = Button6Click
    end
  end
  object Panel3: TPanel
    Left = 345
    Top = 41
    Width = 459
    Height = 459
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 459
      Height = 459
      Align = alClient
      DataSource = ds1
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterColor = clMoneyGreen
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FrozenCols = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'HH'
          Footers = <>
          Title.Caption = #1074#1088#1077#1084#1103
          Title.TitleButton = True
          Width = 38
        end
        item
          EditButtons = <>
          FieldName = 'LOWC'
          Footers = <>
          Title.Caption = '<'#1095#1077#1082#1080
          Title.TitleButton = True
          Width = 46
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'LOWS'
          Footers = <>
          Title.Caption = '<'#1089#1091#1084#1084#1072
          Title.TitleButton = True
          Width = 43
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'LOWP'
          Footers = <>
          Title.Caption = '<%'
          Title.TitleButton = True
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'MIDC'
          Footers = <>
          Title.Caption = '<>'#1095#1077#1082#1080
          Title.TitleButton = True
          Width = 54
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'MIDS'
          Footers = <>
          Title.Caption = '<>'#1089#1091#1084#1084#1072
          Title.TitleButton = True
          Width = 57
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'MIDP'
          Footers = <>
          Title.Caption = '<>%'
          Title.TitleButton = True
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'HIC'
          Footers = <>
          Title.Caption = '>'#1095#1077#1082#1080
          Title.TitleButton = True
          Width = 51
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'HIS'
          Footers = <>
          Title.Caption = '>'#1089#1091#1084#1084#1072
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'HIP'
          Footers = <>
          Title.Caption = '>%'
          Title.TitleButton = True
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'ALC'
          Footers = <>
          Title.Caption = #1042#1089#1077' '#1095#1077#1082#1080
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'ALS'
          Footers = <>
          Title.Caption = #1074#1089#1103' '#1089#1091#1084#1084#1072
        end
        item
          DisplayFormat = '#.00'
          EditButtons = <>
          FieldName = 'ALP'
          Footers = <>
          Title.Caption = #1074#1089#1077' %'
          Title.TitleButton = True
          Width = 37
        end>
    end
  end
  object tabform: TSpeedForm
    Left = 222
    Top = 64
    Width = 707
    Height = 353
    Style = dsIcon
    Caption = #1058#1086#1074#1072#1088#1099' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084
    TabOrder = 5
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 699
      Height = 296
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = '< '#1095#1077#1082#1080
        object DBGridEh2: TDBGridEh
          Left = 0
          Top = 0
          Width = 691
          Height = 268
          Align = alClient
          DataSource = DataSource2
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clMoneyGreen
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FrozenCols = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ShowHint = True
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          UseMultiTitle = True
          Columns = <
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'plu'
              Footers = <>
              Title.Caption = #1082#1086#1076
              Title.TitleButton = True
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #1090#1086#1074#1072#1088
              Title.TitleButton = True
              Width = 317
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'price'
              Footers = <>
              Title.Caption = #1094#1077#1085#1072
              Title.TitleButton = True
              Width = 36
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'count'
              Footers = <>
              Title.Caption = #1087#1086#1082#1091#1087#1086#1082
              Title.TitleButton = True
              Width = 44
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'kolvo'
              Footers = <>
              Title.Caption = #1074#1089#1077#1075#1086
              Title.TitleButton = True
              Width = 58
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'summa'
              Footers = <>
              Title.Caption = #1089#1091#1084#1084#1072
              Title.TitleButton = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = '<> '#1095#1077#1082#1080
        ImageIndex = 1
        object DBGridEh3: TDBGridEh
          Left = 0
          Top = 0
          Width = 691
          Height = 268
          Align = alClient
          DataSource = DataSource3
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clMoneyGreen
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FrozenCols = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ShowHint = True
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'plu'
              Footers = <>
              Title.Caption = #1082#1086#1076
              Title.TitleButton = True
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #1090#1086#1074#1072#1088
              Title.TitleButton = True
              Width = 317
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'price'
              Footers = <>
              Title.Caption = #1094#1077#1085#1072
              Title.TitleButton = True
              Width = 36
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'count'
              Footers = <>
              Title.Caption = #1087#1086#1082#1091#1087#1086#1082
              Title.TitleButton = True
              Width = 44
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'kolvo'
              Footers = <>
              Title.Caption = #1074#1089#1077#1075#1086
              Title.TitleButton = True
              Width = 58
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'summa'
              Footers = <>
              Title.Caption = #1089#1091#1084#1084#1072
              Title.TitleButton = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = '> '#1095#1077#1082#1080
        ImageIndex = 2
        object DBGridEh4: TDBGridEh
          Left = 0
          Top = 0
          Width = 691
          Height = 268
          Align = alClient
          DataSource = DataSource1
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clMoneyGreen
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FrozenCols = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ShowHint = True
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'plu'
              Footers = <>
              Title.Caption = #1082#1086#1076
              Title.TitleButton = True
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #1090#1086#1074#1072#1088
              Title.TitleButton = True
              Width = 317
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'price'
              Footers = <>
              Title.Caption = #1094#1077#1085#1072
              Title.TitleButton = True
              Width = 36
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'count'
              Footers = <>
              Title.Caption = #1087#1086#1082#1091#1087#1086#1082
              Title.TitleButton = True
              Width = 44
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'kolvo'
              Footers = <>
              Title.Caption = #1074#1089#1077#1075#1086
              Title.TitleButton = True
              Width = 58
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'summa'
              Footers = <>
              Title.Caption = #1089#1091#1084#1084#1072
              Title.TitleButton = True
            end>
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1074#1089#1077' '#1095#1077#1082#1080
        ImageIndex = 3
        object DBGridEh5: TDBGridEh
          Left = 0
          Top = 0
          Width = 691
          Height = 268
          Align = alClient
          DataSource = DataSource4
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clMoneyGreen
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FrozenCols = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ShowHint = True
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'plu'
              Footers = <>
              Title.Caption = #1082#1086#1076
              Title.TitleButton = True
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #1090#1086#1074#1072#1088
              Title.TitleButton = True
              Width = 317
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'price'
              Footers = <>
              Title.Caption = #1094#1077#1085#1072
              Title.TitleButton = True
              Width = 36
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'count'
              Footers = <>
              Title.Caption = #1087#1086#1082#1091#1087#1086#1082
              Title.TitleButton = True
              Width = 44
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'kolvo'
              Footers = <>
              Title.Caption = #1074#1089#1077#1075#1086
              Title.TitleButton = True
              Width = 58
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'summa'
              Footers = <>
              Title.Caption = #1089#1091#1084#1084#1072
              Title.TitleButton = True
            end>
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 296
      Width = 699
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Button7: TButton
        Left = 4
        Top = 2
        Width = 85
        Height = 25
        Caption = #1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 88
        Top = 2
        Width = 75
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100
        TabOrder = 1
        OnClick = Button8Click
      end
    end
  end
  object chartform: TSpeedForm
    Left = 16
    Top = -8
    Width = 801
    Height = 545
    Style = dsIcon
    Caption = 'chartform'
    TabOrder = 4
    OnClose = chartformClose
    object DBChart1: TDBChart
      Left = 0
      Top = 0
      Width = 385
      Height = 481
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Foot.Text.Strings = (
        #1082#1088#1072#1089#1085#1099#1081' -'#1053#1044','#1079#1077#1083#1105#1085#1099#1081'-'#1057#1044','#1089#1080#1085#1080#1081'-'#1042#1044)
      LeftWall.Color = 10485760
      Title.Text.Strings = (
        #1082#1086#1083'-'#1074#1086' '#1095#1077#1082#1086#1074)
      Legend.Visible = False
      View3D = False
      TabOrder = 0
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = False
        DataSource = chartquery
        SeriesColor = clRed
        ShowInLegend = False
        XLabelsSource = 'TO_NUMBER(HH)'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'TO_NUMBER(HH)'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'LOWC'
      end
      object Series2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = False
        DataSource = chartquery
        SeriesColor = clGreen
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'TO_NUMBER(HH)'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'MIDC'
      end
      object Series3: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = False
        DataSource = chartquery
        SeriesColor = 16711808
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'TO_NUMBER(HH)'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'HIC'
      end
    end
    object DBChart2: TDBChart
      Left = 384
      Top = 0
      Width = 385
      Height = 481
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Foot.Text.Strings = (
        #1082#1088#1072#1089#1085#1099#1081' -'#1053#1044','#1079#1077#1083#1105#1085#1099#1081'-'#1057#1044','#1089#1080#1085#1080#1081'-'#1042#1044)
      LeftWall.Color = 10485760
      Title.Text.Strings = (
        #1089#1091#1084#1084#1099' '#1095#1077#1082#1086#1074)
      Legend.Visible = False
      View3D = False
      TabOrder = 1
      object BarSeries1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = False
        DataSource = chartquery
        SeriesColor = clRed
        ShowInLegend = False
        XLabelsSource = 'TO_NUMBER(HH)'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'TO_NUMBER(HH)'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'LOWS'
      end
      object BarSeries2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = False
        DataSource = chartquery
        SeriesColor = clGreen
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'TO_NUMBER(HH)'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'MIDS'
      end
      object BarSeries3: TBarSeries
        Marks.ArrowLength = 20
        Marks.Style = smsValue
        Marks.Visible = False
        DataSource = chartquery
        SeriesColor = 16711808
        XLabelsSource = 'TO_NUMBER(HH)'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'TO_NUMBER(HH)'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'HIS'
      end
    end
    object Button5: TButton
      Left = 24
      Top = 488
      Width = 75
      Height = 25
      Caption = #1087#1077#1095#1072#1090#1100
      TabOrder = 2
      OnClick = Button5Click
    end
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 376
    Top = 224
  end
  object ds: TDataSource
    DataSet = ClientDS
    Left = 408
    Top = 224
  end
  object query: TOracleDataSet
    SQL.Strings = (
      
        'select to_char(r.data,'#39'dd.mm.yyyy'#39') dd,to_char(max(r.data),'#39'hh24' +
        '.mi'#39') hh,r.chek,r.kassa,sum(r.sum) sum,count(id) count'
      'from  pos.arc_report r where r.id in (11,12)'
      
        'and r.data>=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toption' +
        's where parametr='#39'from'#39')'
      
        'and r.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'to'#39')'
      'and stornoflag=999'
      'group by to_char(r.data,'#39'dd.mm.yyyy'#39'),r.chek,r.kassa')
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
      0300000006000000040000004348454B0100000000050000004B415353410100
      0000000300000053554D010000000005000000434F554E540100000000020000
      00444401000000000200000048480100000000}
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
    Left = 176
    Top = 96
    object queryDD: TStringField
      FieldName = 'DD'
      Size = 10
    end
    object queryHH: TStringField
      FieldName = 'HH'
      Size = 5
    end
    object queryCHEK: TFloatField
      FieldName = 'CHEK'
    end
    object queryKASSA: TIntegerField
      FieldName = 'KASSA'
      Required = True
    end
    object querySUM: TFloatField
      FieldName = 'SUM'
    end
    object queryCOUNT: TFloatField
      FieldName = 'COUNT'
    end
  end
  object pquery: TOracleDataSet
    SQL.Strings = (
      'select hh,'
      'nvl(sum(nc),0) lowc,'
      'nvl(sum(ns),0) lows,'
      'nvl(sum(sc),0) midc,'
      'nvl(sum(ss),0) mids,'
      'nvl(sum(wc),0) hic,'
      'nvl(sum(ws),0) his,'
      'nvl(sum(ac),0) alc,'
      'nvl(sum(als),0) als'
      'from tmp.vchekhour'
      'group by hh'
      'union all'
      'select hh,'
      'nvl(sum(nc),0) lowc,'
      'nvl(sum(ns),0) lows,'
      'nvl(sum(sc),0) midc,'
      'nvl(sum(ss),0) mids,'
      'nvl(sum(wc),0) hic,'
      'nvl(sum(ws),0) his,'
      'nvl(sum(ac),0) alc,'
      'nvl(sum(als),0) als'
      'from tmp.vchekday'
      'group by hh'
      'union all'
      'select hh,'
      'nvl(sum(nc),0) lowc,'
      'nvl(sum(ns),0) lows,'
      'nvl(sum(sc),0) midc,'
      'nvl(sum(ss),0) mids,'
      'nvl(sum(wc),0) hic,'
      'nvl(sum(ws),0) his,'
      'nvl(sum(ac),0) alc,'
      'nvl(sum(als),0) als'
      'from tmp.vchekall'
      'group by hh')
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
      03000000090000000200000048480100000000040000004C4F57430100000000
      040000004C4F57530100000000040000004D4944430100000000040000004D49
      4453010000000003000000484943010000000003000000484953010000000003
      000000414C43010000000003000000414C530100000000}
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
    OnCalcFields = pqueryCalcFields
    Left = 177
    Top = 249
    object pqueryHH: TStringField
      FieldName = 'HH'
      Size = 5
    end
    object pqueryLOWC: TFloatField
      FieldName = 'LOWC'
    end
    object pqueryLOWS: TFloatField
      FieldName = 'LOWS'
      DisplayFormat = '#.00'
      currency = True
    end
    object pqueryMIDC: TFloatField
      FieldName = 'MIDC'
    end
    object pqueryMIDS: TFloatField
      FieldName = 'MIDS'
      DisplayFormat = '#.00'
      currency = True
    end
    object pqueryHIC: TFloatField
      FieldName = 'HIC'
    end
    object pqueryHIS: TFloatField
      FieldName = 'HIS'
      DisplayFormat = '#.00'
      currency = True
    end
    object pqueryALC: TFloatField
      FieldName = 'ALC'
    end
    object pqueryALS: TFloatField
      FieldName = 'ALS'
      DisplayFormat = '#.00'
      currency = True
    end
    object pquerylowp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'lowp'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object pquerymidp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'midp'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object pqueryhip: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hip'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object pqueryalp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'alp'
      DisplayFormat = '#.00'
      Calculated = True
    end
  end
  object ClientDs1: TClientDataSet
    Aggregates = <>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 384
    Top = 272
  end
  object ds1: TDataSource
    DataSet = ClientDs1
    Left = 416
    Top = 272
  end
  object sumquery: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(sum),0) sum'
      'from  pos.arc_report r where r.id=55'
      
        'and r.data>=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toption' +
        's where parametr='#39'from'#39')'
      
        'and r.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where '
      'parametr='#39'to'#39')')
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
    QBEDefinition.QBEFieldDefs = {03000000010000000300000053554D0100000000}
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
    Left = 184
    Top = 176
    object sumquerySUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object PrintDB: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = []
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 2.000000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 177
    Top = 321
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 168
    object N3: TMenuItem
      Caption = #1074#1099#1073#1088#1072#1090#1100' '#1074#1089#1105
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1082#1072#1082
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'file1'
    Filter = 
      'Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HT' +
      'ML file (*.htm)|*.HTM|Rich Text Format (*.rtf)|*.RTF|Microsoft E' +
      'xcel Workbook (*.xls)|*.XLS'
    Left = 498
    Top = 238
  end
  object chartquery: TOracleDataSet
    SQL.Strings = (
      'select to_number(hh),'
      'nvl(sum(nc),0) lowc,'
      'nvl(sum(ns),0) lows,'
      'nvl(sum(sc),0) midc,'
      'nvl(sum(ss),0) mids,'
      'nvl(sum(wc),0) hic,'
      'nvl(sum(ws),0) his,'
      'nvl(sum(ac),0) alc,'
      'nvl(sum(als),0) als'
      'from tmp.vchekhour'
      'group by hh')
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
      0300000009000000040000004C4F57430100000000040000004C4F5753010000
      0000040000004D4944430100000000040000004D494453010000000003000000
      484943010000000003000000484953010000000003000000414C430100000000
      03000000414C5301000000000D000000544F5F4E554D42455228484829010000
      0000}
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
    OnCalcFields = pqueryCalcFields
    Left = 97
    Top = 97
  end
  object maxtovarq: TOracleDataSet
    SQL.Strings = (
      
        'select a.plu,t.name,t.price,count(a.plu) count,sum(quantity) kol' +
        'vo,sum(sum) summa'
      'from pos.arc_report a,'
      'tmp.tkatalog t,'
      'tmp.maxchek m'
      'where a.id in (11,12)'
      'and a.chek=m.chek'
      'and a.data=m.data'
      'and t.plu=a.plu'
      'group by a.plu,t.name,t.price')
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
    Left = 712
    Top = 135
  end
  object mintovarq: TOracleDataSet
    SQL.Strings = (
      
        'select a.plu,t.name,t.price,count(a.plu) count,sum(quantity) kol' +
        'vo,sum(sum) summa'
      'from pos.arc_report a,'
      'tmp.tkatalog t,'
      'tmp.minchek m'
      'where a.id in (11,12)'
      'and a.chek=m.chek'
      'and a.data=m.data'
      'and t.plu=a.plu'
      'group by a.plu,t.name,t.price')
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
    Left = 712
    Top = 191
  end
  object midtovarq: TOracleDataSet
    SQL.Strings = (
      
        'select a.plu,t.name,t.price,count(a.plu) count,sum(quantity) kol' +
        'vo,sum(sum) summa'
      'from pos.arc_report a,'
      'tmp.tkatalog t,'
      'tmp.midchek m'
      'where a.id in (11,12)'
      'and a.chek=m.chek'
      'and a.data=m.data'
      'and t.plu=a.plu'
      'group by a.plu,t.name,t.price')
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
    Left = 712
    Top = 247
  end
  object maxds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 768
    Top = 135
  end
  object minds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 768
    Top = 191
  end
  object midds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 768
    Top = 255
  end
  object DataSource1: TDataSource
    DataSet = maxds
    Left = 816
    Top = 143
  end
  object DataSource2: TDataSource
    DataSet = minds
    Left = 824
    Top = 207
  end
  object DataSource3: TDataSource
    DataSet = midds
    Left = 816
    Top = 263
  end
  object alltovarq: TOracleDataSet
    SQL.Strings = (
      
        'select a.plu,t.name,t.price,count(a.plu) count,sum(quantity) kol' +
        'vo,sum(sum) summa'
      'from pos.arc_report a,'
      'tmp.tkatalog t'
      'where a.id in (11,12)'
      
        'and a.data>=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toption' +
        's where parametr='#39'from'#39')'
      
        'and a.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'to'#39')'
      'and t.plu=a.plu'
      'group by a.plu,t.name,t.price')
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
    Left = 712
    Top = 303
  end
  object allds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 768
    Top = 311
  end
  object DataSource4: TDataSource
    DataSet = allds
    Left = 816
    Top = 319
  end
  object printtovar: TPrintDBGridEh
    Options = []
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 2.000000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 582
    Top = 255
  end
end
