unit tbl_t001_clientes;

interface

Uses TEntity, CAtribEntity;

Type
  [TableName('t001_clientes')]
  T001_clientes = Class(TGenericEntity)

  private
    FUf: String;
    FCodigo: Integer;
    FNome: String;
    FCidade: String;
    procedure setFCidade(const Value: String);
    procedure setFCodigo(const Value: Integer);
    procedure setFNome(const Value: String);
    procedure setFUf(const Value: String);
  public
    [KeyField('t001_clienteID')]
    [FieldName('t001_clienteID')]
    property Codigo: Integer read FCodigo write setFCodigo;

    [FieldName('t001_nome')]
    property Nome: String read FNome write setFNome;

    [FieldName('t001_cidade')]
    property Cidade: String read FCidade write setFCidade;

    [FieldName('t001_uf')]
    property Uf: String read FUf write setFUf;
  End;

implementation

{ T001_clientes }

procedure T001_clientes.setFCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure T001_clientes.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure T001_clientes.setFNome(const Value: String);
begin
  FNome := Value;
end;

procedure T001_clientes.setFUf(const Value: String);
begin
  FUf := Value;
end;

end.
