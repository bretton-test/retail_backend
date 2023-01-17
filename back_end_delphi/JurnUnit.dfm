object jurnform: Tjurnform
  Left = 173
  Top = 131
  Width = 817
  Height = 538
  Caption = #1046#1091#1088#1085#1072#1083
  Color = clWindow
  Ctl3D = False
  ParentFont = True
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888
    8888888888888888888888888888888888888888888888888888888888888888
    8888888888888888888888888888888888888884444444444888888888888888
    8888888444444444488888888888844444444444444444444444444444488444
    444444444444444444444444444884444444444447744FF44444444444488444
    4444444447744FF444444444444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF4444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF4444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF4444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF4444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF4444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF4444884444777777777744FFFFFFFFFF444488444
    4777777777744FFFFFFFFFF444488444477777777448844FFFFFFFF444488444
    477777777448844FFFFFFFF44448888444444444488888844444444448888884
    4444444448888884444444444888888888888888888888888888888888888888
    8888888888888888888888888888888888888888888888888888888888888888
    8888888888888888888888888888888888888888888888888888888888880000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 809
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 157
      Height = 16
      Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 809
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 176
      Top = 2
      Width = 20
      Height = 19
      AutoSize = False
      Caption = '<'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label4Click
      OnMouseEnter = Label4MouseEnter
      OnMouseLeave = Label4MouseLeave
    end
    object Label5: TLabel
      Left = 269
      Top = 2
      Width = 20
      Height = 19
      AutoSize = False
      Caption = '>'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label5Click
      OnMouseEnter = Label4MouseEnter
      OnMouseLeave = Label4MouseLeave
    end
    object tov_print: TBitBtn
      Left = 296
      Top = 2
      Width = 75
      Height = 22
      Caption = #1058#1086#1074'.'#1054#1090#1095#1077#1090
      TabOrder = 4
      Visible = False
      OnClick = tov_printClick
    end
    object repBut: TBitBtn
      Left = 370
      Top = 2
      Width = 75
      Height = 22
      Caption = #1054#1090#1095#1077#1090
      TabOrder = 5
      Visible = False
      OnClick = repButClick
    end
    object prbut: TBitBtn
      Left = 0
      Top = 3
      Width = 75
      Height = 22
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = prbutClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 444
      Top = 2
      Width = 67
      Height = 22
      Caption = #1086#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 198
      Top = 2
      Width = 65
      Height = 22
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object NumberNakl: TDBNumberEditEh
      Left = 96
      Top = 4
      Width = 67
      Height = 17
      EditButtons = <>
      Flat = True
      TabOrder = 3
      Visible = True
      OnKeyDown = NumberNaklKeyDown
    end
    object closeper: TBitBtn
      Left = 536
      Top = 2
      Width = 97
      Height = 22
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1077#1088#1080#1086#1076
      TabOrder = 6
      Visible = False
      OnClick = closeperClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 31
    Width = 809
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Dbgrid: TDBGridEh
      Left = 0
      Top = 0
      Width = 809
      Height = 447
      Align = alClient
      AutoFitColWidths = True
      DataSource = DM.prihjds
      EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
      Flat = True
      FooterColor = clMoneyGreen
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      MinAutoFitWidth = 15
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghHighlightFocus, dghFitRowHeightToText, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghDblClickOptimizeColWidth]
      PopupMenu = PopupMenu1
      RowHeight = 2
      RowLines = 1
      SortLocal = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnDblClick = DbgridDblClick
      OnDrawColumnCell = DbgridDrawColumnCell
      OnKeyDown = DbgridKeyDown
      OnTitleBtnClick = DbgridTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TIP'
          Footers = <>
          Title.Caption = #1090#1080#1087
          Title.TitleButton = True
          Width = 57
        end
        item
          AutoFitColWidth = False
          Checkboxes = False
          EditButtons = <>
          FieldName = 'REG'
          Footers = <>
          ImageList = DM.ImageList1
          KeyList.Strings = (
            '0'
            '1'
            '2'
            '3')
          LookupDisplayFields = 'reg'
          Title.Caption = #1088#1077#1075'.'
          Title.TitleButton = True
          Width = 28
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NN'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082'.'
          Title.TitleButton = True
          Width = 58
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'TIME'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103
          Title.TitleButton = True
          Width = 57
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DATA'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 54
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Title.TitleButton = True
          Width = 120
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076
          Title.TitleButton = True
          Width = 73
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'PRIM'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 101
        end
        item
          AutoFitColWidth = False
          DisplayFormat = '### ### ##0.00'
          EditButtons = <>
          FieldName = 'SUM'
          Footer.FieldName = 'sum'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'OWNER'
          Footers = <>
          Title.Caption = #1040#1074#1090#1086#1088
          Title.TitleButton = True
          Width = 67
        end>
    end
  end
  object intform: TSpeedForm
    Left = 159
    Top = 248
    Width = 282
    Height = 115
    Caption = #1080#1085#1090#1077#1088#1074#1072#1083
    TabOrder = 3
    ParentColor = False
    Color = clBtnFace
    object Shape1: TShape
      Left = 9
      Top = 3
      Width = 248
      Height = 27
      Brush.Style = bsClear
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 12
      Height = 16
      Caption = #1057' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 136
      Top = 8
      Width = 18
      Height = 16
      Caption = #1055#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 34
      Width = 69
      Height = 16
      Caption = #1087#1086' '#1089#1082#1083#1072#1076#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object d1: TDBDateTimeEditEh
      Left = 32
      Top = 8
      Width = 89
      Height = 17
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object d2: TDBDateTimeEditEh
      Left = 160
      Top = 8
      Width = 89
      Height = 17
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object BitBtn2: TBitBtn
      Left = 104
      Top = 57
      Width = 75
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 2
      OnClick = BitBtn4Click
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
    object BitBtn4: TBitBtn
      Left = 186
      Top = 57
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
      OnClick = BitBtn4Click
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
    end
    object nsklad: TDBLookupComboboxEh
      Left = 88
      Top = 32
      Width = 169
      Height = 19
      EditButtons = <>
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListSource = DM.skladds
      TabOrder = 4
      Visible = False
    end
  end
  object splashform: TSpeedForm
    Left = 119
    Top = 207
    Width = 578
    Height = 45
    BorderIcons = []
    Position = poMainFormCenter
    Caption = #1080#1076#1105#1090' '#1087#1088#1086#1074#1086#1076#1082#1072
    TabOrder = 4
    StayOnTop = True
    object outlabel: TLabel
      Left = 0
      Top = 1
      Width = 22
      Height = 16
      Caption = 'out'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DM.ImageList1
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop, maNone]
    OnPopup = PopupMenu1Popup
    Left = 80
    Top = 120
    object reg: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      ImageIndex = 4
      OnClick = regClick
    end
    object unreg: TMenuItem
      Bitmap.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3300333333333333330033333333333333003333333333333300333333333333
        330033333333333333003300000000003300330FFFFFFFF03300330000000000
        3300333333333333330033333333333333003333333333333300333333333333
        33003333333333333300}
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1074#1086#1076#1082#1091
      ImageIndex = 3
      OnClick = PrintbtClick
    end
    object del: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      OnClick = delClick
    end
    object CancelDel: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1059#1076#1072#1083#1077#1085#1080#1077
      OnClick = CancelDelClick
    end
    object Unblok: TMenuItem
      Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      OnClick = UnblokClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1091#1084#1084#1099' '#1087#1086#1089#1090#1072#1074#1086#1082
      OnClick = N2Click
    end
  end
  object Selprihod: TOracleDataSet
    SQL.Strings = (
      'select * from tmp.kniga where partia=:part and otkat=0')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000050000003A504152540400000008000000000000000071C4
      4000000000}
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
    Master = DM.Qprihj
    MasterFields = 'part'
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
    Left = 544
    Top = 79
  end
  object selpart: TOracleDataSet
    SQL.Strings = (
      'select * from tmp.tpart where part=:part and plu=:plu')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A50415254040000000000000000000000040000
      003A504C55030000000000000000000000}
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
    Left = 544
    Top = 119
  end
  object updaterashod: TOracleQuery
    SQL.Strings = (
      'update tmp.kniga set '
      'pprice=round((pprice/rashod)*(rashod-:kolvo),2),'
      'rashod=rashod-:kolvo,'
      'sum=sum+:kolvo,'
      'ostatok=ostatok+:kolvo'
      'where otkat=0'
      'and nom=:nom'
      'and plu=:plu'
      'and rashod>0')
    Session = DM.OraBase
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000060000003A4B4F4C564F0400000000000000000000000400
      00003A4E4F4D040000000000000000000000040000003A504C55030000000000
      000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 544
    Top = 167
  end
end
