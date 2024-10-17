unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.Buttons;

type
  TFrmMain = class(TForm)
    pnlCabelho: TPanel;
    btnPedidos: TSpeedButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uFrc, uVariaveis, frmWeb, frmPedidos;

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

procedure TFrmMain.btnPedidosClick(Sender: TObject);
begin
  _gFormControl.prMostrarFormulario(TFormPedidos, False);
end;

end.
