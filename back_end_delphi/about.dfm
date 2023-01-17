object AboutBox: TAboutBox
  Left = 414
  Top = 231
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 345
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DS1: TfrDBDataSet
    OpenDataSource = False
    Left = 88
    Top = 48
  end
  object frReport1: TfrReport
    Dataset = DS1
    InitialZoom = pzPageWidth
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = frReport1GetValue
    OnUserFunction = frReport1UserFunction
    Left = 88
    Top = 8
    ReportForm = {18000000}
  end
  object Qkat: TOracleDataSet
    SQL.Strings = (
      'select kat,name'
      'from tmp.Tkat'
      'where name like :name'
      'order by kat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000050000003A4E414D45050000000400000031323300000000
      00}
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
      0300000002000000030000004B41540100000000040000004E414D4501000000
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 48
    Top = 8
    object QkatKAT: TIntegerField
      FieldName = 'KAT'
      Required = True
    end
    object QkatNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object Qostatok: TOracleDataSet
    SQL.Strings = (
      'select k.plu,'
      'nvl(t.name,'#39'?'#39') name,'
      'nvl(t.ed_izm,'#39'?'#39') ed_izm,'
      'nvl(t.price,0) price,'
      'nvl(min(b.barcode),'#39'?'#39') barcode,'
      'sum(k.prihod) prihod,'
      'sum(k.rashod) rashod,'
      'sum(k.ostatok) ostatok'
      'from tmp.minjournal k,tmp.tkatalog t,tmp.tbarcode b'
      'where  '
      't.plu(+)=k.plu'
      'and b.plu(+)=k.plu'
      'and sklad=:sklad'
      'and t.kat=:kat'
      'group by K.plu,t.name,t.kat,nvl(t.price,0),nvl(t.ed_izm,'#39'?'#39')'
      'order by t.name'
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A534B4C41440300000000000000000000000400
      00003A4B4154030000000000000000000000}
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
      0006000000505249484F44010000000006000000524153484F44010000000007
      0000004F535441544F4B01000000000500000050524943450100000000070000
      00424152434F444501000000000600000045445F495A4D0100000000}
    Cursor = crDefault
    Master = Qkat
    MasterFields = 'kat'
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
    BeforeOpen = QostatokBeforeOpen
    OnCalcFields = QostatokCalcFields
    Left = 48
    Top = 48
    object QostatokNAME: TStringField
      FieldName = 'NAME'
      Size = 52
    end
    object QostatokPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object QostatokPRIHOD: TFloatField
      Alignment = taLeftJustify
      FieldName = 'PRIHOD'
      Required = True
    end
    object QostatokRASHOD: TFloatField
      Alignment = taLeftJustify
      FieldName = 'RASHOD'
      Required = True
    end
    object QostatokOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Required = True
    end
    object QostatokBARCODE: TStringField
      FieldName = 'BARCODE'
      Size = 13
    end
    object Qostatokean13: TStringField
      FieldKind = fkCalculated
      FieldName = 'ean13'
      Size = 15
      Calculated = True
    end
    object QostatokPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QostatokED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
  end
  object DS2: TfrDBDataSet
    OpenDataSource = False
    Left = 88
    Top = 88
  end
  object prihnakl: TOracleDataSet
    SQL.Strings = (
      'select p.*,'
      's.sklad,'
      'k.name,'
      's.name self,'
      'j.prim'
      
        'from tmp.tprihnakl p,tmp.tsklad s,tmp.tpostav k,tmp.tselfrec o,t' +
        'mp.tprihj j'
      ' where '
      'p.skladid=s.skladid'
      'and k.cod=p.post'
      'and p.nom=:nom'
      'and p.nom=j.nom'
      'order by id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000009501000000000000}
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
      0300000018000000020000004E4E010000000004000000504F53540100000000
      05000000504F4B5550010000000004000000444154410100000000040000004E
      414D4501000000000600000045445F495A4D0100000000040000004D45535401
      00000000060000004B4F4C5F5550010000000006000000524F53534950010000
      0000060000004B4F4C5F564F01000000000800000043454E41424E4453010000
      00000800000043454E41534E445301000000000800000043454E415245414C01
      0000000005000000544F54414C010000000007000000534B4C41444944010000
      000003000000504C5501000000000900000043454E41575A414C450100000000
      030000004E4F4D0100000000020000004944010000000005000000534B4C4144
      0100000000060000004E414D455F3101000000000400000053454C4601000000
      00080000004B5241534E5F49440100000000040000005052494D0100000000}
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
    Left = 8
    Top = 8
    object prihnaklNN: TIntegerField
      FieldName = 'NN'
      Required = True
    end
    object prihnaklDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object prihnaklNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object prihnaklED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object prihnaklKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object prihnaklCENABNDS: TFloatField
      FieldName = 'CENABNDS'
      Required = True
      currency = True
    end
    object prihnaklCENASNDS: TFloatField
      FieldName = 'CENASNDS'
      Required = True
      currency = True
    end
    object prihnaklCENAREAL: TFloatField
      FieldName = 'CENAREAL'
      Required = True
      currency = True
    end
    object prihnaklTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
      currency = True
    end
    object prihnaklPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object prihnaklNOM: TFloatField
      FieldName = 'NOM'
      Required = True
    end
    object prihnaklSKLAD: TStringField
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object prihnaklNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object prihnaklPOST: TIntegerField
      FieldName = 'POST'
      Required = True
    end
    object prihnaklSELF: TStringField
      FieldName = 'SELF'
      Required = True
      Size = 100
    end
    object prihnaklPRIM: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
  end
  object frShapeObject1: TfrShapeObject
    Left = 184
    Top = 8
  end
  object frRoundRectObject1: TfrRoundRectObject
    Left = 224
    Top = 8
  end
  object reestr: TOracleDataSet
    SQL.Strings = (
      'select '
      't.plu,'
      't.name,'
      'p.name proizw,'
      't.price'
      ' '
      'from'
      'tmp.tkatalog t,tmp.tkat k,tmp.tproizw p'
      'where t.kat=k.kat '
      'and t.proizw=p.proizw'
      'and k.name like '#39'%'#1096#1090#1088#1080#1093#1082#1086#1076#1072'%'#39
      'and t.nal>0'
      'order by t.name,t.price')
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
      000600000050524F495A5701000000000500000050524943450100000000}
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
    Left = 8
    Top = 48
    object reestrPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object reestrNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object reestrPROIZW: TStringField
      FieldName = 'PROIZW'
      Size = 30
    end
    object reestrPRICE: TFloatField
      FieldName = 'PRICE'
      currency = True
    end
  end
  object tov_otch: TOracleDataSet
    SQL.Strings = (
      'select j.post_name post_name,'
      '       -- j.nn,'
      '        to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      '        to_char(:kd,'#39'dd.mm.yy'#39')kdata,'
      '       --  to_char(j.data,'#39'dd.mm.yy'#39')data,'
      '       --  round(sum(n.total),2) sum_u,'
      '         sum(round(n.cenareal*n.kol_vo,2)) sum'
      '         from tmp.tprihj j,tmp.tprihnakl n'
      'where j.nom=n.nom '
      '      and j.reg=1'
      '      and j.data>=:nd and j.data<=:kd'
      '     and j.skladid=:sklad'
      'group by j.post_name'
      '       --      ,j.nn,j.data,j.nom'
      'union all'
      'select '#39#1072#1082#1090' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080#39' post_name,'
      '  to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      '  to_char(:kd,'#39'dd.mm.yy'#39')kdata,'
      '  sum(a.sum) sum'
      'from tmp.actpricej a'
      'where '
      'a.data>=:nd and a.data<=:kd'
      'and a.reg=1 '
      'and a.skladid=:sklad'
      'and a.sum>0'
      'union all '
      'select '#39#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072#39' post_name,'
      'to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      'to_char(:kd,'#39'dd.mm.yy'#39')kdata,'
      ' sum(a.sum)  sum'
      'from tmp.tpricej j,tmp.tprice a'
      'where '
      'j.data>=:nd and j.data<=:kd'
      'and j.reg=1'
      'and j.nom=a.nom'
      'and a.sum>0'
      
        'and a.plu = (select  k.plu from tmp.kniga  k where k.plu=a.plu a' +
        'nd k.prihod>0 and k.skladid=:sklad and k.data<:kd and rownum=1)'
      'union all'
      'select '#39#1087#1088#1080#1105#1084#39' post_name,'
      'to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      'to_char(:kd,'#39'dd.mm.yy'#39')kdata, '
      'sum(j.sum)  sum'
      'from tmp.tskladj j'
      'where '
      'j.data>=:nd and j.data<=:kd'
      'and  j.reg=1'
      'and j.tip=3'
      'and j.skladid=:sklad'
      ''
      'order by post_name --,j.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000030000003A4E440C0000000700000078670B010101010000
      0000030000003A4B440C0000000700000078670C1E0101010000000006000000
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
      030000000200000009000000504F53545F4E414D450100000000030000005355
      4D0100000000}
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
    Top = 128
  end
  object katreport: TOracleDataSet
    SQL.Strings = (
      'select name,'
      'o.value nd,'
      'oe.value kd,'
      'round(to_date(oe.value)-to_date(o.value),0) dney,'
      'sum(NOSTATOK),'
      'sum(NO_SUMMA),'
      'sum(PRIHOD),'
      'sum(P_SUMMA),'
      'sum(RASHOD),'
      'nvl(sum(R_SUMMA),0) rashod,'
      'sum(OSTATOK),'
      'sum(O_SUMMA) '
      'from tmp.vkatreport,tmp.toptions o,tmp.toptions oe'
      'where o.parametr='#39'begin'#39
      'and oe.parametr='#39'end'#39
      'group by name,o.value,'
      'oe.value'
      'order by name  ')
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
      030000000B000000040000004E414D4501000000000D00000053554D284E4F53
      5441544F4B2901000000000D00000053554D284E4F5F53554D4D412901000000
      000B00000053554D28505249484F442901000000000C00000053554D28505F53
      554D4D412901000000000B00000053554D28524153484F442901000000000C00
      000053554D28525F53554D4D412901000000000C00000053554D284F53544154
      4F4B2901000000000C00000053554D284F5F53554D4D41290100000000020000
      004E440100000000020000004B440100000000}
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
    Left = 48
    Top = 88
  end
  object tov_otch_sec: TOracleDataSet
    SQL.Strings = (
      'select  j.nn,'
      '        to_char(j.data,'#39'dd.mm.yy'#39')data,'
      '        round(sum(n.total),2) sum_u,'
      '        sum(round(n.cenareal*n.kol_vo,2)) sum,'
      '        j.data jdata'
      ' from tmp.tprihj j,tmp.tprihnakl n'
      'where j.nom=n.nom '
      '      and j.reg=1'
      '      and j.data>=:nd and j.data<=:kd'
      '    and j.skladid=:sklad    '
      '  and j.post_name=:post_name'
      'group by j.nn,j.data,j.nom'
      ''
      'union all'
      'select a.nom nn,'
      #9'to_char(a.data,'#39'dd.mm.yy'#39')data,'
      #9'0 sum_u,'
      #9'nvl(a.sum,0) sum,'
      #9'a.data jdata'
      'from tmp.actpricej a'
      'where a.data>=:nd and a.data<=:kd'
      '      and :post_name='#39#1072#1082#1090' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080#39
      #9'and a.reg=1'
      '  and a.skladid=:sklad'
      '  and a.sum>0'
      'union all'
      'select j.nom nn,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39')data,'
      #9'0 sum_u,'
      #9'nvl(sum(a.sum),0) sum,'
      #9'j.data jdata'
      'from tmp.tpricej j,tmp.tprice a'
      'where j.data>=:nd and j.data<=:kd'
      '           and :post_name='#39#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072#39
      #9' and j.reg=1'
      '             and j.nom=a.nom'
      '            and a.sum>0'
      
        'and a.plu = (select  k.plu from tmp.kniga  k where k.plu=a.plu a' +
        'nd k.prihod>0 and k.skladid=:sklad and k.data<:kd and rownum=1)'
      ''
      '--having nvl(sum(a.sum),0)>0'
      'group by j.nom,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39'),'
      #9'j.data'
      ''
      'union all'
      'select j.nom nn,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39')data,'
      #9'0 sum_u,'
      #9'nvl(sum(j.sum),0) sum,'
      #9'j.data jdata'
      'from tmp.tskladj j'
      'where j.data>=:nd and j.data<=:kd'
      '           and :post_name='#39#1087#1088#1080#1105#1084#39
      #9' and j.reg=1'
      '             and j.tip=3 '
      '  and j.skladid=:sklad'
      'group by j.nom,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39'),'
      #9'j.data'
      ''
      ''
      ''
      ''
      'order by nn')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000040000000A0000003A504F53545F4E414D4505000000000000000000
      0000030000003A4E440C0000000000000000000000030000003A4B440C000000
      0000000000000000060000003A534B4C41440300000004000000010000000000
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
      030000000700000009000000504F53545F4E414D450100000000020000004E4E
      0100000000040000004441544101000000000500000053554D5F550100000000
      0300000053554D0100000000050000004E444154410100000000050000004B44
      4154410100000000}
    Cursor = crDefault
    Master = tov_otch
    MasterFields = 'post_name'
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
    Left = 32
    Top = 176
  end
  object journ_sum: TOracleDataSet
    SQL.Strings = (
      'select '
      'nvl(('
      'select   sum(round(n.cenareal*n.kol_vo,2)) sum'
      '         from tmp.tprihj j,tmp.tprihnakl n'
      'where j.nom=n.nom '
      '      and j.reg=1   and j.skladid=:sklad'
      '      and j.data>=:nd and j.data<=:kd'
      '),0) +'
      'nvl((select   sum(a.sum) sum'
      '         from tmp.actpricej a'
      'where a.data>=:nd and a.data<=:kd'
      #9'and a.reg=1   and a.skladid=:sklad and a.sum>0'
      '),0)  +'
      'nvl((select sum(ap.sum)'
      #9'from tmp.tprice ap,tmp.tpricej j'
      'where j.data>=:nd and j.data<=:kd'
      #9'and j.reg=1 and j.nom=ap.nom'
      'and ap.sum>0'
      
        'and ap.plu = (select  k.plu from tmp.kniga  k where k.plu=ap.plu' +
        ' and k.prihod>0 and k.skladid=:sklad and k.data<:kd and rownum=1' +
        ')'
      ''
      '--having sum(a.sum) >0'
      '+'
      ''
      'nvl((select   sum(j.sum) sum'
      '         from tmp.tskladj j'
      'where j.data>=:nd and j.data<=:kd'
      #9'and j.reg=1 and j.tip=3   and j.skladid=:sklad'
      '),0) '
      ''
      '),0) sum'
      'from dual')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000030000003A4E440C0000000700000078670B010101010000
      0000030000003A4B440C0000000700000078670C1E0101010000000006000000
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 96
    Top = 168
  end
  object frChartObject1: TfrChartObject
    Left = 184
    Top = 48
  end
  object rashnakl: TOracleDataSet
    SQL.Strings = (
      'select   p.nn,'
      #9
      #9' p.plu,'
      #9'p.name,'
      #9'P.ED_IZM,'
      #9'sum(p.mest) mest,'
      #9'sum(p.kol_up) kol_up, '
      #9'sum(p.kol_vo) kol_vo,'
      #9'avg(p.cenabnds) cenabnds,'
      #9'avg(p.cenasnds) cenasnds,'
      #9'sum(p.total) total,'
      #9'min(p.id) id,'
      's.sklad,'
      'k.name pokup,'
      'j.prim,'
      'j.data'
      ''
      'from tmp.trashnakl p,tmp.trashj j,tmp.tsklad s,tmp.tpostav k'
      ' where '
      'p.skladid=s.skladid'
      'and k.cod=j.pokup'
      'and j.nom=p.nom'
      'and p.nom=:nom'
      'and p.kol_vo<>0'
      'group by p.nn,p.plu,p.name,p.ed_izm,s.sklad,k.name,j.prim,j.data'
      'order by id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000005364000000000000}
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
      030000000F00000005000000504F4B55500100000000040000004E414D450100
      0000000600000045445F495A4D0100000000040000004D455354010000000006
      0000004B4F4C5F55500100000000060000004B4F4C5F564F0100000000080000
      0043454E41534E4453010000000005000000544F54414C010000000003000000
      504C550100000000020000004944010000000005000000534B4C414401000000
      00040000005052494D0100000000020000004E4E01000000000800000043454E
      41424E4453010000000004000000444154410100000000}
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
    Left = 88
    Top = 120
    object rashnaklPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object rashnaklNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object rashnaklED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object rashnaklMEST: TFloatField
      FieldName = 'MEST'
    end
    object rashnaklKOL_UP: TFloatField
      FieldName = 'KOL_UP'
    end
    object rashnaklKOL_VO: TFloatField
      FieldName = 'KOL_VO'
    end
    object rashnaklCENASNDS: TFloatField
      FieldName = 'CENASNDS'
    end
    object rashnaklCENABNDS: TFloatField
      FieldName = 'CENABNDS'
    end
    object rashnaklTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object rashnaklID: TFloatField
      FieldName = 'ID'
    end
    object rashnaklSKLAD: TStringField
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object rashnaklPOKUP: TStringField
      FieldName = 'POKUP'
      Required = True
      Size = 100
    end
    object rashnaklPRIM: TStringField
      FieldName = 'PRIM'
      Size = 40
    end
    object rashnaklNN: TIntegerField
      FieldName = 'NN'
      Required = True
    end
    object rashnaklDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
  end
  object QvhCena: TOracleDataSet
    SQL.Strings = (
      'select            j.nn nn,'
      #9'          to_char(j.data,'#39'dd.mm.yyyy'#39') data,'
      '                     min(r.cenabnds) cenabnds,'
      #9'         min(r.cenasnds) cenasnds,'
      #9'         min( p.kolvo) kolvo,'
      #9'         min(r.krasn_id) krasn_id'
      'from '#9'tmp.tpart p,'
      #9'tmp.tprihnakl r,'
      #9'tmp.tprihj j'
      'where p.plu=:plu'
      '           and p.nomrash=:nom'
      '           and  p.plu=r.plu'
      '           and j.part=p.part'
      '           and r.nom=j.nom'
      '   '
      #9'  '
      
        'group by  j.nn,to_char(j.data,'#39'dd.mm.yyyy'#39'),p.plu,p.nomrash,p.pa' +
        'rt,p.id'
      ''
      'union all'
      ''
      'select            j.nom nn,'
      #9'          '#39#1072#1087#39'||to_char(j.data,'#39'dd.mm.yyyy'#39') data,'
      '                     r.newprice cenabnds,'
      #9#9'r.newprice cenasnds,'
      #9'         p.kolvo kolvo,'
      #9'         '#39'0'#39' krasn_id'
      'from '#9'tmp.tpart p,'
      #9'tmp.actprice r,'
      #9'tmp.actpricej j'
      'where p.plu=:plu'
      '           and p.nomrash=:nom'
      '           and  p.plu=r.newplu'
      '           and j.part=p.part'
      '           and r.nom=j.nom'
      'union all'
      ''
      'select            j.nom nn,'
      #9'          '#39#1087#1088'.'#1090' '#39'||to_char(j.data,'#39'dd.mm.yyyy'#39') data,'
      '                     r.price cenabnds,'
      #9#9'r.price cenasnds,'
      #9'         p.kolvo kolvo,'
      #9'         '#39'0'#39' krasn_id'
      'from '#9'tmp.tpart p,'
      #9'tmp.tinvent r,'
      #9'tmp.tskladj j'
      'where p.plu=:plu'
      '           and p.nomrash=:nom'
      '           and  p.plu=r.plu'
      '           and j.part=p.part'
      '           and r.nom=j.nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C5503000000040000002E1F010000000000
      040000003A4E4F4D0300000004000000E40B000000000000}
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
      03000000060000000800000043454E41534E44530100000000050000004B4F4C
      564F0100000000080000004B5241534E5F49440100000000020000004E4E0100
      000000040000004441544101000000000800000043454E41424E445301000000
      00}
    Cursor = crDefault
    Master = rashnakl
    MasterFields = 'plu'
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
    Left = 128
    Top = 120
    object QvhCenaNN: TFloatField
      FieldName = 'NN'
    end
    object QvhCenaDATA: TStringField
      FieldName = 'DATA'
      Size = 12
    end
    object QvhCenaCENABNDS: TFloatField
      FieldName = 'CENABNDS'
    end
    object QvhCenaCENASNDS: TFloatField
      FieldName = 'CENASNDS'
    end
    object QvhCenaKOLVO: TFloatField
      FieldName = 'KOLVO'
    end
    object QvhCenaKRASN_ID: TStringField
      FieldName = 'KRASN_ID'
      Size = 12
    end
  end
  object Summreport: TOracleDataSet
    SQL.Strings = (
      'select '#39#1057#1091#1084#1084#1072' '#1087#1086' '#1084#1072#1075#1072#1079#1080#1085#1091'('#1047#1072#1082#1091#1087'.) '#1085#1072#1095'.'#1087#1077#1088#1080#1086#1076#1072' '#39'  tip, '
      'nvl(sum(k.sum*nvl(t.cenasnds,k.cena)),0) sum  '
      'from   TMP.kniga k,tmp.tprihnakl t,tmp.tprihj j'
      'where k.otkat=0'
      'and k.partia=j.part(+)'
      'and k.plu=nvl(t.plu,k.plu)'
      'and j.nom=t.nom(+)'
      
        'and k.data < (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toptio' +
        'ns where parametr='#39'begin'#39')'
      'and k.skladid=:sklad'
      'union all'
      'select  '#39#1057#1091#1084#1084#1072' '#1087#1086' '#1084#1072#1075#1072#1079#1080#1085#1091'('#1056#1086#1079#1085'.) '#1085#1072#1095'.'#1087#1077#1088#1080#1086#1076#1072' '#39'  tip,'
      'nvl(sum(k.sum*k.cena),0) sum  '
      'from TMP.kniga k'
      'where otkat=0'
      
        'and k.data < (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toptio' +
        'ns where parametr='#39'begin'#39')'
      'and k.skladid=:sklad'
      'union all'
      'select '#39#1057#1091#1084#1084#1072' '#1087#1086#1089#1090#1072#1074#1086#1082'('#1047#1072#1082#1091#1087'.) '#39'  tip, '
      'nvl(sum(k.prihod*t.CENASNDS),0) sum  '
      'from   TMP.kniga k,tmp.tprihnakl t,tmp.tprihj j'
      'where k.otkat=0'
      'and k.prihod>0'
      'and k.partia=j.part'
      'and k.plu=t.plu'
      'and j.nom=t.nom'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'and k.skladid=:sklad'
      'union all'
      'select  '#39#1057#1091#1084#1084#1072' '#1087#1086#1089#1090#1072#1074#1086#1082'('#1056#1086#1079#1085'.) '#39'  tip,'
      'nvl(sum(k.prihod*k.cena),0) sum  '
      'from TMP.kniga k '
      'where otkat=0'
      'and k.prihod>0'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'and k.skladid=:sklad'
      ''
      ''
      'union all'
      'select  '#39#1057#1091#1084#1084#1072' '#1087#1077#1088#1077#1086#1094#1077#1085#1086#1082' '#39'  tip,'
      'nvl(sum(sum),0) sum  '
      'from TMP.tpricej'
      'where reg=1'
      
        'and data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.toption' +
        's where parametr='#39'begin'#39')'
      
        'and data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.yyy' +
        'y'#39') from tmp.toptions where parametr='#39'end'#39')'
      'union all'
      'select  '#39#1057#1091#1084#1084#1072' '#1055#1088#1086#1076#1072#1078'('#1047#1072#1082#1091#1087'.) '#39'  tip,'
      'nvl(sum(p.kolvo*t.CENASNDS),0) sum  '
      'from TMP.tpart p,tmp.tprihnakl t,tmp.tprihj j'
      ''
      'where p.part=j.part'
      #9'and t.plu=p.plu'
      #9'and j.nom=t.nom'
      
        'and p.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and p.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'and j.skladid=:sklad'
      'union all'
      'select  '#39#1057#1091#1084#1084#1072' '#1055#1088#1086#1076#1072#1078'('#1056#1086#1079#1085'.) '#39'  tip,'
      'nvl(sum(p.kolvo*p.cenareal),0) sum  '
      'from TMP.tpart p,tmp.kniga k'
      'where'
      'k.nom=p.nomrash'
      'and k.plu=p.plu'
      'and k.skladid=:sklad'
      
        'and p.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and p.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'union all'
      'select '#39#1057#1091#1084#1084#1072' '#1087#1086' '#1084#1072#1075#1072#1079#1080#1085#1091'('#1047#1072#1082#1091#1087'.) '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' '#39'  tip, '
      'nvl(sum(k.sum*nvl(t.cenasnds,k.cena)),0) sum  '
      'from   TMP.kniga k,tmp.tprihnakl t,tmp.tprihj j'
      'where k.otkat=0'
      'and k.partia=j.part(+)'
      'and k.skladid=:sklad'
      'and k.plu=nvl(t.plu,k.plu)'
      'and j.nom=t.nom(+)'
      
        'and k.data< = (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.' +
        'yyyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      ''
      ''
      'union all'
      'select  '#39#1057#1091#1084#1084#1072' '#1087#1086' '#1084#1072#1075#1072#1079#1080#1085#1091'('#1056#1086#1079#1085'.)  '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' '#39'  tip,'
      'nvl(sum(k.sum*k.cena),0) sum  '
      'from TMP.kniga k'
      'where otkat=0'
      'and k.skladid=:sklad'
      
        'and k.data < = (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm' +
        '.yyyy'#39') from tmp.toptions where parametr='#39'end'#39')'
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
      03000000020000000300000054495001000000000300000053554D0100000000}
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
    Left = 176
    Top = 120
  end
  object rash_otch: TOracleDataSet
    SQL.Strings = (
      'select j.POKUP_NAME ,'
      '         to_char(:nd,'#39'dd.mm.yy'#39') ndata,'
      '        to_char(:kd,'#39'dd.mm.yy'#39') kdata,'
      '        sum(sum) sum'
      '         from tmp.trashj j'
      'where '
      '      j.reg=1'
      '      and j.data>=:nd and j.data<=:kd   and j.skladid=:sklad'
      'group by j.POKUP_NAME '
      ''
      'union all'
      'select to_char(k.id)||k.name  POKUP_NAME ,'
      '         to_char(:nd,'#39'dd.mm.yy'#39') ndata,'
      '        to_char(:kd,'#39'dd.mm.yy'#39') kdata,'
      '        sum(j.total) sum'
      '         from tmp.kkmj j,tmp.kkm k'
      'where '
      '     k.id=j.kkm and j.reg=1'
      '      and j.data>=:nd and j.data<=:kd   and j.skladid=:sklad'
      'group by to_char(k.id)||k.name '
      ''
      'union all'
      'select '#39#1089#1087#1080#1089#1072#1085#1080#1077#39' POKUP_NAME,'
      'to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      'to_char(:kd,'#39'dd.mm.yy'#39')kdata, '
      'sum(j.sum)  sum'
      'from tmp.tskladj j'
      'where '
      'j.data>=:nd and j.data<=:kd   and j.skladid=:sklad'
      'and  j.reg=1'
      'and j.tip=2'
      'union all'
      'select '#39#1089#1082#1080#1076#1082#1072#39' POKUP_NAME,'
      'to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      'to_char(:kd,'#39'dd.mm.yy'#39')kdata, '
      'sum(j.sumdiscount)  sum'
      'from tmp.kkmj j'
      'where '
      'j.data>=:nd and j.data<=:kd'
      'and  j.reg=1'
      'and j.skladid=:sklad'
      ''
      'union all '
      'select '#39#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072#39' POKUP_NAME,'
      'to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      'to_char(:kd,'#39'dd.mm.yy'#39')kdata,'
      ' sum(a.sum)*-1  sum'
      'from tmp.tpricej j,tmp.tprice a'
      'where '
      'j.data>=:nd and j.data<=:kd'
      'and j.reg=1'
      'and j.nom=a.nom'
      'and a.sum<0'
      
        'and a.plu = (select  k.plu from tmp.kniga  k where k.plu=a.plu a' +
        'nd k.prihod>0 and k.skladid=:sklad and k.data<:kd and rownum=1)'
      'union all'
      'select '#39#1072#1082#1090' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080#39' pokup_name,'
      '  to_char(:nd,'#39'dd.mm.yy'#39')ndata,'
      '  to_char(:kd,'#39'dd.mm.yy'#39')kdata,'
      '  sum(a.sum)*-1 sum'
      'from tmp.actpricej a'
      'where '
      'a.data>=:nd and a.data<=:kd'
      'and a.reg=1 '
      'and a.skladid=:sklad'
      'and a.sum<0'
      ''
      '       '
      'order by POKUP_NAME ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000030000003A4E440C00000007000000786704010101010000
      0000030000003A4B440C0000000700000078670C1F0101010000000006000000
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
      030000000200000009000000504F53545F4E414D450100000000030000005355
      4D0100000000}
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
    Left = 128
    Top = 198
  end
  object rash_otch1: TOracleDataSet
    SQL.Strings = (
      ''
      'select  to_number(j.nn) nn,'
      '        to_date(j.data,'#39'dd.mm.yy'#39') data,'
      '          sum(round(sum,2)) sum'
      '         from tmp.trashj j'
      'where '
      '       j.reg=1'
      '      and j.data>=:nd and j.data<=:kd   and j.skladid=:sklad'
      '      and j.pokup_name like :pokup_name'
      'group by j.nn,j.data,j.nom'
      'union all'
      ''
      'select  to_number(j.doc) nn,'
      '        to_date(j.data,'#39'dd.mm.yy'#39') data,'
      '          sum(round(total,2)) sum'
      '         from tmp.kkmj j'
      
        'where       j.data>=:nd and j.data<=:kd and j.reg=1   and j.skla' +
        'did=:sklad'
      '      and to_char(j.kkm) like substr(:pokup_name,1,1)'
      'group by  to_number(j.doc),j.data'
      ''
      'union all'
      'select j.nom nn,'
      #9'to_date(j.data,'#39'dd.mm.yy'#39') data,'
      #9'nvl(sum(j.sum),0) sum'
      #9'from tmp.tskladj j'
      'where j.data>=:nd and j.data<=:kd   and j.skladid=:sklad'
      '           and :pokup_name='#39#1089#1087#1080#1089#1072#1085#1080#1077#39
      #9' and j.reg=1'
      '             and j.tip=2 '
      'group by j.nom,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39'),'
      #9'j.data'
      'union all'
      'select j.doc nn,'
      #9'to_date(j.data,'#39'dd.mm.yy'#39')data,'
      #9'nvl(sum(j.sumdiscount),0)  sum'
      #9'from tmp.kkmj j'
      'where j.data>=:nd and j.data<=:kd'
      '           and :pokup_name='#39#1089#1082#1080#1076#1082#1072#39
      #9' and j.reg=1'
      '   and j.skladid=:sklad             '
      ' having nvl(sum(j.sumdiscount),0)<>0'
      'group by j.doc,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39'),'
      #9'j.data'
      'union all'
      'select j.nom nn,'
      #9'to_date(j.data,'#39'dd.mm.yy'#39')data,'
      #9'nvl(sum(a.sum),0)*-1  sum'
      #9'from tmp.tpricej j,tmp.tprice a'
      'where j.data>=:nd and j.data<=:kd'
      '           and :pokup_name='#39#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072#39
      #9' and j.reg=1'
      '                 and j.nom=a.nom'
      'and a.sum<0'
      
        'and a.plu = (select  k.plu from tmp.kniga  k where k.plu=a.plu a' +
        'nd k.prihod>0 and k.skladid=:sklad and k.data<:kd and rownum=1)'
      ''
      '--having nvl(sum(a.sum),0)<0'
      'group by j.nom,'
      #9'to_char(j.data,'#39'dd.mm.yy'#39'),'
      #9'j.data'
      'union all'
      'select a.nom nn,'
      #9'to_date(a.data,'#39'dd.mm.yy'#39')data,'
      #9'nvl(a.sum,0)*-1  sum'
      #9'from tmp.actpricej a'
      'where a.data>=:nd and a.data<=:kd'
      '      and :pokup_name='#39#1072#1082#1090' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080#39
      #9'and a.reg=1'
      '  and a.skladid=:sklad'
      '  and a.sum<0'
      ''
      ''
      'order by data,nn')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000004000000030000003A4E440C00000007000000786704010101010000
      0000030000003A4B440C0000000700000078670C1F010101000000000B000000
      3A504F4B55505F4E414D450500000002000000360000000000060000003A534B
      4C414403000000040000000100000000000000}
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
      030000000700000009000000504F53545F4E414D450100000000020000004E4E
      0100000000040000004441544101000000000500000053554D5F550100000000
      0300000053554D0100000000050000004E444154410100000000050000004B44
      4154410100000000}
    Cursor = crDefault
    Master = rash_otch
    MasterFields = 'pokup_name'
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
    Left = 24
    Top = 238
  end
  object rash_sum: TOracleDataSet
    SQL.Strings = (
      'select'
      ''
      '(select  nvl(sum(round(j.sum,2)),0) '
      '     from tmp.trashj j'
      '     where '
      '       j.reg=1   and j.skladid=:sklad'
      '      and j.data>=:nd and j.data<=:kd)'
      '+('
      'nvl((select   sum(rj.sum) '
      '         from tmp.tskladj rj'
      'where rj.data>=:nd and rj.data<=:kd'
      #9'and rj.reg=1 and rj.tip=2   and rj.skladid=:sklad'
      '),0)) '
      '+ (select sum(a.sum)*-1'
      #9'from tmp.tprice a,tmp.tpricej j'
      'where j.data>=:nd and j.data<=:kd'
      #9'and j.reg=1 and j.nom=a.nom'
      'and a.sum<0'
      
        'and a.plu = (select  k.plu from tmp.kniga  k where k.plu=a.plu a' +
        'nd k.prihod>0 and k.skladid=:sklad and k.data<:kd and rownum=1)'
      ''
      '--having sum(a.sum) <0'
      ') +'
      '(nvl((select   sum(a.sum) sum'
      '         from tmp.actpricej a'
      'where a.data>=:nd and a.data<=:kd'
      #9'and a.reg=1   and a.skladid=:sklad and a.sum<0'
      '),0))'
      ''
      ''
      ''
      'sum '
      ''
      ''
      ''
      ',0 skidka'
      'from dual   '
      ''
      'union all'
      ''
      
        'select   nvl(sum(round(k.total,2)),0) sum,  nvl(sum(round(k.sumd' +
        'iscount,2)),0) skidka'
      ''
      '         from tmp.kkmj k'
      'where '
      '       '
      '      '
      '       k.data>=:nd and k.data<=:kd'
      'and k.reg=1   and k.skladid=:sklad')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000030000003A4E440C000000070000007867040A0101010000
      0000030000003A4B440C0000000700000078670C1F0101010000000006000000
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 72
    Top = 238
  end
  object DS3: TfrDBDataSet
    OpenDataSource = False
    Left = 128
    Top = 48
  end
  object DS4: TfrDBDataSet
    OpenDataSource = False
    Left = 128
    Top = 88
  end
  object selrashod: TOracleDataSet
    SQL.Strings = (
      'select '
      'sum(p.kolvo) kolvo,'
      'p.cenazak cena'
      ''
      'from tmp.tpart p'
      'where p.plu=:plu'
      'and p.nomrash=:rash'
      'group by  '
      #9'   p.cenazak ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A504C5503000000000000000000000005000000
      3A52415348030000000000000000000000}
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
    Master = SelPerem
    MasterFields = 'plu'
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
    Left = 280
    Top = 232
  end
  object SelPerem: TOracleDataSet
    SQL.Strings = (
      'select  '
      'p.plu,'
      'p.name,'
      'p.ed_izm,'
      'sum(p.kol_vo) kol_vo,'
      'j.data,'
      'j.sum,'
      'j.nn,'
      'j.reg,'
      's.sklad,'
      'o.sklad,'
      'p.id'
      'from tmp.tperemnakl p,tmp.tperemj j,tmp.tsklad s,tmp.tsklad o'
      ''
      'where j.nom=:nom'
      'and p.nom=j.nom'
      'and s.skladid=j.skladin'
      'and o.skladid=j.skladout'
      'group by p.plu,'
      #9'p.name,'
      #9'p.ed_izm,'
      #9'j.data,'
      #9'j.sum,'
      #9'j.nn,'
      #9'j.reg,'
      #9's.sklad,'
      #9'o.sklad,'
      #9'p.id'
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 240
    Top = 232
  end
  object KKMJ: TOracleDataSet
    SQL.Strings = (
      'select j.*'
      'from tmp.kkmj j'
      'where doc=:nom')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D040000000000000000000000}
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
      030000000C00000003000000444F430100000000030000004B4B4D0100000000
      07000000534B4C41444944010000000004000000444154410100000000050000
      004C454E5441010000000005000000544F54414C01000000000B00000053554D
      444953434F554E5401000000000600000053554D4E4453010000000006000000
      53554D4E53500100000000070000004B4F4D4D454E5401000000000300000052
      45470100000000050000004F574E45520100000000}
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
    Left = 120
    Top = 240
  end
  object Qinvent: TOracleDataSet
    SQL.Strings = (
      'select i.plu,'
      'k.name,'
      'k.ed_izm,'
      'i.price,'
      'i.KOL_SKLAD,'
      'sum(i.KOL_FAKT) KOL_FAKT,'
      'i.KOL_SKLAD-sum(i.KOL_FAKT)  razn,'
      'i.SUM_SKL,'
      'sum(i.SUM_FAKT) SUM_FAKT,'
      ':nom nom'
      'from tmp.tinvent i,tmp.tkatalog k,tmp.tskladj j'
      'where i.plu=k.plu and j.skladid=:sklad'
      'and j.nom=i.nom'
      'and j.reg=1'
      'and j.tip=1'
      'and to_char(j.nom) like :nom'
      'and to_date(j.data,'#39'dd.mm.yyyy'#39')=to_date(:data,'#39'dd.mm.yyyy'#39')'
      'group by  i.plu,'
      'k.name,'
      'k.ed_izm,'
      'i.price,'
      'i.KOL_SKLAD,'
      'i.SUM_SKL'
      'order by k.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000050000003A444154410C0000000700000078670608010101
      00000000040000003A4E4F4D050000000000000000000000060000003A534B4C
      4144030000000000000000000000}
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
      030000000A00000003000000504C550100000000040000004E414D4501000000
      000600000045445F495A4D0100000000090000004B4F4C5F534B4C4144010000
      0000080000004B4F4C5F46414B5401000000000400000052415A4E0100000000
      05000000505249434501000000000700000053554D5F534B4C01000000000800
      000053554D5F46414B540100000000030000004E4F4D0100000000}
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
    Left = 224
    Top = 48
  end
  object selAct: TOracleDataSet
    SQL.Strings = (
      'select   '
      #9'a.oldplu,'
      #9'o.name oname,'
      #9'o.ed_izm,'
      #9'a.newplu,'
      #9'n.name nname,  '#9
      #9'a.oldprice,'
      #9'a.newprice,'
      #9'a.kolvo,'
      #9'a.sum,'
      #9':nom,'
      #9'j.data'
      #9
      'from     tmp.actprice a,'
      #9'tmp.tkatalog o,'
      #9'tmp.tkatalog n,'
      #9'tmp.actpricej j'
      'where  a.nom=:nom'
      #9'and a.oldplu=o.plu'
      #9'and a.newplu=n.plu'
      #9'and j.nom=a.nom'
      'order by id')
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
    QBEDefinition.QBEFieldDefs = {
      0300000009000000030000004E4F4D0100000000060000004F4C44504C550100
      000000050000004F4E414D450100000000060000004E4557504C550100000000
      050000004E4E414D450100000000080000004F4C445052494345010000000008
      0000004E455750524943450100000000050000004B4F4C564F01000000000300
      000053554D0100000000}
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
    Left = 283
    Top = 8
  end
  object QpriceJournal: TOracleDataSet
    SQL.Strings = (
      'select '
      'distinct p.plu,'
      '         t.name,'
      #9'p.oldprice,'
      '       p.newprice,'
      '       t.price,'
      '       j.owner'
      'from tmp.tkatalog t,'
      '        tmp.tprice p'
      '       ,tmp.tpricej j'
      'where p.plu=t.plu'
      '       and p.nom=j.nom'
      '      and j.reg=1'
      '      and j.data>=:d1'
      '     and j.data<=:d2'
      'order by name ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 328
    Top = 8
  end
  object kkmreport: TOracleDataSet
    SQL.Strings = (
      'select v.plu ,'
      't.name '#1090#1086#1074#1072#1088','
      't.ed_izm '#1077#1076'_'#1080#1079#1084','
      't.kat '#1082#1072#1090#1077#1075#1086#1088#1080#1103','
      't.minost '#1084#1080#1085'_'#1086#1089#1090#1072#1090#1086#1082','
      't.wes '#1084#1080#1085'_'#1079#1072#1082#1072#1079','
      'sum(pprice) '#1087#1088#1080#1093'_'#1094#1077#1085#1072','
      'nvl(sum(rprice),t.price) '#1088#1072#1089#1093'_'#1094#1077#1085#1072','
      'sum(pkolvo) '#1087#1086#1089#1090#1072#1074#1082#1080','
      'sum(kkolvo) '#1087#1088#1086#1076#1072#1078#1080','
      'sum(rkolvo) '#1085#1072#1082#1083#1072#1076#1085#1099#1077','
      'sum(ptotal) '#1087#1088#1080#1093'_'#1089#1091#1084#1084#1072','
      'sum(rtotal) '#1088#1072#1089#1093'_'#1089#1091#1084#1084#1072','
      'sum(bnal) '#1085#1072#1095'_'#1086#1089#1090#1072#1090#1086#1082','
      'sum(enal) '#1082#1086#1085'_'#1086#1089#1090#1072#1090#1086#1082','
      'sum(val) '#1074#1072#1083','
      'sum(maxprod) '#1084#1072#1082#1089'_'#1087#1088#1086#1076#1072#1078#1072
      'from tmp.vprihodrashod v,tmp.tkatalog t'
      'where v.plu=t.plu and t.export=1 and t.minost>0'
      'group by v.plu,t.name,t.ed_izm,t.kat,t.price,t.minost,t.wes'
      'order by t.kat,t.name        --sum(rkolvo) desc')
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
      030000000E00000003000000504C550100000000040000004E414D4501000000
      000600000045445F495A4D01000000000B00000053554D285050524943452901
      00000000180000004E564C2853554D28525052494345292C542E505249434529
      01000000000B00000053554D28504B4F4C564F2901000000000B00000053554D
      28524B4F4C564F2901000000000B00000053554D2850544F54414C2901000000
      000B00000053554D2852544F54414C290100000000030000004B415401000000
      00060000004D494E4F535401000000000900000053554D28424E414C29010000
      00000900000053554D28454E414C2901000000000800000053554D2856414C29
      0100000000}
    Cursor = crDefault
    ReadOnly = False
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
    Left = 240
    Top = 192
  end
  object qprice: TOracleDataSet
    SQL.Strings = (
      'select'
      #9'p.plu, '
      #9'p.oldprice,'
      #9'p.newprice,'
      #9'p.kolvo,'
      #9'p.sum,'
      #9'p.nom,'
      #9't.name name,'
      #9't.ed_izm,'
      #9'j.data'
      'from tmp.tprice p,tmp.tkatalog t,tmp.tpricej j'
      'where p.plu=t.plu'
      #9'and p.nom=:nom'
      #9'and j.nom=p.nom'
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
    Left = 288
    Top = 88
  end
  object kkmreportP: TOracleDataSet
    SQL.Strings = (
      'select v.plu '#1082#1086#1076','
      't.name '#1090#1086#1074#1072#1088','
      't.ed_izm '#1077#1076'_'#1080#1079#1084','
      't.kat '#1082#1072#1090#1077#1075#1086#1088#1080#1103','
      't.minost '#1084#1080#1085'_'#1086#1089#1090','
      'sum(pprice) '#1087#1088#1080#1093'_'#1094#1077#1085#1072','
      'nvl(sum(rprice),t.price) '#1088#1072#1089#1093'_'#1094#1077#1085#1072','
      'sum(pkolvo) '#1087#1088#1080#1093#1086#1076','
      'sum(kkolvo) '#1088#1072#1089#1093#1086#1076','
      'sum(rkolvo) '#1085#1072#1082#1083#1072#1076#1085#1099#1077','
      'sum(ptotal) '#1087#1088#1080#1093'_'#1089#1091#1084','
      'sum(rtotal) '#1088#1072#1089#1093'_'#1089#1091#1084','
      'sum(bnal) '#1085#1072#1095'_'#1086#1089#1090','
      'sum(enal) '#1082#1086#1085'_'#1086#1089#1090','
      'sum(val) '#1074#1072#1083','
      'sum(maxprod) '#1084#1072#1082#1089'_'#1087#1088#1086#1076#1072#1078#1072
      'from tmp.vproizwrashod v,tmp.tkatalog t'
      'where v.plu=t.plu and t.export=1 and t.minost>0'
      'group by v.plu,t.name,t.ed_izm,t.kat,t.price,t.minost'
      'order by t.kat,t.name        ')
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 280
    Top = 192
  end
  object QselKat: TOracleDataSet
    SQL.Strings = (
      'select k.name,k.kat'
      'from tmp.tkatalog t,tmp.tkat k'
      'where t.plu=:plu and'
      #9'k.kat=t.kat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000000B18000000000000}
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
      0300000002000000040000004E414D450100000000030000004B415401000000
      00}
    Cursor = crDefault
    Master = kkmreport
    MasterFields = 'plu'
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
    Left = 328
    Top = 192
    object QselKatNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object QselKatKAT: TIntegerField
      FieldName = 'KAT'
      Required = True
    end
  end
  object Qpostavki: TOracleDataSet
    SQL.Strings = (
      'select '
      'k.plu plu,t.name,t.ed_izm,to_date(k.data,'#39'dd.mm.yy'#39') data,'
      'p.cenasnds  pprice,'
      'k.cena,'
      'nvl(sum(k.prihod),0)  pkolvo,'
      'nvl(round(sum(k.prihod*p.cenasnds),2),0) ptotal,'
      'nvl(round(sum(k.prihod*k.cena),2),0) rtotal'
      ''
      'from tmp.kniga k,tmp.tkatalog t,tmp.tprihnakl p'
      'where '
      'k.otkat=0 and'
      'k.nom=p.nom and'
      'p.plu=k.plu '
      'and k.prihod>0'
      'and k.plu=t.plu'
      
        'and k.plu=:plu  --to_char(t.kat) like  ( select  value  from tmp' +
        '.toptions where parametr='#39'kat'#39')'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'group by  k.plu,p.cenasnds,t.name,k.cena,k.data,t.ed_izm'
      'order by t.name,k.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000001F03000000000000}
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
    Master = qpostplu
    MasterFields = 'plu'
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
    Left = 328
    Top = 120
  end
  object qpostplu: TOracleDataSet
    SQL.Strings = (
      'select distinct'
      'k.plu plu,t.name'
      'from tmp.kniga k,tmp.tkatalog t where '
      'k.otkat=0 and'
      'k.prihod>0 '
      'and k.plu=t.plu'
      'and t.kat=:kat'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'order by t.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4B415403000000040000004300000000000000}
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
    Master = Qpostkat
    MasterFields = 'kat'
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
    Left = 288
    Top = 120
  end
  object Qpostkat: TOracleDataSet
    SQL.Strings = (
      'select kat,'
      'name'
      'from tmp.tkat'
      'where'
      
        'to_char(kat) like  ( select  value  from tmp.toptions where para' +
        'metr='#39'kat'#39')'
      'ORDER BY NAME')
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 248
    Top = 120
  end
  object Qpostplusum: TOracleDataSet
    SQL.Strings = (
      'select'
      'nvl(sum(k.prihod),0)  pkolvo,'
      'nvl(round(sum(k.prihod*k.cena),2),0) rtotal'
      ',nvl(round(sum(k.prihod*p.cenasnds),2),0) ptotal'
      'from tmp.kniga k ,tmp.tprihnakl p'
      'where '
      'k.otkat=0 and'
      'k.prihod>0 and'
      'k.nom=p.nom '
      'and p.plu=k.plu '
      'and k.plu=:plu'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000006404000000000000}
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
    Master = qpostplu
    MasterFields = 'plu'
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
    Left = 248
    Top = 152
  end
  object qpostall: TOracleDataSet
    SQL.Strings = (
      'select'
      'nvl(round(sum(k.prihod*k.cena),2),0) rtotal'
      ',nvl(round(sum(k.prihod*p.cenasnds),2),0) ptotal'
      'from tmp.kniga k ,tmp.tprihnakl p,tmp.tkatalog t'
      'where '
      'k.otkat=0 and'
      'k.prihod>0 and'
      'k.nom=p.nom '
      'and p.plu=k.plu and'
      't.plu=k.plu'
      
        'and to_char(t.kat) like  ( select  value  from tmp.toptions wher' +
        'e parametr='#39'kat'#39')'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')')
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 288
    Top = 152
  end
  object qpostallkat: TOracleDataSet
    SQL.Strings = (
      'select'
      'nvl(sum(k.prihod),0)  pkolvo,'
      'nvl(round(sum(k.prihod*k.cena),2),0) rtotal'
      ',nvl(round(sum(k.prihod*p.cenasnds),2),0) ptotal'
      'from tmp.kniga k ,tmp.tprihnakl p,tmp.tkatalog t'
      'where '
      'k.otkat=0 and'
      'k.prihod>0 and'
      'k.nom=p.nom and'
      'p.plu=k.plu '
      'and k.plu=t.plu'
      'and t.kat =:kat'
      
        'and k.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4B415403000000040000006300000000000000}
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
    Master = Qpostkat
    MasterFields = 'kat'
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
    Left = 328
    Top = 152
  end
  object Qrashnom: TOracleDataSet
    SQL.Strings = (
      'select distinct p.plu,'
      #9#9'p.name,'
      #9#9'pr.name,'
      #9#9'v.name'
      
        ' from tmp.tprihnakl p,tmp.tkatalog t,tmp.tproizw pr,tmp.tpostav ' +
        'v'
      ' where nom=:nom'
      'and p.plu=t.plu'
      'and t.proizw=pr.proizw'
      'and v.cod=p.post'
      'order by p.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000006A04000000000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 184
    Top = 272
  end
  object qrashnakl: TOracleDataSet
    SQL.Strings = (
      'select '
      'to_date(min(j.data),'#39'dd.mm.yy'#39')  data,'
      'nvl(round(k.realprice,2),0) rprice,'
      ''
      'nvl(sum(k.kolvo),0) rkolvo,'
      ''
      'nvl(round(sum(k.total),2),0) rtotal'
      ' from tmp.kkmreport k,tmp.kkmj j'
      'where  k.doc=j.doc and '
      'k.plu =:plu'
      
        'and j.data >= (select to_date(value,'#39'dd.mm.yyyy'#39') from tmp.topti' +
        'ons where parametr='#39'begin'#39')'
      
        'and j.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      'group by  round(k.realprice,2)'
      'order by min(j.data)')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000005C04000000000000}
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
    Master = Qrashnom
    MasterFields = 'plu'
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
    Left = 224
    Top = 272
  end
  object nal: TOracleDataSet
    SQL.Strings = (
      'select k.plu,t.name,t.ed_izm,'
      'sum(k.sum) kolvo'
      
        '--,tmp.pricefromdate(k.plu,(select to_date(('#39'23:59 '#39'||value) ,'#39'h' +
        'h24:mi dd.mm.yyyy'#39') from tmp.toptions where parametr='#39'end'#39')) pri' +
        'ce,'
      
        '-- tmp.pricefromdate(k.plu,(select to_date(('#39'23:59 '#39'||value) ,'#39'h' +
        'h24:mi dd.mm.yyyy'#39') from tmp.toptions where parametr='#39'end'#39')) '
      '--* sum(k.sum)  sum'
      ''
      ' from'
      ' tmp.tkatalog t ,tmp.kniga k '
      'where k.plu=t.plu'
      'and k.otkat=0'
      
        'and k.data<= (select to_date(('#39'23:59 '#39'||value) ,'#39'hh24:mi dd.mm.y' +
        'yyy'#39') from tmp.toptions where parametr='#39'end'#39')'
      
        'and to_char(t.kat) like  ( select  value  from tmp.toptions wher' +
        'e parametr='#39'kat'#39')'
      'and k.skladid=:skladid'
      'group by  k.plu,t.name,t.kat,t.ed_izm'
      'order by t.kat,t.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A534B4C41444944030000000400000001000000
      00000000}
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
      000600000045445F495A4D0100000000050000004B4F4C564F0100000000}
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
    OnCalcFields = nalCalcFields
    Left = 392
    Top = 8
    object nalPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object nalNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object nalED_IZM: TStringField
      FieldName = 'ED_IZM'
      Size = 5
    end
    object nalKOLVO: TFloatField
      FieldName = 'KOLVO'
    end
    object nalsum: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sum'
      Calculated = True
    end
    object nalprice: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'price'
      Calculated = True
    end
  end
  object chartreport: TOracleDataSet
    SQL.Strings = (
      'select to_date(j.data,'#39'dd.mm.yy'#39'),sum(k.total) from '
      'tmp.kkmj j,tmp.kkmreport k,tmp.tkatalog t'
      'where'
      'j.doc=k.doc and'
      't.plu=k.plu'
      'and to_char(t.kat) like :kat'
      'and  to_char(j.data,'#39'mm.yy'#39')= to_char(:data,'#39'mm.yy'#39')'
      'group by to_date(j.data,'#39'dd.mm.yy'#39')'
      'order by to_date(j.data,'#39'dd.mm.yy'#39')')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4B415405000000020000003100000000000500
      00003A444154410C000000070000007867050101010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 392
    Top = 56
  end
  object wisyak: TOracleDataSet
    SQL.Strings = (
      'select   k.plu,T.NAME,t.ed_izm,'
      '          k.partost,k.partost*k.cena SUMMA,'
      '         K.DATA,'
      
        '        min(p.data)  PDATA,:days,(select sum(s.sum) from tmp.kni' +
        'ga s where s.plu=k.plu and s.otkat=0 '
      
        '                                                      --and s.da' +
        'ta<=:maxdata and'
      #9#9#9#9#9#9#9#9'and s.skladid=:sklad  ) ostatok'
      ' from tmp.kniga k,tmp.tpart p,TMP.TKATALOG T'
      'where k.plu=p.plu(+) '
      'AND K.PLU=T.PLU'
      'and k.otkat=0'
      'and k.prihod>0'
      'and p.data(+)>k.data'
      'and k.data>=:MINDATA'
      'and K.data<=:MAXDATA'
      'and k.partost>0'
      'and k.skladid=:sklad'
      'and to_char(t.kat) like :kat'
      'and k.data<(:maxdata-:days)'
      'HAVING nvl(min(p.data),sysdate)> k.data'
      'AND nvl(min(p.data),sysdate)-K.DATA>(:days+1)'
      'group by k.plu,K.DATA,T.NAME,t.kat,k.partost,k.cena,t.ed_izm'
      'order by t.name,t.kat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000080000003A4D494E444154410C0000000700000078670501
      01010100000000080000003A4D4158444154410C000000070000007867060101
      010100000000040000003A4B4154050000000200000031000000000005000000
      3A44415953030000000000000000000000060000003A534B4C41440300000000
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
    Left = 392
    Top = 120
  end
  object sroky: TOracleDataSet
    SQL.Strings = (
      'select k.plu,t.name,k.data,k.life,k.partost,t.ed_izm  '
      'from tmp.kniga k,tmp.tkatalog t '
      'where t.plu=k.plu'
      'and t.kat like :kat and k.partost>=1'
      
        ' and prihod>0 and otkat=0 and k.life<=(sysdate+round(t.life/10,0' +
        '))'
      'order by t.name,k.life')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4B41540500000002000000250000000000}
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
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 392
    Top = 264
  end
  object frCSVExport1: TfrCSVExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    ExportFrames = True
    Delimiter = ';'
    Left = 328
    Top = 40
  end
  object frTextExport1: TfrTextExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    ExportFrames = True
    Left = 328
    Top = 72
  end
  object frRTFExport1: TfrRTFExport
    ScaleX = 1.300000000000000000
    ScaleY = 1.000000000000000000
    ExportFrames = True
    ExportBitmaps = True
    Left = 296
    Top = 40
  end
  object frHTMExport1: TfrHTMExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 440
    Top = 40
  end
  object prihodrashod: TOracleDataSet
    SQL.Strings = (
      
        'select (select sum(prihod) from tmp.kniga where plu=:plu and otk' +
        'at=0 and data<:data and data>(select to_date(o.value,'#39'dd.mm.yyyy' +
        #39') from tmp.toptions o where o.parametr='#39'begin'#39') ) prihod,'
      
        '          (select sum(rashod) from tmp.kniga where plu=:plu and ' +
        'otkat=0 and data<:data and data>(select to_date(o.value,'#39'dd.mm.y' +
        'yyy'#39') from tmp.toptions o where o.parametr='#39'begin'#39') ) rashod,'
      
        #9'(select sum(sum) from tmp.kniga where plu=:plu and otkat=0 and ' +
        'data<:data)  ostatok,      '
      
        '           (select prihod from tmp.kniga where plu=:plu and nom=' +
        ':nom) nakl,'
      
        #9'(select to_date(o.value,'#39'dd.mm.yyyy'#39') from tmp.toptions o where' +
        ' o.parametr='#39'begin'#39') ndata,'
      '           :data'
      ''
      ''
      'from dual')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000040000003A504C5503000000040000003409000000000000
      050000003A444154410C00000007000000786705010101010000000004000000
      3A4E4F4D03000000040000006A04000000000000}
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
    Master = Qrashnom
    MasterFields = 'plu'
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
    Left = 264
    Top = 272
  end
  object hourreport: TOracleDataSet
    SQL.Strings = (
      
        'select :day,:day1,'#39'8-9'#39',count(1),sum(sum) from pos.arc_report wh' +
        'ere id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd.m' +
        'm.yyyy'#39')'
      
        ' and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24' +
        ':mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'08'#39
      'union all'
      
        'select :day,:day1,'#39'9-10'#39',count(1),sum(sum) from pos.arc_report w' +
        'here id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd.' +
        'mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'09'#39
      'union all'
      
        'select :day,:day1,'#39'10-11'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'10'#39
      'union all'
      
        'select :day,:day1,'#39'11-12'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'11'#39
      'union all'
      
        'select :day,:day1,'#39'12-13'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'12'#39
      'union all'
      
        'select :day,:day1,'#39'13-14'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'13'#39
      'union all'
      
        'select :day,:day1,'#39'14-15'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'14'#39
      'union all'
      
        'select :day,:day1,'#39'15-16'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39') '
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'15'#39
      'union all'
      
        'select :day,:day1,'#39'16-17'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'16'#39
      'union all'
      
        'select :day,:day1,'#39'17-18'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'17'#39
      'union all'
      
        'select :day,:day1,'#39'18-19'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'18'#39
      'union all'
      
        'select :day,:day1,'#39'19-20'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'19'#39
      'union all'
      
        'select :day,:day1,'#39'20-21'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'20'#39
      'union all'
      
        'select :day,:day1,'#39'21-22'#39',count(1),sum(sum) from pos.arc_report ' +
        'where id = 55 and   to_date(data,'#39'dd.mm.yyyy'#39')>=to_date(:day,'#39'dd' +
        '.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'21'#39)
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4441590C0000000700000078670C1F01010100
      000000050000003A444159310C000000070000007868010101010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 504
    Top = 24
  end
  object hourrep2: TOracleDataSet
    SQL.Strings = (
      
        'select :day,:day1,'#39'8-9'#39',max(count(1)),round(avg(count(1)),2) fro' +
        'm pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39')>' +
        '=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        ' and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24' +
        ':mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'08'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'9-10'#39',max(count(1)),round(avg(count(1)),2) fr' +
        'om pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39')' +
        '>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'09'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'10-11'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'10'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'11-12'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'11'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'12-13'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'12'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'13-14'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'13'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'14-15'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'14'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'15-16'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39') '
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'15'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'16-17'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'16'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'17-18'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'17'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'18-19'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'18'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'19-20'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'19'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'20-21'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'20'#39
      'group by chek'
      'union all'
      
        'select :day,:day1,'#39'21-22'#39',max(count(1)),round(avg(count(1)),2) f' +
        'rom pos.arc_report where id = 11 and   to_date(data,'#39'dd.mm.yyyy'#39 +
        ')>=to_date(:day,'#39'dd.mm.yyyy'#39')'
      
        'and   to_date(data,'#39'dd.mm.yyyy'#39')<=to_date('#39'23:59 '#39'||:day1,'#39'hh24:' +
        'mi dd.mm.yyyy'#39') and to_char(data,'#39'hh24'#39')='#39'21'#39
      'group by chek')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4441590C0000000700000078670C1F01010100
      000000050000003A444159310C000000070000007868010101010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 504
    Top = 64
  end
  object cheksummreport: TOracleDataSet
    SQL.Strings = (
      'select sum from pos.arc_report p,tmp.vkassachek v '
      
        'where p.id=55 and p.chek=v.chek and p.kassa=v.kassa and to_date(' +
        'p.data,'#39'dd.mm.yyyy'#39')=v.data'
      'order by sum')
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
    Left = 496
    Top = 120
  end
  object topten: TOracleDataSet
    SQL.Strings = (
      'select * from tmp.toptovar where rownum<11')
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
    Left = 496
    Top = 152
  end
  object sumpostprim: TOracleDataSet
    SQL.Strings = (
      'select p.name name,k.name post_name,'
      #9'sum(j.sum) summa,'
      #9#39' '#39' prim ,'
      #9':nd,:kd'
      'from tmp.tprihj j,tmp.tpostav p,tmp.tpostav k '
      'where j.ppost=p.cod and j.post=k.cod'
      'and data>=:nd and data<=:kd'
      'group by p.name,k.name'
      'union all'
      'select '#39'1 '#1087#1086#1089#1090#1072#1074#1082#1080' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#39',p.name,'
      #9'sum(j.sum) summa,'
      #9#39' '#39' prim ,'
      #9':nd,:kd'
      'from tmp.tprihj j,tmp.tpostav p '
      'where j.post=p.cod'
      'and j.post=j.ppost'
      'and data>=:nd and data<=:kd'
      'group by p.name'
      'union all'
      'select '#39'2 '#1087#1088#1103#1084#1099#1077' '#1087#1086#1089#1090#1072#1074#1082#1080#39',p.name,'
      #9'sum(j.sum) summa,'
      #9#39' '#39' prim ,'
      #9':nd,:kd'
      'from tmp.tprihj j,tmp.tpostav p '
      'where j.post=p.cod'
      'and j.post<>j.ppost'
      'and data>=:nd and data<=:kd'
      'group by p.name'
      'order by name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000030000003A4E440C00000007000000786905010101010000
      0000030000003A4B440C000000070000007869051F01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 504
    Top = 232
  end
  object qposttovar: TOracleDataSet
    SQL.Strings = (
      'select k.plu,k.name,k.ed_izm,p.name post_name,:nd,:kd,'
      '  j.data,'
      '  k.kol_vo prihod,'
      '  k.cenasnds  pprice,'
      '  k.cenareal cena,'
      '  k.kol_vo*k.cenasnds vxsumma,'
      '  k.kol_vo*k.cenareal prsumma'
      ' from tmp.tprihnakl k,tmp.tprihj j,tmp.tpostav p  where'
      'j.nom=k.nom and p.cod=j.ppost and j.reg=1'
      'and j.ppost=:post and j.data>=:nd and j.data<=:kd'
      'union all'
      'select k.plu,k.name,k.ed_izm,p.name post_name,:nd,:kd,'
      '  sysdate data,'
      '  sum(k.kol_vo) prihod,'
      '  null pprice,'
      '  null cena,'
      '  sum(k.kol_vo*k.cenasnds) vxsumma,'
      '  sum(k.kol_vo*k.cenareal) prsumma'
      ' from tmp.tprihnakl k,tmp.tprihj j,tmp.tpostav p where'
      'j.nom=k.nom and p.cod=j.ppost and j.reg=1'
      'and j.ppost=:post and j.data>=:nd and j.data<=:kd'
      'group by k.plu,k.name,p.name,k.ed_izm'
      'union all'
      'select null plu,'#39#1103#1103#1103#1103#39' name,'#39' '#39' ed_izm,p.name post_name,:nd,:kd,'
      '  sysdate data,'
      '  null prihod,'
      '  null pprice,'
      '  null cena,'
      '  sum(k.kol_vo*k.cenasnds) vxsumma,'
      '  sum(k.kol_vo*k.cenareal) prsumma'
      ' from tmp.tprihnakl k,tmp.tprihj j,tmp.tpostav p  where'
      'j.nom=k.nom and p.cod=j.ppost and j.reg=1'
      'and j.ppost=:post and j.data>=:nd and j.data<=:kd'
      'group by p.name'
      'order by name,data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000050000003A504F535403000000040000004A030000000000
      00030000003A4E440C000000070000007869050101010100000000030000003A
      4B440C0000000700000078690C0101010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 504
    Top = 272
  end
  object skidka: TOracleDataSet
    SQL.Strings = (
      'select :day1 day1,:day2-1 day2,'
      #9'p.plu,'
      #9't.name,t.ed_izm,'
      #9'v.procent,'
      #9'sum(p.quantity),'
      #9'sum(p.sum),'
      #9'(sum(p.sum)-(sum(p.sum)/100*v.procent)) dsum,'
      #9'sum(p.sum)-(sum(p.sum)-(sum(p.sum)/100*v.procent)) skidka '
      'from pos.arc_report p,tmp.vdiscount v,tmp.tkatalog t'
      'where p.id in (11,12) and p.chek=v.chek'
      'and p.kassa=v.kassa'
      'and to_char(p.data,'#39'dd.mm.yyyy'#39')=to_char(v.data,'#39'dd.mm.yyyy'#39')'
      'and t.plu(+)=p.plu and v.data>=:day1'
      'and v.data<:day2 '
      'group by p.plu,t.name,v.procent,t.ed_izm'
      ''
      ''
      'order by v.procent,sum(p.quantity) desc')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444159310C0000000700000078680A0F010101
      00000000050000003A444159320C0000000700000078680A1001010100000000}
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
      000700000050524F43454E5401000000000F00000053554D28502E5155414E54
      4954592901000000000A00000053554D28502E53554D29010000000004000000
      4453554D010000000006000000534B49444B410100000000}
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
    Left = 560
    Top = 24
  end
  object sumdiscount: TOracleDataSet
    SQL.Strings = (
      'select quantity,sum(sum) summa'
      '    from pos.arc_report'
      '    where id=37 and stornoflag=999'
      '    and data>=:day1'
      '    and data<:day2'
      '   group by quantity')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444159310C0000000700000078680A0E010101
      00000000050000003A444159320C0000000700000078680A0F01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 560
    Top = 64
  end
  object daydiscount: TOracleDataSet
    SQL.Strings = (
      'select to_char(data,'#39'mm.dd'#39') d,quantity,'#9'sum(sum),count(id)'
      'from pos.arc_report '
      'where id=37 and stornoflag=999'
      'and data>=:day1'
      'and data<:day2'
      'group by to_char(data,'#39'mm.dd'#39'),quantity'
      'union'
      'select '#39#1074#1089#1077#1075#1086':'#39',quantity,'#9'sum(sum),count(id)'
      'from pos.arc_report '
      'where id=37 and stornoflag=999'
      'and data>=:day1'
      'and data<:day2'
      'group by quantity'
      'order by quantity,d')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444159310C0000000700000078680A01010101
      00000000050000003A444159320C0000000700000078680A1E01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 576
    Top = 128
  end
  object pensdiscount: TOracleDataSet
    SQL.Strings = (
      
        'select to_char(data,'#39'day dd.mm'#39'),to_char(data,'#39'mm.dd'#39'),sum(sum) ' +
        #1089#1091#1084#1084#1072
      'from pos.arc_report '
      'where id=37 and stornoflag=999 and quantity=4.01'
      'and data>=:day1'
      'and data<:day2'
      'group by to_char(data,'#39'day dd.mm'#39'),to_char(data,'#39'mm.dd'#39')'
      'order by to_char(data,'#39'mm.dd'#39')')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444159310C0000000700000078680A01010101
      00000000050000003A444159320C0000000700000078680A1E01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 576
    Top = 168
  end
  object chekdiscount: TOracleDataSet
    SQL.Strings = (
      'select to_char(data,'#39'day dd.mm'#39'),to_char(data,'#39'mm.dd'#39'),count(1)'
      'from pos.arc_report '
      'where id=37 and stornoflag=999 and quantity=4.01'
      'and data>=:day1'
      'and data<:day2'
      'group by to_char(data,'#39'day dd.mm'#39'),to_char(data,'#39'mm.dd'#39')'
      'order by to_char(data,'#39'mm.dd'#39')')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A444159310C0000000700000078680A01010101
      00000000050000003A444159320C0000000700000078680A1E01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 576
    Top = 208
  end
  object qprodtovar: TOracleDataSet
    SQL.Strings = (
      'select k.plu, t.name,t.ed_izm,'
      #9'nvl(sum(k.pkolvo),0) prihod,'
      #9'nvl(sum(k.rkolvo),0)rashod,'
      '     t.price,'
      #9'sum(k.ptotal) psumma,'
      '  '#9'nvl(sum(k.rtotal),0) rsumma ,'
      #9'sum(k.eost) ost,'
      #9':nd,:kd,p.name'
      'from tmp.postprihodrashod k,tmp.tkatalog t,tmp.tpostav p'
      'where'
      't.plu=k.plu'
      'and p.cod=:post'
      'group by k.plu ,t.name,t.ed_izm,t.price,p.name'
      'order by t.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000050000003A504F5354030000000400000026090000000000
      00030000003A4E440C000000070000007869050101010100000000030000003A
      4B440C000000070000007869050A01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 440
    Top = 272
  end
  object rashodF: TOracleDataSet
    SQL.Strings = (
      
        'select r.plu,p.name,p.ed_izm,p.cenabnds vhcenabnds,p.CENASNDS vh' +
        'cena,p.data datap,p.nn nomdocp,p.KRASN_ID,r.kol_vo,'
      
        'r.CENABNDS,r.CENASNDS,c.nds,r.data,r.nn,s.name ip,k.name pokup,j' +
        '.prim'
      'from tmp.tprihnakl p,tmp.trashnakl r,tmp.tkatalog c,'
      'tmp.tsklad s,tmp.tpostav k,tmp.trashj j'
      'where r.nom=:nom'
      'and c.plu=r.plu and r.nom=j.nom'
      'and p.plu =r.plu'
      'and s.skladid=r.skladid'
      'and k.cod=r.post'
      
        'and p.data=(select max(n.data) from tmp.tprihnakl n where plu=r.' +
        'plu)'
      'order by r.id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000007DE3000000000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 8
    Top = 288
  end
  object rashodf1: TOracleDataSet
    SQL.Strings = (
      
        'select r.plu,p.name,p.ed_izm,p.cenabnds vhcenabnds,p.CENASNDS vh' +
        'cena,p.data datap,p.nn nomdocp,p.KRASN_ID,r.kol_vo,'
      
        'r.CENABNDS,r.CENASNDS,c.nds,r.data,r.nn,s.name ip,k.name pokup,j' +
        '.prim'
      'from tmp.tprihnakl p,tmp.trashnakl r,tmp.tkatalog c,'
      'tmp.tsklad s,tmp.tpostav k,tmp.trashj j'
      'where r.nom=:nom'
      'and c.plu=r.plu and r.nom=j.nom'
      'and p.plu =r.plu'
      'and s.skladid=r.skladid'
      'and k.cod=r.post'
      'and p.nom=r.rossip'
      'order by r.id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4E4F4D03000000040000008AE9000000000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 48
    Top = 288
  end
  object kassreport: TOracleDataSet
    SQL.Strings = (
      'select :nd,:kd,'
      'r.plu,t.name,t.ed_izm,t.price,sum(r.kolvo),sum(r.total)'
      'from tmp.kkmreport r,tmp.tkatalog t,tmp.kkmj j,tmp.vkat v'
      'where'
      'r.doc=j.doc and j.skladid=:sklad and'
      'j.data>:nd and j.data<:kd'
      'AND r.plu=t.plu'
      'and t.kat=v.kat'
      'group by r.plu,t.name,t.ed_izm,t.price'
      'order by  t.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000060000003A534B4C41440300000004000000010000000000
      0000030000003A4E440C00000007000000786905010101010000000003000000
      3A4B440C000000070000007869051F01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 584
    Top = 272
  end
  object Qoplata: TOracleDataSet
    SQL.Strings = (
      'select :d1,:d2-1,'#39#1040#1083#1100#1092#1072'-'#1073#1072#1085#1082#39' '#1086#1087#1083#1072#1090#1072','
      'count(1) '#1095#1077#1082#1080','
      'sum(sum-quantity)/count(1) '#1089#1088'_'#1089#1091#1084#1084#1072
      'from pos.arc_report'
      'where id in (40,41) and departament=2'
      'and data>:d1 and data<:d2'
      'UNION ALL'
      'select :d1,:d2-1,'#39#1057#1077#1074'.'#1082#1072#1079#1085#1072#39','
      'count(1),'
      'sum(sum-quantity)/count(1)'
      'from pos.arc_report'
      'where id in (40,41) and departament=3'
      'and data>:d1 and data<:d2'
      'UNION ALL'
      'select :d1,:d2-1,'#39#1085#1072#1083#1080#1095#1085#1099#1077#39','
      'count(1),'
      'sum(sum-quantity)/count(1)'
      'from pos.arc_report'
      'where id in (40,41) and departament=1'
      'and data>:d1 and data<:d2')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000030000003A44310C00000007000000786905010101010000
      0000030000003A44320C000000070000007869060101010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 632
    Top = 24
  end
  object sumPost: TOracleDataSet
    SQL.Strings = (
      'select p.cod,p.name,:nd,:kd,'
      
        '      round(sum(k.prihod*k.cena),2) post, round(sum(k.prihod*k.c' +
        'ena)-sum(k.partost*k.cena),2) prod,round(sum(k.partost*k.cena),2' +
        ') nal'
      'from tmp.tprihj pj,'
      '      tmp.kniga k,'
      '      tmp.tpostav p'
      'where  pj.data >=:nd'
      'and pj.data<=:kd '
      'and pj.nom=k.nom'
      'and p.cod=pj.ppost'
      'group by p.cod,p.name'
      'order by p.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000030000003A4E440C00000007000000786905010101010000
      0000030000003A4B440C000000070000007869051F01010100000000}
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
    Session = DM.OraBase
    DesignActivation = False
    Active = False
    Left = 656
    Top = 272
  end
end
