object masterform: Tmasterform
  Left = 201
  Top = 112
  BorderStyle = bsToolWindow
  Caption = #1055#1088#1086#1076#1072#1078#1080' '#1087#1086' '#1082#1072#1089#1089#1072#1084
  ClientHeight = 223
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageC: TPageControl
    Left = 0
    Top = 0
    Width = 329
    Height = 182
    ActivePage = Sheet2
    Align = alClient
    TabOrder = 0
    object Sheet1: TTabSheet
      Caption = 'Sheet1'
      TabVisible = False
      object Label1: TLabel
        Left = 16
        Top = 56
        Width = 51
        Height = 19
        Caption = #1057' '#1076#1072#1090#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 88
        Width = 56
        Height = 19
        Caption = #1087#1086' '#1076#1072#1090#1091
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object datafrom: TDBDateTimeEditEh
        Left = 91
        Top = 52
        Width = 116
        Height = 19
        BorderStyle = bsNone
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Flat = True
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditFormat = 'DD/MM/YY'
      end
      object datato: TDBDateTimeEditEh
        Left = 91
        Top = 87
        Width = 116
        Height = 19
        BorderStyle = bsNone
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Flat = True
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditFormat = 'DD/MM/YY'
      end
    end
    object Sheet2: TTabSheet
      Caption = 'Sheet2'
      ImageIndex = 1
      TabVisible = False
      object Label3: TLabel
        Left = 33
        Top = 53
        Width = 103
        Height = 19
        Caption = #1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object katlist: TDBLookupComboboxEh
        Left = 36
        Top = 83
        Width = 158
        Height = 22
        BorderStyle = bsNone
        DropDownBox.UseMultiTitle = True
        DropDownBox.Rows = 30
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Flat = True
        KeyField = 'KAT'
        ListField = 'NAME'
        ListFieldIndex = 1
        ListSource = DM.razdds
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnDropDown = katlistDropDown
      end
      object all: TCheckBox
        Left = 166
        Top = 56
        Width = 97
        Height = 17
        Caption = #1087#1086' '#1074#1089#1077#1084
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object Sheet3: TTabSheet
      Caption = 'Sheet3'
      ImageIndex = 2
      TabVisible = False
      object Label4: TLabel
        Left = 21
        Top = 70
        Width = 77
        Height = 19
        Caption = #1055#1086' '#1057#1082#1083#1072#1076#1091
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object listsklad: TDBLookupComboboxEh
        Left = 114
        Top = 67
        Width = 155
        Height = 22
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
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 4
      TabVisible = False
      object RadioGroup1: TRadioGroup
        Left = 16
        Top = 27
        Width = 257
        Height = 102
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object nameBut: TRadioButton
        Left = 32
        Top = 51
        Width = 129
        Height = 17
        Caption = #1085#1072#1079#1074#1072#1085#1080#1077
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object kolBut: TRadioButton
        Left = 32
        Top = 75
        Width = 89
        Height = 17
        Caption = #1082#1086#1083'-'#1074#1086
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object sumbutton: TRadioButton
        Left = 32
        Top = 99
        Width = 89
        Height = 17
        Caption = #1089#1091#1084#1084#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 3
      TabVisible = False
      object Memo1: TMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 145
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 182
    Width = 329
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object NAZAD: TSpeedButton
      Left = 40
      Top = 8
      Width = 89
      Height = 22
      Caption = '< &'#1053#1072#1079#1072#1076
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = NAZADClick
    end
    object VPERED: TSpeedButton
      Left = 128
      Top = 8
      Width = 89
      Height = 22
      Caption = '&'#1044#1072#1083#1077#1077' >'
      OnClick = VPEREDClick
    end
    object ok: TSpeedButton
      Left = 232
      Top = 8
      Width = 81
      Height = 22
      Caption = #1054#1090#1095#1077#1090
      OnClick = okClick
    end
  end
end
