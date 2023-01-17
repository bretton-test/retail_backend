object shetform: Tshetform
  Left = 331
  Top = 208
  AlphaBlendValue = 4
  BorderStyle = bsToolWindow
  Caption = #1089#1095#1077#1090#1072
  ClientHeight = 282
  ClientWidth = 575
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
    6666666666666666666666666666666666666666666666666666666666660000
    00000000000000000000000000000000000000000000000000000000000000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF000000FF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF000000FF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF000000FF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF000000FF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC
    CCCCCCCCCCCCCCCCCCCCCCCCCC0000CCCCCCCCCCCCCCCCCCCCCCCCCCCC000088
    88CCCCCCCCCCCCCCCCCCCC888800008888CCCCCCCCCCCCCCCCCCCC8888000000
    0000000000000000000000000000000000000000000000000000000000006666
    6666666666666666666666666666666666666666666666666666666666666666
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 575
    Height = 282
    Align = alClient
    DataSource = sds
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAIMEN'
        Footers = <>
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBGridEh1Columns1EditButtons0Click
          end>
        FieldName = 'BANK'
        Footers = <>
        Width = 121
      end
      item
        EditButtons = <>
        FieldName = 'RAS_SCH'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DATE_OTKR'
        Footers = <>
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'DATE_ZAKR'
        Footers = <>
        Width = 93
      end>
  end
  object qschet: TOracleDataSet
    SQL.Strings = (
      'select s.*,s.rowid'
      ''
      'from tmp.tscheta s')
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
      03000000070000000200000049440100000000060000004E41494D454E010000
      0000070000005241535F53434801000000000700000042414E4B5F4944010000
      000009000000444154455F4F544B52010000000009000000444154455F5A414B
      5201000000000400000042414E4B0100000000}
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
    AfterPost = qschetAfterPost
    OnNewRecord = qschetNewRecord
    Left = 32
    Top = 16
    object qschetID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object qschetNAIMEN: TStringField
      DisplayLabel = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAIMEN'
      Required = True
      Size = 25
    end
    object qschetBANK: TStringField
      DisplayLabel = #1073#1072#1085#1082
      DisplayWidth = 25
      FieldName = 'BANK'
      Required = True
      Size = 40
    end
    object qschetRAS_SCH: TFloatField
      DisplayLabel = #1088#1072#1089#1095'.'#1089#1095#1077#1090
      FieldName = 'RAS_SCH'
      Required = True
    end
    object qschetBANK_ID: TIntegerField
      FieldName = 'BANK_ID'
      Required = True
      Visible = False
    end
    object qschetDATE_OTKR: TDateTimeField
      DisplayLabel = #1076#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
      FieldName = 'DATE_OTKR'
    end
    object qschetDATE_ZAKR: TDateTimeField
      DisplayLabel = #1076#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'DATE_ZAKR'
    end
  end
  object sds: TDataSource
    DataSet = qschet
    Left = 72
    Top = 16
  end
end
