unit tbl_t002_produtos;

interface

Uses TEntity, CAtribEntity;

Type
  [TableName('t002_produtos')]
  T002_produtos = Class(TGenericEntity)

  private
    FDescricao: String;
    FCodigo: Integer;
    FPrecoVenda: real;
    procedure setFCodigo(const Value: Integer);
    procedure setFDescricao(const Value: String);
    procedure setFPrecoVenda(const Value: real);

  public
    [KeyField('t002_produtoID')]
    [FieldName('t002_produtoID')]
    property Codigo: Integer read FCodigo write setFCodigo;

    [FieldName('t002_descricao')]
    property Descricao: String read FDescricao write setFDescricao;

    [FieldName('t002_preco_venda')]
    property PrecoVenda: real read FPrecoVenda write setFPrecoVenda;
  End;

implementation

{ T002_produtos }

procedure T002_produtos.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure T002_produtos.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure T002_produtos.setFPrecoVenda(const Value: real);
begin
  FPrecoVenda := Value;
end;

end.
