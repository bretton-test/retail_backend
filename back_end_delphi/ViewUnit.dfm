object ViewForm: TViewForm
  Left = 248
  Top = 175
  Width = 754
  Height = 448
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'ViewForm'
  Color = clWindow
  Ctl3D = False
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 171
      Height = 16
      Caption = #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 264
      Top = 8
      Width = 15
      Height = 16
      Caption = #1086#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 89
      Height = 16
      Caption = #1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 472
      Top = 8
      Width = 62
      Height = 16
      Caption = #1085#1072' '#1057#1082#1083#1072#1076
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 416
      Top = 34
      Width = 75
      Height = 16
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 559
      Top = 60
      Width = 149
      Height = 13
      Caption = #1074#1099#1073#1086#1088' '#1094#1077#1085#1085#1080#1082#1086#1074', '#1096#1090#1088#1080#1093#1082#1086#1076#1086#1074
    end
    object Label7: TLabel
      Left = 368
      Top = 63
      Width = 8
      Height = 16
      Caption = '1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 8
      Top = 56
      Width = 68
      Height = 16
      Caption = #1089#1086' '#1089#1082#1083#1072#1076#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object SpeedButton2: TSpeedButton
      Left = 688
      Top = 30
      Width = 23
      Height = 20
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object datanakl: TDateTimePicker
      Left = 288
      Top = 8
      Width = 121
      Height = 19
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 37305.025575451400000000
      Time = 37305.025575451400000000
      DateFormat = dfLong
      TabOrder = 1
    end
    object osnedit: TEdit
      Left = 112
      Top = 32
      Width = 297
      Height = 19
      TabOrder = 2
      OnKeyPress = numberedKeyPress
    end
    object sklad: TDBLookupComboboxEh
      Left = 544
      Top = 8
      Width = 121
      Height = 17
      EditButtons = <>
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListSource = DM.skladds
      TabOrder = 4
      Visible = True
    end
    object postname: TEdit
      Left = 112
      Top = 56
      Width = 225
      Height = 19
      ReadOnly = True
      TabOrder = 3
    end
    object numbered: TEdit
      Left = 184
      Top = 8
      Width = 73
      Height = 19
      TabOrder = 0
      OnKeyPress = numberedKeyPress
    end
    object wesbox: TCheckBox
      Left = 540
      Top = 60
      Width = 14
      Height = 17
      Hint = #1042#1099#1073#1086#1088' '#1094#1077#1085#1085#1080#1082#1086#1074
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = wesboxClick
    end
    object ppostname: TEdit
      Left = 496
      Top = 31
      Width = 193
      Height = 19
      ReadOnly = True
      TabOrder = 6
    end
  end
  object dbgrid: TDBGridEh
    Left = 0
    Top = 81
    Width = 746
    Height = 307
    Align = alClient
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    AutoFitColWidths = True
    DataSource = DataSource1
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 2
    OptionsEh = [dghHighlightFocus, dghClearSelection]
    RowHeight = 16
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    UseMultiTitle = True
    OnCellClick = dbgridCellClick
    OnDrawColumnCell = dbgridDrawColumnCell
    OnKeyPress = dbgridKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PLU'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1076
        Width = 34
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
          end>
        FieldName = 'NAME'
        Footer.FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 160
      end
      item
        EditButtons = <>
        FieldName = 'ED_IZM'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1077#1076'.'#1080#1079#1084
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'KOL_VO'
        Footer.FieldName = 'KOL_VO'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1082#1086#1083'-'#1074#1086' '#1074#1089#1077#1075#1086
        Width = 40
        WordWrap = True
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <
          item
            Style = ebsEllipsisEh
          end>
        FieldName = 'CENABNDS'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072
        Width = 45
        WordWrap = True
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <
          item
            Style = ebsEllipsisEh
          end>
        FieldName = 'CENASNDS'
        Footers = <>
        Title.Caption = #1094#1077#1085#1072' +'#1085#1076#1089
        Width = 44
        WordWrap = True
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'TOTAL'
        Footer.FieldName = 'TOTAL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 60
        WordWrap = True
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'PTOTAL'
        Footer.FieldName = 'PTOTAL'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1089#1091#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <
          item
            Style = ebsEllipsisEh
          end>
        FieldName = 'CENAREAL'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1062#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080
        Width = 52
        WordWrap = True
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'life'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1075#1086#1076#1077#1085' '#1076#1086
        Width = 58
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'CENAWZALE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1094#1077#1085#1072' '#1074' '#1079#1072#1083#1077
        Width = 51
      end
      item
        DisplayFormat = '0.##" '#1088'."'
        EditButtons = <>
        FieldName = 'WESY'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1062#1077#1085#1072' '#1074' '#1074#1077#1089#1072#1093
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'ostatok'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1042' '#1053#1072#1083#1080#1095#1080#1080
        Visible = False
        Width = 51
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 388
    Width = 746
    Height = 26
    Align = alBottom
    BevelOuter = bvLowered
    BevelWidth = 2
    TabOrder = 2
    object cancel: TSpeedButton
      Left = 673
      Top = 3
      Width = 70
      Height = 20
      Cursor = crHandPoint
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = cancelClick
    end
    object ok: TSpeedButton
      Left = 590
      Top = 4
      Width = 83
      Height = 19
      Cursor = crHandPoint
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
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
      OnClick = okClick
    end
    object PrintB: TBitBtn
      Left = 1
      Top = 3
      Width = 65
      Height = 20
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = PrintBClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 65
      Top = 3
      Width = 116
      Height = 20
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1050#1072#1089#1089#1099
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 180
      Top = 3
      Width = 57
      Height = 20
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object CenButton: TBitBtn
      Left = 236
      Top = 3
      Width = 52
      Height = 20
      Caption = #1062#1077#1085#1085#1080#1082
      TabOrder = 2
      OnClick = CenButtonClick
      NumGlyphs = 2
    end
    object BarBtn: TBitBtn
      Left = 287
      Top = 3
      Width = 59
      Height = 20
      Caption = #1064#1090#1088#1080#1093#1082#1086#1076
      TabOrder = 3
      OnClick = BarClick
    end
    object BitBtn3: TBitBtn
      Left = 345
      Top = 3
      Width = 58
      Height = 20
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 402
      Top = 3
      Width = 60
      Height = 20
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 6
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 461
      Top = 3
      Width = 50
      Height = 20
      Caption = #1054#1090#1095#1077#1090
      TabOrder = 7
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 510
      Top = 3
      Width = 69
      Height = 20
      Caption = #1091#1089#1090'.'#1087#1086#1089#1090#1072#1074#1097'.'
      TabOrder = 8
      OnClick = BitBtn6Click
    end
  end
  object Qnakl: TOracleDataSet
    SQL.Strings = (
      'select nn,'
      #9'n.post,'
      #9'pokup,'
      #9'data,'
      #9'n.name,'
      #9'n.ed_izm,'
      #9'n.kol_vo,'
      #9'cenabnds,'
      #9'cenasnds,'
      #9'cenareal,'
      #9'total,n.life,'
      #9'skladid,'
      #9'n.plu,'
      #9'cenawzale,'
      #9'max(w.price)  wesy,'
      #9'nvl(t.price,0) nal,'
      #9'n.id,'
      #9'nvl(k.nds,0) nds,n.krasn_id'
      'from tmp.tprihnakl n,pos.tovar t,pos.caslp w,tmp.tkatalog k'
      #9'where n.plu=t.plu(+) '
      #9'and n.plu=w.icode(+)'
      #9'and n.plu=k.plu(+)'
      #9'and n.nom=:nom'
      'group by nn,'
      #9'n.post,'
      #9'pokup,'
      #9'data,'
      #9'n.name,'
      #9'n.ed_izm,'
      #9'n.kol_vo,'
      #9'cenabnds,'
      #9'cenasnds,'
      #9'cenareal,'
      #9'total,n.life,'
      #9'skladid,'
      #9'n.plu,'
      #9'cenawzale,'
      #9'nvl(t.price,0),'
      #9'n.id,'
      #9'nvl(k.nds,0),n.krasn_id'
      #9
      'order by n.id')
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
      0300000014000000020000004E4E010000000004000000504F53540100000000
      05000000504F4B5550010000000004000000444154410100000000040000004E
      414D4501000000000600000045445F495A4D0100000000060000004B4F4C5F56
      4F01000000000800000043454E41424E445301000000000800000043454E4153
      4E445301000000000800000043454E415245414C010000000005000000544F54
      414C010000000007000000534B4C41444944010000000003000000504C550100
      0000000900000043454E41575A414C4501000000000400000057455359010000
      0000030000004E414C01000000000200000049440100000000030000004E4453
      0100000000080000004B5241534E5F49440100000000040000004C4946450100
      000000}
    Cursor = crDefault
    ReadOnly = True
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
    OnCalcFields = QnaklCalcFields
    Left = 584
    Top = 144
    object QnaklNN: TIntegerField
      FieldName = 'NN'
      Required = True
      Visible = False
    end
    object QnaklPOST: TIntegerField
      FieldName = 'POST'
      Required = True
      Visible = False
    end
    object QnaklPOKUP: TIntegerField
      FieldName = 'POKUP'
      Required = True
      Visible = False
    end
    object QnaklDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
      Visible = False
    end
    object QnaklNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 52
    end
    object QnaklED_IZM: TStringField
      FieldName = 'ED_IZM'
      Required = True
      Size = 5
    end
    object QnaklKOL_VO: TFloatField
      FieldName = 'KOL_VO'
      Required = True
    end
    object QnaklCENABNDS: TFloatField
      FieldName = 'CENABNDS'
      Required = True
      currency = True
    end
    object QnaklCENASNDS: TFloatField
      FieldName = 'CENASNDS'
      Required = True
      currency = True
    end
    object QnaklCENAREAL: TFloatField
      FieldName = 'CENAREAL'
      Required = True
      currency = True
    end
    object QnaklTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object QnaklSKLADID: TIntegerField
      FieldName = 'SKLADID'
      Required = True
      Visible = False
    end
    object QnaklPLU: TFloatField
      FieldName = 'PLU'
      Required = True
    end
    object QnaklCENAWZALE: TFloatField
      FieldName = 'CENAWZALE'
      Required = True
      Visible = False
      currency = True
    end
    object QnaklWESY: TFloatField
      FieldName = 'WESY'
      currency = True
    end
    object QnaklNAL: TFloatField
      FieldName = 'NAL'
    end
    object QnaklID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object QnaklNDS: TStringField
      FieldName = 'NDS'
      Required = True
      Visible = False
      Size = 2
    end
    object QnaklKRASN_ID: TStringField
      FieldName = 'KRASN_ID'
      Required = True
      Visible = False
      Size = 12
    end
    object QnaklPTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PTOTAL'
      Calculated = True
    end
    object QnaklLIFE: TDateTimeField
      FieldName = 'LIFE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDS
    Left = 200
    Top = 152
  end
  object ClientDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = ClientDSBeforePost
    Left = 256
    Top = 152
  end
  object QgetOld: TOracleDataSet
    SQL.Strings = (
      'select   n.nn,'
      #9'n.data,'
      #9'nvl(n.prim,'#39'-'#39') prim,'
      #9'n.owner,'
      #9'n.skladid,'
      #9'n.post_name,'
      #9'n.nom,n.ppost'
      'from tmp.tprihj n'
      'where n.nom=:nom')
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
    Left = 520
    Top = 144
  end
  object pm1: TPopupMenu
    Left = 152
    Top = 168
    object N1: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
      Enabled = False
      Visible = False
      OnClick = N7Click
    end
  end
  object strihmenu: TPopupMenu
    Left = 408
    Top = 160
    object N8: TMenuItem
      Caption = #1085#1072' '#1041#1091#1084#1072#1075#1077
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #1085#1072' '#1051#1077#1085#1090#1077
      OnClick = N9Click
    end
    object N14: TMenuItem
      Caption = #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
      OnClick = N14Click
    end
    object N3: TMenuItem
      Caption = #1085#1072' '#1041#1091#1084#1072#1075#1077' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnClick = N3Click
    end
  end
  object Qprint: TOracleQuery
    SQL.Strings = (
      'update pos.tovar set '
      'quantityout=:kolvo'
      'where plu=:plu'
      'and quantityout=0')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A4B4F4C564F0300000000000000000000000400
      00003A504C55030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 584
    Top = 200
  end
  object pmr: TPopupMenu
    Left = 392
    Top = 240
    object N10: TMenuItem
      Caption = #1088#1072#1089#1093#1086#1076' '#1095#1077#1088#1077#1079' '#1082#1072#1089#1089#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      OnClick = N10Click
    end
    object N13: TMenuItem
      Caption = #1087#1088#1080#1093#1086#1076','#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      OnClick = N13Click
    end
  end
  object expmenu: TPopupMenu
    Left = 264
    Top = 232
    object N11: TMenuItem
      Caption = #1057#1077#1090#1100
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #1044#1080#1089#1082#1077#1090#1072
      OnClick = N12Click
    end
  end
  object qwesprint: TOracleQuery
    SQL.Strings = (
      ' update tmp.tbarcode '
      ' set barcode=:barcode '
      ' where plu=:plu  '
      
        ' and barcode=(select to_char(max(to_number(barcode))) from tmp.t' +
        'barcode where plu=:plu)')
    Session = DM.OraBase
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
    Left = 520
    Top = 200
  end
  object UpPrihod: TOracleQuery
    SQL.Strings = (
      'update tmp.tprihnakl'
      #9'set cenabnds=:cenabnds,'
      #9'    cenasnds=:cenasnds,'
      #9#9'total=:total'
      'where nom=:nom'
      #9'and id=:id'#9#9)
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000090000003A43454E41424E44530400000000000000000000
      00090000003A43454E41534E4453040000000000000000000000060000003A54
      4F54414C040000000000000000000000040000003A4E4F4D0400000000000000
      00000000030000003A4944040000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 520
    Top = 256
  end
  object UpKniga: TOracleQuery
    SQL.Strings = (
      'update tmp.kniga'
      #9'set pprice=:cenasnds'
      'where plu=:plu'
      #9'and nom=:nom'
      #9'and otkat=0'
      #9'and prihod>0')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000090000003A43454E41534E44530400000000000000000000
      00040000003A504C55030000000000000000000000040000003A4E4F4D040000
      000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 584
    Top = 256
  end
  object QSelDoc: TOracleDataSet
    SQL.Strings = (
      'select distinct p.nomrash nom'
      'from tmp.tpart p'
      'where p.nom=:nom'
      #9'and p.plu=:plu'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D03000000040000001DE9000000000000
      040000003A504C550300000004000000003D000000000000}
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
    Left = 520
    Top = 312
  end
  object UpRashod: TOracleQuery
    SQL.Strings = (
      'update tmp.kniga'
      #9'set pprice=pprice+:cenasnds'
      'where nom=:nom'
      #9'and plu=:plu'
      #9'and otkat=0'
      #9'and rashod>0')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000090000003A43454E41534E44530400000000000000000000
      00040000003A4E4F4D040000000000000000000000040000003A504C55030000
      000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 584
    Top = 312
  end
  object oldQuery: TOracleQuery
    SQL.Strings = (
      
        'select nvl((select nvl(cenasnds,0) from tmp.tprihnakl where nom=' +
        ':nom and id=:id),0) cena'
      'from dual')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4E4F4D0300000004000000B3DD000000000000
      030000003A4944040000000800000000000000B922534100000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 664
    Top = 152
  end
  object upJurnal: TOracleQuery
    SQL.Strings = (
      'update tmp.tprihj set sum='
      'nvl((select sum(total) from tmp.tprihnakl where nom=:nom),0)'
      'where nom=:nom')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4E4F4D040000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 640
    Top = 256
  end
end
