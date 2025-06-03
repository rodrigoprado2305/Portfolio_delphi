object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Portfolio examples - Rodrigo Prado'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 352
    Top = 280
    object Examples1: TMenuItem
      Caption = 'Examples'
      object miOrder: TMenuItem
        Caption = 'Order Entry'
        OnClick = miOrderClick
      end
      object miFilesImport: TMenuItem
        Caption = 'Files import'
        OnClick = miFilesImportClick
      end
      object miCustomer: TMenuItem
        Caption = 'Customers'
        OnClick = miCustomerClick
      end
    end
  end
end
