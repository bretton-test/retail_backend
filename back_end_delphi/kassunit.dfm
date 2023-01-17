object kassform: Tkassform
  Left = 278
  Top = 248
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1082#1072#1089#1089#1086#1074#1099#1081' '#1086#1088#1076#1077#1088
  ClientHeight = 208
  ClientWidth = 427
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 208
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 69
      Height = 14
      Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
    end
    object Label2: TLabel
      Left = 9
      Top = 62
      Width = 67
      Height = 14
      Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
    end
    object SpeedButton1: TSpeedButton
      Left = 265
      Top = 35
      Width = 23
      Height = 19
      Caption = '...'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 9
      Top = 86
      Width = 35
      Height = 14
      Caption = #1057#1091#1084#1084#1072
    end
    object SpeedButton2: TSpeedButton
      Left = 287
      Top = 35
      Width = 18
      Height = 19
      Caption = 'x'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label4: TLabel
      Left = 9
      Top = 150
      Width = 76
      Height = 14
      Caption = #1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 26
      Height = 14
      Caption = #1044#1072#1090#1072
    end
    object Label6: TLabel
      Left = 9
      Top = 118
      Width = 78
      Height = 14
      Caption = #1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    end
    object Label7: TLabel
      Left = 233
      Top = 118
      Width = 13
      Height = 14
      Caption = #1086#1090
    end
    object Label8: TLabel
      Left = 217
      Top = 86
      Width = 20
      Height = 14
      Caption = #1085#1076#1089
    end
    object Label9: TLabel
      Left = 305
      Top = 86
      Width = 20
      Height = 14
      Caption = #1085#1089#1087
    end
    object SpeedButton3: TSpeedButton
      Left = 175
      Top = 113
      Width = 18
      Height = 18
      Caption = 'x'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object tipoplaty: TDBComboBoxEh
      Left = 88
      Top = 59
      Width = 223
      Height = 18
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1086#1087#1083#1072#1090#1072' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        #1074#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        #1074#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1076#1086#1090#1095#1077#1090#1085#1080#1082#1072
        #1087#1088#1086#1095#1077#1077)
      TabOrder = 0
      Visible = True
    end
    object datadok: TDBDateTimeEditEh
      Left = 88
      Top = 8
      Width = 121
      Height = 18
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object sumedit: TDBNumberEditEh
      Left = 88
      Top = 85
      Width = 121
      Height = 18
      currency = True
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = sumeditEditButtons0Click
        end>
      Flat = True
      TabOrder = 2
      Value = 0.000000000000000000
      Visible = True
    end
    object docnom: TDBEditEh
      Left = 96
      Top = 113
      Width = 80
      Height = 18
      Alignment = taRightJustify
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = docnomEditButtons0Click
        end>
      Flat = True
      TabOrder = 3
      Visible = True
    end
    object datanakl: TDBDateTimeEditEh
      Left = 256
      Top = 114
      Width = 121
      Height = 18
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      ReadOnly = True
      TabOrder = 4
      Visible = True
    end
    object NDS: TDBNumberEditEh
      Left = 248
      Top = 86
      Width = 41
      Height = 18
      EditButtons = <>
      Flat = True
      TabOrder = 5
      Value = 0.000000000000000000
      Visible = True
    end
    object NSP: TDBNumberEditEh
      Left = 336
      Top = 86
      Width = 41
      Height = 18
      EditButtons = <>
      Flat = True
      TabOrder = 6
      Value = 0.000000000000000000
      Visible = True
    end
    object BitBtn1: TBitBtn
      Left = 280
      Top = 180
      Width = 57
      Height = 25
      Caption = #1054#1050
      TabOrder = 7
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 352
      Top = 180
      Width = 73
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 8
      OnClick = BitBtn2Click
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
    object komment: TDBEditEh
      Left = 104
      Top = 144
      Width = 273
      Height = 18
      EditButtons = <>
      Flat = True
      TabOrder = 9
      Visible = True
    end
    object KONTRNAME: TDBEditEh
      Left = 88
      Top = 35
      Width = 177
      Height = 18
      EditButtons = <>
      Flat = True
      TabOrder = 10
      Visible = True
    end
  end
end
