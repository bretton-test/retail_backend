object MovForm: TMovForm
  Left = 186
  Top = 159
  Width = 771
  Height = 492
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 763
    Height = 458
    Align = alClient
    AutoFitColWidths = True
    DataSource = DS
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
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TIP'
        Footers = <>
        Title.Caption = #1090#1080#1087
      end
      item
        EditButtons = <>
        FieldName = 'DATA'
        Footers = <>
        Title.Caption = #1076#1072#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1090#1086#1074#1072#1088
        Width = 201
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'PRIHOD'
        Footer.FieldName = 'PRIHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1087#1088#1080#1093#1086#1076
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'RASHOD'
        Footer.FieldName = 'RASHOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1088#1072#1089#1093#1086#1076
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'OSTATOK'
        Footers = <>
        Title.Caption = #1086#1089#1090#1072#1090#1086#1082
      end
      item
        EditButtons = <>
        FieldName = 'SKLAD'
        Footers = <>
        Title.Caption = #1089#1082#1083#1072#1076
      end>
  end
  object Query: TOracleDataSet
    SQL.Strings = (
      'select distinct r.*'
      '--,k.partia'
      'from tmp.vrashod r --,tmp.kniga k'
      '--where k.nom=r.nom'
      '--and k.otkat=0'
      '--and k.plu=r.plu'
      'order by d')
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
      030000000D000000030000005449500100000000040000004441544101000000
      000400000054494D45010000000001000000440100000000040000004E414D45
      0100000000050000005052494345010000000006000000505249484F44010000
      000006000000524153484F440100000000070000004F535441544F4B01000000
      0005000000534B4C41440100000000030000004E4F4D01000000000300000050
      4C550100000000060000005041525449410100000000}
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
    Left = 416
    Top = 168
    object QueryTIP: TStringField
      FieldName = 'TIP'
      Size = 10
    end
    object QueryDATA: TStringField
      FieldName = 'DATA'
      Size = 9
    end
    object QueryNAME: TStringField
      FieldName = 'NAME'
      Size = 52
    end
    object QueryPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object QueryPRIHOD: TFloatField
      FieldName = 'PRIHOD'
    end
    object QueryRASHOD: TFloatField
      FieldName = 'RASHOD'
    end
    object QueryOSTATOK: TFloatField
      FieldName = 'OSTATOK'
    end
    object QuerySKLAD: TStringField
      FieldName = 'SKLAD'
      Size = 50
    end
    object QueryNOM: TFloatField
      FieldName = 'NOM'
      Visible = False
    end
    object QueryPLU: TFloatField
      FieldName = 'PLU'
      Visible = False
    end
  end
  object DS: TDataSource
    DataSet = Query
    Left = 456
    Top = 168
  end
end
