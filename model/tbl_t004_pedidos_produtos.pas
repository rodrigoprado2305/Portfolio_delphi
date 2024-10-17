unit tbl_t004_pedidos_produtos;

interface

Uses TEntity, CAtribEntity;

Type
  [TableName('t004_pedidos_produtos')]
  T004_pedidos_produtos = Class(TGenericEntity)

  private
    FClienteNome: String;
    FClienteCidade: String;
    FProdutoDescricao: String;
    FCodigo: Integer;
    FValorUnitario: real;
    FProdutoID: integer;
    FValorTotal: real;
    FClienteUF: String;
    FQuantidade: integer;
    FPedidoID: integer;
    FPedidoValorTotal: real;
    FPedidoDataEmissao: TDate;
    procedure setFClienteCidade(const Value: String);
    procedure setFClienteNome(const Value: String);
    procedure setFClienteUF(const Value: String);
    procedure setFCodigo(const Value: Integer);
    procedure setFPedidoDataEmissao(const Value: TDate);
    procedure setFPedidoID(const Value: integer);
    procedure setFPedidoValorTotal(const Value: real);
    procedure setFProdutoDescricao(const Value: String);
    procedure setFProdutoID(const Value: integer);
    procedure setFQuantidade(const Value: integer);
    procedure setFValorTotal(const Value: real);
    procedure setFValorUnitario(const Value: real);
  public
    [KeyField('t004_pedido_produtoID')]
    [FieldName('t004_pedido_produtoID')]
    property Codigo: Integer read FCodigo write setFCodigo;

    [FieldName('t003_pedidoID')]
    property PedidoID: integer read FPedidoID write setFPedidoID;

    [FieldName('t002_produtoID')]
    property ProdutoID: integer read FProdutoID write setFProdutoID;

    [FieldName('t004_quantidade')]
    property Quantidade: integer read FQuantidade write setFQuantidade;

    [FieldName('t004_vlr_unitario')]
    property ValorUnitario: real read FValorUnitario write setFValorUnitario;

    [FieldName('t004_vlr_total')]
    property ValorTotal: real read FValorTotal write setFValorTotal;

    //para os campos com join, não é o lugar correto...
    property ClienteNome: String read FClienteNome write setFClienteNome;
    property ClienteCidade: String read FClienteCidade write setFClienteCidade;
    property ClienteUF: String read FClienteUF write setFClienteUF;
    property ProdutoDescricao: String read FProdutoDescricao write setFProdutoDescricao;
    property PedidoDataEmissao: TDate read FPedidoDataEmissao write setFPedidoDataEmissao;
    property PedidoValorTotal: real read FPedidoValorTotal write setFPedidoValorTotal;
  End;

implementation

{ T004_pedidos_produtos }

procedure T004_pedidos_produtos.setFClienteCidade(const Value: String);
begin
  FClienteCidade := Value;
end;

procedure T004_pedidos_produtos.setFClienteNome(const Value: String);
begin
  FClienteNome := Value;
end;

procedure T004_pedidos_produtos.setFClienteUF(const Value: String);
begin
  FClienteUF := Value;
end;

procedure T004_pedidos_produtos.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure T004_pedidos_produtos.setFPedidoDataEmissao(const Value: TDate);
begin
  FPedidoDataEmissao := Value;
end;

procedure T004_pedidos_produtos.setFPedidoID(const Value: integer);
begin
  FPedidoID := Value;
end;

procedure T004_pedidos_produtos.setFPedidoValorTotal(const Value: real);
begin
  FPedidoValorTotal := Value;
end;

procedure T004_pedidos_produtos.setFProdutoDescricao(const Value: String);
begin
  FProdutoDescricao := Value;
end;

procedure T004_pedidos_produtos.setFProdutoID(const Value: integer);
begin
  FProdutoID := Value;
end;

procedure T004_pedidos_produtos.setFQuantidade(const Value: integer);
begin
  FQuantidade := Value;
end;

procedure T004_pedidos_produtos.setFValorTotal(const Value: real);
begin
  FValorTotal := Value;
end;

procedure T004_pedidos_produtos.setFValorUnitario(const Value: real);
begin
  FValorUnitario := Value;
end;

end.
