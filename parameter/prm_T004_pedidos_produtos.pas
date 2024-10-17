unit prm_T004_pedidos_produtos;

interface

uses
  prm_base, tbl_t004_pedidos_produtos, System.SysUtils;

Type
  TPrm_T004_pedidos_produtos = class(TPrmBase)
  private
    FFieldName: T004_pedidos_produtos;
    procedure setFFieldName(const Value: T004_pedidos_produtos);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; Override;
    property FieldName : T004_pedidos_produtos read FFieldName write setFFieldName;
  end;

implementation

{ TPrm_T004_pedidos_produtos }

procedure TPrm_T004_pedidos_produtos.Clear;
begin
  inherited;
  clearObj(FFieldName)
end;

constructor TPrm_T004_pedidos_produtos.Create;
begin
  FFieldName := T004_pedidos_produtos.Create;
end;

destructor TPrm_T004_pedidos_produtos.Destroy;
begin
  FreeAndNil(FFieldName);
  inherited;
end;

procedure TPrm_T004_pedidos_produtos.setFFieldName(const Value: T004_pedidos_produtos);
begin
  FFieldName := Value;
end;

end.
