object kassjform: Tkassjform
  Left = 268
  Top = 175
  Width = 696
  Height = 338
  Caption = #1046#1091#1088#1085#1072#1083' '#1082#1072#1089#1089#1086#1074#1099#1093' '#1086#1087#1077#1088#1072#1094#1080#1081
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid: TDBGridEh
      Left = 0
      Top = 0
      Width = 688
      Height = 304
      Align = alClient
      DataSource = DM.KJds
      Flat = True
      FooterColor = clMoneyGreen
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      FooterRowCount = 1
      FrozenCols = 3
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'reg'
          Footers = <>
          ImageList = DM.ImageList1
          KeyList.Strings = (
            '0'
            '1'
            '2')
          LookupDisplayFields = 'reg'
          Title.Caption = #1088#1077#1075
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'TIP'
          Footers = <>
          Title.Caption = #1090#1080#1087
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1082#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Width = 145
        end
        item
          EditButtons = <>
          FieldName = 'DATA'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1076#1072#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'OSNOV'
          Footers = <>
          Title.Caption = #1086#1089#1085#1086#1074#1072#1085#1080#1077
          Width = 136
        end
        item
          EditButtons = <>
          FieldName = 'PRIHOD'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1087#1088#1080#1093#1086#1076
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'RASHOD'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1088#1072#1089#1093#1086#1076
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'SUM'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1089#1091#1084#1084#1072
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'PRIM'
          Footers = <>
          Title.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
        end>
    end
  end
end
