unit prm_t002_produtos;

interface

uses
  prm_base, tbl_t002_produtos, System.SysUtils;

Type
  TPrm_t002_produtos = class(TPrmBase)
  private
    FFieldName: T002_produtos;
    procedure setFFieldName(const Value: T002_produtos);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; Override;
    property FieldName : T002_produtos read FFieldName write setFFieldName;
  end;

implementation

{ TPrm_t002_produtos }

procedure TPrm_t002_produtos.Clear;
begin
  inherited;
  clearObj(FFieldName)
end;

constructor TPrm_t002_produtos.Create;
begin
  FFieldName := T002_produtos.Create;
end;

destructor TPrm_t002_produtos.Destroy;
begin
  FreeAndNil(FFieldName);
  inherited;
end;

procedure TPrm_t002_produtos.setFFieldName(const Value: T002_produtos);
begin
  FFieldName := Value;
end;

end.
