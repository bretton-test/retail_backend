object postsprav: Tpostsprav
  Left = 247
  Top = 176
  AlphaBlendValue = 4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
  ClientHeight = 489
  ClientWidth = 613
  Color = clMoneyGreen
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
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
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 26
    Align = alTop
    ParentColor = True
    TabOrder = 0
    object nav: TOracleNavigator
      Left = 0
      Top = 1
      Width = 230
      Height = 24
      DataSource = DM.postds
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 372
      Top = 1
      Width = 240
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 313
    Top = 26
    Width = 300
    Height = 463
    Align = alClient
    ParentColor = True
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 298
      Height = 461
      Align = alClient
      DataSource = DM.postds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      OnKeyDown = DBGridKeyDown
      OnKeyPress = DBGridKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COD'
          Title.Caption = #1050#1086#1076
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '
          Width = 240
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 313
    Height = 463
    Align = alLeft
    BevelOuter = bvSpace
    ParentColor = True
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 13
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 5
      Top = 31
      Width = 50
      Height = 13
      Caption = #1053#1072#1080#1084'.'#1086#1088#1075'.'
    end
    object Label3: TLabel
      Left = 119
      Top = 9
      Width = 89
      Height = 13
      Caption = #1044#1072#1090#1072' '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1103
    end
    object Label15: TLabel
      Left = 89
      Top = 30
      Width = 120
      Height = 13
      Caption = #1082#1086#1076#1080#1092#1080#1082#1072#1090#1086#1088' ('#1050#1088#1072#1089#1085'-'#1077')'
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 10
      Width = 49
      Height = 19
      DataField = 'COD'
      DataSource = DM.postds
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 4
      Top = 48
      Width = 303
      Height = 19
      DataField = 'NAME'
      DataSource = DM.postds
      TabOrder = 1
    end
    object datereg: TDBDateTimeEditEh
      Left = 219
      Top = 5
      Width = 89
      Height = 17
      DataField = 'DATE_ZAP'
      DataSource = DM.postds
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 210
      Top = 27
      Width = 97
      Height = 19
      DataField = 'KODIFIK'
      DataSource = DM.postds
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
  end
end
