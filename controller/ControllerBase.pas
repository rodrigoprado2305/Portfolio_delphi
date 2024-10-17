unit ControllerBase;

interface

uses Classes,SysUtils, GenericORM, Winapi.Windows, Vcl.Samples.Gauges, uDM,
     FireDAC.Stan.Intf, FireDAC.Comp.Client,
     FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
     FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
     FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
     FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet;

Type
  TControllerBase = Class(TComponent)
  private
    FDataBase: TFDConnection;
    procedure setFProgresso(const Value: TGauge);
    procedure setFOrderBy(const Value: String);
    procedure setFDataFinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFPeriodo(const Value: Boolean);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFDataBase(const Value: TFDConnection);
  protected

    FProgresso: TGauge;
    FOrderBy: String;
    FEstabelecimento: Integer;
    FPeriodo: Boolean;
    FDataFinal: TDate;
    FDataInicial: TDate;

    function clearObj<T: class>(Obj: T):Boolean;
    function insertObj<T: class>(Obj: T):Boolean;
    function updateObj<T: class>(Obj: T):Boolean;
    function deleteObj<T: class>(Obj: T):Boolean;
    procedure SaveObj<T: class>(Obj: T);
    procedure replaceObj<T: class>(Obj: T);
    function getSqlCommandReplaceObj<T: class>(Obj: T):String;

    function getLastInsert<T: class>(Obj: T):Integer;
    function getNextByField<T: class>(Obj: T; Field: String;Intitution: Integer): Integer;
    function getByField(strTable:String;field:String; Content:String): TFDQuery;
    procedure _getByKey<T: class>(Obj: T);
    function existObj<T: class>(Obj: T):Boolean;

    function NomeComputador: string;
    procedure get<T: class>(Qry: TFDQuery; Obj: T);
  public
    exist : Boolean;
    update : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    Function GeraQuery():TFDQuery;
    procedure FinalizaQuery(Qry:TFDQuery);
    function Generator(pc_Gen: string): Integer;
    procedure ClonarObj<T: class>(ObjOri: T;ObjClone: T);
    function getMaxTable(Field,Tab:String):Integer;
    function TimeValid(value:String):Boolean;
    procedure setGenerator(Generator,Sequencia:String);
    Procedure geralog(origem,msg : string);Virtual;
  published
    property DataBase : TFDConnection read FDataBase write setFDataBase;
    Property Progresso : TGauge read FProgresso write setFProgresso;
    property OrderBy : String read FOrderBy write setFOrderBy;
    property Estabel : Integer read FEstabelecimento write setFEstabelecimento;
    property Periodo      : Boolean read FPeriodo write setFPeriodo;
    property DataInicial  : TDate read FDataInicial write setFDataInicial;
    property DataFinal    : TDate read FDataFinal write setFDataFinal;
  End;

implementation

{ TControllerBase }
function TControllerBase.existObj<T>(Obj: T): Boolean;
VAr
  Lc_Qry : TFDQuery;
begin
  Result := True;
  Lc_Qry := GeraQuery;
  Try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add (TGenericORM._Select(Obj,''));
        Active := True;
        FetchAll;
        result := ( RecordCount > 0 );
      End;
    Except on E: Exception do
      geralog('Base - existObj - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerBase.FinalizaQuery(Qry: TFDQuery);
begin
  try
   if Qry.Transaction.Active then
     Qry.Transaction.Commit;
  finally
    Qry.Transaction.Free;
    Qry.Close;
    Qry.Free;
  end;
end;

function TControllerBase.deleteObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Result := True;
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Delete(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.clearObj<T>(Obj: T): Boolean;
begin
  Result := True;
  Try
    TGenericORM._Clear(Obj);
  except
    Result := False;
  End;
end;

constructor TControllerBase.Create(AOwner: TComponent);
begin
  FDataBase := DM.FDConnection;
  exist := False;
  update := False;
end;

destructor TControllerBase.Destroy;
begin
 //
end;

Function TControllerBase.GeraQuery(): TFDQuery;
VAr
  Lc_Tsc : TFDTransaction;
begin
  Result := TFDQuery.Create(Self);
  Lc_Tsc := TFDTransaction.Create(nil);
  if not FDataBase.Connected then
    FDataBase.Connected := True;
  Lc_Tsc.Connection := FDataBase;

  With Result do
  Begin
    Connection := FDataBase;
    Transaction := Lc_Tsc;
    Transaction.StartTransaction;
    Active := False;
    sql.Clear;
  End;
end;


function TControllerBase.getByField(strTable, field, Content: String): TFDQuery;
var
  vSelect: string;
begin
  Result := GeraQuery;
  with Result do
  begin
    Active := False;
    SQL.Clear;
    vSelect := Format('Select * from %s where ( %s = :%s ) ',[strTable, Field, Field]);
    SQL.Add(vSelect);
    ParamByName(Field).Value := Content;
    active := True;
    FetchAll;
    exist := (RecordCount > 0);
  end;
end;

function TControllerBase.getLastInsert<T>(Obj: T): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._getLastInsert( Obj ) );
        Active := True;
      End;
      Result := StrToIntDef(Lc_Qry.FieldByName('id').AsString,0);
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.getMaxTable(Field,Tab: String): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Result := 0;
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add(concat(
                  'select Max(',Field,') id ',
                  'from ',Tab
        ));
        Active := True;
        Result := StrToIntDef( FieldByName('id').AsString,0);
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.getNextByField<T>(Obj: T; Field: String;
  Intitution: Integer): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._getNextByField( Obj,Field  ) );
        Active := True;
        Result := StrToIntDef( FieldByName(Field).AsString,0) + 1;
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.getSqlCommandReplaceObj<T>(Obj: T): String;
begin
  Result := TGenericORM._Replace(Obj);
