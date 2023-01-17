object abcform: Tabcform
  Left = 218
  Top = 229
  Width = 784
  Height = 480
  Caption = 'abcform'
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
    Width = 776
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 5
      Width = 286
      Height = 19
      Caption = #1072#1085#1072#1083#1080#1079' '#1087#1088#1086#1076#1072#1078' '#1090#1086#1074#1072#1088#1072'  '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 419
      Top = 5
      Width = 20
      Height = 19
      Caption = #1087#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object datafrom: TDBDateTimeEditEh
      Left = 317
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
      Left = 461
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 776
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 216
      Top = 8
      Width = 129
      Height = 25
      Caption = #1050#1072#1082' '#1101#1090#1086' '#1089#1095#1080#1090#1072#1077#1090#1089#1103' ? '
      OnClick = SpeedButton1Click
    end
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
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = #1082#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 41
    Width = 776
    Height = 364
    Align = alClient
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
    FrozenCols = 2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDblClickOptimizeColWidth]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    RowHeight = 2
    RowLines = 1
    ShowHint = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 5
    UseMultiTitle = True
    OnDrawColumnCell = DBGridDrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'plu'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1076
        Title.Hint = #1082#1086#1076' '#1090#1086#1074#1072#1088#1072
        Title.TitleButton = True
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1058#1086#1074#1072#1088
        Title.TitleButton = True
        Width = 233
      end
      item
        EditButtons = <>
        FieldName = 'katname'
        Footers = <>
        Title.Caption = #1082#1072#1090#1077#1075#1086#1088#1080#1103
        Title.TitleButton = True
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'proizw'
        Footers = <>
        Title.Caption = #1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'postav'
        Footers = <>
        Title.Caption = #1087#1086#1089#1090#1072#1074#1097#1080#1082
        Title.TitleButton = True
        Width = 95
      end
      item
        DisplayFormat = '#.00'
        EditButtons = <>
        FieldName = 'price'
        Footers = <>
        Title.Caption = ' '#1094#1077#1085#1072'= '#1089#1091#1084#1084#1072'/ '#1082#1086#1083'-'#1074#1086
        Title.TitleButton = True
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'ed_izm'
        Footers = <>
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Title.Orientation = tohVertical
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'wes'
        Footers = <>
        Title.Caption = #1096#1090'/'#1082#1075
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 31
      end
      item
        DisplayFormat = '#.000'
        EditButtons = <>
        FieldName = 'sumkol'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1078
        Title.TitleButton = True
      end
      item
        DisplayFormat = '#.00'
        EditButtons = <>
        FieldName = 'sumsum'
        Footer.FieldName = 'sumsum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'abc'
        Footers = <>
        Title.TitleButton = True
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'procplu'
        Footers = <>
        Title.Caption = #1085#1072#1088#1072#1089#1090#1072#1102#1097#1080#1081' %'#1090#1086#1074#1072#1088#1072' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1075#1088#1091#1087#1087#1077
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'procsum'
        Footers = <>
        Title.Caption = #1085#1072#1088#1072#1089#1090#1072#1102#1097#1080#1081' %'#1087#1088#1086#1076#1072#1078' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1075#1088#1091#1087#1087#1077
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'sumtovar'
        Footers = <>
        Title.Caption = #1085#1072#1088#1072#1089#1090#1072#1102#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1075#1088#1091#1087#1087#1077
        Width = 70
      end>
  end
  object optform: TSpeedForm
    Left = 544
    Top = 16
    Width = 225
    Height = 297
    Position = poOwnerFormCenter
    Style = dsIcon
    Caption = #1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1090#1072#1073#1083#1080#1094#1099
    TabOrder = 3
    StayOnTop = True
    Scaled = False
    object BitBtn1: TBitBtn
      Left = 40
      Top = 240
      Width = 91
      Height = 25
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      Kind = bkYes
    end
    object BitBtn2: TBitBtn
      Left = 136
      Top = 240
      Width = 75
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkNo
    end
    object tablbox: TCheckListBox
      Left = 0
      Top = 0
      Width = 217
      Height = 233
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
  end
  object helpform: TSpeedForm
    Left = 120
    Top = 24
    Width = 553
    Height = 457
    Style = dsIcon
    Caption = '?'
    TabOrder = 4
    object Panel3: TPanel
      Left = 0
      Top = 400
      Width = 545
      Height = 30
      Align = alBottom
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 267
        Top = 5
        Width = 102
        Height = 22
        Caption = #1087#1086#1085#1103#1090#1085#1086
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 370
        Top = 5
        Width = 95
        Height = 22
        Caption = #1085#1077' '#1087#1086#1085#1103#1090#1085#1086
        OnClick = SpeedButton2Click
      end
    end
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 545
      Height = 400
      Align = alClient
      Lines.Strings = (
        #1055#1086#1083#1091#1095#1072#1077#1084' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1086#1076#1072#1078' '#1090#1086#1074#1072#1088#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076'.'
        
          #1057#1086#1088#1090#1080#1088#1091#1077#1084' '#1089#1087#1080#1089#1086#1082' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1090#1086#1074#1072#1088#1072' '#1080' '#1089#1091#1084#1084#1077' '#1087#1088#1086#1076#1072#1078' '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1091#1073 +
          #1099#1074#1072#1085#1080#1103'.'
        
          '1. '#1057#1095#1080#1090#1072#1077#1084' '#1082#1086#1083'-'#1074#1086' '#1090#1086#1074#1072#1088#1086#1074' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1077#1089#1090#1100' '#1087#1088#1086#1076#1072#1078#1080' '#1079#1072 +
          ' '#1087#1077#1088#1080#1086#1076'.'
        
          #1044#1086#1087#1091#1089#1090#1080#1084' '#1101#1090#1086' 100 '#1077#1076#1080#1085#1080#1094'. '#1058#1086#1075#1076#1072' % '#1082#1086#1083'-'#1074#1072' '#1091' '#1082#1072#1078#1076#1086#1075#1086' '#1090#1086#1074#1072#1088#1072' '#1088#1072#1074#1077#1085' 1' +
          '.'
        #1085#1072#1088#1072#1089#1090#1072#1102#1097#1080#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1073#1091#1076#1077#1090' '#1080#1084#1077#1090#1100' '#1074#1080#1076' 1,2,3.....'
        '2. '#1057#1095#1080#1090#1072#1077#1084' '#1089#1091#1084#1084#1091' '#1087#1088#1086#1076#1072#1078' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076'.'
        '3. '#1057#1095#1080#1090#1072#1077#1084' '#1087#1088#1086#1094#1077#1085#1090' '#1087#1088#1086#1076#1072#1078' '#1090#1086#1074#1072#1088#1072' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080'.'
        '%'#1090#1086#1074#1072#1088#1072'= '#1089#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078' '#1090#1086#1074#1072#1088#1072' / '#1089#1091#1084#1084#1091' '#1087#1088#1086#1076#1072#1078' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' * 100'
        
          #1076#1086#1087#1091#1089#1090#1080#1084' '#1087#1080#1074#1086' '#1073#1072#1083#1090#1080#1082#1072'3 - 10%,'#1087#1080#1074#1086' '#1073#1072#1083#1090#1080#1082#1072' 5 -  6%, '#1087#1080#1074#1086' '#1073#1072#1083#1090#1080#1082#1072' ' +
          '7 - 3%'
        #1085#1072#1088#1072#1089#1090#1072#1102#1097#1080#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1087#1088#1086#1076#1072#1078' '#1073#1091#1076#1077#1090' '#1080#1084#1077#1090#1100' '#1074#1080#1076' 10,16,19...'
        '4. '#1057#1082#1083#1072#1076#1099#1074#1072#1077#1084' % '#1082#1086#1083'-'#1074#1072' '#1080' % '#1087#1088#1086#1076#1072#1078'.'
        #1087#1086#1083#1091#1095#1072#1077#1084'  '#1057#1091#1084#1084#1072'= 11,18,22...'
        
          '5. '#1055#1086#1074#1090#1086#1088#1103#1077#1084' '#1076#1086' '#1090#1077#1093' '#1087#1086#1088' '#1087#1086#1082#1072' '#1089#1091#1084#1084#1072' % '#1082#1086#1083'-'#1074#1072' '#1080' % '#1087#1088#1086#1076#1072#1078' '#1084#1077#1085#1100#1096#1077' 10' +
          '0'
        
          '6. '#1077#1089#1083#1080' '#1057#1091#1084#1084#1072' >= 100 '#1090#1086' '#1084#1099' '#1087#1086#1083#1091#1095#1080#1083#1080' '#1075#1088#1091#1087#1087#1091' '#1040' '#1074' '#1076#1072#1085#1085#1086#1081' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' ' +
          #1090#1086#1074#1072#1088#1072'.'
        
          '7. '#1042#1099#1095#1080#1090#1072#1077#1084' '#1080#1079' '#1086#1073#1097#1077#1075#1086' '#1082#1086#1083'-'#1074#1072' '#1090#1086#1074#1072#1088#1086#1074' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1082#1086#1083'-'#1074#1086' '#1090#1086#1074#1072#1088#1086#1074' ' +
          #1075#1088#1091#1087#1087#1099' '#1040'.'
        '8. '#1042#1099#1095#1080#1090#1072#1077#1084' '#1080#1079' '#1086#1073#1097#1077#1081' '#1089#1091#1084#1084#1099' '#1087#1088#1086#1076#1072#1078' '#1089#1091#1084#1084#1091' '#1087#1088#1086#1076#1072#1078' '#1075#1088#1091#1087#1087#1099' '#1040'.'
        '9. '#1055#1086#1074#1090#1086#1088#1103#1077#1084' '#1096#1072#1075#1080' 3...6.'
        '10. '#1055#1086#1083#1091#1095#1072#1077#1084' '#1075#1088#1091#1087#1087#1091' B.'
        '11. '#1042#1089#1105' '#1086#1089#1090#1072#1083#1100#1085#1086#1077' '#1101#1090#1086' '#1075#1088#1091#1087#1087#1072' '#1057'.'
        ''
        
          #1045#1089#1083#1080' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091' '#1080#1083#1080' '#1087#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088', '#1090#1086' '#1094#1080#1092#1088#1099' '#1089' '#1085#1072#1088#1072#1089#1090 +
          #1072#1102#1097#1080#1084' '#1080#1090#1086#1075#1086#1084' '#1090#1077#1088#1103#1102#1090' '
        #1089#1084#1099#1089#1083'.'
        '  ')
      ReadOnly = True
      TabOrder = 1
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
  object Query: TOracleDataSet
    SQL.Strings = (
      
        'select r.plu,r.name,k.kat,k.name katname,w.name proizw,r.ed_izm,' +
        'p.name postav,'
      'round(sum(r.total)/sum(r.kolvo),2)   price,t.shtuka wes,'
      'sum(r.kolvo) sumkol,'
      'sum(r.total) sumsum'
      
        'from tmp.kkmreport r,tmp.tkatalog t,tmp.tkat k,tmp.tproizw w,tmp' +
        '.tpostav p,tmp.vkkmdoc v'
      
        'where r.plu=t.plu and t.kat=k.kat and t.proizw=w.proizw and p.co' +
        'd=t.post'
      'and r.doc=v.doc'
      
        'group by r.plu,r.name,r.ed_izm,k.name,w.name,k.kat,p.name,t.shtu' +
        'ka'
      'order by k.name,sum(r.total) desc')
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
      030000000B00000003000000504C550100000000040000004E414D4501000000
      00030000004B415401000000000600000045445F495A4D010000000005000000
      50524943450100000000070000004B41544E414D450100000000060000005052
      4F495A5701000000000600000053554D4B4F4C01000000000600000053554D53
      554D010000000006000000504F53544156010000000003000000574553010000
      0000}
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
    OnCalcFields = QueryCalcFields
    Left = 296
    Top = 224
    object QueryPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QueryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QueryKAT: TIntegerField
      FieldName = 'KAT'
      Required = True
    end
    object QueryKATNAME: TStringField
      FieldName = 'KATNAME'
      Required = True
      Size = 30
    end
    object QueryPROIZW: TStringField
      FieldName = 'PROIZW'
      Size = 30
    end
    object QueryED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object QueryPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object QuerySUMKOL: TFloatField
      FieldName = 'SUMKOL'
    end
    object QuerySUMSUM: TFloatField
      FieldName = 'SUMSUM'
    end
    object Queryabc: TStringField
      FieldKind = fkCalculated
      FieldName = 'abc'
      Size = 1
      Calculated = True
    end
    object Queryprocplu: TFloatField
      FieldKind = fkCalculated
      FieldName = 'procplu'
      Calculated = True
    end
    object Queryprocsum: TFloatField
      FieldKind = fkCalculated
      FieldName = 'procsum'
      Calculated = True
    end
    object Querysumtovar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sumtovar'
      Calculated = True
    end
    object QueryPOSTAV: TStringField
      FieldName = 'POSTAV'
      Required = True
      Size = 100
    end
    object QueryWES: TIntegerField
      FieldName = 'WES'
    end
  end
  object sumquery: TOracleDataSet
    SQL.Strings = (
      'select k.kat,'
      'nvl(sum(r.total),0) sumsum'
      
        ',(select count(a.plu) from tmp.vkkmkat a where a.kat=k.kat) pluc' +
        'ount'
      'from tmp.kkmreport r,tmp.tkatalog t,tmp.tkat k,tmp.vkkmdoc v'
      'where r.plu=t.plu and t.kat=k.kat'
      'and r.doc =v.doc'
      'group by k.kat')
    ReadBuffer = 100
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
      0300000003000000030000004B415401000000000600000053554D53554D0100
      00000008000000504C55434F554E540100000000}
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
    Left = 512
    Top = 184
    object sumqueryKAT: TIntegerField
      FieldName = 'KAT'
      Required = True
    end
    object sumquerySUMSUM: TFloatField
      FieldName = 'SUMSUM'
    end
    object sumqueryPLUCOUNT: TFloatField
      FieldName = 'PLUCOUNT'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 200
    object N3: TMenuItem
      Caption = #1074#1099#1073#1088#1072#1090#1100' '#1074#1089#1105
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1082#1072#1082
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1087#1088#1086#1089#1084#1086#1090#1088' '#1087#1077#1095#1072#1090#1080
      OnClick = N6Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1085#1072#1089#1090#1088#1086#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      OnClick = N4Click
    end
    object N7: TMenuItem
      Caption = #1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103
      OnClick = N7Click
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'file1'
    Filter = 
      'Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HT' +
      'ML file (*.htm)|*.HTM|Rich Text Format (*.rtf)|*.RTF|Microsoft E' +
      'xcel Workbook (*.xls)|*.XLS'
    Left = 146
    Top = 254
  end
  object PrintDB: TPrintDBGridEh
    DBGridEh = DBGrid
    Options = [pghFitGridToPageWidth, pghColored, pghFitingByColWidths, pghOptimalColWidths]
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
    Left = 424
    Top = 120
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      'DBGrid.<P>.Columns.ColumnsIndex'
      'DBGrid.<P>.Columns.<ForAllItems>.Visible'
      'DBGrid.<P>.Columns.<ForAllItems>.Width')
    Left = 168
    Top = 248
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Left = 312
    Top = 152
  end
end
