unit tbl_t003_pedidos;

interface

Uses TEntity, CAtribEntity;

Type
  [TableName('t003_pedidos')]
  T003_pedidos = Class(TGenericEntity)

  private
    FCodigo: Integer;
    FValorTotal: real;
    FDataEmissao: TDate;
    FClienteID: integer;
    FClienteNome: String;
    FClienteCidade: String;
    FClienteUF: String;
    procedure setFClienteID(const Value: integer);
    procedure setFCodigo(const Value: Integer);
    procedure setFDataEmissao(const Value: TDate);
    procedure setFValorTotal(const Value: real);
    procedure setFClienteCidade(const Value: String);
    procedure setFClienteNome(const Value: String);
    procedure setFClienteUF(const Value: String);


  public
    [KeyField('t003_pedidoID')]
    [FieldName('t003_pedidoID')]
    property Codigo: Integer read FCodigo write setFCodigo;

    [FieldName('t003_data_emissao')]
    property DataEmissao: TDate read FDataEmissao write setFDataEmissao;

    [FieldName('t003_clienteID')]
    property ClienteID: integer read FClienteID write setFClienteID;

    [FieldName('t003_vlr_total')]
    property ValorTotal: real read FValorTotal write setFValorTotal;

    //para os campos com join, não é o lugar correto...
    property ClienteNome: String read FClienteNome write setFClienteNome;
    property ClienteCidade: String read FClienteCidade write setFClienteCidade;
    property ClienteUF: String read FClienteUF write setFClienteUF;
  End;

implementation

{ T003_pedidos }

procedure T003_pedidos.setFClienteCidade(const Value: String);
begin
  FClienteCidade := Value;
end;

procedure T003_pedidos.setFClienteID(const Value: integer);
begin
  FClienteID := Value;
end;

procedure T003_pedidos.setFClienteNome(const Value: String);
begin
  FClienteNome := Value;
end;

procedure T003_pedidos.setFClienteUF(const Value: String);
begin
  FClienteUF := Value;
end;

procedure T003_pedidos.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure T003_pedidos.setFDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure T003_pedidos.setFValorTotal(const Value: real);
begin
  FValorTotal := Value;
end;

end.
