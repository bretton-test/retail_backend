object CenForm: TCenForm
  Left = 284
  Top = 175
  BorderStyle = bsNone
  Caption = 'CenForm'
  ClientHeight = 54
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object mcForm: TSpeedForm
    Left = 112
    Top = 0
    Width = 281
    Height = 257
    Style = dsIcon
    Caption = #1074#1099#1073#1086#1088' '#1094#1077#1085#1085#1080#1082#1072
    ShowHint = True
    OnShow = mcFormShow
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 273
      Height = 27
      Align = alTop
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 0
        Top = 1
        Width = 41
        Height = 25
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1094#1077#1085#1085#1080#1082
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333300033333300333330F03333
          3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
          3300333330F033333300333330F0333333003333300033333300333333333333
          33003333333333333300}
      end
      object BitBtn2: TBitBtn
        Left = 46
        Top = 1
        Width = 41
        Height = 25
        Hint = #1091#1076#1072#1083#1080#1090#1100' '#1094#1077#1085#1085#1080#1082
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          330033333333333333003300000000003300330FFFFFFFF03300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
      end
      object BitBtn3: TBitBtn
        Left = 92
        Top = 1
        Width = 41
        Height = 25
        Hint = #1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn3Click
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
    end
    object Box: TListBox
      Left = 0
      Top = 27
      Width = 273
      Height = 203
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 23
      ParentFont = False
      TabOrder = 1
      OnDblClick = BoxDblClick
      OnKeyDown = BoxKeyDown
    end
  end
  object mcedit: TSpeedForm
    Left = 112
    Top = 24
    Width = 243
    Height = 257
    Style = dsIcon
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1094#1077#1085#1085#1080#1082#1072
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 107
      Height = 16
      Caption = #1085#1072#1079#1074#1072#1085#1080#1077' '#1094#1077#1085#1085#1080#1082#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 97
      Height = 16
      Caption = #1094#1077#1085#1085#1080#1082#1086#1074' '#1074' '#1088#1103#1076#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object nameedit: TEdit
      Left = 8
      Top = 32
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object koledit: TDBNumberEditEh
      Left = 8
      Top = 80
      Width = 49
      Height = 24
      DecimalPlaces = 1
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 3.000000000000000000
      MinValue = 1.000000000000000000
      ParentFont = False
      TabOrder = 1
      Value = 3.000000000000000000
      Visible = True
    end
    object BitBtn4: TBitBtn
      Left = 136
      Top = 200
      Width = 91
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 2
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
  end
  object frReport: TfrReport
    Dataset = UserDs
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = frReportGetValue
    ReportForm = {18000000}
  end
  object frDesigner1: TfrDesigner
    Left = 40
  end
  object UserDs: TfrUserDataset
    OnCheckEOF = UserDsCheckEOF
    OnFirst = UserDsFirst
    OnNext = UserDsNext
    OnPrior = UserDsPrior
    Left = 80
  end
end
