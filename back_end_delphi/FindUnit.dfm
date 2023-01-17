object FindForm: TFindForm
  Left = 227
  Top = 175
  Width = 778
  Height = 503
  VertScrollBar.Style = ssFlat
  AlphaBlendValue = 3
  Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1085#1099#1084' '#1085#1072#1082#1083#1072#1076#1085#1099#1084' '
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF006666
    6666666666666666666666666666666666666666666666666666666666666666
    6666666666666666666666666666666666666666666666666666666666666666
    6666666666666666666666666666600000000006666666666000000000066000
    0000000666666666600000000006600FF000000666666666600FF0000006600F
    F000000666666666600FF0000006600FF000000666666666600FF0000006600F
    F000000666666666600FF0000006600000000000000660000000000000066000
    000000000006600000000000000660000FF000000000000FF000000000066000
    0FF000000000000FF0000000000660000FF000000660000FF000000000066000
    0FF000000660000FF0000000000660000FF000000660000FF000000000066000
    0FF000000660000FF00000000006666000000000000000000000000006666660
    00000000000000000000000006666666600FF0000006600FF000000666666666
    600FF0000006600FF00000066666666660000000000660000000000666666666
    6000000000066000000000066666666666600000066666600000066666666666
    6660000006666660000006666666666666600FF0066666600FF0066666666666
    66600FF0066666600FF006666666666666600000066666600000066666666666
    6660000006666660000006666666666666666666666666666666666666660000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 770
    Height = 45
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 88
      Top = 5
      Width = 34
      Height = 14
      Caption = #1058#1086#1074#1072#1088
    end
    object Label2: TLabel
      Left = 8
      Top = 5
      Width = 43
      Height = 14
      Caption = #8470' '#1044#1086#1082'.'
    end
    object NameEdit: TEdit
      Left = 88
      Top = 21
      Width = 153
      Height = 20
      TabOrder = 0
      OnChange = NameEditChange
      OnKeyDown = NameEditKeyDown
      OnKeyPress = NameEditKeyPress
    end
    object Edit1: TEdit
      Left = 8
      Top = 21
      Width = 73
      Height = 20
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyDown = NameEditKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 336
      Top = 21
      Width = 75
      Height = 20
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 20
      Width = 40
      Height = 21
      TabOrder = 3
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 288
      Top = 20
      Width = 39
      Height = 21
      TabOrder = 4
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
  end
  object DBGrid: TDBGridEh
    Left = 0
    Top = 0
    Width = 770
    Height = 431
    Align = alClient
    DataSource = DataSource1
    Flat = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    FrozenCols = 3
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #1053#1054#1052#1045#1056'_'#1044#1054#1050
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = #1050#1086#1076
        Footer.FieldName = #1050#1054#1044
        Footers = <>
        Title.Caption = #1050#1054#1044
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = #1058#1054#1042#1040#1056
        Footers = <>
        Width = 248
      end
      item
        EditButtons = <>
        FieldName = #1044#1040#1058#1040
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = #1045#1044'_'#1048#1047#1052
        Footers = <>
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = #1050#1054#1051'_'#1042#1054
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = #1042#1061'_'#1062#1045#1053#1040
        Footers = <>
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = #1062#1045#1053#1040'_'#1056#1045#1040#1051
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = #1055#1054#1057#1058#1040#1042#1065#1048#1050
        Footers = <>
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'NOM'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'PART'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'PLU'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'krasn_id'
        Footers = <>
        Title.Caption = #1082#1086#1076' '#1082#1088#1072#1089#1085#1086#1075#1086#1088#1089#1082#1086#1077
        Width = 108
      end>
  end
  object Qfind: TOracleDataSet
    SQL.Strings = (
      'select n.nn '#1053#1086#1084#1077#1088'_'#1044#1086#1082','
      'n.plu '#1050#1086#1076','
      'n.name '#1058#1086#1074#1072#1088','
      'n.data '#1044#1072#1090#1072','
      'n.ed_izm '#1077#1076'_'#1080#1079#1084','
      'n.kol_vo '#1082#1086#1083'_'#1074#1086','
      'n.cenasnds '#1074#1093'_'#1094#1077#1085#1072','
      'n.cenareal '#1094#1077#1085#1072'_'#1088#1077#1072#1083','
      'j.post_name '#1087#1086#1089#1090#1072#1074#1097#1080#1082','
      'j.nom,'
      'j.part,'
      'n.plu,'
      'n.krasn_id  '
      'from '
      'tmp.tprihnakl n,tmp.tprihj j'
      'where n.nom=j.nom'
      'and upper(name)  like upper('#39'%'#39'||:name||'#39'%'#39')'
      'and to_char(n.nn) like :nn'
      'order by '#1044#1072#1090#1072','#1058#1086#1074#1072#1088)
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A4E414D45050000000000000000000000030000
      003A4E4E030000000000000000000000}
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
      030000000C00000009000000CDCECCC5D05FC4CECA010000000005000000D2CE
      C2C0D0010000000004000000C4C0D2C0010000000006000000C5C45FC8C7CC01
      0000000006000000CACECB5FC2CE010000000007000000C2D55FD6C5CDC00100
      00000009000000D6C5CDC05FD0C5C0CB010000000009000000CFCED1D2C0C2D9
      C8CA0100000000030000004E4F4D010000000004000000504152540100000000
      03000000504C55010000000003000000CACEC40100000000}
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
    Left = 48
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = Qfind
    Left = 88
    Top = 56
  end
end
