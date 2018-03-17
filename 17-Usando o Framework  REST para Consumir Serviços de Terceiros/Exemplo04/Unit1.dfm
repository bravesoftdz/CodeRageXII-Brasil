object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'REST/JSON com Delphi - Exemplo 4'
  ClientHeight = 463
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 67
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 622
    object Label1: TLabel
      Left = 10
      Top = 9
      Width = 43
      Height = 16
      Caption = 'P'#225'gina:'
    end
    object SpinEdit1: TSpinEdit
      Left = 10
      Top = 31
      Width = 95
      Height = 26
      MaxValue = 4
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = ConsultarDados
    end
    object Button1: TButton
      Left = 111
      Top = 31
      Width = 94
      Height = 26
      Caption = 'Consultar'
      Default = True
      TabOrder = 1
      OnClick = ConsultarDados
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 70
    Width = 526
    Height = 137
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pantone_value'
        Width = 190
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 210
    Width = 532
    Height = 253
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 373
    ExplicitWidth = 622
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 10
      Height = 16
      Caption = 'id'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 32
      Height = 16
      Caption = 'name'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 16
      Top = 104
      Width = 25
      Height = 16
      Caption = 'year'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 16
      Top = 152
      Width = 28
      Height = 16
      Caption = 'color'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 16
      Top = 200
      Width = 83
      Height = 16
      Caption = 'pantone_value'
      FocusControl = DBEdit5
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 500
      Height = 24
      DataField = 'id'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 500
      Height = 24
      DataField = 'name'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 120
      Width = 500
      Height = 24
      DataField = 'year'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 168
      Width = 500
      Height = 24
      DataField = 'color'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 216
      Width = 500
      Height = 24
      DataField = 'pantone_value'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://reqres.in'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 144
    Top = 72
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        name = 'page'
        Value = '1'
      end>
    Resource = 'api/uses'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 144
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'data'
    Left = 144
    Top = 168
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 416
    Top = 72
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'year'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'color'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'pantone_value'
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
    Left = 416
    Top = 120
    object FDMemTable1id: TWideStringField
      FieldName = 'id'
      Size = 255
    end
    object FDMemTable1name: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object FDMemTable1year: TWideStringField
      FieldName = 'year'
      Size = 255
    end
    object FDMemTable1color: TWideStringField
      FieldName = 'color'
      Size = 255
    end
    object FDMemTable1pantone_value: TWideStringField
      FieldName = 'pantone_value'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 416
    Top = 168
  end
end
