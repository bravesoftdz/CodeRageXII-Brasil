object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 482
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 127
    Width = 449
    Height = 307
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 317
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Put'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 236
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 398
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Patch'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 21
    Width = 449
    Height = 100
    Lines.Strings = (
      '{'
      '    '#39'Usuario'#39' : '#39'teste'#39', '
      '    '#39'Senha'#39' : 123456 '
      '}')
    TabOrder = 4
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 272
    Top = 192
  end
  object TBGFirebaseConnection1: TTBGFirebaseConnection
    Left = 104
    Top = 136
  end
end
