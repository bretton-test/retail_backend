object bprihform: Tbprihform
  Left = 297
  Top = 169
  BorderStyle = bsToolWindow
  Caption = #1042#1099#1087#1080#1089#1082#1072' '#1080#1079' '#1073#1072#1085#1082#1072' ('#1087#1088#1080#1093#1086#1076')'
  ClientHeight = 266
  ClientWidth = 458
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 266
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 45
      Width = 27
      Height = 14
      Caption = #1057#1095#1077#1090
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 67
      Height = 14
      Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 65
      Height = 14
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object SpeedButton1: TSpeedButton
      Left = 273
      Top = 95
      Width = 23
      Height = 19
      Caption = '...'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 295
      Top = 95
      Width = 18
      Height = 19
      Caption = 'x'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label5: TLabel
      Left = 16
      Top = 11
      Width = 26
      Height = 14
      Caption = #1044#1072#1090#1072
    end
    object Label4: TLabel
      Left = 17
      Top = 126
      Width = 35
      Height = 14
      Caption = #1057#1091#1084#1084#1072
    end
    object Label6: TLabel
      Left = 17
      Top = 206
      Width = 76
      Height = 14
      Caption = #1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label7: TLabel
      Left = 17
      Top = 158
      Width = 78
      Height = 14
      Caption = #1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    end
    object Label8: TLabel
      Left = 241
      Top = 158
      Width = 13
      Height = 14
      Caption = #1086#1090
    end
    object SpeedButton3: TSpeedButton
      Left = 183
      Top = 153
      Width = 18
      Height = 18
      Caption = 'x'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object KONTRNAME: TDBEditEh
      Left = 96
      Top = 95
      Width = 177
      Height = 18
      EditButtons = <>
      Flat = True
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object typoplaty: TDBComboBoxEh
      Left = 96
      Top = 68
      Width = 177
      Height = 18
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1086#1087#1083#1072#1090#1072' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        #1074#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        #1087#1088#1086#1095#1077#1077)
      TabOrder = 1
      Visible = True
    end
    object Lshet: TDBLookupComboboxEh
      Left = 96
      Top = 41
      Width = 177
      Height = 18
      EditButtons = <>
      Flat = True
      KeyField = 'id'
      ListField = 'naimen'
      ListSource = sds
      TabOrder = 2
      Visible = True
    end
    object datadok: TDBDateTimeEditEh
      Left = 96
      Top = 8
      Width = 121
      Height = 18
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
    object sumedit: TDBNumberEditEh
      Left = 96
      Top = 125
      Width = 121
      Height = 18
      currency = True
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = sumeditButtonClick
        end>
      Flat = True
      TabOrder = 4
      Value = 0.000000000000000000
      Visible = True
      OnButtonClick = sumeditButtonClick
      OnKeyDown = sumeditKeyDown
    end
    object komment: TDBEditEh
      Left = 112
      Top = 200
      Width = 273
      Height = 18
      EditButtons = <>
      Flat = True
      TabOrder = 5
      Visible = True
    end
    object docnom: TDBEditEh
      Left = 104
      Top = 153
      Width = 80
      Height = 18
      Alignment = taRightJustify
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = docnomEditButtons0Click
        end>
      Flat = True
      TabOrder = 6
      Visible = True
    end
    object datanakl: TDBDateTimeEditEh
      Left = 264
      Top = 154
      Width = 121
      Height = 18
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      ReadOnly = True
      TabOrder = 7
      Visible = True
    end
    object okbt: TBitBtn
      Left = 272
      Top = 236
      Width = 57
      Height = 25
      Caption = #1054#1050
      TabOrder = 8
      OnClick = okbtClick
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
    object cancbt: TBitBtn
      Left = 336
      Top = 236
      Width = 73
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 9
      OnClick = cancbtClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
  object qschet: TOracleDataSet
    SQL.Strings = (
      'select s.*'
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
    Left = 344
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
    Left = 376
    Top = 16
  end
  object insq: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tbeznal '
      'values ('
      ':nom,'
      ':data,'
      ':kontragent,'
      ':doc,'
      ':osnov,'
      ':sum,'
      ':tip,'
      ':reg,'
      'user,'
      ':prim,'
      ':schet'
      ')')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 344
    Top = 56
  end
  object qkassorder: TOracleDataSet
    SQL.Strings = (
      'select k.*,'
      'p.name,'
      'j.nn nn,'
      'j.data d,'
      'k.rowid'
      'from tmp.tbeznal k,tmp.tpostav p,tmp.vfulljourn j'
      'where  p.cod=k.kontragent'
      'and j.nom(+)=k.doc'
      'and k.nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000007E0A000000000000}
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
      030000000E000000030000004E4F4D0100000000040000004441544101000000
      000A0000004B4F4E54524147454E54010000000003000000444F430100000000
      050000004F534E4F5601000000000300000053554D0100000000030000005449
      500100000000030000005245470100000000050000004F574E45520100000000
      040000005052494D01000000000500000053434845540100000000040000004E
      414D450100000000020000004E4E010000000001000000440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 280
    Top = 16
  end
  object kassds: TDataSource
    DataSet = qkassorder
    Left = 280
    Top = 48
  end
end
