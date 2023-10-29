object DMConexao: TDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 281
  Width = 287
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=C:\Helio Sistemas\SysAgenda\DB\DBAGENDA.FDB'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'User_Name=HELIO'
      'Password=su@65065584'
      'RoleName=RDB$ADMIN'
      'Port=3080'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object FDFBDriverLink: TFDPhysFBDriverLink
    Left = 72
    Top = 96
  end
  object frxFDComponents1: TfrxFDComponents
    DefaultDatabase = FDConexao
    Left = 152
    Top = 128
  end
end
