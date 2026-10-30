object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1058#1077#1089#1090#1086#1074#1086#1077' '#1079#1072#1076#1072#1085#1080#1077' | '#1057#1077#1088#1082#1086#1074' '#1040'.'#1040'.'
  ClientHeight = 476
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTitle: TLabel
    Left = 64
    Top = 32
    Width = 394
    Height = 25
    Caption = #1050#1088#1091#1087#1085#1086'-'#1086#1087#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1072#1078#1072' '#1072#1074#1090#1086#1079#1072#1087#1095#1072#1089#1090#1077#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelInputPrice: TLabel
    Left = 64
    Top = 104
    Width = 91
    Height = 19
    Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelNDS: TLabel
    Left = 336
    Top = 104
    Width = 126
    Height = 19
    Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057' (%):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelResultWithNDS: TLabel
    Left = 64
    Top = 264
    Width = 91
    Height = 19
    Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelResultWithoutNDS: TLabel
    Left = 336
    Top = 264
    Width = 108
    Height = 19
    Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditInputPrice: TEdit
    Left = 64
    Top = 136
    Width = 200
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '1000.00'
  end
  object EditNDS: TEdit
    Left = 336
    Top = 129
    Width = 200
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '20'
  end
  object ButtonCalc: TButton
    Left = 407
    Top = 392
    Width = 129
    Height = 41
    Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonCalcClick
  end
  object EditResultWithNDS: TEdit
    Left = 64
    Top = 296
    Width = 200
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '--'
  end
  object EditResultWithoutNDS: TEdit
    Left = 336
    Top = 296
    Width = 200
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = '--'
  end
end
