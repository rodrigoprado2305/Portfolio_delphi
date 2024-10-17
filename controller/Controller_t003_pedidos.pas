unit Controller_t003_pedidos;

interface

uses System.Classes, System.SysUtils, Generics.Collections,
     ControllerBase, tbl_t003_pedidos, prm_t003_pedidos,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TList003_pedidos = TObjectList<t003_pedidos>;
  TController_t003_pedidos = Class(TControllerBase)
  private
    FParametros: TPrm_t003_pedidos;
    procedure setFParametros(const Value: TPrm_t003_pedidos);

  public
    Registro : t003_pedidos;
    Lista : TList003_pedidos;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function salva:boolean;
    procedure getbyId;

    function ultimoRegistro: integer;
    function Clear:Boolean;
    procedure Search;
    property Parametros : TPrm_t003_pedidos read FParametros write setFParametros;
  End;

implementation

function TController_t003_pedidos.Clear: Boolean;
begin
  Result := True;
  clearObj(Registro);
  FParametros.Clear;
end;

constructor TController_t003_pedidos.Create(AOwner: TComponent);
begin
  inherited;
  Registro := t003_pedidos.Create;
  FParametros := TPrm_t003_pedidos.Create;
  Lista := TList003_pedidos.Create;
end;

function TController_t003_pedidos.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TController_t003_pedidos.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  FreeAndNil(FParametros);
  inherited;
end;

function TController_t003_pedidos.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TController_t003_pedidos.salva: boolean;
begin
  Result := True;
  //if Registro.Codigo = 0 then
    //Registro.Codigo := Generator('GN_TRIB_ICMS_SN');
  SaveObj(Registro);
  if Registro.Codigo = 0 then
  begin
    Registro.Codigo := ultimoRegistro;
    //Registro.Codigo := getLastInsert<T>(Obj: T);
  end;
end;

function TController_t003_pedidos.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TController_t003_pedidos.Search;
var
  qryTemp : TFDQuery;
  t003 : t003_pedidos;
begin
  qryTemp := GeraQuery;

  Try
    with qryTemp do
    Begin
      SQL.Text :=
        'SELECT t003.*, ' +
        '       t001.t001_nome, ' +
        '       t001.t001_cidade, ' +
        '       t001.t001_uf ' +
        '  FROM t003_pedidos t003 ' +
        '  JOIN t001_clientes t001 ON t003.t003_clienteID = t001.t001_clienteID ' +
        ' WHERE 1=1 ';

      if FParametros.FieldName.Codigo > 0 then
      begin
        SQL.Text := SQL.Text + ' AND t003.t003_pedidoID = :t003_pedidoID';
        ParamByName('t003_pedidoID').AsInteger := FParametros.FieldName.Codigo;
      end;

      Open;
      Lista.Clear;

      while not Eof do
      Begin
        t003 := t003_pedidos.Create;
        get(qryTemp, t003);

        t003.ClienteNome := FieldByName('t001_nome').AsString;
        t003.ClienteCidade := FieldByName('t001_cidade').AsString;
        t003.ClienteUF := FieldByName('t001_uf').AsString;

        Lista.add(t003);
        Next;
      end;
    end;
  Finally
    FinalizaQuery(qryTemp);
  End;
end;

procedure TController_t003_pedidos.setFParametros(const Value: TPrm_t003_pedidos);
begin
  FParametros := Value;
end;

function TController_t003_pedidos.ultimoRegistro: integer;
var
  qryTemp : TFDQuery;
begin
  qryTemp := GeraQuery;
  try
    //INSERT INTO t003_pedidos (xx) VALUES ('xx'); SELECT LAST_INSERT_ID();
    qryTemp.SQL.Text := 'SELECT MAX(t003_pedidoID) FROM t003_pedidos'; //usando temporariamente...
    qryTemp.Open;
    Result := qryTemp.Fields[0].AsInteger;
  Finally
    FinalizaQuery(qryTemp);
  End;
end;

procedure TController_t003_pedidos.getbyId;
begin
  _getByKey(Registro);
end;

function TController_t003_pedidos.getByKey: Boolean;
begin
  Result := True;
  Self._getByKey(Registro);
end;

end.

