object posform: Tposform
  Left = 400
  Top = 446
  Width = 769
  Height = 489
  Caption = #1050#1072#1089#1089#1086#1074#1099#1077' '#1089#1084#1077#1085#1099
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGridEh
    Left = 0
    Top = 0
    Width = 761
    Height = 422
    Align = alClient
    DataSource = smDS
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATA'
        Footers = <>
        Title.Caption = #1076#1072#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'KASSA'
        Footers = <>
        Title.Caption = #8470' '#1082#1072#1089#1089#1099
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'SUM'
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072
      end
      item
        EditButtons = <>
        FieldName = 'krep'
        Footers = <>
        Title.Caption = #1086#1090#1095#1077#1090' '#1082#1082#1084
      end
      item
        EditButtons = <>
        FieldName = 'kniga'
        Footers = <>
        Title.Caption = #1087#1088#1086#1074#1077#1076#1077#1085#1086
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 422
    Width = 761
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object kassbut: TSpeedButton
      Left = 9
      Top = 6
      Width = 59
      Height = 22
      Caption = #1042#1089#1077#1075#1086
      OnClick = kassbut1Click
    end
    object SpeedButton1: TSpeedButton
      Left = 67
      Top = 6
      Width = 56
      Height = 22
      Caption = #1063#1077#1082#1080
      OnClick = SpeedButton13Click
    end
    object SpeedButton5: TSpeedButton
      Left = 122
      Top = 6
      Width = 56
      Height = 22
      Caption = #1054#1090#1084#1077#1085#1072
      OnClick = SpeedButton51Click
    end
    object SpeedButton6: TSpeedButton
      Left = 177
      Top = 6
      Width = 54
      Height = 22
      Caption = #1057#1090#1086#1088#1085#1086
      OnClick = SpeedButton61Click
    end
    object SpeedButton11: TSpeedButton
      Left = 660
      Top = 6
      Width = 49
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton11Click
    end
    object lastbut: TSpeedButton
      Left = 709
      Top = 6
      Width = 49
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = diskbuttonClick
    end
    object hourbutton: TSpeedButton
      Left = 230
      Top = 6
      Width = 104
      Height = 22
      Caption = #1087#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1095#1072#1089#1072#1084
      OnClick = hourbuttonClick
    end
    object SpeedButton3: TSpeedButton
      Left = 333
      Top = 6
      Width = 53
      Height = 22
      Caption = #1057#1082#1080#1076#1082#1080
      OnClick = SpeedButton3Click
    end
    object SpeedButton7: TSpeedButton
      Left = 385
      Top = 6
      Width = 97
      Height = 22
      Caption = #1089#1082#1080#1076#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      OnClick = SpeedButton7Click
    end
    object SpeedButton4: TSpeedButton
      Left = 481
      Top = 6
      Width = 97
      Height = 22
      Caption = #1090#1086#1074#1072#1088' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
      OnClick = SpeedButton4Click
    end
    object SpeedButton8: TSpeedButton
      Left = 577
      Top = 6
      Width = 84
      Height = 22
      Caption = #1092#1086#1088#1084#1099' '#1086#1087#1083#1072#1090#1099
      OnClick = SpeedButton8Click
    end
  end
  object intform: TSpeedForm
    Left = 175
    Top = 152
    Width = 274
    Height = 97
    Caption = #1080#1085#1090#1077#1088#1074#1072#1083
    TabOrder = 4
    ParentColor = False
    Color = clBtnFace
    object Shape1: TShape
      Left = 9
      Top = 3
      Width = 248
      Height = 27
      Brush.Style = bsClear
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 12
      Height = 16
      Caption = #1057' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 136
      Top = 8
      Width = 18
      Height = 16
      Caption = #1055#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object d1: TDBDateTimeEditEh
      Left = 32
      Top = 8
      Width = 89
      Height = 17
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object d2: TDBDateTimeEditEh
      Left = 160
      Top = 8
      Width = 89
      Height = 17
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object BitBtn2: TBitBtn
      Left = 96
      Top = 41
      Width = 75
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 2
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
    end
    object BitBtn4: TBitBtn
      Left = 182
      Top = 41
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
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
    end
  end
  object chekForm: TSpeedForm
    Left = 13
    Top = 24
    Width = 676
    Height = 345
    Style = dsIcon
    Caption = 'chekForm'
    TabOrder = 2
    ParentColor = False
    Color = clMoneyGreen
    OnClose = kassForm1Close
    object DBGridEh3: TDBGridEh
      Left = 0
      Top = 0
      Width = 257
      Height = 272
      Align = alLeft
      AutoFitColWidths = True
      DataSource = ds2
      Flat = True
      FooterColor = clMoneyGreen
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleBtnClick = DBGridEh3TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATA'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CHEK'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM'
          Footer.FieldName = 'sum'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end>
    end
    object DBGridEh4: TDBGridEh
      Left = 257
      Top = 0
      Width = 412
      Height = 272
      Align = alRight
      AutoFitColWidths = True
      DataSource = DS3
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 0
      Top = 272
      Width = 669
      Height = 29
      Align = alBottom
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object SpeedButton2: TSpeedButton
        Left = 3
        Top = 1
        Width = 62
        Height = 25
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072
        OnClick = SpeedButton2Click
      end
    end
  end
  object kassForm1: TSpeedForm
    Left = 296
    Top = 48
    Width = 412
    Height = 284
    Style = dsIcon
    Caption = #1086#1090#1095#1077#1090' '#1087#1086' '#1082#1072#1089#1089#1077
    TabOrder = 1
    BorderStyle = bsSizeable
    StayOnTop = True
    ParentColor = False
    Color = clMoneyGreen
    OnClose = kassForm1Close
    object printbutton: TSpeedButton
      Left = 0
      Top = 235
      Width = 73
      Height = 22
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = printbuttonClick
    end
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 0
      Width = 404
      Height = 233
      Align = alTop
      AutoFitColWidths = True
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = ds
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Qsmena: TOracleDataSet
    SQL.Strings = (
      'select 55 num,'
      
        #9'to_date(to_char(data,'#39'dd.mm.yyyy'#39')||'#39' 23:59'#39','#39'dd.mm.yyyy hh24:m' +
        'i'#39') data,'
      #9'round(kassa,0) kassa,'
      #9'nvl(round(sum(sum),0),0) sum'
      #9
      '  from pos.arc_report where'
      'id=55'
      
        'and  data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toption' +
        's where parametr='#39'begin'#39')'
      
        'and  data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yyy' +
        'y'#39') from tmp.toptions where parametr='#39'end'#39') '
      
        'group by to_date(to_char(data,'#39'dd.mm.yyyy'#39')||'#39' 23:59'#39','#39'dd.mm.yyy' +
        'y hh24:mi'#39'),kassa'
      'order by data,kassa')
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
      0300000004000000030000004E554D0100000000040000004441544101000000
      00050000004B4153534101000000000800000053554D2853554D290100000000}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    OnCalcFields = QsmenaCalcFields
    Left = 24
    Top = 16
    object QsmenaNUM: TFloatField
      FieldName = 'NUM'
      Visible = False
    end
    object QsmenaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QsmenaKASSA: TFloatField
      FieldName = 'KASSA'
    end
    object QsmenaSUMSUM: TFloatField
      FieldName = 'SUM'
    end
    object Qsmenakrep: TFloatField
      FieldKind = fkCalculated
      FieldName = 'krep'
      Calculated = True
    end
    object Qsmenakniga: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'kniga'
      currency = False
      Calculated = True
    end
  end
  object smDS: TDataSource
    DataSet = Qsmena
    Left = 72
    Top = 16
  end
  object QkassaRep: TOracleDataSet
    SQL.Strings = (
      'select '#39#1074#1085#1077#1089#1077#1085#1080#1077#39' tip,'
      #9'data,'
      '          sum sum'
      'from pos.arc_report'
      #9'where id=50'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1074#1099#1087#1083#1072#1090#1072#39' tip,'
      #9'data,'
      '          -sum sum'
      'from pos.arc_report'
      #9'where id=51'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1087#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1082#1086#1076#1091#39' tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          sum(sum)  sum'
      'from pos.arc_report'
      #9'where id in (11,12,13,14)'
      #9'and stornoflag=999'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1087#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1094#1077#1085#1077#39' tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          sum(sum)  sum'
      'from pos.arc_report'
      #9'where id in (1,2)'
      #9'and stornoflag=999'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1087#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1095#1077#1082#1072#1084#39' tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          sum(sum)  sum'
      'from pos.arc_report'
      #9'where id =55'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1089#1082#1080#1076#1082#1080' '#1087#1086' '#1095#1077#1082#1072#1084' '#39'||to_char(quantity) tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          sum(sum)  sum'
      'from pos.arc_report'
      #9'where id in (35,37)'
      #9'and stornoflag=999'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'group by quantity'
      'union all'
      'select '#39#1074#1089#1077#1075#1086' '#1089#1082#1080#1076#1086#1082' '#1087#1086' '#1095#1077#1082#1072#1084' '#39' tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          sum(sum)  sum'
      'from pos.arc_report'
      #9'where id in (35,37)'
      #9'and stornoflag=999'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1085#1072#1076#1073#1072#1074#1082#1080' '#1087#1086' '#1095#1077#1082#1072#1084#39' tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          sum(sum)  sum'
      'from pos.arc_report'
      #9'where id in (36,38)'
      #9'and stornoflag=999'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      'union all'
      'select '#39#1074#1086#1079#1074#1088#1072#1090#1099#39' tip,'
      '          to_date(to_char(:data2,'#39'dd.mm.yyyy'#39'))  data,'
      '          -1*sum(sum)  sum'
      'from pos.arc_report'
      #9'where id =55'
      #9'and kassa=:kassa'
      '            and data>:data1'
      #9'and data<:data2'
      #9'and sum<0')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000060000003A44415441310C0000000700000078680A0A0101
      0100000000060000003A44415441320C0000000700000078680A0B0101010000
      0000060000003A4B4153534103000000040000000500000000000000}
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
      0300000003000000030000005449500100000000040000004441544101000000
      000300000053554D0100000000}
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
    Left = 24
    Top = 56
    object QkassaRepTIP: TStringField
      DisplayLabel = #1058#1048#1055
      DisplayWidth = 25
      FieldName = 'TIP'
      Size = 25
    end
    object QkassaRepDATA: TDateTimeField
      DisplayLabel = #1044#1040#1058#1040
      FieldName = 'DATA'
    end
    object QkassaRepSUM: TFloatField
      DisplayLabel = #1042#1057#1045#1043#1054
      FieldName = 'SUM'
      currency = True
    end
  end
  object ds: TDataSource
    DataSet = QkassaRep
    Left = 72
    Top = 56
  end
  object qCheck: TOracleDataSet
    SQL.Strings = (
      'select   data,'
      #9'chek,'
      #9'sum'
      'from    pos.arc_report'
      'where  kassa=:kassa'
      'and      id=56'
      'and      data>:data1'
      #9'and data<:data2'
      'order by '
      'data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000060000003A4B415353410300000000000000000000000600
      00003A44415441310C0000000000000000000000060000003A44415441320C00
      00000000000000000000}
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
      0300000003000000040000004348454B01000000000300000053554D01000000
      0004000000444154410100000000}
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
    Left = 24
    Top = 152
    object qCheckDATA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
      Required = True
    end
    object qCheckCHEK: TFloatField
      DisplayLabel = #1063#1077#1082
      FieldName = 'CHEK'
    end
    object qCheckSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM'
      currency = True
    end
  end
  object ds2: TDataSource
    DataSet = qCheck
    Left = 64
    Top = 152
  end
  object SelChek: TOracleDataSet
    SQL.Strings = (
      'select r.id id,'
      #9'r.plu plu,'
      #9'nvl(k.name,'#39'?'#39') tovar,'
      #9'r.price price,'
      #9'r.quantity quantity,'
      #9'r.sum sum,'
      #9'r.stornoflag stornoflag,'
      #9'r.num num'
      'from pos.arc_report r,tmp.tkatalog k'
      'where r.kassa=:kassa'
      'and    r.plu=k.plu(+)'
      'and    r.chek=:chek'
      'and    r.data>:data1'
      'and    r.data<:data2'
      '--and    r.stornoflag=999'
      '--order by r.num'
      ''
      ' union all'
      ''
      'select  1 id,'
      #9#39'1'#39' plu,'
      #9#39'-'#39' tovar,'
      #9' 1 price,'
      #9'1 quantity,'
      #9'sum(r.sum) sum,'
      #9'1 stornoflag,'
      #9'999999 num'
      'from pos.arc_report r'
      'where r.kassa=:kassa'
      'and    r.chek=:chek'
      'and    r.data>:data1'
      'and    r.data<:data2'
      'and r.id in (1,2,11,12)'
      'and r.stornoflag=999'
      ''
      ''
      'order by num')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000004000000060000003A4B415353410300000000000000000000000500
      00003A4348454B030000000000000000000000060000003A44415441310C0000
      000000000000000000060000003A44415441320C0000000000000000000000}
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
      0300000008000000020000004944010000000003000000504C55010000000005
      00000050524943450100000000080000005155414E5449545901000000000300
      000053554D010000000005000000544F56415201000000000A00000053544F52
      4E4F464C41470100000000030000004E554D0100000000}
    Cursor = crDefault
    Master = qCheck
    MasterFields = 'chek'
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
    Left = 24
    Top = 216
    object SelChekID: TFloatField
      FieldName = 'ID'
    end
    object SelChekPLU: TStringField
      FieldName = 'PLU'
      Size = 13
    end
    object SelChekTOVAR: TStringField
      FieldName = 'TOVAR'
      Size = 52
    end
    object SelChekPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object SelChekQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object SelChekSUM: TFloatField
      FieldName = 'SUM'
    end
    object SelChekSTORNOFLAG: TFloatField
      FieldName = 'STORNOFLAG'
    end
    object SelChekNUM: TFloatField
      FieldName = 'NUM'
    end
  end
  object DS3: TDataSource
    DataSet = SelChek
    Left = 64
    Top = 216
  end
  object LastSm: TOracleDataSet
    SQL.Strings = (
      'select max(data) data from pos.arc_report '
      'where kassa=:kassa'
      'and id=61 '
      'and data<:data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A4B415353410300000000000000000000000500
      00003A444154410C0000000000000000000000}
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
    Left = 24
    Top = 104
  end
  object printitog: TPrintDBGridEh
    DBGridEh = DBGridEh2
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
    Left = 492
    Top = 287
  end
  object discquery: TOracleDataSet
    SQL.Strings = (
      'select to_char(data,'#39'dd.mm.yy hh24:mi'#39' ) '#1076#1072#1090#1072','
      '        kassa '#1082#1072#1089#1089#1072','
      #9'chek '#1085#1086#1084#1077#1088'_'#1095#1077#1082#1072','
      #9'to_char(quantity) '#1087#1088#1086#1094#1077#1085#1090'_'#1089#1082#1080#1076#1082#1080','
      #9'sum '#1089#1091#1084#1084#1072'_'#1089#1082#1080#1076#1082#1080' '
      'from pos.arc_report '
      #9'where id=37 and stornoflag=999'
      #9'and data>=:day1'
      #9'and data<:day2'
      'union '
      'select '#39#1074#1089#1077#1075#1086':'#39','
      #9'null,'
      #9'null,'
      #9'null,'
      #9'sum(sum)'
      'from pos.arc_report '
      #9'where id=37 and stornoflag=999'
      #9'and data>=:day1'
      #9'and data<:day2'
      'order by '#1082#1072#1089#1089#1072','#1076#1072#1090#1072)
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444159310C0000000700000078680A0E010101
      00000000050000003A444159320C0000000700000078680A1001010100000000}
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
    Left = 32
    Top = 280
  end
  object krepquery: TOracleQuery
    SQL.Strings = (
      
        'select nvl(round(sum(k.total),0),0) sum from tmp.kkmreport k,tmp' +
        '.kkmj j'
      'where j.doc=k.doc and j.kkm=:kkm'
      'and to_char(j.data,'#39'dd.mm.yyyy'#39')=:data')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4B4B4D03000000040000000100000000000000
      050000003A44415441050000000B00000030312E30312E323030350000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 224
    Top = 32
  end
  object knigaquery: TOracleQuery
    SQL.Strings = (
      
        'select nvl(round(-1*sum(k.sum*k.cena),0),0) sum from tmp.kniga k' +
        ',tmp.kkmj j'
      'where j.doc=k.nom and k.otkat=0 and j.kkm=:kkm'
      'and to_char(j.data,'#39'dd.mm.yyyy'#39')=:data')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4B4B4D03000000040000000100000000000000
      050000003A44415441050000000B00000030312E30312E323030350000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 304
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 136
    Top = 96
    object N1: TMenuItem
      Caption = #1086#1073#1085#1086#1074#1080#1090#1100
      Visible = False
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1089#1086#1079#1076#1072#1090#1100
      OnClick = N2Click
    end
  end
end
