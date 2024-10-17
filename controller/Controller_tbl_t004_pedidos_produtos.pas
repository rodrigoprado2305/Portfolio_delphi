unit Controller_tbl_t004_pedidos_produtos;

interface

uses System.Classes, System.SysUtils, Generics.Collections,
     ControllerBase, prm_T004_pedidos_produtos, tbl_t004_pedidos_produtos,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TList004_pedidos_produtos = TObjectList<t004_pedidos_produtos>;
  TController_t004_pedidos_produtos = Class(TControllerBase)
  private
    FParametros: TPrm_t004_pedidos_produtos;
    procedure setFParametros(const Value: TPrm_t004_pedidos_produtos);
  public
    Registro : t004_pedidos_produtos;
    Lista : TList004_pedidos_produtos;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function salva:boolean;
    procedure getbyId;
    procedure apagarItensPorPedido(iPedidoID: integer);

    function Clear:Boolean;
    procedure Search;
    property Parametros : TPrm_t004_pedidos_produtos read FParametros write setFParametros;
  End;

implementation

function TController_t004_pedidos_produtos.Clear: Boolean;
begin
  Result := True;
  clearObj(Registro);
  FParametros.Clear;
end;

constructor TController_t004_pedidos_produtos.Create(AOwner: TComponent);
begin
  inherited;
  Registro := t004_pedidos_produtos.Create;
  FParametros := TPrm_t004_pedidos_produtos.Create;
  Lista := TList004_pedidos_produtos.Create;
end;

function TController_t004_pedidos_produtos.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TController_t004_pedidos_produtos.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  FreeAndNil(FParametros);
  inherited;
end;

function TController_t004_pedidos_produtos.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TController_t004_pedidos_produtos.salva: boolean;
begin
  Result := True;
  //if Registro.Codigo = 0 then
    //Registro.Codigo := Generator('GN_TRIB_ICMS_SN');
  SaveObj(Registro);
end;

function TController_t004_pedidos_produtos.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TController_t004_pedidos_produtos.Search;
var
  qryTemp : TFDQuery;
  t004 : t004_pedidos_produtos;
begin
  qryTemp := GeraQuery;

  Try
    with qryTemp do
    Begin
      SQL.Text :=
        ' SELECT t004.*, ' +
        '        t003.t003_pedidoID, ' +
        '        t003.t003_data_emissao, ' +
        '        t001.t001_nome, ' +
        '        t001.t001_cidade, ' +
        '        t001.t001_uf, ' +
        '        t002.t002_descricao, ' +
        '        t003.t003_vlr_total ' +
        '   FROM t004_pedidos_produtos t004 ' +
        '   JOIN t003_pedidos t003 ON t003.t003_pedidoID = t004.t003_pedidoID ' +
        '   JOIN t001_clientes t001 ON t003.t003_clienteID = t001.t001_clienteID ' +
        '   JOIN t002_produtos t002 ON t004.t002_produtoID = t002.t002_produtoID ' +
        '  WHERE 1=1 ';

      if FParametros.FieldName.Codigo > 0 then
      begin
        SQL.Text := SQL.Text + ' AND t004.t004_pedido_produtoID = :t004_pedido_produtoID';
        ParamByName('t004_pedido_produtoID').AsInteger := FParametros.FieldName.Codigo;
      end;

      if FParametros.FieldName.PedidoID > 0 then
      begin
        SQL.Text := SQL.Text + ' AND t003.t003_pedidoID = :t003_pedidoID';
        ParamByName('t003_pedidoID').AsInteger := FParametros.FieldName.PedidoID;
      end;

      SQL.Text := SQL.Text + ' ORDER BY t004.t004_pedido_produtoID ';

      Open;
      Lista.Clear;

      while not Eof do
      Begin
        t004 := t004_pedidos_produtos.Create;
        get(qryTemp, t004);

        t004.ClienteNome := FieldByName('t001_nome').AsString;
        t004.ClienteCidade := FieldByName('t001_cidade').AsString;
        t004.ClienteUF := FieldByName('t001_uf').AsString;
        t004.ProdutoDescricao := FieldByName('t002_descricao').AsString;
        t004.PedidoDataEmissao := FieldByName('t003_data_emissao').AsDateTime;
        t004.PedidoValorTotal := FieldByName('t003_vlr_total').AsFloat;

        Lista.add(t004);
        Next;
      end;
    end;
  Finally
    FinalizaQuery(qryTemp);
  End;
end;

procedure TController_t004_pedidos_produtos.setFParametros(const Value: TPrm_t004_pedidos_produtos);
begin
  FParametros := Value;
end;

procedure TController_t004_pedidos_produtos.getbyId;
begin
  _getByKey(Registro);
end;

function TController_t004_pedidos_produtos.getByKey: Boolean;
begin
  Result := True;
  Self._getByKey(Registro);
end;

procedure TController_t004_pedidos_produtos.apagarItensPorPedido(iPedidoID: integer);
var
  qryTemp : TFDQuery;
begin
  qryTemp := GeraQuery;

  try
    qryTemp.SQL.Text := 'delete from t004_pedidos_produtos where t003_pedidoID = :t003_pedidoID';
    qryTemp.ParamByName('t003_pedidoID').AsInteger := iPedidoID;
    qryTemp.ExecSQL;
  finally
    FinalizaQuery(qryTemp);
  end;
end;

end.

