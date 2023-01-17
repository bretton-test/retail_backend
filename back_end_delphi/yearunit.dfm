object Yform: TYform
  Left = 257
  Top = 229
  Width = 696
  Height = 480
  Caption = #1075#1086#1076#1086#1074#1086#1081' '#1086#1090#1095#1105#1090
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
      Width = 279
      Height = 19
      Caption = #1087#1086#1089#1090#1072#1074#1082#1080' '#1080' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1086#1074#1072#1088#1072'  '#1079#1072' '#1075#1086#1076
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
      Left = 300
      Top = 7
      Width = 52
      Height = 19
      Alignment = taRightJustify
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
      EditFormat = 'YYYY'
    end
    object katlist: TDBLookupComboboxEh
      Left = 124
      Top = 27
      Width = 158
      Height = 22
      Alignment = taCenter
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
      TabOrder = 1
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
        FieldName = 'ed_izm'
        Footers = <>
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Title.Orientation = tohVertical
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'mon'
        Footers = <>
        Title.Caption = #1084#1077#1089#1103#1094
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'prihod'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1087#1086#1089#1090#1072#1074#1086#1082
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'rashod'
        Footers = <>
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1078
        Title.TitleButton = True
      end
      item
        DisplayFormat = '#.00'
        EditButtons = <>
        FieldName = 'ptot'
        Footer.FieldName = 'ptot'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
        Width = 55
      end
      item
        DisplayFormat = '#.00'
        EditButtons = <>
        FieldName = 'rtot'
        Footer.FieldName = 'rtot'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078
        Width = 58
      end>
  end
  object Query: TOracleDataSet
    SQL.Strings = (
      'select p.plu,t.name,t.ed_izm,p.mon,'
      
        'sum(p.pkolvo) prihod,sum(p.rkolvo) rashod,sum(p.ptotal) ptot,sum' +
        '(p.rtotal) rtot'
      'from tmp.monthprihodrashod p,tmp.tkatalog t'
      'where t.plu=p.plu'
      'group by p.plu,p.mon,t.name,t.ed_izm'
      'order by p.plu,p.mon')
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
      030000000800000003000000504C550100000000040000004E414D4501000000
      000600000045445F495A4D0100000000030000004D4F4E010000000006000000
      505249484F44010000000006000000524153484F440100000000040000005054
      4F5401000000000400000052544F540100000000}
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
    Left = 296
    Top = 224
    object QueryPLU: TFloatField
      FieldName = 'PLU'
    end
    object QueryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QueryED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object QueryMON: TStringField
      FieldName = 'MON'
      Size = 2
    end
    object QueryPRIHOD: TFloatField
      FieldName = 'PRIHOD'
    end
    object QueryRASHOD: TFloatField
      FieldName = 'RASHOD'
    end
    object QueryPTOT: TFloatField
      FieldName = 'PTOT'
    end
    object QueryRTOT: TFloatField
      FieldName = 'RTOT'
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
    Left = 416
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
    Left = 424
    Top = 120
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
