object repform: Trepform
  Left = 493
  Top = 177
  AlphaBlendValue = 5
  BorderStyle = bsToolWindow
  Caption = #1048#1090#1086#1075#1080
  ClientHeight = 477
  ClientWidth = 260
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
    6600000066000000660000006666666666000000660000006600000066666666
    6666666666666666666666666666666666666666666666666666666666667700
    0000000000000000000000000077770000000000000000000000000000776600
    6699999966BBBBBB66CCCCCC666666006699999966BBBBBB66CCCCCC66667700
    6699999966BBBBBB66CCCCCC666677006699999966BBBBBB66CCCCCC66666600
    6699999966BBBBBB66CCCCCC666666006699999966BBBBBB66CCCCCC66667700
    7799999977BBBBBB77CCCCCC777777007799999977BBBBBB77CCCCCC77776600
    669999996600000066CCCCCC66666600669999996600000066CCCCCC66667700
    669999996666666666CCCCCC66667700669999996666666666CCCCCC66666600
    669999996666666666CCCCCC66666600669999996666666666CCCCCC66667700
    770000007777777777CCCCCC77777700770000007777777777CCCCCC77776600
    666666666666666666CCCCCC66666600666666666666666666CCCCCC66667700
    6666666666666666660000006666770066666666666666666600000066666600
    6666666666666666666666666666660066666666666666666666666666667700
    7777777777777777777777777777770077777777777777777777777777776666
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 477
    Align = alClient
    TabOrder = 0
    object Shape2: TShape
      Left = 9
      Top = 52
      Width = 241
      Height = 69
      Brush.Color = clBtnFace
    end
    object Shape1: TShape
      Left = 9
      Top = 8
      Width = 241
      Height = 39
      Brush.Color = clBtnFace
    end
    object Label1: TLabel
      Left = 21
      Top = 22
      Width = 54
      Height = 13
      Caption = #1055#1086' '#1057#1082#1083#1072#1076#1091
    end
    object Label2: TLabel
      Left = 13
      Top = 71
      Width = 70
      Height = 13
      Caption = #1055#1086' '#1050#1072#1090#1077#1075#1086#1088#1080#1080
    end
    object Label4: TLabel
      Left = 13
      Top = 249
      Width = 38
      Height = 13
      Caption = #1057' '#1044#1072#1090#1099
    end
    object Label5: TLabel
      Left = 13
      Top = 273
      Width = 42
      Height = 13
      Caption = #1055#1086' '#1044#1072#1090#1091
    end
    object SpeedButton1: TSpeedButton
      Left = 79
      Top = 299
      Width = 66
      Height = 25
      Caption = #1057#1091#1084#1084#1072
      OnClick = SpeedButton1Click
    end
    object Shape3: TShape
      Left = 9
      Top = 122
      Width = 241
      Height = 117
      Brush.Color = clBtnFace
    end
    object Label3: TLabel
      Left = 21
      Top = 125
      Width = 162
      Height = 13
      Caption = #1055#1086' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1102' '#1095#1077#1088#1077#1079' '#1082#1072#1089#1089#1099
    end
    object SpeedButton2: TSpeedButton
      Left = 218
      Top = 142
      Width = 23
      Height = 20
      Caption = '...'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label6: TLabel
      Left = 13
      Top = 55
      Width = 52
      Height = 13
      Caption = #1043#1088#1072#1092#1080#1082' '#1079#1072
    end
    object SpeedButton3: TSpeedButton
      Left = 224
      Top = 356
      Width = 23
      Height = 22
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333CCCCC333333CCCCCC808CCCCCC3008888070888
        80030F0770F7F0770F0370FFFFF7FFFFF07370F000F7F000F07330FFFFF7FFFF
        F033370F00F7F00F0733370FFFF7FFFF0733330FFF030FFF0333333000333000
        3333333333333333333333333333333333333333333333333333}
      OnClick = SpeedButton3Click
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 412
      Width = 243
      Height = 57
      TabOrder = 19
      object daylabel: TLabel
        Left = 173
        Top = 35
        Width = 8
        Height = 14
        Caption = '3'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object daybar: TTrackBar
        Left = 2
        Top = 7
        Width = 167
        Height = 41
        Max = 60
        Min = 3
        Position = 3
        TabOrder = 0
        TickMarks = tmBoth
        OnChange = daybarChange
      end
    end
    object GroupBox1: TGroupBox
      Left = 78
      Top = 320
      Width = 171
      Height = 33
      TabOrder = 18
    end
    object listsklad: TDBLookupComboboxEh
      Left = 90
      Top = 19
      Width = 155
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Flat = True
      KeyField = 'SKLADID'
      ListField = 'SKLAD'
      ListFieldIndex = 1
      ListSource = DM.skladds
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object allkat: TCheckBox
      Left = 16
      Top = 92
      Width = 65
      Height = 17
      Caption = #1087#1086' '#1074#1089#1077#1084
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object katlist: TDBLookupComboboxEh
      Left = 88
      Top = 92
      Width = 158
      Height = 20
      DropDownBox.UseMultiTitle = True
      DropDownBox.Rows = 30
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Flat = True
      KeyField = 'NAME'
      ListField = 'NAME'
      ListFieldIndex = 1
      ListSource = DM.razdds
      ParentFont = False
      TabOrder = 3
      Visible = True
      OnChange = katlistChange
    end
    object Button3: TButton
      Left = 8
      Top = 299
      Width = 65
      Height = 25
      Caption = #1058#1072#1073#1083#1080#1094#1072
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 152
      Top = 299
      Width = 97
      Height = 25
      Caption = #1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
      TabOrder = 5
      OnClick = Button2Click
    end
    object pbegin: TDBDateTimeEditEh
      Left = 88
      Top = 246
      Width = 161
      Height = 17
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 6
      Visible = True
    end
    object pend: TDBDateTimeEditEh
      Left = 88
      Top = 270
      Width = 161
      Height = 17
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 7
      Visible = True
    end
    object prname: TDBEditEh
      Left = 18
      Top = 142
      Width = 201
      Height = 20
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Flat = True
      ParentFont = False
      TabOrder = 8
      Visible = True
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 166
      Width = 225
      Height = 65
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 9
    end
    object kolBut: TRadioButton
      Left = 24
      Top = 179
      Width = 73
      Height = 17
      Caption = #1082#1086#1083'-'#1074#1086
      TabOrder = 10
    end
    object nameBut: TRadioButton
      Left = 24
      Top = 195
      Width = 81
      Height = 17
      Caption = #1085#1072#1079#1074#1072#1085#1080#1077
      TabOrder = 11
    end
    object Button1: TButton
      Left = 136
      Top = 177
      Width = 97
      Height = 25
      Caption = #1095#1077#1088#1077#1079' '#1082#1072#1089#1089#1099
      Enabled = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button4: TButton
      Tag = 5
      Left = 8
      Top = 355
      Width = 65
      Height = 23
      Caption = #1055#1086#1089#1090#1072#1074#1082#1080
      TabOrder = 12
      OnClick = Button5Click
    end
    object Button5: TButton
      Tag = 6
      Left = 80
      Top = 328
      Width = 65
      Height = 23
      Caption = #1085#1072#1083#1080#1095#1080#1077
      TabOrder = 13
      OnClick = Button4Click
    end
    object month: TDateTimePicker
      Left = 111
      Top = 54
      Width = 134
      Height = 21
      Date = 0.671902291665901400
      Format = 'MMMM yyyy'
      Time = 0.671902291665901400
      DateFormat = dfLong
      TabOrder = 14
      OnCloseUp = monthCloseUp
    end
    object Button6: TButton
      Left = 176
      Top = 421
      Width = 66
      Height = 23
      Caption = #1074#1080#1089#1080#1090' '#1076#1085#1077#1081
      TabOrder = 15
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 8
      Top = 328
      Width = 65
      Height = 22
      Caption = #1057#1088#1086#1082#1080
      TabOrder = 16
      OnClick = Button7Click
    end
    object nullchek: TCheckBox
      Left = 152
      Top = 330
      Width = 73
      Height = 17
      Caption = #1041#1077#1079' '#1085#1086#1083#1077#1081
      TabOrder = 17
    end
    object valbut: TRadioButton
      Left = 24
      Top = 210
      Width = 81
      Height = 17
      Caption = #1076#1086#1093#1086#1076
      Checked = True
      TabOrder = 20
      TabStop = True
    end
    object zak: TCheckBox
      Left = 96
      Top = 208
      Width = 65
      Height = 17
      Caption = #1079#1072#1082#1072#1079
      TabOrder = 21
      OnClick = zakClick
    end
    object mnogo: TCheckBox
      Left = 160
      Top = 208
      Width = 65
      Height = 17
      Caption = #1080#1079#1083#1080#1096#1077#1082
      TabOrder = 22
      OnClick = mnogoClick
    end
    object postlist: TDBLookupComboboxEh
      Left = 79
      Top = 356
      Width = 146
      Height = 22
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          MaxWidth = 500
          MinWidth = 200
          Width = 500
        end>
      DropDownBox.Options = [dlgColumnResizeEh, dlgRowLinesEh, dlgAutoSortMarkingEh]
      DropDownBox.UseMultiTitle = True
      DropDownBox.Rows = 20
      DropDownBox.Sizable = True
      EditButton.Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333CCCCC333333CCCCCC808CCCCCC3008888070888
        80030F0770F7F0770F0370FFFFF7FFFFF07370F000F7F000F07330FFFFF7FFFF
        F033370F00F7F00F0733370FFFF7FFFF0733330FFF030FFF0333333000333000
        3333333333333333333333333333333333333333333333333333}
      EditButton.Visible = False
      EditButton.Width = 25
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'COD'
      ListField = 'NAME'
      ListSource = DM.postds
      ParentFont = False
      TabOrder = 23
      Visible = True
    end
    object prodbutton: TButton
      Left = 8
      Top = 387
      Width = 137
      Height = 22
      Caption = #1055#1088#1086#1076#1072#1078#1080' '#1087#1086'  '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      TabOrder = 24
      OnClick = prodbuttonClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 56
    Top = 248
    object N1: TMenuItem
      Caption = #1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1090#1086#1083#1100#1082#1086' '#1074#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1089#1091#1084#1084#1099' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
      OnClick = N6Click
    end
  end
end
