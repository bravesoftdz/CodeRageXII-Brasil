object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'REST/JSON com Delphi - Exemplo 1'
  ClientHeight = 481
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Json To Object'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 8
    Top = 40
    Width = 472
    Height = 433
    Margins.Left = 8
    Margins.Top = 40
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '{'
      '  "titulo": "Tenda dos Milagres",'
      '  "autor": "Jorge Amado",'
      '  "paginas": 320,'
      '  "ano": 2008,'
      '  "editora": "Companhia das Letras",'
      '  "livrarias": ['
      '    {'
      '      "nome": "Saraiva",'
      '      "site": "www.saraiva.com",'
      '      "preco": 50'
      '    },'
      '    {'
      '      "nome": "Submarino",'
      '      "site": "www.submarino.com.br",'
      '      "preco": 44.99'
      '    }'
      '  ]'
      '}')
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 127
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Object to Json'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 246
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Builder'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 365
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Reader'
    TabOrder = 4
    OnClick = Button4Click
  end
end
