object m1form: Tm1form
  Left = 271
  Top = 199
  Width = 696
  Height = 480
  Caption = 'm1form'
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
    Width = 688
    Height = 65
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
    object Label3: TLabel
      Left = 9
      Top = 29
      Width = 109
      Height = 19
      Caption = #1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '
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
    object katlist: TDBLookupComboboxEh
      Left = 124
      Top = 27
      Width = 158
      Height = 22
      BorderStyle = bsNone
      DropDownBox.UseMultiTitle = True
      DropDownBox.Rows = 30
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Flat = True
      KeyField = 'NAME'
      ListField = 'NAME'
      ListFieldIndex = 1
      ListSource = DM.razdds
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnChange = katlistChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
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
    Top = 65
    Width = 688
    Height = 340
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
    FrozenCols = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth]
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
        Width = 218
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
        Title.Caption = '0-'#1096#1090'. 1-'#1082#1075'.'
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 28
      end
      item
        EditButtons = <>
        FieldName = 'proizw'
        Footers = <>
        Title.Caption = #1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'postav'
        Footers = <>
        Title.Caption = #1087#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'pdata'
        Footers = <>
        Title.Caption = #1076#1072#1090#1072' '#1087#1086#1089#1083'. '#1087#1086#1089#1090#1072#1074#1082#1080
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'pprice'
        Footers = <>
        Title.Caption = #1087#1086#1089#1083'. '#1087#1088#1080#1093'. '#1094#1077#1085#1072
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'rprice'
        Footers = <>
        Title.Caption = #1088#1072#1089#1093'. '#1094#1077#1085#1072' '#1087#1086' '#1085#1072#1082#1083'.'
        Title.Hint = 
          #1084#1072#1082#1089'.'#1094#1077#1085#1072' '#1074' '#1087#1088#1080#1093'.'#1085#1072#1082#1083#1072#1076#1085#1086#1081' '#1079#1072' '#1087#1077#1088#1080#1086#1076'/'#1077#1089#1083#1080' '#1087#1086#1089#1090#1072#1074#1086#1082' '#1085#1077#1090' - '#1090#1086' '#1090#1077#1082#1091 +
          #1097#1072#1103' '#1094#1077#1085#1072
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'prnaz'
        Footers = <>
        Title.Caption = '% '#1085#1072#1094#1077#1085#1082#1080
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'prdoh'
        Footer.FieldName = 'prdoh'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = '%  '#1086#1090' '#1086#1073#1097#1077#1081' '#1085#1072#1094#1077#1085#1082#1080
        Title.TitleButton = True
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'sumnaz'
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072' '#1085#1072#1094#1077#1085#1082#1080
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'post'
        Footers = <>
        Title.Caption = #1087#1086#1089#1090'. '#1090#1086#1074#1072#1088#1072' '#1079#1072' 60 '#1076#1085#1077#1081' '#1076#1086' '#1085#1072#1095#1072#1083#1072' '#1087#1077#1088#1080#1086#1076#1072
        Title.TitleButton = True
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'ppost'
        Footers = <>
        Title.Caption = #1087#1086#1089#1090'. '#1090#1086#1074#1072#1088#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'prod'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1078' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'ost'
        Footers = <>
        Title.Caption = #1086#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Title.TitleButton = True
        Width = 58
      end>
  end
  object query: TOracleDataSet
    SQL.Strings = (
      
        'select t.plu,t.name,t.ed_izm,t.shtuka wes,pr.name proizw,po.name' +
        ' postav,'
      'nvl((select max(p.cenasnds) from tmp.tprihnakl p where'
      'p.plu=t.plu and'
      'p.data='
      '(select max(z.data) from tmp.tprihnakl z where'
      
        'z.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yyyy'#39')' +
        ' from tmp.toptions where parametr='#39'to'#39')'
      'and z.plu=t.plu'
      ')),0'
      ') pprice,'
      
        '(select to_char(max(z.data),'#39'dd.mm.yy'#39') from tmp.tprihnakl z whe' +
        're'
      
        'z.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yyyy'#39')' +
        ' from tmp.toptions where parametr='#39'to'#39')'
      'and z.plu=t.plu'
      ') pdata,'
      'nvl((select max(p.cenareal) from tmp.tprihnakl p where'
      'p.plu=t.plu'
      
        'and p.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'from'#39')'
      
        'and p.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'to'#39')'
      '),t.price'
      ') rprice,'
      'nvl(( select sum(x.kol_vo) from tmp.tprihnakl x where'
      'x.plu=t.plu and'
      
        'x.data<(select to_date((value) ,'#39'dd.mm.yyyy'#39') from tmp.toptions ' +
        'where parametr='#39'from'#39') and'
      
        'x.data>(select to_date((value) ,'#39'dd.mm.yyyy'#39')-60 from tmp.toptio' +
        'ns where parametr='#39'from'#39')'
      '),0) post,'
      'nvl(( select sum(y.kol_vo) from tmp.tprihnakl y where'
      'y.plu=t.plu'
      
        'and y.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'from'#39')'
      
        'and y.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'to'#39')'
      '),0) ppost,'
      
        'nvl((select sum(w.kolvo) from tmp.kkmreport w,tmp.vkkmdoc d wher' +
        'e'
      'w.plu=t.plu and w.doc=d.doc'
      '),0) prod,'
      'nvl((select sum(k.sum) from tmp.kniga k where'
      'k.otkat=0 and k.plu=t.plu'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'to'#39')'
      '),0) ost'
      'from tmp.tkatalog t,tmp.vkat v,tmp.tproizw pr,tmp.tpostav po'
      'where t.kat=v.kat and pr.proizw=t.proizw and t.post=po.cod')
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
      030000000D00000003000000504C550100000000040000004E414D4501000000
      000300000057455301000000000600000045445F495A4D010000000006000000
      50505249434501000000000600000050524F495A57010000000006000000504F
      53544156010000000006000000525052494345010000000004000000504F5354
      01000000000500000050504F535401000000000400000050524F440100000000
      030000004F535401000000000500000050444154410100000000}
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
    AfterOpen = queryAfterOpen
    OnCalcFields = queryCalcFields
    Left = 80
    Top = 208
    object queryPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object queryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object queryED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object queryWES: TIntegerField
      FieldName = 'WES'
      Required = True
    end
    object queryPROIZW: TStringField
      FieldName = 'PROIZW'
      Size = 30
    end
    object queryPOSTAV: TStringField
      FieldName = 'POSTAV'
      Required = True
      Size = 100
    end
    object queryPPRICE: TFloatField
      FieldName = 'PPRICE'
    end
    object queryRPRICE: TFloatField
      FieldName = 'RPRICE'
    end
    object queryPOST: TFloatField
      FieldName = 'POST'
    end
    object queryPPOST: TFloatField
      FieldName = 'PPOST'
    end
    object queryPROD: TFloatField
      FieldName = 'PROD'
    end
    object queryOST: TFloatField
      FieldName = 'OST'
    end
    object queryprnaz: TFloatField
      FieldKind = fkCalculated
      FieldName = 'prnaz'
      Calculated = True
    end
    object querysumnaz: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sumnaz'
      Calculated = True
    end
    object queryPDATA: TStringField
      FieldName = 'PDATA'
      Size = 8
    end
    object querydohod: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'dohod'
      Calculated = True
    end
    object queryprdoh: TFloatField
      FieldKind = fkCalculated
      FieldName = 'prdoh'
      Calculated = True
    end
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 376
    Top = 232
  end
  object ds: TDataSource
    DataSet = ClientDS
    Left = 408
    Top = 232
  end
  object PrintDB: TPrintDBGridEh
    DBGridEh = DBGrid
    Options = [pghColored]
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
    Left = 488
    Top = 176
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
  object DBSum: TDBSumList
    DataSet = query
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'dohod'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    Left = 296
    Top = 405
  end
end
