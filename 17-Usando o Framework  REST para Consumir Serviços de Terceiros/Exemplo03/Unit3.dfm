object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'REST/JSON com Delphi - Exemplo 3'
  ClientHeight = 493
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 20
    Height = 16
    Caption = 'cep'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 62
    Height = 16
    Caption = 'logradouro'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 144
    Width = 77
    Height = 16
    Caption = 'complemento'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 192
    Width = 34
    Height = 16
    Caption = 'bairro'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 240
    Width = 57
    Height = 16
    Caption = 'localidade'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 288
    Width = 11
    Height = 16
    Caption = 'uf'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 336
    Width = 45
    Height = 16
    Caption = 'unidade'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 384
    Width = 24
    Height = 16
    Caption = 'ibge'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 8
    Top = 432
    Width = 17
    Height = 16
    Caption = 'gia'
    FocusControl = DBEdit9
  end
  object Button1: TButton
    Left = 135
    Top = 8
    Width = 89
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
  object DBEdit1: TDBEdit
    Left = 8
    Top = 64
    Width = 400
    Height = 24
    DataField = 'cep'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 112
    Width = 400
    Height = 24
    DataField = 'logradouro'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 160
    Width = 400
    Height = 24
    DataField = 'complemento'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 208
    Width = 400
    Height = 24
    DataField = 'bairro'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 256
    Width = 400
    Height = 24
    DataField = 'localidade'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 304
    Width = 400
    Height = 24
    DataField = 'uf'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit7: TDBEdit
    Left = 8
    Top = 352
    Width = 400
    Height = 24
    DataField = 'unidade'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit8: TDBEdit
    Left = 8
    Top = 400
    Width = 400
    Height = 24
    DataField = 'ibge'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit9: TDBEdit
    Left = 8
    Top = 448
    Width = 400
    Height = 24
    DataField = 'gia'
    DataSource = DataSource1
    TabOrder = 10
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 112
    Top = 80
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'cep'
        Value = '01001000'
      end
      item
        Kind = pkURLSEGMENT
        name = 'formato'
        Value = 'json'
      end>
    Resource = 'ws/{cep}/{formato}'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 112
    Top = 128
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 112
    Top = 176
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 248
    Top = 80
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'cep'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'logradouro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'complemento'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'bairro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'localidade'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'uf'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'unidade'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ibge'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'gia'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 248
    Top = 128
    object FDMemTable1cep: TWideStringField
      FieldName = 'cep'
      Size = 255
    end
    object FDMemTable1logradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object FDMemTable1complemento: TWideStringField
      FieldName = 'complemento'
      Size = 255
    end
    object FDMemTable1bairro: TWideStringField
      FieldName = 'bairro'
      Size = 255
    end
    object FDMemTable1localidade: TWideStringField
      FieldName = 'localidade'
      Size = 255
    end
    object FDMemTable1uf: TWideStringField
      FieldName = 'uf'
      Size = 255
    end
    object FDMemTable1unidade: TWideStringField
      FieldName = 'unidade'
      Size = 255
    end
    object FDMemTable1ibge: TWideStringField
      FieldName = 'ibge'
      Size = 255
    end
    object FDMemTable1gia: TWideStringField
      FieldName = 'gia'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 248
    Top = 176
  end
end
