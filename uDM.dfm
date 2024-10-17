object DM: TDM
  OnCreate = DataModuleCreate
  Height = 297
  Width = 355
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=DBTESTEWK'
      'User_Name=root'
      'Password=Banco12345*'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 153
    Top = 24
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'D:\github\Teste_WK\Win32\Debug\libmysql.dll'
    Left = 153
    Top = 104
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 152
    Top = 184
  end
end
