unit FrmPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Buttons,

  Controller_t001_clientes, Controller_t002_produtos, Controller_t003_pedidos,
  Controller_tbl_t004_pedidos_produtos, FrmPesquisa;

type
  TFormPedidos = class(TForm)
    memListaPedidos: TFDMemTable;
    dsListaPedidos: TDataSource;
    pcPedidos: TPageControl;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    gbListaPedidos: TGroupBox;
    gbListaItens: TGroupBox;
    Splitter: TSplitter;
    grdListaPedidos: TDBGrid;
    grdListaItens: TDBGrid;
    memListaItens: TFDMemTable;
    dsListaItens: TDataSource;
    memListaPedidost003_pedidoID: TIntegerField;
    memListaPedidost003_clienteID: TIntegerField;
    memListaPedidost003_data_emissao: TDateField;
    memListaPedidost001_nome: TStringField;
    memListaPedidost001_cidade: TStringField;
    memListaPedidost001_uf: TStringField;
    memListaItenst002_descricao: TStringField;
    memListaItenst004_pedido_produtoID: TIntegerField;
    memListaItenst004_quantidade: TIntegerField;
    memListaItenst004_vlr_unitario: TFloatField;
    memListaItenst004_vlr_total: TFloatField;
    memListaPedidost003_vlr_total: TFloatField;
    pnlCabecalho: TPanel;
    pnlTitulo: TPanel;
    gbxItens: TGroupBox;
    grdItens: TDBGrid;
    memItens: TFDMemTable;
    memItenst004_pedido_produtoID: TIntegerField;
    memItenst002_descricao: TStringField;
    memItenst004_quantidade: TIntegerField;
    memItenst004_vlr_unitario: TFloatField;
    memItenst004_vlr_total: TFloatField;
    dsItens: TDataSource;
    memItenst003_pedidoID: TIntegerField;
    memItenst002_produtoID: TIntegerField;
    pnlRodapeItem: TPanel;
    btnExcluirItem: TSpeedButton;
    btnInserirItem: TSpeedButton;
    edtTotalGeral: TEdit;
    lblTotalGeral: TLabel;
    lblDataEmissao: TLabel;
    pnlRodapeListaPedidos: TPanel;
    btnListaSelecionar: TSpeedButton;
    btnListaPesquisa: TSpeedButton;
    gbxPedidos: TGroupBox;
    edtDescricaoCliente: TLabeledEdit;
    edtDataEmissao: TDateTimePicker;
    btnPesquisaCliente: TSpeedButton;
    edtCliente: TLabeledEdit;
    pnlProduto: TPanel;
    edtValorTotal: TLabeledEdit;
    edtValorUnitario: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtDescricaoProduto: TLabeledEdit;
    edtProduto: TLabeledEdit;
    btnPesquisaProduto: TSpeedButton;
    btnEditarItem: TSpeedButton;
    btnCancelarItem: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlRodapePedidos: TPanel;
    btnInserirPedido: TSpeedButton;
    btnGravarPedido: TSpeedButton;
    btnAlterarPedido: TSpeedButton;
    btnExcluirPedido: TSpeedButton;
    btnCancelarPedido: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dsListaPedidosDataChange(Sender: TObject; Field: TField);
    procedure btnInserirItemClick(Sender: TObject);
    procedure btnInserirPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorUnitarioEnter(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure btnPesquisaClienteClick(Sender: TObject);
    procedure btnPesquisaProdutoClick(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnListaPesquisaClick(Sender: TObject);
    procedure btnListaSelecionarClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnAlterarPedidoClick(Sender: TObject);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure grdListaPedidosDblClick(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure grdItensKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarItemClick(Sender: TObject);
    procedure grdListaPedidosKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarItemClick(Sender: TObject);
  private
    sEditionState : String;

    clientes: TController_t001_clientes;
    produtos: TController_t002_produtos;
    pedidos: TController_t003_pedidos;
    pedidos_produtos: TController_t004_pedidos_produtos;

    procedure CarregarListaPedidos;
    procedure CarregarListaItens(iPedidoID: integer);
    function AtualizarTotalGeral: real;
    procedure PesquisaCliente(iCliente: integer);
    procedure Limpar;
    procedure EditionControl;
    procedure PesquisaProduto(iProduto: integer);
  end;

var
  FormPedidos: TFormPedidos;

implementation

uses uDM, uMsg, uFormat, uVariaveis, uConstantes;

{$R *.dfm}

procedure TFormPedidos.FormCreate(Sender: TObject);
begin
  clientes := TController_t001_clientes.create(nil);
  produtos := TController_t002_produtos.create(nil);
  pedidos := TController_t003_pedidos.create(nil);
  pedidos_produtos := TController_t004_pedidos_produtos.create(nil);
end;

procedure TFormPedidos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(clientes);
  FreeAndNil(produtos);
  FreeAndNil(pedidos);
  FreeAndNil(pedidos_produtos);
end;

procedure TFormPedidos.FormShow(Sender: TObject);
begin
  memItens.CreateDataSet;
  edtDataEmissao.DateTime := Now;
  sEditionState := CANCELAR;
  EditionControl;
  pcPedidos.ActivePage := tsPesquisa;
end;

procedure TFormPedidos.grdListaPedidosDblClick(Sender: TObject);
begin
  btnListaSelecionar.Click;
end;

procedure TFormPedidos.grdListaPedidosKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    btnListaSelecionar.Click;
end;

procedure TFormPedidos.btnAlterarPedidoClick(Sender: TObject);
begin
  sEditionState := ALTERAR;
  EditionControl;
  grdItens.SetFocus;
end;

procedure TFormPedidos.btnCancelarItemClick(Sender: TObject);
begin
  btnExcluirItem.enabled := True;
  edtProduto.Clear;
  edtDescricaoProduto.Clear;
  edtQuantidade.Clear;
  edtValorUnitario.Clear;
  edtValorTotal.Clear;
end;

procedure TFormPedidos.btnCancelarPedidoClick(Sender: TObject);
begin
  sEditionState := CANCELAR;
  EditionControl;
end;

procedure TFormPedidos.btnExcluirItemClick(Sender: TObject);
begin
  if memItens.IsEmpty then
  begin
    fnMsg(msgNenhumRegSelecionado);
    exit;
  end;

  if fnMsg(msgExcluir) then
  begin

    if sEditionState = ALTERAR then
    begin
      if memItens.FieldByName('t004_pedido_produtoID').AsInteger > 0  then
      begin
        pedidos_produtos.Registro.Codigo := memItens.FieldByName('t004_pedido_produtoID').AsInteger;
        pedidos_produtos.getbyId;
        pedidos_produtos.delete;
      end;
    end;

    memItens.Delete;
    sEditionState := EXCLUIR;
    EditionControl;
    AtualizarTotalGeral;
    fnMsg(msgExcluido);
  end;
end;

procedure TFormPedidos.btnExcluirPedidoClick(Sender: TObject);
begin
  if (memItens.IsEmpty) or (sEditionState = INSERIR) then
  begin
    fnMsg(msgNenhumRegSelecionado);
    exit;
  end;

  sEditionState := EXCLUIR;
  EditionControl;

  if fnMsg(msgExcluir) then
  begin
    if pedidos.Registro.Codigo > 0 then
    begin
      pedidos_produtos.apagarItensPorPedido(pedidos.Registro.Codigo);
      pedidos.delete;
    end;
  end;

  btnListaPesquisa.click;
end;

procedure TFormPedidos.btnGravarPedidoClick(Sender: TObject);
begin
  if edtCliente.Text = EmptyStr then
  begin
    fnMsg(msgCampoObrigatorio, edtCliente.EditLabel.Caption);
    edtQuantidade.SetFocus;
    exit;
  end;

  if memItens.IsEmpty then
  begin
    fnMsg(msgNenhumItem);
    exit;
  end;

  if pedidos.Registro.Codigo = 0 then
  begin
    pedidos.Registro.DataEmissao := edtDataEmissao.Date;
    pedidos.Registro.ClienteID := StrToInt(edtCliente.Text);
  end;

  AtualizarTotalGeral;
  pedidos.Registro.ValorTotal := AtualizarTotalGeral;
  pedidos.salva;

  memItens.first;
  while not memItens.Eof do
  begin
    if (sEditionState = ALTERAR) or (sEditionState = ALTERAR_ITEM) then
      pedidos_produtos.Registro.Codigo := memItens.FieldByName('t004_pedido_produtoID').AsInteger;

    pedidos_produtos.Registro.PedidoID := pedidos.Registro.Codigo;
    pedidos_produtos.Registro.ProdutoID := memItens.FieldByName('t002_produtoID').AsInteger;
    pedidos_produtos.Registro.Quantidade := memItens.FieldByName('t004_quantidade').AsInteger;
    pedidos_produtos.Registro.ValorUnitario := memItens.FieldByName('t004_vlr_unitario').AsFloat;
    pedidos_produtos.Registro.ValorTotal := memItens.FieldByName('t004_vlr_total').AsFloat;
    pedidos_produtos.insert;

    memItens.Next;
  end;

  fnMsg(msgGravar);

  sEditionState := GRAVAR;
  EditionControl;

  btnListaPesquisa.click;
end;

procedure TFormPedidos.btnInserirItemClick(Sender: TObject);
var
  cValorTotal: real;
  sTemp: String;
begin
  if edtProduto.Text = EmptyStr then
  begin
    fnMsg(msgCampoObrigatorio, edtProduto.EditLabel.Caption);
    edtProduto.SetFocus;
    exit;
  end;

  if edtQuantidade.Text = EmptyStr then
  begin
    fnMsg(msgCampoObrigatorio, edtQuantidade.EditLabel.Caption);
    edtQuantidade.SetFocus;
    exit;
  end;
  if StrToInt(edtQuantidade.Text) <= 0 then
  begin
    fnMsg(msgValorCampoIncorreto, edtQuantidade.EditLabel.Caption);
    edtQuantidade.SetFocus;
    exit;
  end;

  if edtValorUnitario.Text = EmptyStr then
  begin
    fnMsg(msgCampoObrigatorio, edtValorUnitario.EditLabel.Caption);
    edtValorUnitario.SetFocus;
    exit;
  end;
  LimparFormatacao(edtValorUnitario);
  if StrToFloat(edtValorUnitario.Text) <= 0 then
  begin
    fnMsg(msgValorCampoIncorreto, edtValorUnitario.EditLabel.Caption);
    edtValorUnitario.SetFocus;
    exit;
  end;

  Formatar(edtValorUnitario, TFormato.Valor);
  cValorTotal := StrToInt(edtQuantidade.Text) * StrToFloat(edtValorUnitario.Text);

  if sEditionState = ALTERAR_ITEM then
  begin
     memItens.Edit;
     memItens.FieldByName('t004_quantidade').AsInteger := StrToInt(edtQuantidade.Text);
     memItens.FieldByName('t004_vlr_unitario').AsFloat := StrToFloat(edtValorUnitario.Text);
     memItens.FieldByName('t004_vlr_total').AsFloat := cValorTotal;
     memItens.Post;
  end
  else
  begin
    memItens.AppendRecord([
      0,
      0,
      StrToInt(edtProduto.Text),
      edtDescricaoProduto.Text,
      StrToInt(edtQuantidade.Text),
      StrToFloat(edtValorUnitario.Text),
      cValorTotal
    ]);
  end;

  AtualizarTotalGeral;
  btnExcluirItem.enabled := True;
end;

procedure TFormPedidos.btnEditarItemClick(Sender: TObject);
begin
  btnExcluirItem.enabled := False;

  if memItens.IsEmpty then
  begin
    fnMsg(msgNenhumRegSelecionado);
    exit;
  end;

  edtProduto.Text := memItens.FieldByName('t002_produtoID').AsString;
  edtDescricaoProduto.Text := memItens.FieldByName('t002_descricao').AsString;
  edtQuantidade.Text := memItens.FieldByName('t004_quantidade').AsString;
  edtValorUnitario.Text := memItens.FieldByName('t004_vlr_unitario').AsString;
  edtValorTotal.Text := memItens.FieldByName('t004_vlr_total').AsString;

  sEditionState := ALTERAR_ITEM;

  edtQuantidade.SetFocus;
end;

procedure TFormPedidos.Limpar;
begin
  pedidos.Clear;
  pedidos_produtos.Clear;

  edtCliente.Clear;
  edtDescricaoCliente.Clear;
  edtDataEmissao.DateTime := Now;
  edtProduto.Clear;
  edtDescricaoProduto.clear;
  edtQuantidade.Clear;
  edtValorUnitario.Clear;
  edtValorTotal.Clear;
  edtTotalGeral.Clear;

  memItens.EmptyDataSet;

  gbxItens.Caption := 'Itens do pedido';
end;

procedure TFormPedidos.btnListaPesquisaClick(Sender: TObject);
begin
  CarregarListaPedidos;
  Limpar;
end;

procedure TFormPedidos.btnListaSelecionarClick(Sender: TObject);
var
  i: integer;
begin
  if not memListaPedidos.IsEmpty then
  begin
    pedidos.clear;
    pedidos.Parametros.FieldName.Codigo := memListaPedidos.FieldByName('t003_pedidoID').AsInteger;
    pedidos.Search;

    pedidos.Registro.Codigo := pedidos.Lista[0].Codigo;
    pedidos.getbyId;

    edtCliente.Text := IntToStr(pedidos.Lista[0].Codigo);
    PesquisaCliente(pedidos.Lista[0].Codigo);
    edtDataEmissao.Date := pedidos.Lista[0].DataEmissao;

    pedidos_produtos.clear;
    pedidos_produtos.Parametros.FieldName.PedidoID := pedidos.Registro.Codigo;
    pedidos_produtos.Search;

    if not memItens.Active then
      memItens.CreateDataSet;

    memItens.EmptyDataSet;

    memItens.DisableControls;
    for i := 0 to Pred(pedidos_produtos.Lista.Count) do
      memItens.AppendRecord([
        pedidos_produtos.Lista[i].Codigo,
        pedidos.Registro.Codigo,
        pedidos_produtos.Lista[i].ProdutoID,
        pedidos_produtos.Lista[i].ProdutoDescricao,
        pedidos_produtos.Lista[i].Quantidade,
        pedidos_produtos.Lista[i].ValorUnitario,
        pedidos_produtos.Lista[i].ValorTotal
      ]);
    memItens.EnableControls;

    edtTotalGeral.Text := FloatToStr(pedidos.Lista[0].ValorTotal);
    //Formatar(edtTotalGeral, TFormato.Valor);

    gbxItens.Caption := 'Itens do pedido: ' + IntToStr(pedidos.Registro.Codigo);

    sEditionState := ALTERAR;
    EditionControl;

    pcPedidos.ActivePage := tsCadastro;
  end;
end;

procedure TFormPedidos.btnInserirPedidoClick(Sender: TObject);
begin
  limpar;
  sEditionState := INSERIR;
  EditionControl;
  edtCliente.SetFocus;
end;

procedure TFormPedidos.CarregarListaPedidos;
var
  i: Integer;
begin
  pedidos.Clear;
  pedidos.Search;

  if not memListaPedidos.Active then
    memListaPedidos.CreateDataSet;

  memListaPedidos.EmptyDataSet;

  memListaPedidos.DisableControls;

  for i := 0 to Pred(pedidos.Lista.Count) do
    memListaPedidos.AppendRecord([
      pedidos.Lista[i].Codigo, pedidos.Lista[i].ClienteID,
      pedidos.Lista[i].DataEmissao, pedidos.Lista[i].ClienteNome,
      pedidos.Lista[i].ClienteCidade, pedidos.Lista[i].ClienteUF,
      pedidos.Lista[i].ValorTotal]);

  memListaPedidos.EnableControls;
end;

procedure TFormPedidos.CarregarListaItens(iPedidoID: integer);
var
  i: Integer;
begin
  pedidos_produtos.Clear;

  pedidos_produtos.Parametros.FieldName.PedidoID := iPedidoID;

  pedidos_produtos.Search;

  if not memListaItens.Active then
    memListaItens.CreateDataSet;

  memListaItens.EmptyDataSet;

  memListaItens.DisableControls;

  for i := 0 to Pred(pedidos_produtos.Lista.Count) do
    memListaItens.AppendRecord([
      pedidos_produtos.Lista[i].Codigo, pedidos_produtos.Lista[i].ProdutoDescricao,
      pedidos_produtos.Lista[i].Quantidade, pedidos_produtos.Lista[i].ValorUnitario,
      pedidos_produtos.Lista[i].ValorTotal]);

  memListaItens.EnableControls;
end;

procedure TFormPedidos.dsListaPedidosDataChange(Sender: TObject; Field: TField);
begin
  if not memListaPedidos.IsEmpty then
    CarregarListaItens(memListaPedidos.FieldByName('t003_pedidoID').AsInteger);
end;

procedure TFormPedidos.edtValorUnitarioEnter(Sender: TObject);
begin
  LimparFormatacao(edtValorUnitario);
end;

procedure TFormPedidos.edtValorUnitarioExit(Sender: TObject);
var
  cValor, cValorTotal: real;
begin
  if edtQuantidade.Text = EmptyStr then
    exit;
  if StrToInt(edtQuantidade.Text) <= 0 then
    exit;

  LimparFormatacao(edtValorUnitario);
  cValor := StrToFloat(edtValorUnitario.Text);
  Formatar(edtValorUnitario, TFormato.Valor);

  cValorTotal := StrToInt(edtQuantidade.Text) * cValor;
  edtValorTotal.Text := FloatToStr(cValorTotal);
  Formatar(edtValorTotal, TFormato.Valor);
end;

procedure TFormPedidos.edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    grdItens.SetFocus;
end;

procedure TFormPedidos.edtQuantidadeExit(Sender: TObject);
var
  cValor, cValorTotal: real;
begin
  if edtQuantidade.Text = EmptyStr then
    exit;
  if StrToInt(edtQuantidade.Text) <= 0 then
    exit;
  if edtValorUnitario.Text = EmptyStr then
    exit;

  LimparFormatacao(edtValorUnitario);
  if StrToFloat(edtValorUnitario.Text) <= 0 then
    exit;

  cValor := StrToFloat(edtValorUnitario.Text);
  Formatar(edtValorUnitario, TFormato.Valor);

  cValorTotal := StrToInt(edtQuantidade.Text) * cValor;
  edtValorTotal.Text := FloatToStr(cValorTotal);
  Formatar(edtValorTotal, TFormato.Valor);
end;

procedure TFormPedidos.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    edtValorUnitario.SetFocus;
end;

procedure TFormPedidos.PesquisaCliente(iCliente: integer);
begin
  clientes.Clear;
  clientes.Parametros.FieldName.Codigo := iCliente;
  clientes.Search;

  edtCliente.Text := IntToStr(clientes.Lista[0].Codigo);
  edtDescricaoCliente.Text := clientes.Lista[0].Nome;
end;

procedure TFormPedidos.edtClienteExit(Sender: TObject);
begin
  if edtCliente.Text <> EmptyStr then
    PesquisaCliente(StrToIntDef(edtCliente.Text, 0));
end;

procedure TFormPedidos.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (edtCliente.Text <> EmptyStr) then
    PesquisaCliente(StrToIntDef(edtCliente.Text, 0));
end;

procedure TFormPedidos.btnPesquisaClienteClick(Sender: TObject);
var
  i: Integer;
begin
  clientes.Clear;
  clientes.Search;

  if not FormPesquisa.memPesquisa.Active then
    FormPesquisa.memPesquisa.CreateDataSet;

  FormPesquisa.memPesquisa.EmptyDataSet;

  FormPesquisa.memPesquisa.DisableControls;

  for i := 0 to Pred(clientes.Lista.Count) do
    FormPesquisa.memPesquisa.AppendRecord([clientes.Lista[i].Codigo, clientes.Lista[i].Nome]);

  FormPesquisa.memPesquisa.EnableControls;

  FormPesquisa.ShowModal;

  edtCliente.Text := IntToStr(_gintCodigo);
  edtDescricaoCliente.Text := _gstrDescricao;
end;

procedure TFormPedidos.PesquisaProduto(iProduto: integer);
begin
  produtos.Clear;
  produtos.Parametros.FieldName.Codigo := iProduto;
  produtos.Search;

  edtProduto.Text := IntToStr(produtos.Lista[0].Codigo);
  edtDescricaoProduto.Text := produtos.Lista[0].Descricao;
end;

procedure TFormPedidos.edtProdutoExit(Sender: TObject);
begin
  if edtCliente.Text <> EmptyStr then
    PesquisaProduto(StrToIntDef(edtProduto.Text, 0));
end;

procedure TFormPedidos.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (edtProduto.Text <> EmptyStr) then
    PesquisaProduto(StrToIntDef(edtProduto.Text, 0));
end;

procedure TFormPedidos.btnPesquisaProdutoClick(Sender: TObject);
var
  i: Integer;
begin
  produtos.Clear;
  produtos.Search;

  if not FormPesquisa.memPesquisa.Active then
    FormPesquisa.memPesquisa.CreateDataSet;

  FormPesquisa.memPesquisa.EmptyDataSet;

  FormPesquisa.memPesquisa.DisableControls;

  for i := 0 to Pred(produtos.Lista.Count) do
    FormPesquisa.memPesquisa.AppendRecord([produtos.Lista[i].Codigo, produtos.Lista[i].Descricao]);

  FormPesquisa.memPesquisa.EnableControls;

  FormPesquisa.ShowModal;

  edtProduto.Text := IntToStr(_gintCodigo);
  edtDescricaoProduto.Text := _gstrDescricao;
end;

procedure TFormPedidos.grdItensKeyPress(Sender: TObject; var Key: Char);
begin
  //showmessage(format('O código da tecla pressionada é: %d', [Key]));
  if (key = #13) then
    btnEditarItem.click
  else if (key = #46) or (key = #110) or (key = #8) then  //[del], [BACKSPACE <-], [NUM SEP. DECIMAL - .del]
  begin
    btnExcluirItem.click;
  end;
end;

procedure TFormPedidos.EditionControl;
begin
  if sEditionState = INSERIR then
  begin
    gbxPedidos.Enabled := True;

    btnInserirPedido.Enabled := False;
    btnAlterarPedido.Enabled := False;
    btnExcluirPedido.Enabled := False;
    btnGravarPedido.Enabled := True;
    btnCancelarPedido.Enabled := True;

    edtProduto.Enabled := True;
    btnPesquisaProduto.Enabled := True;
    edtQuantidade.Enabled := True;
    edtValorUnitario.Enabled := True;

    btnInserirItem.Enabled := True;
    btnExcluirItem.Enabled := True;
    btnEditarItem.Enabled := True;
  end
  else if sEditionState = ALTERAR then
  begin
    gbxPedidos.Enabled := False;

    edtProduto.Enabled := False;
    btnPesquisaProduto.Enabled := False;
    edtQuantidade.Enabled := True;
    edtValorUnitario.Enabled := True;

    btnInserirItem.Enabled := True;
    btnExcluirItem.Enabled := True;
    btnEditarItem.Enabled := True;

    btnInserirPedido.Enabled := False;
    btnAlterarPedido.Enabled := False;
    btnExcluirPedido.Enabled := False;
    btnGravarPedido.Enabled := True;
    btnCancelarPedido.Enabled := True;
  end
  else if sEditionState = EXCLUIR then
  begin
    gbxPedidos.Enabled := False;

    edtProduto.Enabled := False;
    btnPesquisaProduto.Enabled := False;
    edtQuantidade.Enabled := True;
    edtValorUnitario.Enabled := True;

    btnInserirItem.Enabled := True;
    btnExcluirItem.Enabled := True;
    btnEditarItem.Enabled := True;

    btnInserirPedido.Enabled := False;
    btnAlterarPedido.Enabled := False;
    btnExcluirPedido.Enabled := False;
    btnGravarPedido.Enabled := True;
    btnCancelarPedido.Enabled := True;
  end
  else if sEditionState = GRAVAR then
  begin
    gbxPedidos.Enabled := True;

    edtProduto.Enabled := gbxPedidos.Enabled;
    btnPesquisaProduto.Enabled := gbxPedidos.Enabled;
    edtQuantidade.Enabled := gbxPedidos.Enabled;
    edtValorUnitario.Enabled := gbxPedidos.Enabled;

    btnInserirItem.Enabled := False;
    btnExcluirItem.Enabled := False;
    btnEditarItem.Enabled := False;

    btnInserirPedido.Enabled := True;
    btnAlterarPedido.Enabled := True;
    btnExcluirPedido.Enabled := True;
    btnGravarPedido.Enabled := False;
    btnCancelarPedido.Enabled := False;
  end
  else if sEditionState = CANCELAR then
  begin
    gbxPedidos.Enabled := False;

    edtProduto.Enabled := gbxPedidos.Enabled;
    btnPesquisaProduto.Enabled := gbxPedidos.Enabled;
    edtQuantidade.Enabled := gbxPedidos.Enabled;
    edtValorUnitario.Enabled := gbxPedidos.Enabled;

    btnInserirItem.Enabled := True;
    btnExcluirItem.Enabled := True;
    btnEditarItem.Enabled := True;

    btnInserirPedido.Enabled := True;
    btnAlterarPedido.Enabled := False;
    btnExcluirPedido.Enabled := True;
    btnGravarPedido.Enabled := False;
    btnCancelarPedido.Enabled := False;
  end;
end;

function TFormPedidos.AtualizarTotalGeral: real;
var
  cValorTotal : real;
begin
  cValorTotal := 0;
  if not memItens.IsEmpty then
  begin
    memItens.first;
    while not memItens.Eof do
    begin
      cValorTotal := cValorTotal + memItens.FieldByName('t004_vlr_total').AsFloat;
      memItens.Next;
    end;
  end;
  edtTotalGeral.Text := FloatToStr(cValorTotal);
  //Formatar(edtTotalGeral, TFormato.Valor);
  memItens.first;
  result := cValorTotal;
end;

end.
