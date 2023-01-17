object test: Ttest
  OldCreateOrder = False
  Left = 586
  Top = 279
  Height = 313
  Width = 385
  object selsum: TOracleDataSet
    SQL.Strings = (
      'select '
      
        '( select nvl(sum(sum),0) from tmp.kniga where otkat=0 and plu=:p' +
        'lu and skladid=:sklad and data<=:data'
      ') summa'
      ','
      
        '(select  nvl(sum(partost),0) from tmp.kniga where otkat=0  and p' +
        'lu=:plu and skladid=:sklad and data<=:data'
      ') partost'
      'from dual')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C5503000000000000000000000006000000
      3A534B4C4144030000000000000000000000050000003A444154410C00000000
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
    QBEDefinition.QBEFieldDefs = {
      03000000020000000500000053554D4D41010000000007000000504152544F53
      540100000000}
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
    Left = 16
    Top = 16
    object selsumSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object selsumPARTOST: TFloatField
      FieldName = 'PARTOST'
    end
  end
  object selpartost: TOracleDataSet
    SQL.Strings = (
      
        'select k.* from tmp.kniga k where plu=:plu and prihod>0 and otka' +
        't=0 and skladid=:sklad and data<=:data'
      ' order by data ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C5503000000040000000C09000000000000
      060000003A534B4C414403000000040000000100000000000000050000003A44
      4154410C0000000700000078670A0101010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 16
    Top = 72
    object selpartostID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object selpartostPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object selpartostDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object selpartostPRIHOD: TFloatField
      FieldName = 'PRIHOD'
      Required = True
    end
    object selpartostRASHOD: TFloatField
      FieldName = 'RASHOD'
      Required = True
    end
    object selpartostOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
    object selpartostCENA: TFloatField
      FieldName = 'CENA'
      Required = True
    end
    object selpartostSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
    end
    object selpartostOTKAT: TIntegerField
      FieldName = 'OTKAT'
      Required = True
    end
    object selpartostNOM: TFloatField
      FieldName = 'NOM'
      Required = True
    end
    object selpartostPARTIA: TFloatField
      FieldName = 'PARTIA'
      Required = True
    end
    object selpartostSUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object selpartostPARTOST: TFloatField
      FieldName = 'PARTOST'
      Required = True
    end
  end
  object updkolvo: TOracleQuery
    SQL.Strings = (
      'update tmp.kniga set partost=:nal where id=:id')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000030000003A4944040000000000000000000000040000003A
      4E414C040000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 16
    Top = 136
  end
end
