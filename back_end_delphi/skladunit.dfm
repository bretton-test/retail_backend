object skladform: Tskladform
  Left = 302
  Top = 219
  BorderStyle = bsToolWindow
  Caption = #1057#1087#1080#1089#1086#1082' '#1057#1082#1083#1072#1076#1086#1074
  ClientHeight = 311
  ClientWidth = 519
  Color = clWindow
  Ctl3D = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 25
    Align = alTop
    TabOrder = 0
    object ornav: TOracleNavigator
      Left = 0
      Top = 0
      Width = 280
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 519
    Height = 286
    Align = alClient
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 517
      Height = 284
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
