unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.Menus;

type
  TFrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Examples1: TMenuItem;
    miOrder: TMenuItem;
    miFilesImport: TMenuItem;
    miCustomer: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miOrderClick(Sender: TObject);
    procedure miFilesImportClick(Sender: TObject);
    procedure miCustomerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uFrc, uVariaveis, frmWeb, frmPedidos, frmFile, FrmCustomers;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  _gFormControl := TFrc.Create(Self, TFormWeb);
  _gFormControl.MostrarMenuPopup := True;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_gFormControl);
end;

procedure TFrmMain.miCustomerClick(Sender: TObject);
begin
  _gFormControl.prMostrarFormulario(TFormCustomers, False);
end;

procedure TFrmMain.miFilesImportClick(Sender: TObject);
begin
  _gFormControl.prMostrarFormulario(TFormFile, False);
end;

procedure TFrmMain.miOrderClick(Sender: TObject);
begin
  _gFormControl.prMostrarFormulario(TFormPedidos, False);
end;

end.
