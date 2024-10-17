unit uMsg;

interface

uses System.SysUtils, Vcl.Forms, Winapi.Windows, uConstantes;

Type
  TTipoMsg =
    (
      //CAMPOS OBRIGAT�RIOS
      msgCampoObrigatorio, msgCamposObrigatorios, msgValorCampoIncorreto,
      msgCampoInvalido,
      //GERAL
      msgDadosAtualizados, msgGravar, msgExcluir, msgExcluido, msgRegEdicaoInsercao,
      msgNenhumRegSelecionado, msgRegJaSelecionado, msgDataInvalida, msgDataInicialMaior,
      msgNenhumRegEncontrado,  msgArqExportado, msgArqImportado, msgArqCarregado,
      msgArqGerado, msgDadosProcessados, msgCancelar, msgOperacaoSucesso, msgConfirmaOperacao, msgFinaldoArquivo,
      msgNenhumItem,
      // Erro em msg
      msgErroCustomizado
    );

  function fnMsg(_rTipoMsg: TTipoMsg; _rstrCampo: String): Boolean;  overload;
  function fnMsg(_rTipoMsg: TTipoMsg): Boolean; overload;
  function fnException(_rstrTipo: String; E: Exception) : Boolean;

resourcestring
  msgErroIncluir = 'Erro ao tentar inserir o registro:';
  msgErroEditar = 'Erro ao tentar editar o registro:';
  msgErroExcluir = 'Erro ao tentar excluir o registro:';
  msgErroGravar = 'Erro ao tentar gravar o registro:';
  msgErroExportar = 'Erro ao exportar dados:';
  msgErroImportar = 'Erro ao importar dados:';
  msgErroCarregarArq = 'Erro ao carregar arquivo(s): ';
  msgErroGerarArq = 'Erro ao gerar arquivo(s):';
  msgErroProcessar = 'Erro ao processar dados:';
  msgErroSelecionar = 'Erro ao tentar selecionar o registro:';
  msgErroPesq = 'Erro ao tentar executar a pesquisa:';
  msgErroExecutarAcao = 'Erro ao tentar executar a a��o:';
  msgErroGerarRelatorio = 'Erro ao tentar gerar relat�rio:';
  msgErroCarregarDados = 'Erro ao carregar dados:';

implementation

function fnMsg(_rTipoMsg: TTipoMsg; _rstrCampo: String): Boolean;
begin
  Result := False;
  if (msgCampoObrigatorio = _rTipoMsg) then
    Application.MessageBox(pchar('O Campo "'+_rstrCampo+'" � obrigat�rio! A��o cancelada!'),Pchar(MSG_CAPTION), MB_ICONWARNING);

  if (msgCamposObrigatorios = _rTipoMsg) then
    Application.MessageBox(pchar('Pelo menos um desses campos "'+_rstrCampo+'" � de preenchimento obrigat�rio!'),Pchar(MSG_CAPTION), MB_ICONWARNING);

  if (msgValorCampoIncorreto = _rTipoMsg) then
    Application.MessageBox(pchar('O valor digitado para o campo "'+_rstrCampo+'" est� incorreto! Informe um Valor maior que 0. A��o cancelada!'),Pchar(MSG_CAPTION), MB_ICONWARNING);

  if (msgCampoInvalido = _rTipoMsg) then
    Application.MessageBox(pchar('Campo "'+_rstrCampo+'" inv�lido!'),Pchar(MSG_CAPTION),MB_ICONWARNING);

  if (msgErroCustomizado = _rTipoMsg) then
    Application.MessageBox(pchar('Erro: '+_rstrCampo),Pchar(MSG_CAPTION),MB_ICONERROR);
end;

function fnMsg(_rTipoMsg: TTipoMsg): Boolean;
begin
  Result := False;
  if (msgDadosAtualizados = _rTipoMsg) then
    Application.MessageBox('Dados atualizados com sucesso!',Pchar(MSG_CAPTION),MB_ICONINFORMATION);

  if (msgGravar = _rTipoMsg) then
    Application.MessageBox('Registro salvo corretamente!',Pchar(MSG_CAPTION),MB_ICONINFORMATION);

  if (msgNenhumItem = _rTipoMsg) then
    Application.MessageBox('Informe ao menos um item de pedido! A��o cancelada!',Pchar(MSG_CAPTION),MB_ICONWARNING);

  if _rTipoMsg = msgExcluir then
    if Application.MessageBox('Deseja realmente excluir este registro?', Pchar(MSG_CAPTION), MB_YESNO+MB_ICONQUESTION) = IDYes then
      Result := True
    else
      Result := False;

  if (msgExcluido = _rTipoMsg) then
    Application.MessageBox('Registro exclu�do com sucesso!',Pchar(MSG_CAPTION),MB_ICONINFORMATION);

  if (msgRegEdicaoInsercao = _rTipoMsg) then
    Application.MessageBox('Existem dados sendo inseridos ou editados! Grave ou cancele a a��o antes de sair!',Pchar(MSG_CAPTION),MB_ICONEXCLAMATION);

  if (msgNenhumRegSelecionado = _rTipoMsg) then
    Application.MessageBox('Nenhum registro selecionado!', Pchar(MSG_CAPTION), MB_ICONWARNING);

  if (msgRegJaSelecionado = _rTipoMsg) then
    Application.MessageBox('Registro j� selecionado!', Pchar(MSG_CAPTION), MB_ICONWARNING);

  if (msgDataInvalida = _rTipoMsg) then
    Application.MessageBox('Data Inv�lida! A��o cancelada!', Pchar(MSG_CAPTION), MB_ICONERROR);

  if (msgDataInicialMaior = _rTipoMsg) then
    Application.MessageBox('Data inicial maior que a data final! A��o cancelada!', Pchar(MSG_CAPTION), MB_ICONWARNING);

  if (msgNenhumRegEncontrado = _rTipoMsg) then
    Application.MessageBox('Nenhum registro encontrado!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);

  if (msgArqExportado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) exportado(s) com sucesso!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);

  if (msgArqImportado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) importado(s) com sucesso!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);

  if (msgArqCarregado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) carregado(s) com sucesso!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);

  if (msgArqGerado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) gerado(s) com sucesso!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);

  if (msgDadosProcessados = _rTipoMsg) then
    Application.MessageBox('Dados processados com sucesso!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);

  if _rTipoMsg = msgCancelar then
    if Application.MessageBox('Cancelar a inser��o/edi��o do registro!', Pchar(MSG_CAPTION), MB_YESNO + MB_ICONQUESTION) = IDYES then
      Result := True
    else
      Result := False;

  if (msgOperacaoSucesso = _rTipoMsg) then
    Application.MessageBox('Opera��o conclu�da com sucesso!',Pchar(MSG_CAPTION),MB_ICONINFORMATION);

  if (msgConfirmaOperacao = _rTipoMsg) then
    if Application.MessageBox('Confirma esta opera��o?', Pchar(MSG_CAPTION), MB_YESNO + MB_ICONQUESTION) = IDYES then
      Result := True
    else
      Result := False;

  if (msgFinaldoArquivo = _rTipoMsg) then
    Application.MessageBox('N�o h� mais nenhum registro para ser movimentado! A��o cancelada!', Pchar(MSG_CAPTION), MB_ICONINFORMATION);
end;

function  fnException(_rstrTipo: String; E: Exception) : Boolean;
begin
  Application.MessageBox(PChar(_rstrTipo + #13#10 + E.Message), Pchar(MSG_CAPTION), MB_ICONERROR);
  Result := False;
end;

end.
