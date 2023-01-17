object kassrepForm: TkassrepForm
  Left = 292
  Top = 195
  Width = 696
  Height = 480
  Caption = #1072#1085#1072#1083#1080#1079' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1090#1086#1074#1072#1088#1072
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
      Width = 305
      Height = 19
      Caption = #1072#1085#1072#1083#1080#1079' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1090#1086#1074#1072#1088#1072'  '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '
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
    TabOrder = 1
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
        FieldName = 'edizm'
        Footers = <>
        Title.Caption = #1077#1076'.'#1080#1079#1084'.'
        Title.Orientation = tohVertical
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'proizw'
        Footers = <>
        Title.Caption = #1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 82
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'prihcena'
        Footer.FieldName = 'prihcena'
        Footers = <>
        Title.Caption = #1087#1088#1080#1093'. '#1094#1077#1085#1072
        Title.Hint = #1089#1088#1077#1076#1085#1103#1103' '#1087#1088#1080#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 32
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'rashcena'
        Footers = <>
        Title.Caption = #1088#1072#1089#1093'.'#1094#1077#1085#1072
        Title.Hint = #1089#1088#1077#1076#1085#1103#1103' '#1088#1072#1089#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 30
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'pronac'
        Footers = <>
        Title.Caption = '% '#1085#1072#1094#1077#1085#1082#1080
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
        FieldName = 'PROPROD'
        Footers = <>
        Title.Caption = '% '#1087#1088#1086#1076#1072#1078#1080
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 31
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'nakl'
        Footer.FieldName = 'nakl'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1076#1086#1082'.'
        Title.Hint = #1088#1072#1089#1093#1086#1076' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 24
        WordWrap = True
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'psum'
        Footer.FieldName = 'psum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1088#1080#1093'.'#1089#1091#1084#1084#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 39
        WordWrap = True
      end
      item
        EditButtons = <>
        FieldName = 'rsum'
        Footer.FieldName = 'rsum'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1088#1072#1089#1093'.'#1089#1091#1084#1084#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'DISCOUNT'
        Footers = <>
        Title.Caption = #1089#1091#1084#1084#1072' '#1089#1082#1080#1076#1086#1082
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 37
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
        Width = 29
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'minost'
        Footers = <>
        Title.Caption = #1084#1080#1085'.'#1086#1089#1090'.'
        Title.Hint = #1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1090#1086#1074#1072#1088#1072' ('#1079#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1074' '#1082#1072#1088#1090#1086#1095#1082#1077')'
        Title.Orientation = tohVertical
        Width = 26
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'zakaz'
        Footers = <>
        Title.Caption = #1079#1072#1082#1072#1079
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 29
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'izl'
        Footers = <>
        Title.Caption = #1080#1079#1083#1080#1096#1082#1080
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 31
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'val'
        Footer.FieldName = 'val'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1074#1072#1083'.'#1076#1086#1093#1086#1076
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 33
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'proval'
        Footers = <>
        Title.Caption = '% '#1076#1086#1093#1086#1076#1072
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 25
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'maxprod'
        Footers = <>
        Title.Caption = #1084#1072#1082#1089'.'#1087#1088#1086#1076'.'
        Title.Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'_'#1074#1086', '#1087#1088#1086#1076#1072#1085#1085#1086#1077' '#1074' '#1076#1077#1085#1100' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'sredprod'
        Footers = <>
        Title.Caption = #1089#1088#1077#1076'.'#1087#1088#1086#1076'.'
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'tovzap'
        Footers = <>
        Title.Caption = #1079#1072#1087#1072#1089', '#1076#1085#1077#1081
        Title.Orientation = tohVertical
        Title.TitleButton = True
        Width = 30
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 184
      Top = 8
      Width = 89
      Height = 13
      Caption = #1092#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      Visible = False
    end
    object Label5: TLabel
      Left = 184
      Top = 24
      Width = 176
      Height = 13
      Caption = #1083#1102#1073#1072#1103' '#1095#1072#1089#1090#1100' '#1089#1083#1086#1074#1072', '#1079#1072#1087#1088#1086#1089' '#1076#1086#1083#1075#1080#1081
      Visible = False
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
    object Edit1: TEdit
      Left = 368
      Top = 11
      Width = 153
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
  end
  object optform: TSpeedForm
    Left = 432
    Top = 24
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
  object Query: TOracleDataSet
    SQL.Strings = (
      'select vid.plu ,'
      't.name name,'
      't.ed_izm edizm,'
      't.kat '#1082#1072#1090#1077#1075#1086#1088#1080#1103',p.name proizw,'
      't.minost ,'
      '--t.wes ,'
      'round(sum(vid.pprice),2)  prihcena,'
      'round(nvl(sum(vid.rprice),t.price),2) rashcena,'
      'sum(vid.pkolvo) post,'
      'sum(vid.kkolvo) prod,'
      'sum(vid.rkolvo) nakl,'
      'round(sum(vid.ptotal),2)  psum,'
      'round(sum(vid.rtotal),2)  rsum,'
      'sum(vid.bnal) bost,'
      'sum(vid.enal) nost,'
      'round(sum(vid.val),2) val,'
      'sum(vid.maxprod) maxprod,'
      'sum(vid.discount) discount'
      'from tmp.vprihodrashod vid,tmp.tkatalog t,tmp.tproizw p'
      
        'where vid.plu=t.plu and t.export=1 and t.minost>0 and p.proizw=t' +
        '.proizw'
      
        'group by vid.plu,t.name,t.ed_izm,t.kat,p.name,t.price,t.minost,t' +
        '.wes')
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
      00050000004544495A4D010000000009000000CAC0D2C5C3CED0C8DF01000000
      000600000050524F495A570100000000060000004D494E4F5354010000000003
      0000005745530100000000080000005052494843454E41010000000008000000
      5241534843454E41010000000004000000504F53540100000000040000005052
      4F440100000000040000004E414B4C0100000000040000005053554D01000000
      00040000005253554D010000000004000000424F53540100000000040000004E
      4F535401000000000300000056414C0100000000070000004D415850524F4401
      0000000008000000444953434F554E540100000000}
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
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = QueryCalcFields
    Left = 80
    Top = 104
    object QueryPLU: TFloatField
      FieldName = 'PLU'
    end
    object QueryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QueryEDIZM: TStringField
      FieldName = 'EDIZM'
      Size = 5
    end
    object QueryDSDesigner: TIntegerField
      FieldName = #1050#1040#1058#1045#1043#1054#1056#1048#1071
      Required = True
    end
    object QueryPROIZW: TStringField
      FieldName = 'PROIZW'
      Size = 30
    end
    object QueryMINOST: TFloatField
      FieldName = 'MINOST'
    end
    object QueryPRIHCENA: TFloatField
      FieldName = 'PRIHCENA'
      currency = True
    end
    object QueryRASHCENA: TFloatField
      FieldName = 'RASHCENA'
      currency = True
    end
    object QueryPOST: TFloatField
      FieldName = 'POST'
    end
    object QueryPROD: TFloatField
      FieldName = 'PROD'
    end
    object QueryNAKL: TFloatField
      FieldName = 'NAKL'
    end
    object QueryPSUM: TFloatField
      FieldName = 'PSUM'
      currency = True
    end
    object QueryRSUM: TFloatField
      FieldName = 'RSUM'
      currency = True
    end
    object QueryBOST: TFloatField
      FieldName = 'BOST'
    end
    object QueryNOST: TFloatField
      FieldName = 'NOST'
    end
    object QueryVAL: TFloatField
      FieldName = 'VAL'
      currency = True
    end
    object QueryMAXPROD: TFloatField
      FieldName = 'MAXPROD'
    end
    object Querypronac: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pronac'
      Calculated = True
    end
    object QueryPROPROD: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PROPROD'
      Calculated = True
    end
    object Queryproval: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'proval'
      Calculated = True
    end
    object Queryzakaz: TFloatField
      FieldKind = fkCalculated
      FieldName = 'zakaz'
      Calculated = True
    end
    object Queryizl: TFloatField
      FieldKind = fkCalculated
      FieldName = 'izl'
      Calculated = True
    end
    object QueryDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
      currency = True
    end
    object Querysredprod: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sredprod'
      Calculated = True
    end
    object Querytovzap: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tovzap'
      Calculated = True
    end
  end
  object ds: TDataSource
    DataSet = ClientDS
    Left = 408
    Top = 224
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 376
    Top = 224
  end
  object sumquery: TOracleDataSet
    SQL.Strings = (
      'select'
      'sum(pkolvo) post,'
      'sum(kkolvo) prod,'
      'sum(rkolvo) nakl,'
      'round(sum(ptotal),2)  psum,'
      'round(sum(rtotal),2)  rsum,'
      'sum(val) val'
      'from tmp.vprihodrashod v,tmp.tkatalog t'
      'where v.plu=t.plu and t.export=1 and t.minost>0'
      
        '--group by v.plu,t.name,t.ed_izm,t.kat,p.name,t.price,t.minost,t' +
        '.wes')
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
      030000000600000004000000504F535401000000000400000050524F44010000
      0000040000004E414B4C0100000000040000005053554D010000000004000000
      5253554D01000000000300000056414C0100000000}
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
    Left = 96
    Top = 200
    object sumqueryPOST: TFloatField
      FieldName = 'POST'
    end
    object sumqueryPROD: TFloatField
      FieldName = 'PROD'
    end
    object sumqueryNAKL: TFloatField
      FieldName = 'NAKL'
    end
    object sumqueryPSUM: TFloatField
      FieldName = 'PSUM'
    end
    object sumqueryRSUM: TFloatField
      FieldName = 'RSUM'
    end
    object sumqueryVAL: TFloatField
      FieldName = 'VAL'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 200
    object N1: TMenuItem
      Caption = #1085#1072#1089#1090#1088#1086#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
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
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      'DBGrid.<P>.Columns.ColumnsIndex'
      'DBGrid.<P>.Columns.<ForAllItems>.Title'
      'DBGrid.<P>.Columns.<ForAllItems>.Visible'
      'DBGrid.<P>.Columns.<ForAllItems>.Width')
    Left = 176
    Top = 168
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
  object RegPropStorageManEh1: TRegPropStorageManEh
    Left = 216
    Top = 248
  end
end
