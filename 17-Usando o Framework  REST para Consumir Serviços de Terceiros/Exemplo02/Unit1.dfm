object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'REST/JSON com Delphi - Exemplo 2'
  ClientHeight = 360
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 135
    Top = 8
    Width = 91
    Height = 24
    Caption = 'Buscar CEP'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object MaskEdit1: TMaskEdit
    Left = 8
    Top = 8
    Width = 116
    Height = 24
    EditMask = '99.999-999;0;_'
    MaxLength = 10
    TabOrder = 0
    Text = '01001000'
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 8
    Top = 38
    Width = 529
    Height = 314
    Margins.Left = 8
    Margins.Top = 38
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 2
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 144
    Top = 88
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'cep'
        Options = [poAutoCreated]
        Value = '01001000'
      end
      item
        Kind = pkURLSEGMENT
        name = 'formato'
        Options = [poAutoCreated]
        Value = 'json'
      end>
    Resource = 'ws/{cep}/{formato}'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 144
    Top = 136
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 144
    Top = 184
  end
end
