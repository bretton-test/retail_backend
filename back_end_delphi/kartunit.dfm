object KartForm: TKartForm
  Left = 362
  Top = 233
  Width = 754
  Height = 547
  AlphaBlendValue = 4
  BorderIcons = [biSystemMenu]
  Caption = #1050#1072#1088#1090#1086#1090#1077#1082#1072
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 265
    Width = 746
    Height = 207
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 225
      Top = 1
      Width = 314
      Height = 205
      Hint = #1078#1077#1083#1090#1099#1081'-'#1088#1072#1079#1085#1099#1077' '#1094#1077#1085#1099','#1082#1088#1072#1089#1085#1099#1081'-'#1087#1088#1086#1076#1072#1078#1072' '#1074' '#1091#1073#1099#1090#1086#1082
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = False
      DataSource = DM.tovds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      ParentCtl3D = False
      ParentShowHint = False
      PopupMenu = HistMenu
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'PLU'
          Title.Caption = #1082#1086#1076
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 244
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAL'
          Title.Caption = #1085#1072#1083'.'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ED_IZM'
          Title.Caption = #1077#1076'.'#1080#1079#1084
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE'
          Title.Caption = #1062#1077#1085#1072
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KASSA'
          Title.Caption = #1094#1077#1085#1072' '#1074' '#1082#1072#1089#1089#1077
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WESY'
          Title.Caption = #1094#1077#1085#1072' '#1074' '#1074#1077#1089#1072#1093
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CENAPRIH'
          Title.Caption = #1055#1088#1080#1093'. '#1094#1077#1085#1072
          Width = 54
          Visible = True
        end>
    end
    object SelList: TCheckListBox
      Left = 539
      Top = 1
      Width = 206
      Height = 205
      Hint = #1086#1082#1085#1086' '#1087#1086#1076#1073#1086#1088#1072' '#1090#1086#1074#1072#1088#1072
      Align = alRight
      Color = clCream
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
    end
    object Tree: TTreeView
      Left = 17
      Top = 1
      Width = 208
      Height = 205
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      Images = ImageList1
      Indent = 19
      ParentCtl3D = False
      TabOrder = 2
      OnDblClick = TreeDblClick
      OnExpanding = TreeExpanding
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 16
      Height = 205
      Align = alLeft
      BevelWidth = 2
      Caption = '>'
      TabOrder = 3
      OnClick = Panel5Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 27
    Width = 746
    Height = 238
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Shape1: TShape
      Left = 176
      Top = 6
      Width = 329
      Height = 227
      Brush.Color = clBtnFace
    end
    object Label3: TLabel
      Left = 184
      Top = 9
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
    end
    object Label4: TLabel
      Left = 274
      Top = 9
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label5: TLabel
      Left = 274
      Top = 45
      Width = 103
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1082#1072#1089#1089#1099
    end
    object Label6: TLabel
      Left = 184
      Top = 46
      Width = 39
      Height = 13
      Caption = #1045#1076'.'#1048#1079#1084'.'
    end
    object Shape2: TShape
      Left = 5
      Top = 6
      Width = 167
      Height = 51
      Brush.Color = clBtnFace
    end
    object Label7: TLabel
      Left = 14
      Top = 11
      Width = 54
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
    end
    object Label8: TLabel
      Left = 336
      Top = 82
      Width = 70
      Height = 13
      Caption = #1052#1072#1082#1089'.'#1086#1089#1090#1072#1090#1086#1082
    end
    object Label9: TLabel
      Left = 184
      Top = 82
      Width = 75
      Height = 13
      Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
    end
    object Shape3: TShape
      Left = 5
      Top = 103
      Width = 167
      Height = 130
      Brush.Color = clBtnFace
    end
    object Label10: TLabel
      Left = 13
      Top = 106
      Width = 38
      Height = 13
      Caption = #1062#1077#1085#1085#1080#1082
    end
    object Label11: TLabel
      Left = 264
      Top = 82
      Width = 65
      Height = 13
      Caption = #1052#1080#1085'.'#1086#1089#1090#1072#1090#1086#1082
    end
    object Label14: TLabel
      Left = 184
      Top = 146
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object selbutton: TSpeedButton
      Left = 455
      Top = 168
      Width = 17
      Height = 19
      Caption = '...'
      OnClick = selbuttonClick
    end
    object Label13: TLabel
      Left = 249
      Top = 146
      Width = 79
      Height = 13
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
    end
    object SpeedButton1: TSpeedButton
      Left = 671
      Top = 112
      Width = 74
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Flat = True
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3300333333333333330033333333333333003333333333333300333333333333
        330033333333333333003300000000003300330FFFFFFFF03300330000000000
        3300333333333333330033333333333333003333333333333300333333333333
        33003333333333333300}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 671
      Top = 56
      Width = 74
      Height = 22
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Flat = True
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
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object Label18: TLabel
      Left = 418
      Top = 81
      Width = 18
      Height = 13
      Caption = #1085#1076#1089
    end
    object SpeedButton3: TSpeedButton
      Left = 707
      Top = 24
      Width = 24
      Height = 25
      Hint = #1086#1073#1085#1086#1074#1080#1090#1100
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object Label20: TLabel
      Left = 206
      Top = 120
      Width = 50
      Height = 13
      Caption = '% '#1089#1082#1080#1076#1082#1080
    end
    object SpeedButton4: TSpeedButton
      Left = 672
      Top = 168
      Width = 73
      Height = 25
      Caption = #1048#1089#1082#1072#1090#1100
      Flat = True
      Glyph.Data = {
        CA010000424DCA01000000000000760000002800000022000000110000000100
        04000000000054010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666000000666666666666666666666666666666666600
        00006666666666666666666FFFFF66666FFFFF00000060000066666000006688
        888F666688888F00000060F000666660F000668F888F66668F888F00000060F0
        00666660F000668F888FFF6F8F888F0000006000000060000000668888888F88
        88888F000000600F000000F000006688F888888F88888F000000600F000600F0
        00006688F888F88F88888F000000600F000600F000006688F888F88F88888600
        000066000000000000066668888888888888660000006660F00060F000666666
        8F888F8F888F6600000066600000600000666666888886888886660000006666
        00066600066666666888F66888F66600000066660F06660F0666666668F8F668
        F8F6660000006666000666000666666668886668886666000000666666666666
        6666666666666666666666000000}
      NumGlyphs = 2
      OnClick = SpeedButton4Click
    end
    object Shape5: TShape
      Left = 5
      Top = 54
      Width = 167
      Height = 51
      Brush.Color = clBtnFace
    end
    object Label22: TLabel
      Left = 14
      Top = 59
      Width = 57
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object postbutton: TSpeedButton
      Left = 148
      Top = 80
      Width = 21
      Height = 19
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333CCCCC333333CCCCCC808CCCCCC3008888070888
        80030F0770F7F0770F0370FFFFF7FFFFF07370F000F7F000F07330FFFFF7FFFF
        F033370F00F7F00F0733370FFFF7FFFF0733330FFF030FFF0333333000333000
        3333333333333333333333333333333333333333333333333333}
      OnClick = postbuttonClick
    end
    object Label15: TLabel
      Left = 182
      Top = 131
      Width = 79
      Height = 13
      Caption = #1086#1073#1098#1105#1084' '#1074' '#1083#1080#1090#1088#1072#1093
      Layout = tlCenter
    end
    object DBEdit12: TDBEdit
      Left = 264
      Top = 124
      Width = 57
      Height = 19
      Hint = '% '#1089#1082#1080#1076#1082#1080' '#1076#1083#1103' '#1074#1077#1089#1086#1074#1086#1075#1086' '#1090#1086#1074#1072#1088#1072'.'#1054#1073#1098#1105#1084' '#1074' '#1083#1080#1090#1088#1072#1093' '#1076#1083#1103' '#1096#1090#1091#1095#1085#1086#1075#1086
      DataField = 'DISCOUNT'
      DataSource = DM.tovds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
    end
    object DBCheckBox2: TDBCheckBox
      Left = 390
      Top = 200
      Width = 113
      Height = 17
      Caption = #1044#1088#1086#1073#1085#1099#1077' '#1087#1088#1086#1076#1072#1078#1080
      DataField = 'NSP'
      DataSource = DM.tovds
      TabOrder = 23
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEdit1: TDBEdit
      Left = 184
      Top = 24
      Width = 57
      Height = 19
      DataField = 'PLU'
      DataSource = DM.tovds
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 273
      Top = 24
      Width = 225
      Height = 19
      DataField = 'NAME'
      DataSource = DM.tovds
      ReadOnly = True
      TabOrder = 1
      OnChange = DBEdit2Change
      OnKeyDown = DBEdit2KeyDown
    end
    object DBEdit3: TDBEdit
      Left = 274
      Top = 61
      Width = 225
      Height = 19
      DataField = 'ECRNAME'
      DataSource = DM.tovds
      ReadOnly = True
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 184
      Top = 61
      Width = 65
      Height = 19
      DataField = 'ED_IZM'
      DataSource = DM.tovds
      KeyField = 'ED_IZM'
      ListField = 'ED_IZM'
      ListSource = DM.edds
      TabOrder = 13
    end
    object DBEdit4: TDBEdit
      Left = 336
      Top = 96
      Width = 57
      Height = 19
      DataField = 'WES'
      DataSource = DM.tovds
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 184
      Top = 96
      Width = 57
      Height = 19
      DataField = 'LIFE'
      DataSource = DM.tovds
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 14
      Top = 129
      Width = 135
      Height = 19
      DataField = 'CENNIK1'
      DataSource = DM.tovds
      MaxLength = 16
      TabOrder = 8
      OnKeyDown = DBEdit6KeyDown
    end
    object DBEdit7: TDBEdit
      Left = 14
      Top = 150
      Width = 135
      Height = 19
      DataField = 'CENNIK2'
      DataSource = DM.tovds
      MaxLength = 16
      TabOrder = 9
      OnKeyDown = DBEdit6KeyDown
    end
    object DBEdit8: TDBEdit
      Left = 14
      Top = 171
      Width = 135
      Height = 19
      DataField = 'CENNIK3'
      DataSource = DM.tovds
      MaxLength = 16
      TabOrder = 10
      OnKeyDown = DBEdit6KeyDown
    end
    object DBEdit9: TDBEdit
      Left = 14
      Top = 192
      Width = 135
      Height = 19
      DataField = 'CENNIK4'
      DataSource = DM.tovds
      MaxLength = 16
      TabOrder = 11
      OnKeyDown = DBEdit6KeyDown
    end
    object DBGrid2: TDBGrid
      Left = 506
      Top = 56
      Width = 164
      Height = 137
      TabStop = False
      Color = clWhite
      DataSource = DM.bards
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 14
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object OracleNavigator1: TOracleNavigator
      Left = 510
      Top = 24
      Width = 198
      Height = 25
      DataSource = DM.tovds
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Flat = True
      Hints.Strings = (
        #1042' '#1085#1072#1095#1072#1083#1086
        #1085#1072#1079#1072#1076
        #1074#1087#1077#1088#1077#1076
        #1074' '#1082#1086#1085#1077#1094
        #1085#1086#1074#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072
        #1091#1076#1072#1083#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
        #1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        #1089#1086#1093#1088#1072#1085#1080#1090#1100
        #1086#1090#1084#1077#1085#1080#1090#1100
        ''
        ''
        #1086#1073#1085#1086#1074#1080#1090#1100)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = OracleNavigator1Click
    end
    object editkart: TCheckBox
      Left = 512
      Top = 6
      Width = 209
      Height = 17
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = editkartClick
    end
    object DBEdit11: TDBEdit
      Left = 264
      Top = 96
      Width = 57
      Height = 19
      DataField = 'MINOST'
      DataSource = DM.tovds
      TabOrder = 5
    end
    object DBCheckBox1: TDBCheckBox
      Left = 288
      Top = 200
      Width = 97
      Height = 17
      Caption = #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
      DataField = 'SHTUKA'
      DataSource = DM.tovds
      TabOrder = 12
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEdit10: TDBEdit
      Left = 184
      Top = 168
      Width = 57
      Height = 19
      DataField = 'PRICE'
      DataSource = DM.tovds
      ReadOnly = True
      TabOrder = 7
      OnKeyPress = DBEdit10KeyPress
    end
    object DBComboBoxEh1: TDBComboBoxEh
      Left = 408
      Top = 97
      Width = 34
      Height = 17
      TabStop = False
      DataField = 'NDS'
      DataSource = DM.tovds
      EditButtons = <>
      Flat = True
      Items.Strings = (
        '0'
        '10'
        '18')
      TabOrder = 6
      Visible = True
      EditMask = ''
    end
    object Panel4: TPanel
      Left = 14
      Top = 211
      Width = 155
      Height = 19
      BevelOuter = bvNone
      TabOrder = 17
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 16
      Top = 24
      Width = 145
      Height = 20
      DataField = 'KAT'
      DataSource = DM.tovds
      DropDownRows = 30
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      KeyField = 'KAT'
      ListField = 'NAME'
      ListSource = DM.razdds
      ParentFont = False
      TabOrder = 18
      OnClick = DBLookupComboboxEh1DropDown
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 247
      Top = 168
      Width = 209
      Height = 19
      DataField = 'PROIZW'
      DataSource = DM.tovds
      EditButton.ShortCut = 0
      EditButton.Visible = False
      EditButtons = <>
      KeyField = 'PROIZW'
      ListField = 'NAME'
      ListSource = DM.przwds
      ReadOnly = True
      TabOrder = 19
      Visible = True
    end
    object exportBox: TDBCheckBox
      Left = 182
      Top = 200
      Width = 107
      Height = 17
      Hint = #1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' '#1074' '#1082#1072#1089#1089#1099' '#1080#1083#1080' '#1085#1077#1090
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1082#1072#1089#1089#1099
      DataField = 'EXPORT'
      DataSource = DM.tovds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object tovgrid: TDBGridEh
      Left = 272
      Top = 42
      Width = 226
      Height = 103
      DataSource = DataSource1
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 21
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
      OnDblClick = tovgridDblClick
      OnKeyDown = tovgridKeyDown
    end
    object postbox: TDBLookupComboboxEh
      Left = 14
      Top = 80
      Width = 135
      Height = 19
      DataField = 'POST'
      DataSource = DM.tovds
      EditButton.Visible = False
      EditButtons = <>
      KeyField = 'COD'
      ListField = 'NAME'
      ListSource = DM.postds
      TabOrder = 24
      Visible = True
      OnCloseUp = postboxCloseUp
      OnDropDown = postboxDropDown
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 746
    Height = 27
    Caption = 'ToolBar1'
    Color = clHighlight
    ParentColor = False
    TabOrder = 2
    object ExpBut: TBitBtn
      Left = 0
      Top = 2
      Width = 113
      Height = 22
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1090#1086#1074#1072#1088#1072' '#1074' '#1090#1077#1088#1084#1080#1085#1072#1083
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1050#1072#1089#1089#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ExpButClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object ToolButton1: TToolButton
      Left = 113
      Top = 2
      Width = 4
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object istbut: TSpeedButton
      Left = 117
      Top = 2
      Width = 55
      Height = 22
      Hint = #1086#1089#1090#1072#1090#1086#1082' '#1087#1072#1088#1090#1080#1081' '#1090#1086#1074#1072#1088#1072
      Caption = #1048#1089#1090#1086#1088#1080#1103
      ParentShowHint = False
      ShowHint = True
      OnClick = istbutClick
    end
    object ToolButton2: TToolButton
      Left = 172
      Top = 2
      Width = 5
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn2: TBitBtn
      Left = 177
      Top = 2
      Width = 72
      Height = 22
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102' '#1085#1072' '#1074#1077#1089#1100' '#1090#1086#1074#1072#1088' '#1074' '#1089#1087#1080#1089#1082#1077
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
      NumGlyphs = 2
    end
    object ToolButton7: TToolButton
      Left = 249
      Top = 2
      Width = 5
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object barbtn: TBitBtn
      Left = 254
      Top = 2
      Width = 86
      Height = 22
      Hint = #1087#1077#1095#1072#1090#1100' '#1096#1090#1088#1080#1093#1082#1086#1076#1072
      Caption = #1064#1090#1088#1080#1093#1082#1086#1076
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = barbtnClick
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
    object ToolButton3: TToolButton
      Left = 340
      Top = 2
      Width = 5
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object kartbt: TBitBtn
      Left = 345
      Top = 2
      Width = 51
      Height = 22
      TabOrder = 4
      OnClick = kartbtClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
        3333333333777F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
        3333333777737777F333333099999990333333373F3333373333333309999903
        333333337F33337F33333333099999033333333373F333733333333330999033
        3333333337F337F3333333333099903333333333373F37333333333333090333
        33333333337F7F33333333333309033333333333337373333333333333303333
        333333333337F333333333333330333333333333333733333333}
      NumGlyphs = 2
    end
    object ToolButton5: TToolButton
      Left = 396
      Top = 2
      Width = 5
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object insnaklbt: TBitBtn
      Left = 401
      Top = 2
      Width = 120
      Height = 22
      Caption = #1047#1072#1085#1077#1089#1090#1080' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      TabOrder = 3
      OnClick = insnaklbtClick
    end
    object ToolButton4: TToolButton
      Left = 521
      Top = 2
      Width = 4
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object insbt: TBitBtn
      Left = 525
      Top = 2
      Width = 85
      Height = 22
      Caption = #1047#1072#1085#1077#1089#1090#1080' '#1058#1086#1074#1072#1088
      TabOrder = 6
      Visible = False
      OnClick = InsBtClick
    end
    object ToolButton6: TToolButton
      Left = 610
      Top = 2
      Width = 82
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Button1: TButton
      Left = 692
      Top = 2
      Width = 49
      Height = 22
      Caption = #1055#1086#1074#1077#1088#1093
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 472
    Width = 746
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
    object Bevel1: TBevel
      Left = 108
      Top = 3
      Width = 654
      Height = 37
      Shape = bsFrame
    end
    object Label2: TLabel
      Left = 284
      Top = 4
      Width = 24
      Height = 13
      Caption = #1094#1077#1085#1072
    end
    object Label19: TLabel
      Left = 339
      Top = 4
      Width = 51
      Height = 13
      Caption = #1096#1090#1088#1080#1093#1082#1086#1076
    end
    object Label16: TLabel
      Left = 114
      Top = 4
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label1: TLabel
      Left = 465
      Top = 4
      Width = 19
      Height = 13
      Caption = #1082#1086#1076
    end
    object tovarLabel: TLabel
      Left = 531
      Top = 20
      Width = 4
      Height = 13
      Caption = '-'
    end
    object Label21: TLabel
      Left = 486
      Top = 4
      Width = 67
      Height = 13
      Caption = #1090#1077#1082'.'#1092#1080#1083#1100#1090#1088' -'
    end
    object filtrCaption: TLabel
      Left = 555
      Top = 4
      Width = 4
      Height = 13
      Caption = '-'
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 15
      Width = 92
      Height = 23
      Hint = #1074#1077#1089#1100' '#1090#1086#1074#1072#1088
      Caption = #1042#1077#1089#1100' '#1057#1087#1080#1089#1086#1082
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
    end
    object NameEdit: TEdit
      Left = 114
      Top = 17
      Width = 124
      Height = 19
      Hint = #1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = NameEditChange
      OnKeyPress = NameEditKeyPress
    end
    object priceedit: TDBNumberEditEh
      Left = 284
      Top = 17
      Width = 52
      Height = 19
      EditButtons = <>
      TabOrder = 2
      Visible = True
      OnKeyDown = priceeditKeyDown
    end
    object filtrbutton: TBitBtn
      Left = 667
      Top = 15
      Width = 77
      Height = 21
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 3
      OnClick = filtrbuttonClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333773777333333333C33
        3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
        33003377333337F33377333333333C333300333F333337F33377339333333C33
        3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
        330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
        330077F377F337F33377993399333C33330077FF773337F33377399993333C33
        33333777733337F333FF333333333C33300033333333373FF7773333333333CC
        3000333333333377377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object fbarcode: TDBNumberEditEh
      Left = 338
      Top = 17
      Width = 123
      Height = 19
      EditButtons = <>
      TabOrder = 4
      Visible = True
      OnKeyDown = FbarcodeKeyDown
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 463
      Top = 17
      Width = 66
      Height = 19
      EditButtons = <>
      TabOrder = 5
      Visible = True
      OnKeyDown = DBNumberEditEh1KeyDown
    end
    object RadioGroup1: TRadioGroup
      Left = 239
      Top = 5
      Width = 43
      Height = 31
      TabOrder = 6
      Visible = False
    end
    object shButton: TRadioButton
      Left = 244
      Top = 12
      Width = 33
      Height = 14
      Caption = #1096#1090
      TabOrder = 7
      OnClick = shButtonClick
    end
    object kgButton: TRadioButton
      Tag = 1
      Left = 244
      Top = 23
      Width = 33
      Height = 13
      Caption = #1082#1075
      TabOrder = 8
      OnClick = shButtonClick
    end
  end
  object CprintForm: TSpeedForm
    Left = 144
    Top = 203
    Width = 285
    Height = 86
    Position = poMainFormCenter
    Style = dsIcon
    Caption = 'CprintForm'
    TabOrder = 5
    BorderStyle = bsNone
    ParentColor = False
    Color = clMoneyGreen
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    object Shape4: TShape
      Left = 1
      Top = 3
      Width = 273
      Height = 53
      Brush.Style = bsClear
    end
    object Label12: TLabel
      Left = 29
      Top = 6
      Width = 120
      Height = 14
      Caption = #1041#1091#1076#1077#1090' '#1085#1072#1087#1077#1095#1072#1090#1072#1085#1086' '
    end
    object Clabel: TLabel
      Left = 185
      Top = 6
      Width = 61
      Height = 14
      Caption = #1094#1077#1085#1085#1080#1082#1086#1074
    end
    object CountLabel: TLabel
      Left = 153
      Top = 6
      Width = 8
      Height = 14
      Caption = '0'
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 24
      Width = 75
      Height = 25
      Caption = #1041#1086#1083#1100#1096#1086#1081
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 96
      Top = 24
      Width = 81
      Height = 25
      Caption = #1052#1072#1083#1077#1085#1100#1082#1080#1081
      ModalResult = 2
      TabOrder = 1
    end
    object BitBtn5: TBitBtn
      Left = 192
      Top = 24
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 3
      TabOrder = 2
    end
  end
  object Hform: TSpeedForm
    Left = 248
    Top = 323
    Width = 622
    Height = 273
    Position = poMainFormCenter
    Style = dsIcon
    Caption = #1048#1089#1090#1086#1088#1080#1103' '#1055#1088#1080#1093#1086#1076#1072
    TabOrder = 4
    OnClose = HformClose
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 614
      Height = 246
      Align = alClient
      AutoFitColWidths = True
      DataSource = histds
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
    end
  end
  object Qhistory: TOracleDataSet
    SQL.Strings = (
      'select p.nn,'
      #9'k.data,'
      #9'k.cena,'
      #9'p.cenasnds,'
      #9'sum(k.partost) sum,'
      #9'k.nom,'
      #9'k.partia,'
      #9's.name,'
      #9'm.sklad,p.life'
      'from   TMP.kniga k,tmp.tprihnakl p,tmp.tpostav s,tmp.tsklad m '
      'where  k.otkat=0'
      #9'and k.prihod>0'
      #9'and k.plu=:plu'
      #9'and p.nom=k.nom'
      #9'and p.plu=k.plu'
      #9'and s.cod=p.post'
      #9'and k.skladid=m.skladid'
      #9
      'group by '
      #9'p.nn,'
      #9'k.plu,'
      #9'k.cena,'
      #9'p.cenasnds,'
      #9'k.data,'
      #9'k.nom,'
      #9'k.partia,'
      #9's.name,'
      #9'm.sklad,p.life'
      'having sum(k.partost)>0'
      'order by k.data')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A504C5503000000040000005116000000000000}
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
      030000000A0000000400000043454E4101000000000300000053554D01000000
      0004000000444154410100000000030000004E4F4D0100000000060000005041
      5254494101000000000800000043454E41534E44530100000000040000004E41
      4D45010000000005000000534B4C41440100000000020000004E4E0100000000
      040000004C4946450100000000}
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
    Left = 352
    Top = 192
    object QhistoryNN: TIntegerField
      DisplayLabel = #8470
      FieldName = 'NN'
      Required = True
    end
    object QhistoryDATA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
      Required = True
    end
    object QhistoryCENASNDS: TFloatField
      DisplayLabel = #1074#1093'.'#1094#1077#1085#1072
      FieldName = 'CENASNDS'
      Required = True
      currency = True
    end
    object QhistoryCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      Required = True
      currency = True
    end
    object QhistorySUM: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'SUM'
      Required = True
    end
    object QhistoryNOM: TFloatField
      FieldName = 'NOM'
      Required = True
      Visible = False
    end
    object QhistoryPARTIA: TFloatField
      FieldName = 'PARTIA'
      Required = True
      Visible = False
    end
    object QhistoryNAME: TStringField
      DisplayLabel = #1087#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 30
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object QhistorySKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      FieldName = 'SKLAD'
      Required = True
      Size = 50
    end
    object QhistoryLIFE: TDateTimeField
      DisplayLabel = #1043#1086#1076#1077#1085' '#1076#1086
      FieldName = 'LIFE'
    end
  end
  object histds: TDataSource
    DataSet = Qhistory
    Left = 384
    Top = 176
  end
  object HistMenu: TPopupMenu
    OnPopup = HistMenuPopup
    Left = 384
    Top = 305
    object N1: TMenuItem
      Caption = #1053#1072#1083#1080#1095#1080#1077
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1055#1086#1089#1090#1072#1074#1082#1080
      OnClick = N3Click
    end
    object N24: TMenuItem
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      OnClick = N24Click
    end
    object N2: TMenuItem
      Caption = #1055#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1063#1077#1082#1072#1084
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
      OnClick = N4Click
    end
    object N11: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081' '#1088#1072#1089#1093#1086#1076
      OnClick = N11Click
    end
    object N5: TMenuItem
      Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1080
      OnClick = N5Click
    end
    object N23: TMenuItem
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
      OnClick = N23Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N21: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082' '#1089#1091#1084#1084#1099' '#1095#1077#1082#1086#1074
      OnClick = N21Click
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Caption = #1063#1080#1089#1090#1082#1072' '#1050#1072#1090#1072#1083#1086#1075#1072
      Enabled = False
      OnClick = N15Click
    end
  end
  object SelTovar: TOracleDataSet
    SQL.Strings = (
      'select name from tmp.tkatalog')
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
    QBEDefinition.QBEFieldDefs = {0300000001000000040000004E414D450100000000}
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
    FilterOptions = [foCaseInsensitive]
    Left = 440
    Top = 179
  end
  object DataSource1: TDataSource
    DataSet = SelTovar
    Left = 304
    Top = 259
  end
  object barmenu: TPopupMenu
    Left = 480
    Top = 281
    object N6: TMenuItem
      Caption = #1085#1072' '#1083#1077#1085#1090#1077
      OnClick = N6Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1085#1072' '#1073#1091#1084#1072#1075#1077
      OnClick = BitBtn6Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
      OnClick = N8Click
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
    Left = 280
    Top = 312
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
    Left = 320
    Top = 312
  end
  object atribmenu: TPopupMenu
    Left = 440
    Top = 353
    object N12: TMenuItem
      Caption = #1082#1072#1090#1077#1075#1086#1088#1080#1102
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
      OnClick = N13Click
    end
    object N25: TMenuItem
      Caption = #1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnClick = N25Click
    end
  end
  object FiltrMenu: TPopupMenu
    Left = 272
    Top = 369
    object Dtc1: TMenuItem
      Caption = #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
      OnClick = wesClick
    end
    object N16: TMenuItem
      Caption = #1056#1072#1079#1085#1099#1077' '#1094#1077#1085#1099
      OnClick = razcenaClick
    end
    object N01: TMenuItem
      Caption = #1053#1072#1083#1080#1095#1080#1077' <0'
      OnClick = minusClick
    end
    object N02: TMenuItem
      Caption = #1053#1072#1083#1080#1095#1080#1077' <>0'
      OnClick = N02Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      OnClick = PostBtClick
    end
    object N18: TMenuItem
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      OnClick = proizwFiltrClick
    end
    object N19: TMenuItem
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      OnClick = katfiltrClick
    end
  end
  object tovarcounter: TDBSumList
    Active = False
    DataSet = DM.tovar
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'plu'
        GroupOperation = goCount
      end>
    VirtualRecords = False
    OnAfterRecalcAll = tovarcounterRecalcAll
    Left = 360
    Top = 377
  end
  object qprotree: TOracleDataSet
    SQL.Strings = (
      
        'select distinct  pr.* from tmp.tproizw pr,tmp.tkatalog t,tmp.tka' +
        't k'
      'where t.kat=k.kat and t.proizw=pr.proizw and k.kat=:kat'
      'order by pr.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000040000003A4B415403000000040000000000000000000000}
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
    Left = 480
    Top = 401
    object qprotreePROIZW: TIntegerField
      FieldName = 'PROIZW'
      Required = True
    end
    object qprotreeNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object qprotreeSTRANA: TStringField
      FieldName = 'STRANA'
      Size = 30
    end
  end
  object qposttree: TOracleDataSet
    SQL.Strings = (
      'select distinct  post.cod,post.name'
      'from tmp.tproizw pr,tmp.tkatalog t,tmp.tkat k,tmp.tpostav post'
      'where t.kat=k.kat'
      #9'and t.proizw=pr.proizw'
      #9'and t.post=post.cod'
      #9'and k.kat=:kat'
      #9'and pr.proizw=:proizw'
      'order by post.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4B415403000000040000000000000000000000
      070000003A50524F495A5703000000040000000100000000000000}
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
      030000000200000003000000434F440100000000040000004E414D4501000000
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
    Left = 536
    Top = 401
    object qposttreeCOD: TIntegerField
      FieldName = 'COD'
      Required = True
    end
    object qposttreeNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
  end
  object ImageList1: TImageList
    Left = 416
    Top = 401
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000084000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000000000C0C0C0000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000084000000FF000000FF000000FF000000
      00000000FF00000000000000000000000000000000000000000080808000C0C0
      C000C0C0C0008080800080808000808080008080800080808000808080008080
      8000000000008080800000000000000000000000000000000000000000000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000084000000FF000000FF000000FF000000
      00000000FF00000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000084
      0000008400000084000000840000FFFFFF000084000000840000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000084000000FF000000FF000000FF000000
      00000000FF00000000000000000000000000000000008080800080808000C0C0
      C000C0C0C000C0C0C000C0C0C000000000008080800080808000FFFFFF008080
      8000000000008080800080808000000000000000000000000000000000000000
      0000008400000084000000840000FFFFFF000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000084000000FF000000FF000000FF000000
      00000000FF00000000000000000000000000808080000000000000000000FFFF
      FF00C0C0C000C0C0C000C0C0C000000000008080800080808000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000000000000000000000000000
      00000000FF0000000000000000000000000080808000C0C0C000C0C0C000FFFF
      FF00808080000000000000000000000000000000000000000000C0C0C0008080
      8000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000084000000FF000000FF000000
      FF000000FF00000000000000000000000000808080000000000000000000FFFF
      FF0080808000C0C0C000FFFFFF0000000000C0C0C000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000084840000008400000084000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000080808000C0C0C00000000000C0C0C000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000084000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000FFFFFF00000000008080800080808000C0C0C000C0C0C000C0C0C0008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000000000000840000000000000084000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000C0C0C0000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFE3FFFFF0000
      FEFFFC3FC0070000F01FE027C0070000F017C003C0070000F017E007C0070000
      F0178001E00F0000F0170001F01F0000FEF70001FC7F0000FC070001F83F0000
      FE1FE007F83F0000FC5FE003F83F0000F95FC007F83F0000FFBFE42FFC7F0000
      FFFFFC3FFFFF0000FFFFFC3FFFFF000000000000000000000000000000000000
      000000000000}
  end
end
