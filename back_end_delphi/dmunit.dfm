object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 382
  Top = 119
  Height = 638
  Width = 875
  object OraBase: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    ConnectAs = caNormal
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Preferences.NullLOBIsEmpty = False
    Pooling = spNone
    MTSOptions = [moImplicit, moUniqueServer]
    Connected = False
    RollbackOnDisconnect = True
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 16
    Top = 8
  end
  object tovar: TOracleDataSet
    SQL.Strings = (
      'select '
      't.plu,'
      'T.name,T.ecrname,'
      't.shtuka,'
      't.price,'
      'KAT,'
      't.life,'
      'cennik1,'
      'cennik2,'
      'cennik3,'
      'cennik4,'
      'T.PROIZW,'
      'ed_izm,'
      'wes,'
      'minost,'
      'NDS,'
      'nsp,'
      'nal,t.discount,t.post,'
      't.export,'
      'T.rowid,'
      '--P.NAME,'
      'nvl(max(k.cena),0) cenaprih,'
      'nvl(r.price,-1) kassa,'
      'max(w.price) wesy'
      ''
      'from TMP.tkatalog T,tmp.kniga k,pos.tovar r,pos.caslp w'
      ''
      ''
      ''
      'WHERE --T.PROIZW=P.PROIZW(+) and'
      
        '(k.plu(+)=t.plu and k.prihod(+)>0 and k.partost(+)>0 and k.otkat' +
        '(+)=0)'
      'and r.plu(+)=t.plu'
      'and w.icode(+)=t.plu'
      '--and t.export=1'
      ''
      ''
      'group by'
      't.plu,'
      'T.name,T.ecrname,'
      't.shtuka,'
      't.price,'
      'KAT,'
      't.life,'
      'cennik1,'
      'cennik2,'
      'cennik3,'
      'cennik4,'
      'T.PROIZW,'
      'ed_izm,'
      'wes,'
      'minost,'
      'NDS,'
      'nsp,'
      'nal,t.discount,t.post,'
      't.export,'
      'T.rowid,'
      '--P.NAME,'
      'nvl(r.price,-1) '
      'order by T.name')
    ReadBuffer = 50
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
      030000001800000003000000504C550100000000040000004E414D4501000000
      00070000004543524E414D45010000000006000000534854554B410100000000
      0500000050524943450100000000040000004C49464501000000000700000043
      454E4E494B3101000000000700000043454E4E494B3201000000000700000043
      454E4E494B3301000000000700000043454E4E494B3401000000000600000045
      445F495A4D0100000000030000005745530100000000030000004B4154010000
      00000600000050524F495A570100000000030000004E44530100000000030000
      004E414C01000000000800000043454E41505249480100000000050000004B41
      535341010000000004000000574553590100000000060000004558504F525401
      00000000030000004E53500100000000060000004D494E4F5354010000000008
      000000444953434F554E54010000000004000000504F53540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    FilterOptions = [foCaseInsensitive]
    AfterOpen = tovarAfterOpen
    AfterInsert = tovarAfterInsert
    BeforeEdit = tovarBeforeEdit
    AfterEdit = tovarAfterEdit
    BeforePost = tovarBeforePost
    AfterPost = tovarAfterPost
    AfterCancel = tovarAfterCancel
    BeforeDelete = tovarBeforeDelete
    AfterDelete = tovarAfterDelete
    AfterScroll = tovarAfterScroll
    OnDeleteError = tovarDeleteError
    OnNewRecord = tovarNewRecord
    Left = 72
    Top = 8
    object tovarNAME: TStringField
      DisplayWidth = 94
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object tovarWES: TIntegerField
      FieldName = 'WES'
    end
    object tovarED_IZM: TStringField
      DisplayWidth = 8
      FieldName = 'ED_IZM'
      Size = 5
    end
    object tovarECRNAME: TStringField
      FieldName = 'ECRNAME'
      Visible = False
      Size = 26
    end
    object tovarSHTUKA: TIntegerField
      FieldName = 'SHTUKA'
      Visible = False
    end
    object tovarPRICE: TFloatField
      DisplayWidth = 9
      FieldName = 'PRICE'
      currency = True
    end
    object tovarLIFE: TIntegerField
      FieldName = 'LIFE'
      Visible = False
    end
    object tovarCENNIK1: TStringField
      FieldName = 'CENNIK1'
      Visible = False
      Size = 26
    end
    object tovarCENNIK2: TStringField
      FieldName = 'CENNIK2'
      Visible = False
      Size = 26
    end
    object tovarCENNIK3: TStringField
      FieldName = 'CENNIK3'
      Visible = False
      Size = 26
    end
    object tovarCENNIK4: TStringField
      FieldName = 'CENNIK4'
      Visible = False
      Size = 26
    end
    object tovarKAT: TIntegerField
      FieldName = 'KAT'
      Visible = False
    end
    object tovarPROIZW: TIntegerField
      FieldName = 'PROIZW'
      Visible = False
    end
    object tovarPLU: TFloatField
      DisplayWidth = 12
      FieldName = 'PLU'
      Required = True
    end
    object tovarNDS: TStringField
      FieldName = 'NDS'
      Visible = False
      Size = 2
    end
    object tovarMINOST: TFloatField
      FieldName = 'MINOST'
    end
    object tovarNAL: TFloatField
      DisplayWidth = 10
      FieldName = 'NAL'
    end
    object tovarCENAPRIH: TFloatField
      FieldName = 'CENAPRIH'
      currency = True
    end
    object tovarKASSA: TFloatField
      FieldName = 'KASSA'
      currency = True
    end
    object tovarWESY: TFloatField
      FieldName = 'WESY'
      currency = True
    end
    object tovarEXPORT: TIntegerField
      FieldName = 'EXPORT'
      Visible = False
      OnChange = tovarEXPORTChange
    end
    object tovarNSP: TStringField
      FieldName = 'NSP'
      Visible = False
      Size = 3
    end
    object tovarDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object tovarPOST: TIntegerField
      FieldName = 'POST'
    end
  end
  object tovds: TDataSource
    DataSet = tovar
    Left = 112
    Top = 8
  end
  object plu: TOracleDataSet
    SQL.Strings = (
      'select plu'
      'from TMP.tkatalog'
      '')
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
    QBEDefinition.QBEFieldDefs = {030000000100000003000000504C550100000000}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 256
    Top = 8
  end
  object Qedizm: TOracleDataSet
    SQL.Strings = (
      'select ed_izm,OKEI,'
      'rowid'
      'from TMP.edizm')
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
      03000000020000000600000045445F495A4D0100000000040000004F4B454901
      00000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 72
    Top = 64
    object QedizmED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object QedizmOKEI: TIntegerField
      FieldName = 'OKEI'
      Required = True
    end
  end
  object edds: TDataSource
    DataSet = Qedizm
    Left = 112
    Top = 64
  end
  object Qrazdel: TOracleDataSet
    SQL.Strings = (
      'select '
      'KAT,'
      'name,'
      'report,'
      'parent,'
      'rowid'
      'from TMP.TKAT'
      'order by NAME')
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
      0300000004000000040000004E414D450100000000030000004B415401000000
      00060000005245504F5254010000000006000000504152454E540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterPost = QrazdelAfterPost
    Left = 72
    Top = 112
    object QrazdelKAT: TIntegerField
      FieldName = 'KAT'
    end
    object QrazdelNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object QrazdelREPORT: TIntegerField
      DisplayLabel = #1086#1090#1095#1077#1090'(0,1)'
      DisplayWidth = 5
      FieldName = 'REPORT'
      MaxValue = 1
    end
    object QrazdelPARENT: TIntegerField
      DisplayWidth = 5
      FieldName = 'PARENT'
    end
  end
  object razdds: TDataSource
    DataSet = Qrazdel
    Left = 112
    Top = 112
  end
  object barcode: TOracleDataSet
    SQL.Strings = (
      'select barcode,'
      'plu,'
      'nvl(substr(barcode,1,7),0)  kodpr,'
      'cennik,'
      'rowid'
      'from TMP.TBARCODE'
      'where plu=:plu ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A504C55050000000300000035390000000000}
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
      030000000400000007000000424152434F4445010000000003000000504C5501
      00000000050000004B4F44505201000000000600000043454E4E494B01000000
      00}
    Cursor = crDefault
    Master = tovar
    MasterFields = 'plu'
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforeInsert = barcodeBeforeEdit
    AfterInsert = barcodeAfterInsert
    BeforeEdit = barcodeBeforeEdit
    BeforePost = barcodeBeforePost
    AfterScroll = barcodeAfterScroll
    OnNewRecord = barcodeNewRecord
    Left = 160
    Top = 8
    object barcodeBARCODE: TStringField
      DisplayLabel = #1096#1090#1088#1080#1093#1082#1086#1076
      FieldName = 'BARCODE'
      Size = 13
    end
    object barcodePLU: TFloatField
      FieldName = 'PLU'
      Visible = False
    end
    object barcodeKODPR: TStringField
      FieldName = 'KODPR'
      Visible = False
      Size = 7
    end
    object barcodeCENNIK: TStringField
      DisplayLabel = #1094#1077#1085#1085#1080#1082
      FieldName = 'CENNIK'
      Size = 26
    end
  end
  object bards: TDataSource
    DataSet = barcode
    Left = 200
    Top = 8
  end
  object Qprzwd: TOracleDataSet
    SQL.Strings = (
      'select proizw,'
      'name,'
      'strana,'
      'rowid'
      'from tmp.tproizw'
      'order by name')
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
      03000000030000000600000050524F495A570100000000040000004E414D4501
      0000000006000000535452414E410100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    FilterOptions = [foCaseInsensitive]
    AfterOpen = QprzwdAfterOpen
    OnNewRecord = QprzwdNewRecord
    Left = 160
    Top = 56
    object QprzwdPROIZW: TIntegerField
      DisplayLabel = #1082#1086#1076
      DisplayWidth = 12
      FieldName = 'PROIZW'
    end
    object QprzwdNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 33
      FieldName = 'NAME'
      Size = 30
    end
    object QprzwdSTRANA: TStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      DisplayWidth = 13
      FieldName = 'STRANA'
      Size = 30
    end
  end
  object przwds: TDataSource
    DataSet = Qprzwd
    Left = 200
    Top = 56
  end
  object findplu: TOracleQuery
    SQL.Strings = (
      'select distinct to_char(plu) plu '
      'from tmp.tbarcode'
      'where barcode like :barcode')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A424152434F4445050000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 256
    Top = 56
  end
  object qsetbar: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tbarcode (plu,barcode)'
      'values (:plu,:barcode)')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C5503000000000000000000000008000000
      3A424152434F4445050000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 256
    Top = 104
  end
  object delbar: TOracleQuery
    SQL.Strings = (
      'delete from tmp.Tbarcode where plu=:plu')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A504C55030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 352
    Top = 16
  end
  object kodproizw: TOracleQuery
    SQL.Strings = (
      'select tmp.proizseq.nextval kod  from dual')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 328
    Top = 80
  end
  object Qpostav: TOracleDataSet
    SQL.Strings = (
      'select cod ,'
      'name ,'
      'yr_adr,'
      'fakt_adr,'
      'tel,'
      ' ras_sch,'
      ' n_bank,'
      'kor_sch,'
      'bik,'
      'city,'
      'inn,'
      'okonx,'
      'okpo,'
      'date_zap,'
      'tip,'
      'kodifik,'
      'rowid from tmp.tpostav'
      ''
      'order by name')
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
      030000001000000003000000434F440100000000040000004E414D4501000000
      000600000059525F41445201000000000800000046414B545F41445201000000
      000300000054454C0100000000070000005241535F5343480100000000060000
      004E5F42414E4B0100000000070000004B4F525F534348010000000003000000
      42494B01000000000400000043495459010000000003000000494E4E01000000
      00050000004F4B4F4E580100000000040000004F4B504F010000000008000000
      444154455F5A41500100000000030000005449500100000000070000004B4F44
      4946494B0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    FilterOptions = [foCaseInsensitive]
    OnNewRecord = QpostavNewRecord
    Left = 72
    Top = 160
    object QpostavCOD: TIntegerField
      FieldName = 'COD'
      Required = True
    end
    object QpostavNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object QpostavYR_ADR: TStringField
      FieldName = 'YR_ADR'
      Visible = False
      Size = 150
    end
    object QpostavFAKT_ADR: TStringField
      FieldName = 'FAKT_ADR'
      Visible = False
      Size = 150
    end
    object QpostavTEL: TStringField
      FieldName = 'TEL'
      Visible = False
      Size = 14
    end
    object QpostavRAS_SCH: TStringField
      FieldName = 'RAS_SCH'
      Visible = False
    end
    object QpostavN_BANK: TStringField
      FieldName = 'N_BANK'
      Visible = False
      Size = 85
    end
    object QpostavKOR_SCH: TStringField
      FieldName = 'KOR_SCH'
      Visible = False
    end
    object QpostavBIK: TStringField
      FieldName = 'BIK'
      Visible = False
      Size = 9
    end
    object QpostavCITY: TStringField
      FieldName = 'CITY'
      Visible = False
      Size = 30
    end
    object QpostavINN: TStringField
      FieldName = 'INN'
      Visible = False
      Size = 12
    end
    object QpostavOKONX: TStringField
      FieldName = 'OKONX'
      Visible = False
      Size = 15
    end
    object QpostavOKPO: TStringField
      FieldName = 'OKPO'
      Visible = False
      Size = 15
    end
    object QpostavDATE_ZAP: TDateTimeField
      FieldName = 'DATE_ZAP'
      Visible = False
    end
    object QpostavTIP: TIntegerField
      FieldName = 'TIP'
    end
    object QpostavKODIFIK: TFloatField
      FieldName = 'KODIFIK'
    end
  end
  object postds: TDataSource
    DataSet = Qpostav
    Left = 112
    Top = 160
  end
  object qperiod: TOracleDataSet
    SQL.Strings = (
      'select q.value begin,'
      'w.value end'
      ' '
      'from tmp.toptions q,tmp.toptions w'
      'where q.parametr='#39'begin'#39
      'and w.parametr='#39'end'#39)
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
      030000000300000005000000424547494E010000000003000000454E44010000
      000005000000524F5749440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 160
    Top = 104
    object qperiodBEGIN: TStringField
      FieldName = 'BEGIN'
      Required = True
      Size = 15
    end
    object qperiodEND: TStringField
      FieldName = 'END'
      Required = True
      Size = 15
    end
  end
  object periodds: TDataSource
    DataSet = qperiod
    Left = 200
    Top = 104
  end
  object qsklad: TOracleDataSet
    SQL.Strings = (
      'select sklad,'
      'skladid,name,'
      'rowid from tmp.Tsklad'
      'order by skladid')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.Field = 'SKLADID'
    SequenceField.Sequence = 'TMP.SKLADSEQ'
    SequenceField.ApplyMoment = amOnNewRecord
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
      030000000300000005000000534B4C4144010000000007000000534B4C414449
      440100000000040000004E414D450100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 160
    Top = 152
    object qskladSKLAD: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1057#1082#1083#1072#1076#1072
      DisplayWidth = 30
      FieldName = 'SKLAD'
      Size = 50
    end
    object qskladSKLADID: TIntegerField
      FieldName = 'SKLADID'
    end
    object qskladNAME: TStringField
      DisplayLabel = #1088#1077#1082#1074#1080#1079#1080#1090
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
  end
  object skladds: TDataSource
    DataSet = qsklad
    Left = 200
    Top = 152
  end
  object Qnakltemp: TOracleDataSet
    SQL.Strings = (
      'select nn,'
      'n.post,'
      'pokup,'
      'data,'
      'n.name,'
      'n.ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'n.kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'skladid,'
      'n.plu,'
      'cenawzale,'
      'max(w.price)  wesy,'
      'nvl(t.price,0) nal,'
      'n.id,'
      'k.nds,n.krasn_id,n.life,'
      'n.rowid'
      'from tnakltemp n,pos.tovar t,pos.caslp w,tmp.tkatalog k'
      'where n.plu=t.plu(+) '
      'and n.plu=w.icode(+)'
      'and n.plu=k.plu'
      'group by nn,'
      'n.post,'
      'pokup,'
      'data,'
      'n.name,'
      'n.ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'n.kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'skladid,'
      'n.plu,'
      'cenawzale,'
      'nvl(t.price,0),'
      'n.id,'
      'k.nds,n.krasn_id,n.life,'
      'n.rowid'
      'order by n.id')
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
      0300000017000000020000004E4E010000000004000000504F53540100000000
      05000000504F4B5550010000000004000000444154410100000000040000004E
      414D4501000000000600000045445F495A4D0100000000040000004D45535401
      00000000060000004B4F4C5F5550010000000006000000524F53534950010000
      0000060000004B4F4C5F564F01000000000800000043454E41424E4453010000
      00000800000043454E41534E445301000000000800000043454E415245414C01
      0000000005000000544F54414C010000000007000000534B4C41444944010000
      000003000000504C5501000000000900000043454E41575A414C450100000000
      030000004E414C01000000000400000057455359010000000002000000494401
      00000000030000004E44530100000000080000004B5241534E5F494401000000
      00040000004C4946450100000000}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterOpen = QnakltempAfterOpen
    BeforeInsert = QnakltempBeforeInsert
    BeforeEdit = QnakltempBeforeEdit
    BeforePost = QnakltempBeforePost
    AfterPost = QnakltempAfterPost
    OnCalcFields = QnakltempCalcFields
    OnNewRecord = QnakltempNewRecord
    Left = 160
    Top = 208
    object QnakltempNN: TIntegerField
      DisplayWidth = 12
      FieldName = 'NN'
      Visible = False
    end
    object QnakltempPOST: TIntegerField
      DisplayWidth = 12
      FieldName = 'POST'
      Visible = False
    end
    object QnakltempPOKUP: TIntegerField
      DisplayWidth = 12
      FieldName = 'POKUP'
      Visible = False
    end
    object QnakltempDATA: TDateTimeField
      DisplayWidth = 13
      FieldName = 'DATA'
      Required = True
      Visible = False
    end
    object QnakltempNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QnakltempED_IZM: TStringField
      DisplayLabel = #1077#1076'.'#1080#1079#1084'.'
      DisplayWidth = 8
      FieldName = 'ED_IZM'
      Size = 5
    end
    object QnakltempMEST: TIntegerField
      DisplayLabel = #1052#1077#1089#1090
      DisplayWidth = 7
      FieldName = 'MEST'
    end
    object QnakltempKOL_UP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074' '#1059#1087'.'
      DisplayWidth = 8
      FieldName = 'KOL_UP'
    end
    object QnakltempROSSIP: TFloatField
      DisplayLabel = #1056#1086#1089#1089#1099#1087#1100
      DisplayWidth = 8
      FieldName = 'ROSSIP'
    end
    object QnakltempKOL_VO: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1089#1077#1075#1086
      DisplayWidth = 9
      FieldName = 'KOL_VO'
    end
    object QnakltempCENABNDS: TFloatField
      DisplayLabel = #1094#1077#1085#1072'-'#1085#1076#1089
      DisplayWidth = 10
      FieldName = 'CENABNDS'
      currency = True
    end
    object QnakltempCENASNDS: TFloatField
      DisplayLabel = #1094#1077#1085#1072'+'#1085#1076#1089
      DisplayWidth = 10
      FieldName = 'CENASNDS'
      currency = True
    end
    object QnakltempCENAREAL: TFloatField
      DisplayLabel = #1094#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080
      DisplayWidth = 11
      FieldName = 'CENAREAL'
      currency = True
    end
    object QnakltempTOTAL: TFloatField
      DisplayLabel = #1042#1089#1077#1075#1086
      DisplayWidth = 11
      FieldName = 'TOTAL'
      currency = True
    end
    object QnakltempPtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Ptotal'
      Calculated = True
    end
    object QnakltempSKLADID: TIntegerField
      DisplayWidth = 12
      FieldName = 'SKLADID'
      Visible = False
    end
    object QnakltempPLU: TFloatField
      FieldName = 'PLU'
      Visible = False
    end
    object QnakltempCENAWZALE: TFloatField
      FieldName = 'CENAWZALE'
      Visible = False
      currency = True
    end
    object Qnakltempostatok: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ostatok'
      Calculated = True
    end
    object QnakltempNAL: TFloatField
      FieldName = 'NAL'
      currency = True
    end
    object QnakltempWESY: TFloatField
      FieldName = 'WESY'
      currency = True
    end
    object QnakltempID: TFloatField
      FieldName = 'ID'
    end
    object QnakltempNDS: TStringField
      FieldName = 'NDS'
      Size = 2
    end
    object QnakltempKRASN_ID: TStringField
      FieldName = 'KRASN_ID'
      Visible = False
      Size = 12
    end
    object Qnakltemprow: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'row'
      OnGetText = QnakltemprowGetText
      Calculated = True
    end
    object QnakltempLIFE: TDateTimeField
      FieldName = 'LIFE'
    end
  end
  object tempds: TDataSource
    DataSet = Qnakltemp
    Left = 208
    Top = 208
  end
  object qtotal: TOracleQuery
    SQL.Strings = (
      'select sum(mest) mest,'
      'sum(kol_vo)  kol_vo,'
      'sum(total) total'
      'from tnakltemp')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 256
    Top = 160
  end
  object qinsertnakl: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tprihnakl (nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'skladid,'
      'plu,'
      'cenawzale,'
      'id,'
      'nom,'
      'krasn_id,life'
      ''
      ') '
      ''
      'select :nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'skladid,'
      'plu,'
      'cenawzale,'
      'id,'
      ':nom,'
      'krasn_id,life'
      ''
      'from tnakltemp'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 312
    Top = 168
  end
  object qInsertJournal: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tprihj '
      '(NOM,'
      'DATA,'
      'POST,'
      'SUM,'
      'PRIM,'
      'POST_NAME,'
      'SKLADID,'
      'POKUP,'
      'NN,'
      'part,'
      'ppost'
      ')'
      ' values '
      '(:NOM,'
      ':DATA,'
      ':POST,'
      ':SUM,'
      ':PRIM,'
      ':POST_NAME,'
      ':SKLADID,'
      ':POKUP,'
      ':NN,'
      ':part,'
      ':ppost'
      ')'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      030000000B000000040000003A4E4F4D03000000000000000000000005000000
      3A444154410C0000000000000000000000050000003A504F5354030000000000
      000000000000040000003A53554D040000000000000000000000050000003A50
      52494D0500000000000000000000000A0000003A504F53545F4E414D45050000
      000000000000000000080000003A534B4C414449440300000000000000000000
      00060000003A504F4B5550030000000000000000000000030000003A4E4E0300
      00000000000000000000050000003A5041525403000000000000000000000006
      0000003A50504F5354030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 376
    Top = 160
  end
  object Qprihj: TOracleDataSet
    SQL.Strings = (
      'select '
      #39#1055#1088#1080#1093'.'#1085#1072#1082#1083'.'#39' tip,'
      'reg,'
      'nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      'post_name name,'
      'sklad,prim,sum,'
      'nom,'
      'part,data d,'
      'owner'
      'from tmp.tprihj p,tmp.tsklad t'
      'where t.skladid=p.skladid '
      
        'and p.data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toptio' +
        'ns where parametr='#39'begin'#39')'
      
        'and p.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'end'#39') '
      ''
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
      030000000D000000030000005245470100000000020000004E4E010000000004
      00000054494D45010000000004000000444154410100000000040000004E414D
      45010000000005000000534B4C41440100000000040000005052494D01000000
      000300000053554D0100000000030000004E4F4D010000000004000000504152
      5401000000000300000054495001000000000100000044010000000005000000
      4F574E45520100000000}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 160
    Top = 256
    object QprihjTIP: TStringField
      FieldName = 'TIP'
      Size = 10
    end
    object QprihjREG: TIntegerField
      FieldName = 'REG'
      Required = True
    end
    object QprihjNN: TIntegerField
      FieldName = 'NN'
      Required = True
    end
    object QprihjTIME: TStringField
      FieldName = 'TIME'
      Required = True
      Size = 5
    end
    object QprihjDATA: TStringField
      FieldName = 'DATA'
      Required = True
      Size = 9
    end
    object QprihjNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object QprihjSKLAD: TStringField
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object QprihjPRIM: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
    object QprihjSUM: TFloatField
      FieldName = 'SUM'
      Required = True
      currency = True
    end
    object QprihjNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object QprihjPART: TFloatField
      FieldName = 'PART'
      Required = True
      Visible = False
    end
    object QprihjD: TDateTimeField
      FieldName = 'D'
      Visible = False
    end
    object QprihjOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 15
    end
  end
  object prihjds: TDataSource
    DataSet = Qprihj
    Left = 208
    Top = 256
  end
  object updatetime: TOracleQuery
    SQL.Strings = (
      'update tnakltemp set data=:data')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A444154410C0000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 448
    Top = 160
  end
  object insertTemp: TOracleQuery
    SQL.Strings = (
      'insert into tnakltemp (nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'skladid,'
      'plu,'
      'cenawzale,'
      'id,krasn_id,life'
      ') '
      ''
      'select nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'skladid,'
      'plu,'
      'cenawzale,'
      'id,krasn_id,life'
      ''
      'from tmp.tprihnakl p'
      'where P.nom=:nom')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 448
    Top = 208
  end
  object Qprovodka: TOracleQuery
    SQL.Strings = (
      'insert into tmp.kniga'
      ' (plu,'
      'data,'
      'prihod,'
      'rashod,'
      'cena,'
      'skladid,'
      'ostatok,'
      'nom,'
      'partia,'
      'sum,'
      'partost,life,'
      'pprice,discount)'
      ''
      'values'
      '(:plu,'
      ':data,'
      ':prihod,'
      ':rashod,'
      ':cena,'
      ':skladid,'
      ':ostatok,'
      ':nom,'
      ':partia,'
      ':sum,'
      ':partost,:life,'
      ':pprice,:discount)'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      030000000E000000040000003A504C5503000000000000000000000005000000
      3A444154410C0000000000000000000000070000003A505249484F4404000000
      0000000000000000070000003A524153484F4404000000000000000000000005
      0000003A43454E41040000000000000000000000080000003A534B4C41444944
      030000000000000000000000080000003A4F535441544F4B0400000000000000
      00000000040000003A4E4F4D030000000000000000000000070000003A504152
      544941030000000000000000000000040000003A53554D040000000000000000
      000000080000003A504152544F5354040000000000000000000000070000003A
      505052494345040000000000000000000000050000003A4C4946450C00000000
      00000000000000090000003A444953434F554E54040000000800000000000000
      0000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 512
    Top = 160
  end
  object selkniga: TOracleQuery
    SQL.Strings = (
      'select plu,'
      'data,'
      'prihod,'
      'rashod,'
      'cena,'
      'skladid,'
      'otkat,'
      'ostatok,'
      'sum,'
      'partost,'
      'partia'
      'from tmp.kniga'
      'where nom=:nom'
      'and otkat=0')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 496
    Top = 208
  end
  object Qostatok: TOracleDataSet
    SQL.Strings = (
      'select'
      'k.plu,'
      'nvl(t.ed_izm,'#39'?'#39') ed_izm,'
      'nvl(t.price,0) price,'
      'sum(k.partost) ostatok'
      'from tmp.kniga k,tmp.tkatalog t '
      'where  '
      't.plu(+)=k.plu'
      'and k.otkat=0'
      'and skladid=:sklad'
      'and data <=:data'
      'and t.kat=:kat'
      'having sum(k.partost)>0'
      'group by K.plu,t.name,nvl(t.price,0),nvl(t.ed_izm,'#39'?'#39')'
      'order by t.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A534B4C41440300000000000000000000000500
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
    QBEDefinition.QBEFieldDefs = {
      030000000700000003000000504C550100000000040000004E414D4501000000
      0006000000505249484F44010000000006000000524153484F44010000000007
      0000004F535441544F4B01000000000500000050524943450100000000060000
      0045445F495A4D0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 272
    Top = 304
    object QostatokPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QostatokED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object QostatokPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object QostatokOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
  end
  object OstDs: TDataSource
    DataSet = qaltost
    Left = 200
    Top = 352
  end
  object Qinsertrashod: TOracleQuery
    SQL.Strings = (
      'insert into tmp.trashj '
      '(NOM,'
      'DATA,'
      'POST,'
      'SUM,'
      'PRIM,'
      'POKUP_NAME,'
      'SKLADID,'
      'POKUP,'
      'NN,'
      'part'
      ')'
      ' values '
      '(:NOM,'
      ':DATA,'
      ':POST,'
      ':SUM,'
      ':PRIM,'
      ':POKUP_NAME,'
      ':SKLADID,'
      ':POKUP,'
      ':NN,'
      ':part'
      ')'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      030000000A000000040000003A4E4F4D03000000000000000000000005000000
      3A444154410C0000000000000000000000050000003A504F5354030000000000
      000000000000040000003A53554D040000000000000000000000050000003A50
      52494D050000000000000000000000080000003A534B4C414449440300000000
      00000000000000060000003A504F4B5550030000000000000000000000030000
      003A4E4E030000000000000000000000050000003A5041525403000000000000
      00000000000B0000003A504F4B55505F4E414D45050000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 376
    Top = 208
  end
  object QinsrasNakl: TOracleQuery
    SQL.Strings = (
      'insert into tmp.trashnakl (nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'total,'
      'skladid,'
      'plu,'
      'id,'
      'nom'
      ''
      ') '
      ''
      'select :nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'total,'
      'skladid,'
      'plu,'
      'id,'
      ':nom'
      ''
      'from tnakltemp'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D03000000000000000000000003000000
      3A4E4E030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 376
    Top = 256
  end
  object QpartOst: TOracleDataSet
    SQL.Strings = (
      'select '
      'k.id,'
      'k.pprice,'
      'k.partia,'
      'k.partost,'
      'k.cena,'
      'k.nom nom,'
      't.name,'
      'k.data data'
      'from tmp.kniga k,tmp.tkatalog t'
      ' where  k.plu=:plu'
      'and t.plu=k.plu'
      'and k.prihod>0'
      ''
      'and k.partost>0'
      'and k.data<=:data'
      'and k.skladid=:sklad'
      'and k.otkat=0'
      ''
      'union'
      ''
      'select '
      'k.id,'
      'k.pprice,'
      'k.partia,'
      'k.partost,'
      'k.cena,'
      'k.nom nom,'
      't.name,'
      'k.data data'
      'from tmp.kniga k,tmp.tkatalog t'
      ' where  k.plu=:plu'
      'and t.plu=k.plu'
      'and k.prihod>0'
      'and k.data<=:data'
      'and k.skladid=:sklad'
      'and k.otkat=0'
      'and rownum=1'
      'and k.data=(select max(data) from tmp.kniga where'
      
        #9'  plu=:plu and skladid=:sklad and data<=:data and prihod>0 and ' +
        'otkat=0'
      #9#9')'
      ''
      ''
      'order by data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C550300000004000000BB15010000000000
      060000003A534B4C414403000000040000000100000000000000050000003A44
      4154410C00000007000000786D010101010100000000}
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
      030000000800000006000000504152544941010000000007000000504152544F
      5354010000000002000000494401000000000400000043454E41010000000003
      0000004E4F4D0100000000040000004E414D4501000000000600000050505249
      4345010000000004000000444154410100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 448
    Top = 256
    object QpartOstPARTIA: TFloatField
      FieldName = 'PARTIA'
      Required = True
    end
    object QpartOstPARTOST: TFloatField
      FieldName = 'PARTOST'
      Required = True
    end
    object QpartOstID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object QpartOstCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object QpartOstNOM: TFloatField
      FieldName = 'NOM'
      Required = True
    end
    object QpartOstNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QpartOstPPRICE: TFloatField
      FieldName = 'PPRICE'
    end
  end
  object Qrashj: TOracleDataSet
    SQL.Strings = (
      'select '
      #39#1056#1072#1089#1093'.'#1085#1072#1082#1083'.'#39' tip,'
      'reg,'
      'nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      'pokup_name name,'
      'sklad,prim,sum,'
      'nom,'
      'part,'
      'owner,p.data d'
      'from tmp.trashj p,tmp.tsklad t'
      'where t.skladid=p.skladid '
      
        'and p.data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toptio' +
        'ns where parametr='#39'begin'#39')'
      
        'and p.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'end'#39') '
      ''
      'union all'
      ''
      'select '
      #39#1054#1090#1095#1077#1090' '#1050#1050#1052#39' tip,'
      'reg,'
      'doc nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      'nvl(m.name,'#39'?'#39') name,'
      't.sklad,'
      'komment prim,'
      'total sum,'
      'doc nom,'
      '0 part,'
      'owner,p.data d'
      'from tmp.kkmj p,tmp.tsklad t,tmp.kkm m'
      'where t.skladid=p.skladid '
      'and m.id=p.kkm(+)'
      
        'and p.data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toptio' +
        'ns where parametr='#39'begin'#39')'
      
        'and p.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'end'#39')'
      ''
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
      030000000D000000030000005245470100000000020000004E4E010000000004
      00000054494D45010000000004000000444154410100000000040000004E414D
      45010000000005000000534B4C41440100000000040000005052494D01000000
      000300000053554D0100000000030000004E4F4D010000000004000000504152
      540100000000030000005449500100000000050000004F574E45520100000000
      01000000440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 160
    Top = 400
    object StringField1: TStringField
      FieldName = 'TIP'
      Size = 10
    end
    object QrashjREG: TFloatField
      FieldName = 'REG'
    end
    object QrashjNN: TFloatField
      FieldName = 'NN'
    end
    object StringField2: TStringField
      FieldName = 'TIME'
      Required = True
      Size = 5
    end
    object StringField3: TStringField
      FieldName = 'DATA'
      Required = True
      Size = 9
    end
    object StringField4: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
    object FloatField1: TFloatField
      FieldName = 'SUM'
      Required = True
      currency = True
    end
    object FloatField2: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'PART'
      Required = True
      Visible = False
    end
    object QrashjD: TDateTimeField
      FieldName = 'D'
      Visible = False
    end
    object QrashjOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 15
    end
  end
  object rashjDS: TDataSource
    DataSet = Qrashj
    Left = 200
    Top = 400
  end
  object InsertTempRas: TOracleQuery
    SQL.Strings = (
      'insert into tnakltemp (nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'total,'
      'skladid,'
      'plu,'
      'id'
      ''
      ') '
      ''
      'select nn,'
      'post,'
      'pokup,'
      'data,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'total,'
      'skladid,'
      'plu,'
      'id'
      ''
      ''
      'from tmp.trashnakl'
      'where nom=:nom'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 376
    Top = 304
  end
  object updateOstatok: TOracleQuery
    SQL.Strings = (
      'update tmp.kniga'
      'set ostatok=ostatok+:prihod'
      'where plu=:plu'
      'and data>:data'
      'and skladid=:sklad'
      'and nom<>:nom')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000070000003A505249484F4404000000000000000000000004
      0000003A504C55030000000000000000000000050000003A444154410C000000
      0000000000000000060000003A534B4C41440300000000000000000000000400
      00003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 456
    Top = 304
  end
  object qaltost: TOracleDataSet
    SQL.Strings = (
      'select j.nom,'
      'j.cena,'
      'j.plu,'
      't.name,'
      'j.data,'
      'sum(j.prihod) prihod,'
      'sum(j.rashod)rashod,'
      'sum(j.ostatok)ostatok,'
      '--sum(j.prihod)*j.cena sum_prihod,'
      '--sum(j.rashod)*j.cena sum_rashod,'
      'sum(j.sum_prihod) sum_prihod,'
      'sum(j.sum_rashod) sum_rashod,'
      'j.prnom,'
      'j.klient'
      'from tmp.journal j,tmp.tkatalog t'
      'where -- (j.data between :begin and :end  or j.data=sysdate)'
      'j.sklad=:sklad'
      'and t.plu=j.plu'
      '-- and t.kat like :name'
      'group by'
      'j.nom,'
      'j.cena,'
      'j.plu,'
      't.name,'
      'j.data,'
      'j.prnom,'
      'j.klient,'
      'j.partia,j.id'
      'order by'
      't.name'
      ',j.data'
      ',j.id'
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000060000003A534B4C41440300000004000000010000000000
      0000}
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
      030000000C00000003000000504C550100000000040000004E414D4501000000
      00030000004E4F4D010000000004000000444154410100000000040000004345
      4E41010000000006000000505249484F44010000000006000000524153484F44
      0100000000070000004F535441544F4B01000000000500000050524E4F4D0100
      000000060000004B4C49454E5401000000000A00000053554D5F505249484F44
      01000000000A00000053554D5F524153484F440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    FilterOptions = [foCaseInsensitive]
    Left = 120
    Top = 352
    object qaltostNOM: TFloatField
      FieldName = 'NOM'
    end
    object qaltostCENA: TFloatField
      FieldName = 'CENA'
      currency = True
    end
    object qaltostPLU: TFloatField
      FieldName = 'PLU'
    end
    object qaltostNAME: TStringField
      FieldName = 'NAME'
      Size = 52
    end
    object qaltostDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qaltostPRIHOD: TFloatField
      FieldName = 'PRIHOD'
    end
    object qaltostRASHOD: TFloatField
      FieldName = 'RASHOD'
    end
    object qaltostOSTATOK: TFloatField
      FieldName = 'OSTATOK'
    end
    object qaltostPRNOM: TFloatField
      FieldName = 'PRNOM'
    end
    object qaltostKLIENT: TStringField
      FieldName = 'KLIENT'
      Size = 100
    end
    object qaltostSUM_PRIHOD: TFloatField
      FieldName = 'SUM_PRIHOD'
      ReadOnly = True
      currency = True
    end
    object qaltostSUM_RASHOD: TFloatField
      FieldName = 'SUM_RASHOD'
      ReadOnly = True
      currency = True
    end
  end
  object QInsertPart: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tpart ('
      'plu,'
      'nom,'
      'cenazak,'
      'cenareal,'
      'kolvo,'
      'data,'
      'nomrash,'
      'part'
      ')'
      'values ('
      ':plu,'
      ':nom,'
      ':cenazak,'
      ':cenareal,'
      ':kolvo,'
      ':data,'
      ':nomrash,'
      ':part'
      ')')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000008000000040000003A504C5503000000000000000000000004000000
      3A4E4F4D030000000000000000000000080000003A43454E415A414B04000000
      0000000000000000090000003A43454E415245414C0400000000000000000000
      00060000003A4B4F4C564F040000000000000000000000050000003A44415441
      0C0000000000000000000000080000003A4E4F4D524153480300000000000000
      00000000050000003A50415254030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 512
    Top = 256
  end
  object QselPart: TOracleQuery
    SQL.Strings = (
      'select nvl(sum(kolvo),0) kolvo'
      'from tmp.Tpart'
      'where plu=:plu'
      'and part=:nom'
      'and data>:data')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C5503000000000000000000000004000000
      3A4E4F4D030000000000000000000000050000003A444154410C000000000000
      0000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 512
    Top = 304
  end
  object QselRashod: TOracleQuery
    SQL.Strings = (
      'select p.nom,'
      'sum(p.kolvo) kolvo,'
      'p.part partia,'
      'p.cenazak cena'
      ''
      'from tmp.tpart p'
      'where p.plu=:plu'
      'and p.nomrash=:rash'
      'group by  p.nom,'
      #9'p.part ,'
      #9'p.cenazak ')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C550300000004000000D001000000000000
      050000003A524153480300000004000000DB1B000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 376
    Top = 352
  end
  object qFullj: TOracleDataSet
    SQL.Strings = (
      'select '
      'tip,'
      'reg,'
      'nn,'
      'time,'
      'data,'
      'name,'
      'sklad,'
      'prim,'
      'sum,'
      'nom,'
      'part,'
      'd,'
      'owner'
      'From tmp.vfulljourn'
      '--where data between :begin and :end'
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
      030000000D000000030000005245470100000000020000004E4E010000000004
      00000054494D45010000000004000000444154410100000000040000004E414D
      45010000000005000000534B4C41440100000000040000005052494D01000000
      000300000053554D0100000000030000004E4F4D010000000004000000504152
      5401000000000300000054495001000000000100000044010000000005000000
      4F574E45520100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 160
    Top = 448
    object qFulljTIP: TStringField
      DisplayWidth = 15
      FieldName = 'TIP'
      Size = 10
    end
    object qFulljREG: TFloatField
      FieldName = 'REG'
    end
    object qFulljNN: TFloatField
      FieldName = 'NN'
    end
    object qFulljTIME: TStringField
      FieldName = 'TIME'
      Size = 5
    end
    object qFulljDATA: TStringField
      FieldName = 'DATA'
      Size = 9
    end
    object qFulljNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object qFulljSKLAD: TStringField
      FieldName = 'SKLAD'
      Size = 50
    end
    object qFulljPRIM: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
    object qFulljSUM: TFloatField
      FieldName = 'SUM'
      currency = True
    end
    object qFulljNOM: TFloatField
      FieldName = 'NOM'
    end
    object qFulljPART: TFloatField
      FieldName = 'PART'
    end
    object qFulljD: TDateTimeField
      FieldName = 'D'
    end
    object qFulljOWNER: TStringField
      FieldName = 'OWNER'
      Size = 15
    end
  end
  object fulljds: TDataSource
    DataSet = qFullj
    Left = 200
    Top = 448
  end
  object QInsertPerem: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tperemnakl'
      '('
      'nn,'
      'id,'
      'data,'
      'nom,'
      'plu,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'skladin,'
      'skladout'
      ')'
      'select nn,'
      'id,'
      'data,'
      ':nom,'
      'plu,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      ':skladin,'
      ':skladout'
      ''
      'from tnakltemp'
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A534B4C4144494E030000000000000000000000
      090000003A534B4C41444F5554030000000000000000000000040000003A4E4F
      4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 448
    Top = 408
  end
  object QinsperJ: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tperemj'
      '('
      'nn,'
      'data,'
      'nom,'
      'prim,'
      'skladin,'
      'skladout'
      ')'
      'values'
      '('
      ':nn,'
      ':data,'
      ':nom,'
      ':prim,'
      ':skladin,'
      ':skladout'
      ')')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000006000000030000003A4E4E030000000000000000000000050000003A
      444154410C0000000000000000000000040000003A4E4F4D0300000000000000
      00000000050000003A5052494D050000000000000000000000080000003A534B
      4C4144494E030000000000000000000000090000003A534B4C41444F55540300
      00000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 520
    Top = 408
  end
  object Qperemj: TOracleDataSet
    SQL.Strings = (
      'select nn,'
      'reg,'
      #39#1055#1077#1088'.'#1085#1072#1082#1083'.'#39' tip,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      'i.sklad name,'
      'skladout skladout,'
      'o.sklad sklad,'
      'skladin skladin,'
      'prim,sum,'
      'nom,'
      'owner,data d'
      'from tmp.tperemj,tmp.tsklad i,tmp.tsklad o'
      'where i.skladid=skladout and'
      'o.skladid=skladin'
      'and data between :begin and :end'
      'order by d')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A424547494E0C00000000000000000000000400
      00003A454E440C0000000000000000000000}
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
      030000000E000000020000004E4E010000000003000000524547010000000003
      00000054495001000000000400000054494D4501000000000400000044415441
      0100000000040000004E414D45010000000005000000534B4C41440100000000
      07000000534B4C4144494E0100000000040000005052494D0100000000030000
      0053554D0100000000030000004E4F4D010000000008000000534B4C41444F55
      540100000000050000004F574E4552010000000001000000440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = QprihjBeforeOpen
    Left = 160
    Top = 496
    object QperemjNN: TIntegerField
      FieldName = 'NN'
      Required = True
    end
    object QperemjREG: TIntegerField
      FieldName = 'REG'
      Required = True
    end
    object QperemjTIP: TStringField
      FieldName = 'TIP'
      Size = 9
    end
    object QperemjTIME: TStringField
      FieldName = 'TIME'
      Required = True
      Size = 5
    end
    object QperemjDATA: TStringField
      FieldName = 'DATA'
      Required = True
      Size = 9
    end
    object QperemjNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object QperemjSKLAD: TStringField
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object QperemjPRIM: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
    object QperemjSUM: TFloatField
      FieldName = 'SUM'
      Required = True
      currency = True
    end
    object QperemjNOM: TFloatField
      FieldName = 'NOM'
      Required = True
    end
    object QperemjSKLADOUT: TIntegerField
      FieldName = 'SKLADOUT'
      Required = True
    end
    object QperemjD: TDateTimeField
      FieldName = 'D'
      Visible = False
    end
    object QperemjOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 15
    end
    object QperemjSKLADIN: TIntegerField
      FieldName = 'SKLADIN'
      Required = True
    end
  end
  object peremjds: TDataSource
    DataSet = Qperemj
    Left = 200
    Top = 496
  end
  object QinsperTemp: TOracleQuery
    SQL.Strings = (
      'insert into tnakltemp'
      '('
      'nn,'
      'data,'
      'plu,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'id'
      ')'
      'select nn,'
      'data,'
      'plu,'
      'name,'
      'ed_izm,'
      'mest,'
      'kol_up,'
      'rossip,'
      'kol_vo,'
      'id'
      ''
      'from tmp.tperemnakl'
      'where nom=:nom'
      'order by id')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 376
    Top = 408
  end
  object QperemNakl: TOracleDataSet
    SQL.Strings = (
      'select * '
      'from tmp.tperemnakl'
      'where nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      030000000D000000020000004E4E010000000004000000444154410100000000
      030000004E4F4D0100000000020000004944010000000003000000504C550100
      000000040000004E414D4501000000000600000045445F495A4D010000000004
      0000004D4553540100000000060000004B4F4C5F555001000000000600000052
      4F535349500100000000060000004B4F4C5F564F010000000007000000534B4C
      4144494E010000000008000000534B4C41444F55540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 376
    Top = 464
    object QperemNaklNN: TIntegerField
      FieldName = 'NN'
      Required = True
    end
    object QperemNaklDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object QperemNaklPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QperemNaklNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QperemNaklED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object QperemNaklMEST: TIntegerField
      FieldName = 'MEST'
      Required = True
    end
    object QperemNaklKOL_UP: TFloatField
      FieldName = 'KOL_UP'
      Required = True
    end
    object QperemNaklROSSIP: TFloatField
      FieldName = 'ROSSIP'
      Required = True
    end
    object QperemNaklKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
  end
  object QtipNakl: TOracleQuery
    SQL.Strings = (
      'select tip'
      'from tmp.tipnakl '
      'where nom=:nom')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 264
    Top = 440
  end
  object SelPrihod: TOracleDataSet
    SQL.Strings = (
      'select  '
      'p.plu,'
      'p.kol_vo,'
      'p.cenareal,'
      'p.cenasnds,p.life,'
      'j.part,'
      'j.data,'
      'j.skladid'
      'from tmp.tprihnakl p,tmp.tprihj j'
      ''
      'where j.nom=:nom'
      'and p.nom=j.nom'
      'and p.kol_vo>0'
      'order by p.id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      030000000800000004000000444154410100000000060000004B4F4C5F564F01
      000000000800000043454E415245414C010000000003000000504C5501000000
      000400000050415254010000000007000000534B4C4144494401000000000800
      000043454E41534E44530100000000040000004C4946450100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 400
    Top = 16
    object SelPrihodPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object SelPrihodKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object SelPrihodCENAREAL: TFloatField
      FieldName = 'CENAREAL'
      Required = True
    end
    object SelPrihodPART: TFloatField
      FieldName = 'PART'
      Required = True
    end
    object SelPrihodDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object SelPrihodSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
    end
    object SelPrihodCENASNDS: TFloatField
      FieldName = 'CENASNDS'
      Required = True
    end
    object SelPrihodLIFE: TDateTimeField
      FieldName = 'LIFE'
    end
  end
  object SelRashod: TOracleDataSet
    SQL.Strings = (
      'select  '
      'p.plu,'
      'p.kol_vo,'
      'p.cenasnds cena,'
      'j.data,'
      'j.skladid'
      'from tmp.trashnakl p,tmp.trashj j'
      ''
      'where j.nom=:nom'
      'and p.nom=j.nom'
      'and p.kol_vo>0')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      030000000500000003000000504C550100000000060000004B4F4C5F564F0100
      0000000400000043454E41010000000004000000444154410100000000070000
      00534B4C414449440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 456
    Top = 16
    object SelRashodPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object SelRashodKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object SelRashodCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object SelRashodDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object SelRashodSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
    end
  end
  object SelPerem: TOracleDataSet
    SQL.Strings = (
      'select  '
      'p.plu,'
      'sum(p.kol_vo) kol_vo,'
      'j.data,'
      'j.skladin,'
      'j.skladout'
      'from tmp.tperemnakl p,tmp.tperemj j'
      ''
      'where j.nom=:nom'
      'and p.nom=j.nom'
      'group by p.plu,'
      #9'j.data,'
      #9'j.skladin,'
      #9'j.skladout')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      030000000500000003000000504C550100000000060000004B4F4C5F564F0100
      0000000400000044415441010000000007000000534B4C4144494E0100000000
      08000000534B4C41444F55540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 520
    Top = 16
    object SelPeremPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object SelPeremKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object SelPeremDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object SelPeremSKLADIN: TIntegerField
      FieldName = 'SKLADIN'
      Required = True
    end
    object SelPeremSKLADOUT: TIntegerField
      FieldName = 'SKLADOUT'
      Required = True
    end
  end
  object GetOst: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(partost),0) ostatok'
      'from tmp.kniga'
      'where plu=:plu'
      'and data<=:data'
      'and otkat=0'
      'and skladid=:sklad'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C5503000000000000000000000005000000
      3A444154410C0000000000000000000000060000003A534B4C41440300000000
      00000000000000}
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
    QBEDefinition.QBEFieldDefs = {0300000001000000070000004F535441544F4B0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 592
    Top = 208
    object GetOstOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
  end
  object QSelDoc: TOracleDataSet
    SQL.Strings = (
      'select distinct p.nomrash nom,'
      'nvl(kj.doc,nvl(sj.nom,nvl(rj.nn,pj.nn))) doc,'
      'to_char(p.data,'#39'dd.mon.yyyy'#39') data'
      ''
      
        'from tmp.tpart p,tmp.trashj rj,tmp.tperemj pj,tmp.tskladj sj,tmp' +
        '.kkmj kj'
      'where p.nom=:nom'
      'and rj.nom(+)=p.nomrash'
      'and pj.nom(+)=p.nomrash'
      'and sj.nom(+)=p.nomrash'
      'and kj.doc(+)=p.nomrash')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      0300000003000000030000004E4F4D010000000003000000444F430100000000
      04000000444154410100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 400
    Top = 72
  end
  object GetFullOst: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(partost),0) ostatok'
      'from tmp.kniga'
      'where plu=:plu'
      'and otkat=0')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000003B00000000000000}
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
    QBEDefinition.QBEFieldDefs = {0300000001000000070000004F535441544F4B0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 592
    Top = 256
    object GetFullOstOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
  end
  object qTipKontr: TOracleDataSet
    SQL.Strings = (
      'select'
      'tip,'
      'name,'
      'rowid'
      'from tmp.kontrtip'
      'order by tip')
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
      0300000002000000030000005449500100000000040000004E414D4501000000
      00}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 72
    Top = 208
    object qTipKontrTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
    end
    object qTipKontrNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object qMaxtip: TOracleQuery
    SQL.Strings = (
      'select nvl(max(tip),0) tip  from tmp.kontrtip')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 72
    Top = 256
  end
  object QBalans: TOracleDataSet
    SQL.Strings = (
      'select '
      'name,'
      'nom,'
      'data,'
      'sum(rashod) rashod,'
      'sum(prihod) prihod,'
      'sum(prihod)-sum(rashod) dolg '
      ',tip'
      'from tmp.vbalans'
      'group by cod,name,nom,data,tip'
      'order by name,data')
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
      0300000007000000040000004E414D450100000000030000004E4F4D01000000
      000400000044415441010000000006000000524153484F440100000000060000
      00505249484F44010000000004000000444F4C47010000000003000000544950
      0100000000}
    Cursor = crDefault
    AutoCalcFields = False
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 464
    Top = 80
    object QBalansNOM: TFloatField
      FieldName = 'NOM'
    end
    object QBalansNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object QBalansDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QBalansRASHOD: TFloatField
      FieldName = 'RASHOD'
      currency = True
    end
    object QBalansPRIHOD: TFloatField
      FieldName = 'PRIHOD'
      currency = True
    end
    object QBalansDOLG: TFloatField
      FieldName = 'DOLG'
      currency = True
    end
    object QBalansTIP: TStringField
      FieldName = 'TIP'
      Size = 10
    end
  end
  object BalDS: TDataSource
    DataSet = QBalans
    Left = 504
    Top = 75
  end
  object Qselfrec: TOracleDataSet
    SQL.Strings = (
      'select s.*,user,'
      's.rowid'
      'from tmp.tselfrec s')
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
      0300000011000000040000004E414D4501000000000600000059525F41445201
      000000000800000046414B545F41445201000000000300000054454C01000000
      00070000005241535F5343480100000000060000004E5F42414E4B0100000000
      070000004B4F525F53434801000000000300000042494B010000000004000000
      43495459010000000003000000494E4E0100000000050000004F4B4F4E580100
      000000040000004F4B504F010000000008000000444154455F5A415001000000
      0008000000444952454B544F5201000000000900000042554847414C54455201
      00000000060000004B4153534952010000000007000000504F4452415A440100
      000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterInsert = QselfrecAfterEdit
    AfterEdit = QselfrecAfterEdit
    AfterPost = QnakltempAfterPost
    Left = 72
    Top = 304
  end
  object selfds: TDataSource
    DataSet = Qselfrec
    Left = 112
    Top = 304
  end
  object qInsKas: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tkassa '
      'values ('
      ':nom,'
      ':data,'
      ':kontragent,'
      ':osnov,'
      ':sum,'
      ':doc,'
      ':nds,'
      ':nsp,'
      ':tip,'
      ':prim,'
      ':reg,'
      'user'
      ')'
      ''
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      030000000B000000040000003A4E4F4D03000000000000000000000005000000
      3A444154410C00000000000000000000000B0000003A4B4F4E54524147454E54
      030000000000000000000000060000003A4F534E4F5605000000000000000000
      0000040000003A53554D040000000000000000000000040000003A444F430300
      00000000000000000000040000003A4E44530400000000000000000000000400
      00003A4E5350040000000000000000000000040000003A544950030000000000
      000000000000050000003A5052494D050000000000000000000000040000003A
      524547030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 64
    Top = 452
  end
  object qkassorder: TOracleDataSet
    SQL.Strings = (
      'select k.*,'
      'p.name,'
      'j.nn nn,'
      'j.data d,'
      'k.rowid'
      'from tmp.tkassa k,tmp.tpostav p,tmp.vfulljourn j'
      'where  p.cod=k.kontragent'
      'and j.nom(+)=k.doc'
      'and k.nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 64
    Top = 408
  end
  object kassds: TDataSource
    DataSet = qkassorder
    Left = 112
    Top = 408
  end
  object qkassjourn: TOracleDataSet
    SQL.Strings = (
      'select * '
      'from tmp.kassjourn'
      'order by data')
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
      030000000B000000030000005245470100000000030000005449500100000000
      03000000434F440100000000040000004E414D450100000000030000004E4F4D
      010000000004000000444154410100000000050000004F534E4F560100000000
      06000000505249484F44010000000006000000524153484F4401000000000300
      000053554D0100000000040000005052494D0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 256
    Top = 376
  end
  object KJds: TDataSource
    DataSet = qkassjourn
    Left = 296
    Top = 376
  end
  object ImageList1: TImageList
    Left = 592
    Top = 16
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BDBDBD00FFFFFF00BDBD
      BD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBD
      BD00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000BDBDBD00000000000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000BDBDBD00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000007B7B7B00000000007B7B7B00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF007B7B7B00000000007B7B7B000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000007B7B7B000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007B7B7B000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000840000000000000084000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000007B7B7B00000000007B7B7B00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF80010000FFFFFC0000000000
      FFFFFC0000000000FFFFFC0000000000FC7FFC0000000000FC7FEC0000000000
      FC7FE40000000000E00FE00000000000E00F0000E0070000E00F0001E0070000
      FC7F0003E0070000FC7F0007E0070000FC7F000FE00F0000FFFFE3FFE01F0000
      FFFFE7FFE03F0000FFFFEFFFE07F0000FFFFFFFFFFFFFFFFE007FFFFFFFFFFFF
      E007F9FFC631FFFFE007F0FFE223FFFFE007F0FFF007FFFFE007E07FF88FFFFF
      E007C07FFC1FFFFFE007843FFE3FE007E0071E3FFC1FE007E007FE1FF80FE007
      E007FF1FF007FFFFE00FFF8FE223FFFFE01FFFC7C631FFFFE03FFFE3FFFFFFFF
      FFFFFFF8FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object Qinvent: TOracleDataSet
    SQL.Strings = (
      'select i.plu,'
      'k.name,'
      'i.ed_izm,'
      'i.KOL_SKLAD,'
      'i.KOL_FAKT,i.KOL_SKLAD-i.KOL_FAKT razn,'
      'i.PRICE,i.SUM_SKL,i.SUM_FAKT,i.rowid,i.nom,i.id'
      ''
      'from tmp.tinvent i,tmp.tkatalog k'
      'where i.plu=k.plu'
      'and nom=:nom'
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
      030000000B00000003000000504C550100000000040000004E414D4501000000
      000600000045445F495A4D0100000000090000004B4F4C5F534B4C4144010000
      0000080000004B4F4C5F46414B5401000000000400000052415A4E0100000000
      05000000505249434501000000000700000053554D5F534B4C01000000000800
      000053554D5F46414B540100000000030000004E4F4D01000000000200000049
      440100000000}
    Cursor = crDefault
    AutoCalcFields = False
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforePost = QinventBeforePost
    AfterPost = QinventAfterPost
    OnNewRecord = QinventNewRecord
    Left = 584
    Top = 328
    object QinventPLU: TFloatField
      FieldName = 'PLU'
    end
    object QinventNAME: TStringField
      FieldName = 'NAME'
      Size = 52
    end
    object QinventED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object QinventKOL_SKLAD: TFloatField
      FieldName = 'KOL_SKLAD'
    end
    object QinventKOL_FAKT: TFloatField
      FieldName = 'KOL_FAKT'
    end
    object QinventRAZN: TFloatField
      FieldName = 'RAZN'
    end
    object QinventPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object QinventSUM_SKL: TFloatField
      FieldName = 'SUM_SKL'
      currency = True
    end
    object QinventSUM_FAKT: TFloatField
      FieldName = 'SUM_FAKT'
      currency = True
    end
    object QinventNOM: TFloatField
      FieldName = 'NOM'
    end
    object QinventID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
  end
  object InvDS: TDataSource
    DataSet = Qinvent
    Left = 632
    Top = 328
  end
  object QskladJ: TOracleDataSet
    SQL.Strings = (
      'select j.*,j.rowid '
      'from tmp.tskladj j'
      'where nom=:nom'
      'and tip=:tip')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D03000000000000000000000004000000
      3A544950030000000000000000000000}
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
      0300000007000000030000004E4F4D0100000000030000005449500100000000
      07000000534B4C41444944010000000004000000444154410100000000050000
      004F534E4F560100000000070000004B4F4D4D454E5401000000000300000052
      45470100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterPost = QnakltempAfterPost
    Left = 584
    Top = 384
  end
  object SkladJds: TDataSource
    DataSet = QskladJ
    Left = 632
    Top = 384
  end
  object QsafeInv: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tskladj values('
      ':nom,'
      ':tip,'
      ':skladid,'
      ':data,'
      ':osnov,'
      ':komment,'
      ':reg,'
      ':sum,'
      ':part,'
      ':owner'
      ')')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      030000000A000000040000003A4E4F4D03000000000000000000000004000000
      3A544950030000000000000000000000080000003A534B4C4144494403000000
      0000000000000000050000003A444154410C0000000000000000000000060000
      003A4F534E4F56030000000000000000000000080000003A4B4F4D4D454E5405
      0000000000000000000000040000003A52454703000000040000000000000000
      000000040000003A53554D040000000000000000000000050000003A50415254
      03000000040000000000000000000000060000003A4F574E4552050000000200
      00002D0000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 592
    Top = 160
  end
  object QfsklJ: TOracleDataSet
    SQL.Strings = (
      'select '
      #39#1048#1085#1074#1077#1085#1090#1072#1088'.'#39' tip,'
      'reg,'
      'nom nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      #39'-'#39' name,'
      'sklad,'
      'komment prim,'
      'sum,'
      'nom,'
      'part'
      '--,owner'
      ',data d'
      ',owner'
      ''
      'from tmp.tskladj p,tmp.tsklad t'
      'where t.skladid=p.skladid '
      'and tip=1'
      'and p.data between :begin and :end'
      ''
      'union all'
      ''
      'select '
      #39#1057#1087#1080#1089#1072#1085#1080#1077'.'#39' tip,'
      'reg,'
      'nom nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      #39'-'#39' name,'
      'sklad,'
      'komment prim,'
      'sum,'
      'nom,'
      'part'
      '--,owner'
      ',data d,owner'
      'from tmp.tskladj p,tmp.tsklad t'
      'where t.skladid=p.skladid '
      'and tip=2'
      'and p.data between :begin and :end'
      ''
      'union all'
      ''
      'select '
      #39#1055#1088#1080#1077#1084'.'#39' tip,'
      'reg,'
      'nom nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      #39'-'#39' name,'
      'sklad,'
      'komment prim,'
      'sum,'
      'nom,'
      'part'
      '--,owner'
      ',data d,owner'
      'from tmp.tskladj p,tmp.tsklad t'
      'where t.skladid=p.skladid '
      'and tip=3'
      'and p.data between :begin and :end'
      'union all'
      'select '
      #39#1055#1077#1088#1077#1089#1086#1088#1090'.'#39' tip,'
      'reg,'
      'nom nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      #39'-'#39' name,'
      'sklad,'
      'komment prim,'
      'sum,'
      'nom,'
      '0 part'
      '--,owner'
      ',data d,owner'
      'from tmp.tminusj p,tmp.tsklad t'
      'where t.skladid=p.skladid '
      'and p.data between :begin and :end'
      'order by d')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A424547494E0C00000000000000000000000400
      00003A454E440C0000000000000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = QprihjBeforeOpen
    Left = 584
    Top = 440
  end
  object Fsklds: TDataSource
    DataSet = QfsklJ
    Left = 632
    Top = 440
  end
  object Qtmc: TOracleDataSet
    SQL.Strings = (
      'select i.plu,'
      'nvl(k.name,'#39'?'#39')  name,'
      'i.ed_izm,'
      'i.KOL_FAKT,'
      'i.price,'
      'i.SUM_FAKT,'
      'i.rowid,'
      'i.nom,'
      'k.nal'
      ''
      'from tmp.tinvent i,tmp.tkatalog k'
      'where i.plu=k.plu(+)'
      'and nom=:nom'
      'order by id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      000600000045445F495A4D0100000000030000004E4F4D010000000008000000
      4B4F4C5F46414B54010000000005000000505249434501000000000800000053
      554D5F46414B540100000000030000004E414C0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforePost = QtmcBeforePost
    AfterPost = QtmcAfterPost
    OnNewRecord = QtmcNewRecord
    Left = 688
    Top = 328
    object QtmcPLU: TFloatField
      FieldName = 'PLU'
    end
    object QtmcNAME: TStringField
      FieldName = 'NAME'
      Size = 52
    end
    object QtmcED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object QtmcKOL_FAKT: TFloatField
      FieldName = 'KOL_FAKT'
    end
    object QtmcNOM: TFloatField
      FieldName = 'NOM'
    end
    object QtmcPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object QtmcSUM_FAKT: TFloatField
      FieldName = 'SUM_FAKT'
    end
    object QtmcNAL: TFloatField
      FieldName = 'NAL'
    end
  end
  object tmzDS: TDataSource
    DataSet = Qtmc
    Left = 736
    Top = 328
  end
  object QtmzJ: TOracleDataSet
    SQL.Strings = (
      'select j.*,'
      'concat(v.tip||'#39' '#8470' '#39',to_char(v.nn))  osdoc,s.name ip,'
      'j.rowid '
      'from tmp.tskladj j,tmp.vfulljourn v,tmp.tsklad s'
      'where j.nom=:nom'
      'and j.tip=:tip'
      'and v.nom(+)=j.osnov'
      'and s.skladid=j.skladid')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D03000000040000007D0B000000000000
      040000003A54495003000000040000000200000000000000}
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
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterPost = QnakltempAfterPost
    Left = 688
    Top = 384
  end
  object TMZJDS: TDataSource
    DataSet = QtmzJ
    Left = 728
    Top = 384
  end
  object SelSpisanie: TOracleDataSet
    SQL.Strings = (
      'select  '
      'p.plu,'
      'p.kol_fakt KOL_VO,'
      'p.price cena,'
      'j.data,'
      'j.skladid,'
      'j.part'
      'from tmp.tinvent p,tmp.tskladj j'
      ''
      'where j.nom=:nom'
      'and p.nom=j.nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      030000000600000003000000504C5501000000000400000043454E4101000000
      000400000044415441010000000007000000534B4C4144494401000000000600
      00004B4F4C5F564F010000000004000000504152540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 656
    Top = 16
    object SelSpisaniePLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object SelSpisanieCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object SelSpisanieDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object SelSpisanieSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
    end
    object SelSpisanieKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object SelSpisaniePART: TFloatField
      FieldName = 'PART'
      Required = True
    end
  end
  object QsumOst: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(partost*cena),0) sum  '
      ''
      'from TMP.kniga '
      'where otkat=0'
      'and partost<>0'
      'AND SKLADID=:sklad'
      'and data <=  :end')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A534B4C41440300000000000000000000000400
      00003A454E440C0000000000000000000000}
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
    QBEDefinition.QBEFieldDefs = {03000000010000000300000053554D0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforeOpen = QsumOstBeforeOpen
    Left = 656
    Top = 208
    object QsumOstSUM: TFloatField
      FieldName = 'SUM'
      Required = True
      currency = True
    end
  end
  object Qpricej: TOracleDataSet
    SQL.Strings = (
      'select p.*,p.rowid'
      'from tmp.tpricej p'
      'where nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterPost = QnakltempAfterPost
    Left = 584
    Top = 488
  end
  object prJds: TDataSource
    DataSet = Qpricej
    Left = 632
    Top = 488
  end
  object Qprice: TOracleDataSet
    SQL.Strings = (
      'select'
      'p.plu, '
      'p.oldprice,'
      'p.newprice,'
      'p.kolvo,'
      'p.sum,'
      'p.nom,'
      't.name name,'
      'p.osn,'
      '-- nvl(max(k.cena),t.price)  max_cena,'
      'p.rowid'
      'from tmp.tprice p,'
      'tmp.tkatalog t --,tmp.kniga k'
      'where p.plu=t.plu'
      'and p.nom=:nom'
      '-- and k.partost>0'
      '-- and k.cena>0'
      '-- and k.plu(+)=p.plu'
      'group by '
      'p.plu, '
      'p.oldprice,'
      'p.newprice,'
      'p.kolvo,'
      'p.sum,'
      'p.nom,'
      't.name,'
      'p.osn,p.rowid,p.id,t.price'
      'order by p.id'
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000000300000000000000}
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
      0300000009000000080000004F4C4450524943450100000000080000004E4557
      50524943450100000000050000004B4F4C564F01000000000300000053554D01
      00000000040000004E414D45010000000003000000504C550100000000030000
      004E4F4D0100000000030000004F534E0100000000080000004D41585F43454E
      410100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    BeforePost = QpriceBeforePost
    OnNewRecord = QpriceNewRecord
    Left = 688
    Top = 488
    object QpricePLU: TFloatField
      FieldName = 'PLU'
    end
    object QpriceNOM: TFloatField
      FieldName = 'NOM'
    end
    object QpriceNAME: TStringField
      FieldName = 'NAME'
      Size = 52
    end
    object QpriceOLDPRICE: TFloatField
      FieldName = 'OLDPRICE'
      currency = True
    end
    object QpriceNEWPRICE: TFloatField
      FieldName = 'NEWPRICE'
      currency = True
    end
    object QpriceKOLVO: TFloatField
      FieldName = 'KOLVO'
    end
    object QpriceSUM: TFloatField
      FieldName = 'SUM'
      currency = True
    end
    object QpriceOSN: TFloatField
      FieldName = 'OSN'
    end
  end
  object prDS: TDataSource
    DataSet = Qprice
    Left = 736
    Top = 488
  end
  object Qsafeprice: TOracleQuery
    SQL.Strings = (
      'insert into tmp.tpricej'
      'values('
      ':nom,'
      ':data,'
      ':sum,'
      #39'-'#39','
      ':komment,'
      '0)')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000004000000040000003A4E4F4D03000000000000000000000005000000
      3A444154410C0000000000000000000000040000003A53554D04000000000000
      0000000000080000003A4B4F4D4D454E54050000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 664
    Top = 168
  end
  object InsertAll: TOracleQuery
    SQL.Strings = (
      'insert into pos.tovar (plu,'
      'barcode,'
      'name,'
      'ecrname,'
      'price,'
      'quantity,'
      'shtuka,'
      'life,'
      'parentplu,'
      'sortfield)'
      'select t.plu,'
      'nvl(min(b.barcode),0),'
      't.name,'
      't.ecrname,'
      't.price,'
      
        '(select nvl(sum(k.sum),0) from tmp.kniga k where  k.otkat=0 and ' +
        'k.plu=t.plu having sum(k.sum)>0),'
      't.shtuka,'
      't.life,'
      '0,'
      '1'
      ' from tmp.tkatalog t,tmp.tbarcode b'
      'where t.plu=b.plu(+)'
      ' and t.export=1'
      ' and t.plu>0'
      
        'and (select nvl(sum(k.sum),0) from tmp.kniga k where  k.otkat=0 ' +
        'and k.plu=t.plu having sum(k.sum)>0)>0'
      'group by'
      't.plu,'
      't.name,'
      't.ecrname,'
      't.price,'
      't.shtuka,'
      't.life,'
      '0, '
      '1')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 592
    Top = 72
  end
  object QinsertPlu: TOracleQuery
    SQL.Strings = (
      'insert into pos.tovar (plu,'
      'barcode,'
      'name,'
      'ecrname,'
      'price,'
      'quantity,'
      'shtuka,'
      'life,'
      'parentplu,'
      'sortfield)'
      'select TO_CHAR(3E12+t.plu) PLU,'
      '0,'
      't.name,'
      't.ecrname,'
      't.price,'
      
        '(select nvl(sum(sum),0) from tmp.kniga where  otkat=0 and plu=:p' +
        'lu)'
      ','
      't.shtuka,'
      't.life,'
      '0,  ---t.proizw+t.kat*1e8,'
      '1  --3'
      'from tmp.tkatalog t'
      'where  t.plu=:plu')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A504C55030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 664
    Top = 72
  end
  object insprint: TOracleQuery
    SQL.Strings = (
      'insert into tmp.printbar '
      'values (:name,'
      ':price,'
      ':barcode,'
      ':kod,'
      ':COL_N,'
      ':ROW_N,'
      ':stroka1,'
      ':stroka2,'
      ':stroka3,'
      ':stroka4)')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      030000000A000000050000003A4E414D45050000000000000000000000060000
      003A5052494345050000000000000000000000080000003A424152434F444505
      0000000000000000000000040000003A4B4F4405000000000000000000000006
      0000003A434F4C5F4E030000000000000000000000060000003A524F575F4E03
      0000000000000000000000080000003A5354524F4B4131050000000000000000
      000000080000003A5354524F4B4132050000000000000000000000080000003A
      5354524F4B4133050000000000000000000000080000003A5354524F4B413405
      0000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 440
    Top = 464
  end
  object showcennik: TOracleDataSet
    SQL.Strings = (
      'select'
      'p.name,'
      'k.price,'
      'b.barcode,'
      'b.cennik,'
      'p.shtuka,'
      'p.plu,'
      'p.ed_izm'
      'from tmp.tkatalog p,tmp.tbarcode b,pos.tovar k'
      'where b.plu=p.plu '
      'and k.plu=p.plu'
      'and export=1'
      '--order by name')
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
      0300000007000000040000004E414D4501000000000500000050524943450100
      00000007000000424152434F4445010000000006000000534854554B41010000
      000003000000504C5501000000000600000045445F495A4D0100000000060000
      0043454E4E494B0100000000}
    Cursor = crDefault
    AutoCalcFields = False
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    FilterOptions = [foCaseInsensitive]
    Left = 440
    Top = 520
    object showcennikPLU: TFloatField
      DisplayLabel = #1082#1086#1076
      DisplayWidth = 7
      FieldName = 'PLU'
      Required = True
    end
    object showcennikNAME: TStringField
      DisplayLabel = #1090#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object showcennikPRICE: TFloatField
      DisplayLabel = #1094#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'PRICE'
      currency = True
    end
    object showcennikCENNIK: TStringField
      DisplayLabel = #1094#1077#1085#1085#1080#1082
      FieldName = 'CENNIK'
      Size = 26
    end
    object showcennikBARCODE: TStringField
      DisplayLabel = #1096#1090#1088#1080#1093#1082#1086#1076
      FieldName = 'BARCODE'
      Required = True
      Size = 13
    end
    object showcennikSHTUKA: TIntegerField
      DisplayLabel = #1064#1090#1091#1095#1085'?'
      FieldName = 'SHTUKA'
      Required = True
    end
    object showcennikED_IZM: TStringField
      DisplayLabel = #1077#1076'.'#1080#1079#1084
      FieldName = 'ED_IZM'
      Size = 5
    end
  end
  object DS15: TDataSource
    DataSet = showcennik
    Left = 504
    Top = 520
  end
  object qSelReport: TOracleDataSet
    SQL.Strings = (
      'select distinct  '
      'id,'
      'plu,'
      'quantity,'
      'sum,'
      'num,chek,data'
      'from pos.arc_report'
      'where '
      'kassa=:kassa'
      '--and stornoflag<>998'
      'and to_char(data,'#39'dd.mm.yyyy'#39')=to_char(:data,'#39'dd.mm.yyyy'#39')'
      'order by num--,chek')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A4B415353410300000004000000060000000000
      0000050000003A444154410C0000000700000078680C0101010100000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 728
    Top = 16
  end
  object QInsReport: TOracleQuery
    SQL.Strings = (
      'insert into tnakltemp'
      '('
      'data,'
      'plu,'
      'name,'
      'ed_izm,'
      'rossip,'
      'kol_vo,'
      'cenabnds,'
      'cenasnds,'
      'cenareal,'
      'total,'
      'id,'
      'nn,'
      'skladid,'
      'post'
      ')'
      'select '
      ':data,'
      ':plu,'
      'nvl(name,'#39'?'#39'),'
      'nvl(ed_izm,'#39#1096#1090'.'#39'),'
      ':kol_vo,'
      'nal,'
      'round(:total/:kol_vo,2),'
      'round(:total/:kol_vo,2),'
      'nvl(price,0),'
      ':total,'
      'TMP.TEMPSEQ.NEXTVAL,'
      ':nn,'
      ':sklad,'
      ':post'
      'from tmp.tkatalog'
      'where plu=:plu'
      '--and nal>0'
      ''
      ''
      ''
      '')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000007000000050000003A444154410C0000000000000000000000040000
      003A504C55030000000000000000000000070000003A4B4F4C5F564F04000000
      0000000000000000060000003A544F54414C0400000000000000000000000300
      00003A4E4E030000000000000000000000060000003A534B4C41440300000000
      00000000000000050000003A504F5354030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 736
    Top = 72
  end
  object Logon: TOracleLogon
    Session = OraBase
    Retries = 3
    Options = [ldAuto, ldDatabase, ldDatabaseList]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '
    Left = 16
    Top = 64
  end
  object tplu: TOracleDataSet
    SQL.Strings = (
      'select plu'
      'from pos.tovar'
      'union'
      'select to_char(icode) plu'
      'from pos.caslp'
      '')
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
    QBEDefinition.QBEFieldDefs = {030000000100000003000000504C550100000000}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 312
    Top = 8
  end
  object QfindPost: TOracleDataSet
    SQL.Strings = (
      'select distinct  t.plu,t.name '
      'from tmp.tprihnakl t'
      'where t.post=:post'
      'order by t.name')
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
      030000000200000003000000504C550100000000040000004E414D4501000000
      00}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 736
    Top = 168
    object QfindPostPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
  end
  object InsertKat: TOracleQuery
    SQL.Strings = (
      'insert into pos.tovar (plu,'
      'barcode,'
      'name,'
      'ecrname,'
      'price,'
      'quantity,'
      'shtuka,'
      'life,'
      'parentplu,'
      'sortfield,'
      'isgoods)'
      'select distinct t.proizw+1e8*:kat,'
      '0,'
      'p.name,'
      #39'-'#39','
      '0,'
      '0,'
      '0,'
      '0,'
      ':kat*1e9,'
      '2,'
      #39'K'#39
      'from tmp.tkatalog t,tmp.tproizw p'
      'where p.proizw=t.proizw'
      'and t.kat=:kat'
      'and t.proizw>0'
      'and t.kat>0'
      'and p.name is not null')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4B4154030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 592
    Top = 120
  end
  object UpdateKat: TOracleQuery
    SQL.Strings = (
      'insert into pos.tovar (plu,'
      'barcode,'
      'name,'
      'ecrname,'
      'price,'
      'quantity,'
      'shtuka,'
      'life,'
      'parentplu,'
      'sortfield,'
      'isgoods)'
      'select TO_CHAR(3E12+t.kat*1e9) PLU,'
      '0,'
      't.name,'
      #39'-'#39','
      '0,'
      '0,'
      '0,'
      '0,'
      '0,'
      '1,'
      #39'K'#39
      'from tmp.tkat t'
      'where t.kat=:kat'
      'and t.kat<>0')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4B4154030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 664
    Top = 120
  end
  object UpdateKat2: TOracleQuery
    SQL.Strings = (
      'insert into pos.tovar (plu,'
      'barcode,'
      'name,'
      'ecrname,'
      'price,'
      'quantity,'
      'shtuka,'
      'life,'
      'parentplu,'
      'sortfield,'
      'isgoods)'
      'select TO_CHAR(3E12+:kat*1e8+t.proizw) PLU,'
      '0,'
      't.name,'
      #39'-'#39','
      '0,'
      '0,'
      '0,'
      '0,'
      ':kat*1e9,'
      '2,'
      #39'K'#39
      'from tmp.tproizw t'
      'where t.proizw=:proizw'
      'and t.proizw<>0'
      'and t.name is not null')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4B415403000000000000000000000007000000
      3A50524F495A57030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 736
    Top = 120
  end
  object SelPlu: TOracleDataSet
    SQL.Strings = (
      'select plu from pos.tovar'
      'where plu=:plu')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A504C55050000000000000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 728
    Top = 216
  end
  object DeletePlu: TOracleQuery
    SQL.Strings = (
      'delete from pos.tovar where plu=:plu')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 656
    Top = 264
  end
  object qPEROZj: TOracleDataSet
    SQL.Strings = (
      'select '
      #39#1055#1077#1088#1077#1086#1094'.'#39' tip,'
      'reg,'
      'nom nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      #39'-'#39'  name,'
      #39'-'#39' sklad,'
      'komment prim,'
      'p.sum,nom,'
      '0 part,p.data d'
      ',owner'
      'from tmp.tpricej p'
      'where'
      
        ' p.data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toptions ' +
        'where parametr='#39'begin'#39')'
      
        'and p.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'end'#39') '
      ''
      'union all'
      ''
      'select '
      #39#1040#1082#1090' '#1055#1077#1088#1077#1086#1094'.'#39' tip,'
      'reg,'
      'nom nn,'
      'to_char(data,'#39'hh24:mi'#39') time,'
      'to_char(data,'#39'dd.mon.yy'#39') data,'
      #39'-'#39'  name,'
      's.sklad,'
      'komment prim,'
      'p.sum,nom,'
      '0 part,p.data d'
      ',owner'
      'from tmp.actpricej p,tmp.tsklad s'
      'where'
      's.skladid=p.skladid'
      
        'and  p.data >=(select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and p.data<=(select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yy' +
        'yy'#39') from tmp.toptions where parametr='#39'end'#39')'
      ''
      ''
      ''
      ''
      'ORDER BY d')
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
      030000000D000000030000005245470100000000020000004E4E010000000004
      00000054494D45010000000004000000444154410100000000040000004E414D
      45010000000005000000534B4C41440100000000040000005052494D01000000
      000300000053554D0100000000030000004E4F4D010000000004000000504152
      5401000000000300000054495001000000000100000044010000000005000000
      4F574E45520100000000}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 160
    Top = 304
    object StringField7: TStringField
      FieldName = 'TIP'
      Size = 10
    end
    object qPEROZjREG: TFloatField
      FieldName = 'REG'
    end
    object qPEROZjNN: TFloatField
      FieldName = 'NN'
      Required = True
    end
    object StringField8: TStringField
      FieldName = 'TIME'
      Required = True
      Size = 5
    end
    object StringField9: TStringField
      FieldName = 'DATA'
      Required = True
      Size = 9
    end
    object StringField10: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object StringField12: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
    object FloatField4: TFloatField
      FieldName = 'SUM'
      Required = True
      currency = True
    end
    object FloatField5: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'PART'
      Required = True
      Visible = False
    end
    object qPEROZjD: TDateTimeField
      FieldName = 'D'
      Visible = False
    end
    object StringField13: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 15
    end
  end
  object perds: TDataSource
    DataSet = qPEROZj
    Left = 208
    Top = 304
  end
  object SelUser: TOracleDataSet
    SQL.Strings = (
      'select '
      'count(1) kolvo,'
      'trim(USERNAME) usr'
      ' from gv$session'
      'group by username ')
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 16
    Top = 120
  end
  object QselDouble: TOracleDataSet
    SQL.Strings = (
      'select plu '
      'from tmp.tprihnakl '
      'where'
      ' nom=:nom'
      'group by plu'
      'having count(plu)>1')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 736
    Top = 264
  end
  object KKM: TOracleDataSet
    SQL.Strings = (
      'select id,name,skladid,'
      'rowid'
      'from TMP.KKM'
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
      03000000020000000600000045445F495A4D0100000000040000004F4B454901
      00000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    AfterPost = QinventAfterPost
    Left = 272
    Top = 504
  end
  object KKM_ds: TDataSource
    DataSet = KKM
    Left = 312
    Top = 504
  end
  object qRealPrice: TOracleDataSet
    SQL.Strings = (
      'select p.oldprice '
      ' from tmp.tprice  p,tmp.tpricej j'
      'where  plu=:plu'
      'and p.nom=j.nom'
      'and j.reg=1'
      'and j.data>:data'
      'order by j.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C5503000000000000000000000005000000
      3A444154410C0000000000000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 584
    Top = 536
  end
  object SelKKm: TOracleDataSet
    SQL.Strings = (
      'select  '
      'p.plu,'
      'p.kolvo,'
      'p.price cena,'
      'p.sumdiscount,'
      'j.data,'
      'j.skladid'
      'from tmp.kkmreport p,tmp.kkmj j,tmp.tkatalog t'
      ''
      'where j.doc=:nom'
      'and p.doc=j.doc'
      'and p.kolvo>0'
      'and p.plu>0 and p.plu=t.plu')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
      030000000600000003000000504C5501000000000400000043454E4101000000
      000400000044415441010000000007000000534B4C4144494401000000000500
      00004B4F4C564F01000000000B00000053554D444953434F554E540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 784
    Top = 20
    object SelKKmPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object SelKKmKOLVO: TFloatField
      FieldName = 'KOLVO'
      Required = True
    end
    object SelKKmCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object SelKKmDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object SelKKmSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
    end
    object SelKKmSUMDISCOUNT: TFloatField
      FieldName = 'SUMDISCOUNT'
      Required = True
    end
  end
  object Ftovar: TOracleDataSet
    SQL.Strings = (
      'select plu,name,price,shtuka from tmp.tkatalog where export=1 '
      ''
      ''
      '')
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
      030000000400000003000000504C550100000000040000004E414D4501000000
      00050000005052494345010000000006000000534854554B410100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 16
    Top = 168
    object FtovarPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object FtovarNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object FtovarPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object FtovarSHTUKA: TIntegerField
      FieldName = 'SHTUKA'
      Required = True
    end
  end
  object SelAct: TOracleDataSet
    SQL.Strings = (
      'select   '
      #9'a.oldplu,'
      #9'a.newplu,'
      #9'a.oldprice,'
      #9'a.newprice,'
      #9'a.kolvo,'
      #9'j.data,'
      #9'j.reg,'
      #9'j.skladid,'
      #9'j.part'
      #9
      'from     tmp.actprice a,'
      #9'tmp.actpricej j'
      #9
      'where a. nom=:nom'
      #9'and j.nom=a.nom'
      #9
      #9
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D050000000000000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 800
    Top = 72
  end
  object Getsumost: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(sum),0) ostatok'
      'from tmp.kniga'
      'where plu=:plu'
      'and data<=:data'
      'and otkat=0'
      'and skladid=:sklad'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C5503000000000000000000000005000000
      3A444154410C0000000000000000000000060000003A534B4C41440300000000
      00000000000000}
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
    QBEDefinition.QBEFieldDefs = {0300000001000000070000004F535441544F4B0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 784
    Top = 216
    object getsumostatok: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
  end
  object qinsertkatalog: TOracleQuery
    SQL.Strings = (
      'INSERT INTO TMP.TINVENT '
      '(NOM,'
      'PLU,'
      'ED_IZM,'
      'PRICE,'
      'KOL_SKLAD,'
      'SUM_SKL)'
      'SELECT :nom,'
      'T.PLU,'
      'T.ED_IZM,'
      'T.PRICE,'
      'sum(k.sum),'
      'T.PRICE*sum(k.sum)'
      'from tmp.kniga k,tmp.tkatalog t'
      'WHERE T.PLU=K.PLU and k.otkat=0'
      'and k.skladid=:sklad'
      'and t.plu<>0'
      'and k.data<=:data'
      'and t.kat=:kat'
      ''
      'group by t.plu,t.name,t.price,t.ed_izm'
      'order by t.name')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000004000000040000003A4E4F4D05000000000000000000000006000000
      3A534B4C4144030000000000000000000000050000003A444154410C00000000
      00000000000000040000003A4B4154030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 488
    Top = 360
  end
  object GetFullOstSklad: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(partost),0) ostatok'
      'from tmp.kniga'
      'where plu=:plu'
      'and otkat=0'
      'and skladid=:sklad'
      'and prihod>0')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C5503000000040000003B00000000000000
      060000003A534B4C4144030000000000000000000000}
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
    QBEDefinition.QBEFieldDefs = {0300000001000000070000004F535441544F4B0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 688
    Top = 448
    object GetFullOstSkladOSTATOK: TFloatField
      FieldName = 'OSTATOK'
    end
  end
  object QselMinus: TOracleDataSet
    SQL.Strings = (
      'select t.*,j.data,j.reg,j.skladid'
      ' from tmp.tminus t,tmp.tminusj j'
      ''
      'where '
      't.nom=j.nom and'
      'j.nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000005E0A000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 792
    Top = 264
  end
  object QminKniga: TOracleDataSet
    SQL.Strings = (
      'select distinct k.* from tmp.kniga k'
      'where k.otkat=0'
      #9'and k.prihod>0'
      '       and k.partost<0'
      #9'and k.data<=:data'
      #9'and k.plu=:plu'
      #9'and k.skladid=:sklad'
      'order by k.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000050000003A444154410C0000000700000078670609010101
      00000000040000003A504C550300000004000000604101000000000006000000
      3A534B4C414403000000040000000100000000000000}
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
      030000000D000000020000004944010000000003000000504C55010000000004
      00000044415441010000000006000000505249484F4401000000000600000052
      4153484F440100000000070000004F535441544F4B0100000000040000004345
      4E41010000000007000000534B4C414449440100000000050000004F544B4154
      0100000000030000004E4F4D0100000000060000005041525449410100000000
      0300000053554D010000000007000000504152544F53540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 792
    Top = 312
    object QminKnigaID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object QminKnigaPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QminKnigaDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object QminKnigaPRIHOD: TFloatField
      FieldName = 'PRIHOD'
      Required = True
    end
    object QminKnigaRASHOD: TFloatField
      FieldName = 'RASHOD'
      Required = True
    end
    object QminKnigaOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
    object QminKnigaCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object QminKnigaSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
    end
    object QminKnigaOTKAT: TIntegerField
      FieldName = 'OTKAT'
      Required = True
    end
    object QminKnigaNOM: TFloatField
      FieldName = 'NOM'
      Required = True
    end
    object QminKnigaPARTIA: TFloatField
      FieldName = 'PARTIA'
      Required = True
    end
    object QminKnigaSUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object QminKnigaPARTOST: TFloatField
      FieldName = 'PARTOST'
      Required = True
    end
  end
  object qInsMinpart: TOracleQuery
    SQL.Strings = (
      'insert into tmp.minpart'
      'values (:plu,'
      #9':nom,'
      #9':kolvo,'
      #9':data,'
      #9'0,'
      #9':nomrash)')
    Session = OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000040000003A504C5503000000000000000000000004000000
      3A4E4F4D030000000000000000000000060000003A4B4F4C564F040000000000
      000000000000050000003A444154410C0000000000000000000000080000003A
      4E4F4D52415348030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 784
    Top = 360
  end
  object qselMinpart: TOracleDataSet
    SQL.Strings = (
      'select * from tmp.minpart '
      'where nomrash=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D030000000000000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 776
    Top = 424
  end
  object QselPeresort: TOracleDataSet
    SQL.Strings = (
      'select distinct  nomrash,data'
      ' from tmp.minpart  where nom=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D0300000004000000D201000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 400
    Top = 120
  end
  object selinventar: TOracleDataSet
    SQL.Strings = (
      
        'select plu  from tmp.tinvent i,tmp.tskladj j where j.nom=i.nom a' +
        'nd j.tip=1 and '
      ' plu=:plu'
      'and j.data>:data'
      'and j.skladid=:sklad'
      'and j.reg=1')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C550300000004000000E215000000000000
      050000003A444154410C00000007000000786701010101010000000006000000
      3A534B4C414403000000040000000100000000000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 280
    Top = 232
  end
  object QpriceData: TOracleDataSet
    SQL.Strings = (
      'select nvl(nvl('
      '(select DISTINCT max(newprice)'
      'from tmp.tprice p,tmp.tpricej j'
      'where p.nom=j.nom '
      'and p.plu=:plu'
      
        'and j.data=(select max(data)  from tmp.tpricej j,tmp.tprice p wh' +
        'ere j.reg=1 and p.nom=j.nom and p.plu=:plu and j.data< :data))'
      ',(select DISTINCT max(oldprice)'
      'from tmp.tprice p,tmp.tpricej j'
      'where p.nom=j.nom '
      'and p.plu=:plu'
      
        'and j.data=(select min(data)  from tmp.tpricej j,tmp.tprice p wh' +
        'ere  j.reg=1 and p.nom=j.nom and p.plu=:plu and j.data>= :data)'
      ')'
      ''
      ''
      
        '),(select price from tmp.tkatalog where plu=:plu)) price  from d' +
        'ual')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C550300000004000000A008000000000000
      050000003A444154410C000000070000007867060801010100000000}
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
    Session = OraBase
    DesignActivation = False
    Active = False
    Left = 16
    Top = 224
  end
end
