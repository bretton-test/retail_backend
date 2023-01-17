object cennikform: Tcennikform
  Left = 229
  Top = 173
  Width = 775
  Height = 436
  BorderIcons = [biSystemMenu]
  Caption = #1055#1077#1095#1072#1090#1100' '#1062#1077#1085#1085#1080#1082#1086#1074
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 407
    Top = 0
    Width = 360
    Height = 402
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object grid1: TDBGridEh
      Left = 0
      Top = 24
      Width = 360
      Height = 378
      Align = alClient
      DataSource = DM.DS15
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghFitRowHeightToText]
      RowHeight = 2
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = grid1KeyDown
      OnKeyPress = grid1KeyPress
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 360
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object skladSelect: TDBLookupComboboxEh
        Left = 216
        Top = 3
        Width = 145
        Height = 19
        BorderStyle = bsNone
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'NAME'
        ListField = 'SKLAD'
        ListSource = DM.skladds
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 402
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Grid: TStringGrid
      Left = 0
      Top = 24
      Width = 407
      Height = 378
      Align = alClient
      ColCount = 6
      Ctl3D = False
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = GridKeyDown
      ColWidths = (
        175
        32
        26
        68
        32
        64)
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 407
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Button1: TButton
        Left = 218
        Top = 0
        Width = 80
        Height = 24
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072
        TabOrder = 1
        OnClick = Button1Click
      end
      object BitBtn2: TBitBtn
        Left = 297
        Top = 0
        Width = 52
        Height = 24
        Action = delall
        TabOrder = 2
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
      object BitBtn1: TBitBtn
        Left = 152
        Top = 1
        Width = 66
        Height = 23
        Caption = #1062#1077#1085#1085#1080#1082
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
      object Button2: TButton
        Left = 348
        Top = 0
        Width = 58
        Height = 24
        Caption = #1086#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        OnClick = Button2Click
      end
      object barbtn: TBitBtn
        Left = 5
        Top = 2
        Width = 86
        Height = 22
        Hint = #1087#1077#1095#1072#1090#1100' '#1096#1090#1088#1080#1093#1082#1086#1076#1072
        Caption = #1064#1090#1088#1080#1093#1082#1086#1076
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
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
    end
  end
  object ActionList1: TActionList
    Left = 224
    Top = 112
    object delall: TAction
      OnExecute = delallExecute
    end
    object printcennik: TAction
      Caption = 'printcennik'
    end
  end
end
