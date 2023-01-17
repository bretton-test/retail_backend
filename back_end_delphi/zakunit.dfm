object zakform: Tzakform
  Left = 268
  Top = 194
  Width = 696
  Height = 480
  Caption = #1086#1090#1095#1105#1090' '#1087#1086' '#1085#1072#1083#1080#1095#1080#1102' '#1090#1086#1074#1072#1088#1072
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 5
      Width = 182
      Height = 19
      Caption = #1079#1072#1082#1072#1079' '#1090#1086#1074#1072#1088#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 291
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
      Left = 197
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
    Top = 57
    Width = 688
    Height = 348
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
        Visible = False
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
        FieldName = 'proizw'
        Footers = <>
        Title.Caption = #1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'postav'
        Footers = <>
        Title.Caption = #1087#1086#1089#1090#1072#1074#1097#1080#1082
        Title.TitleButton = True
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'edizm'
        Footers = <>
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Title.Orientation = tohVertical
        Width = 31
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'bost'
        Footers = <>
        Title.Caption = #1085#1072#1095'.'#1086#1089#1090'.'
        Title.Hint = #1085#1072#1083#1080#1095#1080#1077' '#1074' '#1085#1072#1095#1072#1083#1077' '#1087#1077#1088#1080#1086#1076#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 31
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'post'
        Footer.FieldName = 'post'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1086#1089#1090#1072#1074#1082#1080
        Title.Hint = #1087#1086#1089#1090#1072#1074#1082#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 29
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'prod'
        Footer.FieldName = 'prod'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1088#1086#1076#1072#1078#1080
        Title.Hint = #1087#1088#1086#1076#1072#1078#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 28
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'nost'
        Footers = <>
        Title.Caption = #1082#1086#1085'.'#1086#1089#1090'.'
        Title.Hint = #1085#1072#1083#1080#1095#1080#1077' '#1074' '#1082#1086#1085#1094#1077' '#1087#1077#1088#1080#1086#1076#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'tovzap'
        Footers = <>
        Title.Caption = #1090#1086#1074'.'#1079#1072#1087#1072#1089' '#1076#1085#1077#1081
        Title.TitleButton = True
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'minost'
        Footers = <>
        Title.Caption = #1084#1080#1085'.'#1086#1089#1090'.'
        Title.Hint = #1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1090#1086#1074#1072#1088#1072' ('#1079#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1074' '#1082#1072#1088#1090#1086#1095#1082#1077')'
        Title.Orientation = tohVertical
        Width = 34
      end
      item
        EditButtons = <>
        FieldName = 'wes'
        Footers = <>
        Title.Caption = #1084#1072#1082#1089'.'#1086#1089#1090'.'
        Title.Orientation = tohVertical
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'min'
        Footers = <>
        Title.Caption = #1084#1077#1085#1100#1096#1077' '#1074' '#1096#1090'.'
        Title.TitleButton = True
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'max'
        Footers = <>
        Title.Caption = #1073#1086#1083#1100#1096#1077' '#1074' '#1096#1090'.'
        Title.TitleButton = True
        Width = 46
      end
      item
        Alignment = taRightJustify
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'rashcena'
        Footers = <>
        Title.Caption = #1088#1072#1089#1093'.'#1094#1077#1085#1072
        Title.Hint = #1089#1088#1077#1076#1085#1103#1103' '#1088#1072#1089#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 42
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'rsum'
        Footer.FieldName = 'rsum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1088#1072#1089#1093'.'#1089#1091#1084#1084#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 47
      end
      item
        Alignment = taRightJustify
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'psum'
        Footer.FieldName = 'psum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1088#1080#1093'.'#1089#1091#1084#1084#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Visible = False
        Width = 48
        WordWrap = True
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'nsum'
        Footer.FieldName = 'nsum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1090#1086#1074'.'#1079#1072#1087#1072#1089' '#1088#1091#1073
        Title.TitleButton = True
        Width = 55
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'minrub'
        Footer.FieldName = 'minrub'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1084#1077#1085#1100#1096#1077' '#1074' '#1088#1091#1073'.'
        Title.TitleButton = True
        Width = 49
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'maxrub'
        Footer.FieldName = 'maxrub'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1073#1086#1083#1100#1096#1077' '#1074' '#1088#1091#1073'.'
        Title.TitleButton = True
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'zayavka'
        Footers = <>
        Title.Caption = #1079#1072#1103#1074#1082#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 43
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'zakrub'
        Footer.FieldName = 'zakrub'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1079#1072#1082'. '#1088#1091#1073
        Title.Orientation = tohVertical
        Width = 45
      end>
  end
  object query: TOracleDataSet
    SQL.Strings = (
      'select vid.plu ,post.name postav,'
      't.name name,'
      't.ed_izm edizm,'
      't.kat kategory,p.name proizw,'
      't.minost ,'
      't.wes ,'
      't.price,'
      'round(nvl(sum(vid.rprice),t.price),2) rashcena,'
      'sum(vid.pkolvo) post,'
      'sum(vid.kkolvo) prod,'
      'round(sum(vid.ptotal),2)  psum,'
      'round(sum(vid.rtotal),2)  rsum,'
      'sum(vid.bnal) bost,'
      'sum(vid.enal) nost,'
      'round(t.price*sum(vid.enal),2) nsum,0 zayavka,0 zakrub'
      
        'from tmp.vnewprihodrashod vid,tmp.tkatalog t,tmp.tproizw p,tmp.t' +
        'postav post'
      
        'where vid.plu=t.plu and t.export=1 and t.minost>0 and p.proizw=t' +
        '.proizw'
      'and post.cod=t.post'
      
        'group by vid.plu,t.name,t.ed_izm,t.kat,p.name,t.price,t.minost,t' +
        '.wes,post.name')
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
      030000001300000003000000504C550100000000040000004E414D4501000000
      00050000004544495A4D0100000000080000004B415445474F52590100000000
      0600000050524F495A570100000000060000004D494E4F535401000000000300
      0000574553010000000005000000505249434501000000000800000052415348
      43454E41010000000004000000504F535401000000000400000050524F440100
      000000040000005053554D0100000000040000005253554D0100000000040000
      00424F53540100000000040000004E4F53540100000000040000004E53554D01
      00000000070000005A415941564B410100000000060000005A414B5255420100
      00000006000000504F535441560100000000}
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
    OnCalcFields = queryCalcFields
    Left = 80
    Top = 120
    object queryPLU: TFloatField
      FieldName = 'PLU'
    end
    object queryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object queryEDIZM: TStringField
      FieldName = 'EDIZM'
      Size = 5
    end
    object queryKATEGORY: TIntegerField
      FieldName = 'KATEGORY'
      Required = True
    end
    object queryPROIZW: TStringField
      FieldName = 'PROIZW'
      Size = 30
    end
    object queryMINOST: TFloatField
      FieldName = 'MINOST'
    end
    object queryPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object queryRASHCENA: TFloatField
      FieldName = 'RASHCENA'
      currency = True
    end
    object queryPOST: TFloatField
      FieldName = 'POST'
    end
    object queryPROD: TFloatField
      FieldName = 'PROD'
    end
    object queryPSUM: TFloatField
      FieldName = 'PSUM'
      currency = True
    end
    object queryRSUM: TFloatField
      FieldName = 'RSUM'
      currency = True
    end
    object queryBOST: TFloatField
      FieldName = 'BOST'
    end
    object queryNOST: TFloatField
      FieldName = 'NOST'
    end
    object queryNSUM: TFloatField
      FieldName = 'NSUM'
      currency = True
    end
    object querytovzap: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tovzap'
      Calculated = True
    end
    object querymin: TFloatField
      FieldKind = fkCalculated
      FieldName = 'min'
      Calculated = True
    end
    object querymax: TFloatField
      FieldKind = fkCalculated
      FieldName = 'max'
      Calculated = True
    end
    object queryWES: TIntegerField
      FieldName = 'WES'
    end
    object queryminrub: TFloatField
      FieldKind = fkCalculated
      FieldName = 'minrub'
      Calculated = True
    end
    object querymaxrub: TFloatField
      FieldKind = fkCalculated
      FieldName = 'maxrub'
      Calculated = True
    end
    object queryZAYAVKA: TFloatField
      FieldName = 'ZAYAVKA'
    end
    object queryZAKRUB: TFloatField
      FieldName = 'ZAKRUB'
    end
    object queryPOSTAV: TStringField
      FieldName = 'POSTAV'
      Required = True
      Size = 100
    end
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    BeforePost = ClientDSBeforePost
    Left = 376
    Top = 224
  end
  object ds: TDataSource
    DataSet = ClientDS
    Left = 408
    Top = 224
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
    Left = 504
    Top = 160
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
end
