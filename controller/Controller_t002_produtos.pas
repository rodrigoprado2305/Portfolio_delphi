unit Controller_t002_produtos;

interface

uses System.Classes, System.SysUtils, Generics.Collections,
     ControllerBase, tbl_t002_produtos, prm_t002_produtos,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TList002_produtos = TObjectList<t002_produtos>;
  TController_t002_produtos = Class(TControllerBase)
  private
    FParametros: TPrm_t002_produtos;
    procedure setFParametros(const Value: TPrm_t002_produtos);

  public
    Registro : t002_produtos;
    Lista : TList002_produtos;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function salva:boolean;
    procedure getbyId;

    function Clear:Boolean;
    procedure Search;
    property Parametros : TPrm_t002_produtos read FParametros write setFParametros;
  End;

implementation

function TController_t002_produtos.Clear: Boolean;
begin
  Result := True;
  clearObj(Registro);
  FParametros.Clear;
end;

constructor TController_t002_produtos.Create(AOwner: TComponent);
begin
  inherited;
  Registro := t002_produtos.Create;
  FParametros := TPrm_t002_produtos.Create;
  Lista := TList002_produtos.Create;
end;

function TController_t002_produtos.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TController_t002_produtos.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  FreeAndNil(FParametros);
  inherited;
end;

function TController_t002_produtos.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TController_t002_produtos.salva: boolean;
begin
  Result := True;
  //if Registro.Codigo = 0 then
    //Registro.Codigo := Generator('GN_TRIB_ICMS_SN');
  SaveObj(Registro);
end;

function TController_t002_produtos.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TController_t002_produtos.Search;
var
  qryTemp : TFDQuery;
  t002 : t002_produtos;
begin
  qryTemp := GeraQuery;

  Try
    with qryTemp do
    Begin
      SQL.Text := ' SELECT * FROM t002_produtos where 1=1 ';

      if FParametros.FieldName.Codigo > 0 then
      begin
        SQL.Text := SQL.Text + ' AND t002_produtoID = :t002_produtoID';
        ParamByName('t002_produtoID').AsInteger := FParametros.FieldName.Codigo;
      end;

      if FParametros.FieldName.Descricao <> EmptyStr then
      begin
        SQL.Text := SQL.Text + ' AND t002_descricao LIKE :t002_descricao';
        ParamByName('t002_descricao').AsString := Concat('%',FParametros.FieldName.Descricao,'%');
      end;

      SQL.Text := SQL.Text + ' ORDER BY t002_descricao ';

      Open;
      Lista.Clear;

      while not Eof do
      Begin
        t002 := t002_produtos.Create;
        get(qryTemp, t002);

        Lista.add(t002);
        Next;
      end;
    end;
  Finally
    FinalizaQuery(qryTemp);
  End;
end;

procedure TController_t002_produtos.setFParametros(const Value: TPrm_t002_produtos);
begin
  FParametros := Value;
end;

procedure TController_t002_produtos.getbyId;
begin
  _getByKey(Registro);
end;

function TController_t002_produtos.getByKey: Boolean;
begin
  Result := True;
  Self._getByKey(Registro);
end;

end.

