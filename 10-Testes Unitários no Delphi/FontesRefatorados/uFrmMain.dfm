object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consumo Ve'#237'culo'
  ClientHeight = 243
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 44
    Height = 13
    Caption = 'KM Inicial'
  end
  object Label2: TLabel
    Left = 208
    Top = 24
    Width = 39
    Height = 13
    Caption = 'KM Final'
  end
  object Label3: TLabel
    Left = 24
    Top = 80
    Width = 170
    Height = 13
    Caption = 'M'#233'dia consumo do ve'#237'culo (KM / LT)'
  end
  object Label4: TLabel
    Left = 208
    Top = 80
    Width = 134
    Height = 13
    Caption = 'Valor do litro do combust'#237'vel'
  end
  object edtKmInicial: TEdit
    Left = 24
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtKmFinal: TEdit
    Left = 208
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtMediaConsumo: TEdit
    Left = 24
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtValorLitro: TEdit
    Left = 208
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object btnCalcularConsumo: TButton
    Left = 24
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Calcular Consumo'
    TabOrder = 4
    OnClick = btnCalcularConsumoClick
  end
  object edtValorFinal: TEdit
    Left = 24
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 5
  end
end
