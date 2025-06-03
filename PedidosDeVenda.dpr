program PedidosDeVenda;

uses
  Vcl.Forms,
  Winapi.Windows,
  uMain in 'uMain.pas' {FrmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uBiblioteca in 'uBiblioteca.pas',
  uConstantes in 'uConstantes.pas',
  uFrc in 'uFrc.pas',
  frmWeb in 'view\frmWeb.pas' {FormWeb},
  FrmPedidos in 'view\FrmPedidos.pas' {FormPedidos},
  uVariaveis in 'uVariaveis.pas',
  tbl_t001_clientes in 'model\tbl_t001_clientes.pas',
  CAtribEntity in 'model\orm\CAtribEntity.pas',
  GenericEntity in 'model\orm\GenericEntity.pas',
  GenericORM in 'model\orm\GenericORM.pas',
  TEntity in 'model\orm\TEntity.pas',
  tbl_t002_produtos in 'model\tbl_t002_produtos.pas',
  tbl_t003_pedidos in 'model\tbl_t003_pedidos.pas',
  tbl_t004_pedidos_produtos in 'model\tbl_t004_pedidos_produtos.pas',
  prm_t002_produtos in 'parameter\prm_t002_produtos.pas',
  prm_base in 'parameter\prm_base.pas',
  prm_t001_clientes in 'parameter\prm_t001_clientes.pas',
  prm_t003_pedidos in 'parameter\prm_t003_pedidos.pas',
  prm_T004_pedidos_produtos in 'parameter\prm_T004_pedidos_produtos.pas',
  ControllerBase in 'controller\ControllerBase.pas',
  Controller_t001_clientes in 'controller\Controller_t001_clientes.pas',
  uMsg in 'uMsg.pas',
  Controller_t002_produtos in 'controller\Controller_t002_produtos.pas',
  Controller_t003_pedidos in 'controller\Controller_t003_pedidos.pas',
  Controller_tbl_t004_pedidos_produtos in 'controller\Controller_tbl_t004_pedidos_produtos.pas',
  uFormat in 'uFormat.pas',
  FrmPesquisa in 'view\FrmPesquisa.pas' {FormPesquisa},
  FrmFile in 'view\FrmFile.pas' {FormFile},
  CRADataSets in 'library\CRADataSets.pas',
  FrmCustomers in 'view\FrmCustomers.pas' {FormCustomers};

{$R *.res}

Var
  MutexHandle: THandle;

begin
  ReportMemoryLeaksOnShutDown := DebugHook <> 0; //for memory leaks

  MutexHandle := CreateMutex(nil, TRUE, 'MstGestao');
  if MutexHandle <> 0 then
  begin
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      Application.MessageBox('Este programa já está em execução!', PChar(MSG_CAPTION), MB_ICONWARNING);
      CloseHandle(MutexHandle);
      Halt;
    end
  end;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFormPesquisa, FormPesquisa);
  Application.Run;
end.
