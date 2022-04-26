object Form1: TForm1
  Left = 430
  Top = 226
  Width = 718
  Height = 475
  Caption = #1047#1072#1076#1072#1085#1080#1077' '#8470'1. '#1047#1072#1076#1072#1085#1080#1077' '#1085#1072' '#1087#1086#1090#1086#1082#1080' '#1080' '#1086#1073#1098#1077#1082#1090#1099' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 221
    Height = 19
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' 10 '#1089#1086#1086#1073#1097#1077#1085#1080#1081':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LitBoxMes: TListBox
    Left = 16
    Top = 72
    Width = 665
    Height = 217
    ExtendedSelect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 0
  end
  object grp1: TGroupBox
    Left = 16
    Top = 304
    Width = 313
    Height = 121
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1086#1090#1086#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbl1: TLabel
      Left = 16
      Top = 24
      Width = 153
      Height = 32
      Caption = #1055#1077#1088#1080#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1086#1090#1086#1082#1086#1084' '#1089#1086#1086#1073#1097#1077#1085#1080#1103', '#1089#1077#1082'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object NewThread: TButton
      Left = 24
      Top = 72
      Width = 249
      Height = 41
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1086#1090#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Pitch = fpFixed
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = NewThreadClick
    end
    object DeltaTime: TEdit
      Left = 176
      Top = 24
      Width = 89
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '3'
    end
    object ud1: TUpDown
      Left = 265
      Top = 24
      Width = 32
      Height = 27
      Associate = DeltaTime
      Min = 3
      Max = 60
      Position = 3
      TabOrder = 2
    end
  end
  object grp2: TGroupBox
    Left = 336
    Top = 304
    Width = 353
    Height = 121
    Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl2: TLabel
      Left = 8
      Top = 24
      Width = 146
      Height = 32
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' ID '#1087#1086#1090#1086#1082#1072' '#1076#1083#1103' '#1091#1076#1072#1083#1077#1085#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object DellThread: TButton
      Left = 8
      Top = 72
      Width = 145
      Height = 41
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1090#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = DellThreadClick
    end
    object ListThread: TListBox
      Left = 168
      Top = 16
      Width = 161
      Height = 97
      ItemHeight = 16
      TabOrder = 1
    end
  end
  object grp3: TGroupBox
    Left = 408
    Top = 8
    Width = 273
    Height = 57
    Caption = #1055#1077#1088#1080#1086#1076' '#1086#1095#1080#1089#1090#1082#1080' '#1092#1072#1081#1083#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1081', '#1084#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object ClearFile: TEdit
      Left = 16
      Top = 24
      Width = 97
      Height = 24
      ReadOnly = True
      TabOrder = 0
      Text = '5'
      OnChange = ClearFileChange
    end
    object ud2: TUpDown
      Left = 113
      Top = 24
      Width = 40
      Height = 24
      Associate = ClearFile
      Min = 1
      Max = 59
      Position = 5
      TabOrder = 1
      Wrap = True
    end
  end
  object TimerClearFile: TTimer
    OnTimer = TimerClearFileTimer
    Left = 328
    Top = 16
  end
end