end;

function TControllerBase.insertObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Result := True;
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Insert(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('insertObj - ',E.Message + Lc_Qry.SQL.Text);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.NomeComputador: string;
var
   lpBuffer: PChar;
   nSize: DWord;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
   nSize := Buff_Size;
   lpBuffer := StrAlloc(Buff_Size);
   GetComputerName(lpBuffer, nSize);
   Result := string(lpBuffer);
   StrDispose(lpBuffer);
end;


procedure TControllerBase.replaceObj<T>(Obj: T);
Var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Replace(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerBase.SaveObj<T>(Obj: T);
begin
  if existObj(Obj) then
    updateObj(Obj)
  else
    InsertObj(Obj);
end;

procedure TControllerBase.setFDataBase(const Value: TFDConnection);
begin
  FDataBase := Value;
end;

procedure TControllerBase.setFDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TControllerBase.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TControllerBase.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TControllerBase.setFOrderBy(const Value: String);
begin
  FOrderBy := Value;
end;

procedure TControllerBase.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

procedure TControllerBase.setFProgresso(const Value: TGauge);
begin
  FProgresso := Value;
end;

procedure TControllerBase.setGenerator(Generator, Sequencia: String);
var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      CachedUpdates := True;
      if Sequencia = '' then Sequencia := '0';

      sql.Add('ALTER SEQUENCE ' + Generator + ' RESTART WITH ' + Sequencia);
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerBase.TimeValid(value: String): Boolean;
begin
  Result := True;
  try
    StrToTime(Value);
  Except
    Result := False;
  end;
end;

function TControllerBase.updateObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Result := True;
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Update(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('updateObj - ',Concat(E.Message,' - ',Lc_Qry.SQL.Text ));
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerBase.get<T>(Qry: TFDQuery;Obj: T) ;
begin
  clearObj(Obj);
  TGenericORM._get(Qry,Obj);
end;

procedure TControllerBase.ClonarObj<T>(ObjOri, ObjClone: T);
begin
  TGenericORM._assign(ObjOri,ObjClone);
end;

procedure TControllerBase._getByKey<T>(Obj: T);
VAr
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add (TGenericORM._Select(Obj,''));
        Active := True;
        FetchAll;
        exist  := ( RecordCount > 0 );
        if exist then
        Begin
          clearObj(Obj);
          TGenericORM._get(Lc_Qry,Obj) ;
        End;
      End;
    Except on E: Exception do
      geralog('Base - _getByKey - ',E.Message);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerBase.Generator(pc_Gen: string): Integer;
var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := GeraQuery;
  TRy
    with Lc_Qry do
    Begin
      CachedUpdates := True;
      sql.Add('SELECT GEN_ID(' + pc_Gen + ',1) FROM RDB$DATABASE');
      Active := True;
      Result := fieldbyname('GEN_ID').AsInteger;
      ApplyUpdates;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerBase.geralog(origem, msg: string);   //não vou utilizar agora
//Var
//  Lc_Tabela : String;
//  Lc_Tamanho : Integer;
//  Lc_Posicao : Integer;
//  Lc_Campo:String;
//  Lc_Generator : String;
begin
  //GeralogCrashlytics(origem,msg);

  {
  if (Copy( Msg,1,20) = 'violation of PRIMARY') then
  Begin
    //tABELA
    Lc_Tamanho := length(Msg);
    Lc_Posicao := Pos('TB_', Msg);
    Lc_Tabela := Copy(Msg,Lc_Posicao,(Lc_Tamanho - Lc_Posicao));
    Lc_Posicao := Pos('"', Lc_Tabela) - 1;
    if Lc_Posicao > 0 then
      Lc_Tabela := copy(Lc_Tabela,1,Lc_Posicao);
    if Lc_Tabela  = 'TB_ITENS_NFL' then
    Begin
      Lc_Campo := 'ITF_CODIGO';
      Lc_Generator := 'GN_ITENS_NFL';
    end;
    if Lc_Tabela  = 'TB_PRODUTO' then
    Begin
      Lc_Campo := 'PRO_CODIGO';
      Lc_Generator := 'GN_PRODUTO';
    end;
    if Lc_Tabela  = 'TB_PEDIDO' then
    Begin
      Lc_Campo := 'PED_CODIGO';
      Lc_Generator := 'GN_PEDIDO';
    end;

    if Lc_Tabela  = 'TB_FORMAPAGTO' then
    Begin
      Lc_Campo := 'FPT_CODIGO';
      Lc_Generator := 'GN_FORMAPAGTO';
    end;
    IF (Lc_Generator <> '')AND (Lc_Campo <> '' ) AND (Lc_Tabela <> '') then
      setGenerator(Lc_Generator,Lc_Campo,Lc_Tabela);
  end;
  }
end;

end.
