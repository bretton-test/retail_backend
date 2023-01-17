object Bankform: TBankform
  Left = 247
  Top = 252
  AlphaBlendValue = 4
  BorderStyle = bsToolWindow
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'.'#1041#1072#1085#1082#1080
  ClientHeight = 313
  ClientWidth = 679
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 679
    Height = 313
    Align = alClient
    DataSource = Bds
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
  end
  object Qbank: TOracleDataSet
    SQL.Strings = (
      'select b.*,b.rowid'
      'from tmp.tbank b'
      'order by id')
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
      00000300000042494B0100000000060000004B4F52525F530100000000050000
      004D4553544F010000000005000000414452455301000000000300000054454C
      0100000000}
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
    AfterPost = QbankAfterPost
    OnNewRecord = QbankNewRecord
    Left = 8
    Top = 80
    object QbankID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object QbankNAIMEN: TStringField
      DisplayLabel = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 25
      FieldName = 'NAIMEN'
      Required = True
      Size = 40
    end
    object QbankBIK: TIntegerField
      DisplayLabel = #1073#1080#1082
      FieldName = 'BIK'
      Required = True
    end
    object QbankKORR_S: TFloatField
      DisplayLabel = #1050#1086#1088#1088'.'#1089#1095#1077#1090
      FieldName = 'KORR_S'
      Required = True
    end
    object QbankMESTO: TStringField
      DisplayLabel = #1084#1077#1089#1090#1086#1085#1072#1093#1086#1078#1076#1077#1085#1080#1077
      DisplayWidth = 25
      FieldName = 'MESTO'
      Required = True
      Size = 30
    end
    object QbankADRES: TStringField
      DisplayLabel = #1072#1076#1088#1077#1089
      DisplayWidth = 25
      FieldName = 'ADRES'
      Required = True
      Size = 40
    end
    object QbankTEL: TStringField
      DisplayLabel = #1090#1077#1083#1077#1092#1086#1085#1099
      DisplayWidth = 10
      FieldName = 'TEL'
      Required = True
    end
  end
  object Bds: TDataSource
    DataSet = Qbank
    Left = 48
    Top = 80
  end
end
