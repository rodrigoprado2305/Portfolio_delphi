object FormFile: TFormFile
  Left = 0
  Top = 0
  Caption = 'FormFile'
  ClientHeight = 467
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object grdHeader: TDBGrid
    Left = 0
    Top = 95
    Width = 654
    Height = 60
    Align = alTop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object grdTransacao: TDBGrid
    Left = 0
    Top = 155
    Width = 654
    Height = 252
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object grdTrailler: TDBGrid
    Left = 0
    Top = 407
    Width = 654
    Height = 60
    Align = alBottom
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 95
    Align = alTop
    TabOrder = 3
    ExplicitTop = -6
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 176
      Height = 93
      Align = alLeft
      Caption = 'Process'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 0
      ExplicitTop = -4
    end
  end
end
