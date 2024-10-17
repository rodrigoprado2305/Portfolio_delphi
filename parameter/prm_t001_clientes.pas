unit prm_t001_clientes;

interface

uses
  prm_base, tbl_t001_clientes, System.SysUtils;

Type
  TPrm_t001_clientes = class(TPrmBase)
  private
    FFieldName: T001_clientes;
    procedure setFFieldName(const Value: T001_clientes);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; Override;
    property FieldName : T001_clientes read FFieldName write setFFieldName;
  end;

implementation

{ TPrm_t001_clientes }

procedure TPrm_t001_clientes.Clear;
begin
  inherited;
  clearObj(FFieldName)
end;

constructor TPrm_t001_clientes.Create;
begin
  FFieldName := T001_clientes.Create;
end;

destructor TPrm_t001_clientes.Destroy;
begin
  FreeAndNil(FFieldName);
  inherited;
end;

procedure TPrm_t001_clientes.setFFieldName(const Value: T001_clientes);
begin
  FFieldName := Value;
end;

end.
