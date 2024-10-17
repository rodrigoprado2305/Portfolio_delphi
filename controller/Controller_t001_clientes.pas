unit Controller_t001_clientes;

interface

uses System.Classes, System.SysUtils, Generics.Collections,
     ControllerBase, tbl_t001_clientes, prm_t001_clientes,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TLisT001_clientes = TObjectList<T001_clientes>;
  TController_t001_clientes = Class(TControllerBase)
  private
    FParametros: TPrm_t001_clientes;
    procedure setFParametros(const Value: TPrm_t001_clientes);

  public
    Registro : T001_clientes;
    Lista : TLisT001_clientes;
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
    property Parametros : TPrm_t001_clientes read FParametros write setFParametros;
  End;

implementation

function TController_t001_clientes.Clear: Boolean;
begin
  Result := True;
  clearObj(Registro);
  FParametros.Clear;
end;

constructor TController_t001_clientes.Create(AOwner: TComponent);
begin
  inherited;
  Registro := T001_clientes.Create;
  FParametros := TPrm_t001_clientes.Create;
  Lista := TLisT001_clientes.Create;
end;

function TController_t001_clientes.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TController_t001_clientes.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  FreeAndNil(FParametros);
  inherited;
end;

function TController_t001_clientes.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TController_t001_clientes.salva: boolean;
begin
  Result := True;
  //if Registro.Codigo = 0 then
    //Registro.Codigo := Generator('GN_TRIB_ICMS_SN');
  SaveObj(Registro);
end;

function TController_t001_clientes.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TController_t001_clientes.Search;
var
  qryTemp : TFDQuery;
  t001 : T001_clientes;
begin
  qryTemp := GeraQuery;

  Try
    with qryTemp do
    Begin
      SQL.Text := ' SELECT * FROM t001_clientes where 1=1 ';

      if FParametros.FieldName.Codigo > 0 then
      begin
        SQL.Text := SQL.Text + ' AND t001_clienteID = :t001_clienteID';
        ParamByName('t001_clienteID').AsInteger := FParametros.FieldName.Codigo;
      end;

      if FParametros.FieldName.Nome <> EmptyStr then
      begin
        SQL.Text := SQL.Text + ' AND t001_nome LIKE :t001_nome';
        ParamByName('t001_nome').AsString := Concat('%',FParametros.FieldName.Nome,'%');
      end;

      SQL.Text := SQL.Text + ' ORDER BY t001_nome ';

      Open;
      Lista.Clear;

      while not Eof do
      Begin
        t001 := T001_clientes.Create;
        get(qryTemp, t001);

        Lista.add(t001);
        Next;
      end;
    end;
  Finally
    FinalizaQuery(qryTemp);
  End;
end;

procedure TController_t001_clientes.setFParametros(const Value: TPrm_t001_clientes);
begin
  FParametros := Value;
end;

procedure TController_t001_clientes.getbyId;
begin
  _getByKey(Registro);
end;

function TController_t001_clientes.getByKey: Boolean;
begin
  Result := True;
  Self._getByKey(Registro);
end;

end.

