unit prm_t003_pedidos;

interface

uses
  prm_base, tbl_t003_pedidos, System.SysUtils;

Type
  TPrm_t003_pedidos = class(TPrmBase)
  private
    FFieldName: T003_pedidos;
    procedure setFFieldName(const Value: T003_pedidos);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; Override;
    property FieldName : T003_pedidos read FFieldName write setFFieldName;
  end;

implementation

{ TPrm_t003_pedidos }

procedure TPrm_t003_pedidos.Clear;
begin
  inherited;
  clearObj(FFieldName)
end;

constructor TPrm_t003_pedidos.Create;
begin
  FFieldName := T003_pedidos.Create;
end;

destructor TPrm_t003_pedidos.Destroy;
begin
  FreeAndNil(FFieldName);
  inherited;
end;

procedure TPrm_t003_pedidos.setFFieldName(const Value: T003_pedidos);
begin
  FFieldName := Value;
end;

end.
