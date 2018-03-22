object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 288
  Width = 428
  object DSServer1: TDSServer
    Left = 104
    Top = 35
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 232
    Top = 35
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=rmfactory'
      'User_Name=rmfactory'
      'Password=123456'
      'Server=mysql.rmfactory.com.br'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 104
  end
end
