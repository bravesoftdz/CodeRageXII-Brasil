object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 532
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 30
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 16
    Caption = 'Label2'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 232
    Width = 289
    Height = 289
    TabOrder = 0
  end
  object Buckets: TButton
    Left = 8
    Top = 200
    Width = 289
    Height = 25
    Caption = 'Buckets'
    TabOrder = 1
    OnClick = BucketsClick
  end
  object Button1: TButton
    Left = 303
    Top = 201
    Width = 274
    Height = 25
    Caption = 'Arquivos'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ListBox2: TListBox
    Left = 303
    Top = 232
    Width = 274
    Height = 292
    TabOrder = 3
  end
  object Button2: TButton
    Left = 583
    Top = 201
    Width = 201
    Height = 25
    Caption = 'Upload'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 583
    Top = 232
    Width = 201
    Height = 25
    Caption = 'Download'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 583
    Top = 263
    Width = 201
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = Button4Click
  end
  object AmazonConnectionInfo1: TAmazonConnectionInfo
    TableEndpoint = 'sdb.amazonaws.com'
    QueueEndpoint = 'queue.amazonaws.com'
    StorageEndpoint = 's3.amazonaws.com'
    Left = 128
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    Left = 592
    Top = 72
  end
end
