unit FrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormPesquisa = class(TForm)
    gbxFiltro: TGroupBox;
    pnlBotoes1: TPanel;
    btnSelecionar: TSpeedButton;
    btnFechar: TSpeedButton;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    grdPesquisa: TDBGrid;
    memPesquisa: TFDMemTable;
    dsPesquisa: TDataSource;
    memPesquisaCodigo: TIntegerField;
    memPesquisaDescricao: TStringField;
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure grdPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisa: TFormPesquisa;

implementation

uses uVariaveis;

{$R *.dfm}

procedure TFormPesquisa.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFormPesquisa.btnSelecionarClick(Sender: TObject);
begin
  if not memPesquisa.IsEmpty then
  begin
    _gintCodigo := memPesquisa.FieldByName('Codigo').AsInteger;
    _gstrDescricao := memPesquisa.FieldByName('Descricao').AsString;
  end;
  ModalResult := mrCancel;
end;

procedure TFormPesquisa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
 { if key = #13 then
  begin
    cdsDados.Filtered := False;
    if edtCodigo.Text <> '' then
    begin
      cdsDados.Filtered := True;
      if chkAtivos.Checked then
        cdsDados.Filter := _gtypPesqCampos.sCampoAtivo + ' = ''A'' and ' + _gtypPesqCampos.sCampoCodigo + ' = '+edtCodigo.Text
      else
        cdsDados.Filter := _gtypPesqCampos.sCampoCodigo + ' = '+edtCodigo.Text;
    end;
  end;}
end;

procedure TFormPesquisa.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtDescricao.Text = EmptyStr then
    memPesquisa.Filtered := False;
end;

procedure TFormPesquisa.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
{  if key = #13 then
  begin
    cdsDados.Filtered := False;
    if edtDescricao.Text <> '' then
    begin
      cdsDados.Filtered := True;
      if chkAtivos.Checked then //erro no xe2
        cdsDados.Filter := _gtypPesqCampos.sCampoAtivo + ' = ''A'' and ' + _gtypPesqCampos.sCampoDescricao + ' Like '+QuotedStr('%'+edtDescricao.Text+'%')
      else
        cdsDados.Filter := _gtypPesqCampos.sCampoDescricao + ' Like '+QuotedStr('%'+edtDescricao.Text+'%');
    end;
  end;}
end;

procedure TFormPesquisa.grdPesquisaDblClick(Sender: TObject);
begin
  btnSelecionar.click;
end;

procedure TFormPesquisa.grdPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if State = [] then
  begin
    if memPesquisa.RecNo mod 2 = 1 then
      TDbGrid(Sender).Canvas.Brush.Color := clWebLightBlue
    else
      TDbGrid(Sender).Canvas.Brush.Color := clWhite;
  end;
  TDbGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormPesquisa.grdPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnSelecionar.click;
end;

end.
