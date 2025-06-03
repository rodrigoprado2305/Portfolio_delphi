unit CRADataSets;

interface

uses
  System.SysUtils, System.Classes, System.DateUtils, Data.DB, FireDAC.Comp.Client;

type

  //https://www.protesto.com.br/cra/apresentantes/layouts/Layout_Centralizado_V43.pdf
  TCRAMemManager = class
  private
    FMemHeader: TFDMemTable;
    FMemTransacao: TFDMemTable;
    FMemTrailler: TFDMemTable;

    procedure PrepareHeader;
    procedure PrepareTransacao;
    procedure PrepareTrailler;
  public
    property MemHeader: TFDMemTable read FMemHeader;
    property MemTransacao: TFDMemTable read FMemTransacao;
    property MemTrailler: TFDMemTable read FMemTrailler;

    constructor Create;
    destructor Destroy; override;

    /// <summary>Importa o arquivo CRA e popula os MemTables.</summary>
    /// <param name="AFileName">Caminho do .txt CRA (ANSI)</param>
    procedure ImportFromFile(const AFileName: string);
  end;

implementation

{ TCRAMemManager }

constructor TCRAMemManager.Create;
begin
  inherited;
  FMemHeader     := TFDMemTable.Create(nil);
  FMemTransacao  := TFDMemTable.Create(nil);
  FMemTrailler    := TFDMemTable.Create(nil);

  PrepareHeader;
  PrepareTransacao;
  PrepareTrailler;
end;

destructor TCRAMemManager.Destroy;
begin
  FMemHeader.Free;
  FMemTransacao.Free;
  FMemTrailler.Free;
  inherited;
end;

procedure TCRAMemManager.PrepareHeader;
begin
  with FMemHeader.FieldDefs do
  begin
    Clear;
    Add('IdentificacaoRegistro', ftSmallint);            // 01 Identifica��o do Registro 001/001 001 Num�rico
    Add('CodigoPortador',        ftSmallint);            // 02 C�digo do Portador 002/004 003 Num�rico
    Add('NomePortador',          ftString,   40);        // 03 Nome do Portador 005/044 040 Alfanum�rico
    Add('DataMovimento',         ftString,    8);        // 04 Data do Movimento 045/052 008 Num�rico (DDMMAAAA)
    Add('TransacaoRemetente',    ftString,    3);        // 05 Transa��o � Remetente 053/055 003 Alfanum�rico
    Add('TransacaoDestinatario', ftString,    3);        // 06 Transa��o � Destinat�rio 056/058 003 Alfanum�rico
    Add('TransacaoTipo',         ftString,    3);        // 07 Transa��o � Tipo 059/061 003 Alfanum�rico
    Add('SequenciaRemessa',      ftInteger);             // 08 Seq�encial da Remessa 062/067 006 Num�rico
    Add('QuantidadeRegistros',   ftSmallint);            // 09 Qtde Registros 068/071 004 Num�rico
    Add('QuantidadeTitulos',     ftSmallint);            // 10 Qtde T�tulos 072/075 004 Num�rico
    Add('QuantidadeIndicacoes',  ftSmallint);            // 11 Qtde Indica��es 076/079 004 Num�rico
    Add('QuantidadeOriginais',   ftSmallint);            // 12 Qtde Originais 080/083 004 Num�rico
    Add('AgenciaCentralizadora', ftString,    6);        // 13 Ag�ncia Cent. 084/089 006 Alfanum�rico
    Add('VersaoLayout',          ftSmallint);            // 14 Vers�o Layout 090/092 003 Num�rico
    Add('CodigoMunicipio',       ftString,    7);        // 15 C�d Munic�pio 093/099 007 Alfanum�rico
    Add('ComplementoRegistro',   ftString,  497);        // 16 Complemento Registro 100/596 497 Alfanum�rico
    Add('SeqRegistroArquivo',    ftSmallint);            // 17 Seq Registro Arquivo 597/600 004 Num�rico
  end;
  FMemHeader.CreateDataSet;
end;

procedure TCRAMemManager.PrepareTransacao;
begin
  with FMemTransacao.FieldDefs do
  begin
    Clear;
    Add('IdentificacaoRegistro',    ftSmallint);         // 01 Identifica��o do Registro 001/001 001 Num�rico
    Add('CodigoPortador',           ftSmallint);         // 02 C�digo do Portador 002/004 003 Num�rico
    Add('AgenciaCedente',           ftString,    15);    // 03 Ag�ncia/C�d Cedente 005/019 015 Alfanum�rico
    Add('NomeCedente',              ftString,    45);    // 04 Nome do Cedente 020/064 045 Alfanum�rico
    Add('NomeSacador',              ftString,    45);    // 05 Nome do Sacador 065/109 045 Alfanum�rico
    Add('DocumentoSacador',         ftString,    14);    // 06 Documento Sacador 110/123 014 Alfanum�rico
    Add('EnderecoSacador',          ftString,    45);    // 07 Endere�o Sacador 124/168 045 Alfanum�rico
    Add('CEPSacador',               ftInteger      );    // 08 CEP Sacador 169/176 008 Num�rico
    Add('CidadeSacador',            ftString,    20);    // 09 Cidade Sacador 177/196 020 Alfanum�rico
    Add('UFSacador',                ftString,     2);    // 10 UF Sacador 197/198 002 Alfab�tico
    Add('NossoNumero',              ftString,    15);    // 11 Nosso N�mero 199/213 015 Alfanum�rico
    Add('EspecieTitulo',            ftString,     3);    // 12 Esp�cie do T�tulo 214/216 003 Alfab�tico
    Add('NumeroTitulo',             ftString,    11);    // 13 N� T�tulo 217/227 011 Alfanum�rico
    Add('DataEmissao',              ftInteger      );    // 14 Data Emiss�o 228/235 008 Num�rico
    Add('DataVencimento',           ftInteger      );    // 15 Data Vencimento 236/243 008 Num�rico
    Add('TipoMoeda',                ftSmallint     );    // 16 Tipo Moeda 244/246 003 Num�rico
    Add('ValorTitulo',              ftCurrency);         // 17 Valor T�tulo 247/260 014 Num�rico 2 decimais
    Add('SaldoTitulo',              ftCurrency);         // 18 Saldo T�tulo 261/274 014 Num�rico 2 decimais
    Add('PracaProtesto',            ftString,    20);    // 19 Pra�a Protesto 275/294 020 Alfanum�rico
    Add('TipoEndosso',              ftString,     1);    // 20 Tipo Endosso 295/295 001 Alfab�tico
    Add('Aceite',                   ftString,     1);    // 21 Aceite 296/296 001 Alfab�tico
    Add('ControleDevedor',          ftSmallint);         // 22 Controle Devedor 297/297 001 Num�rico
    Add('NomeDevedor',              ftString,    45);    // 23 Nome Devedor 298/342 045 Alfanum�rico
    Add('TipoIDDevedor',            ftSmallint     );    // 24 Tipo ID Devedor 343/345 003 Num�rico
    Add('NumeroIDDevedor',          ftFloat        );    // 25 N� ID Devedor 346/359 014 Num�rico
    Add('DocumentoDevedor',         ftString,    11);    // 26 Documento Devedor 360/370 011 Alfanum�rico
    Add('EnderecoDevedor',          ftString,    45);    // 27 Endere�o Devedor 371/415 045 Alfanum�rico
    Add('CEPDevedor',               ftInteger      );    // 28 CEP Devedor 416/423 008 Num�rico
    Add('CidadeDevedor',            ftString,    20);    // 29 Cidade Devedor 424/443 020 Alfanum�rico
    Add('UFDevedor',                ftString,     2);    // 30 UF Devedor 444/445 002 Alfab�tico
    Add('CodigoCartorio',           ftSmallint);         // 31 C�digo Cart�rio 446/447 002 Num�rico
    Add('ProtocoloCartorio',        ftString,    10);    // 32 Protocolo Cart�rio 448/457 010 Alfanum�rico
    Add('TipoOcorrencia',           ftString,     1);    // 33 Tipo Ocorr�ncia 458/458 001 Alfanum�rico
    Add('DataProtocolo',            ftInteger     );     // 34 Data Protocolo 459/466 008 Num�rico
    Add('ValorCustasCartorio',      ftCurrency);         // 35 Custas Cart�rio 467/476 010 Num�rico 2 decimais
    Add('DeclaracaoPortador',       ftString,     1);    // 36 Declara��o Portador 477/477 001 Alfanum�rico
    Add('DataOcorrencia',           ftInteger      );    // 37 Data Ocorr�ncia 478/485 008 Num�rico
    Add('CodigoIrregularidade',     ftString,     2);    // 38 C�d Irregularidade 486/487 002 Alfanum�rico
    Add('BairroDevedor',            ftString,    20);    // 39 Bairro Devedor 488/507 020 Alfab�tico
    Add('ValorCustasDistribuidor',  ftCurrency);         // 40 Custas Distribuidor 508/517 010 Num�rico 2 decimais
    Add('RegistroDistribuicao',     ftInteger);          // 41 Registro Distribui��o 518/523 006 Num�rico
    Add('ValorGravacao',            ftCurrency);         // 42 Grava��o Eletr�nica 524/533 010 Num�rico 2 decimais
    Add('NumeroOperacaoBanco',      ftInteger      );    // 43 Opera��o Banco 534/538 005 Num�rico
    Add('NumeroContratoBanco',      ftCurrency     );    // 44 Contrato Banco 539/553 015 Num�rico
    Add('ParcelaContrato',          ftSmallint);         // 45 Parcela Contrato 554/556 003 Num�rico
    Add('TipoLetraCambio',          ftString,     1);    // 46 Letra C�mbio 557/557 001 Alfanum�rico
    Add('ComplCodIrregularidade',   ftString,     8);    // 47 Compl. C�d Irreg. 558/565 008 Alfanum�rico
    Add('ProtestoFalencia',         ftString,     1);    // 48 Fal�ncia 566/566 001 Alfab�tico
    Add('InstrumentoProtesto',      ftString,     1);    // 49 Instr. Protesto 567/567 001 Alfab�tico
    Add('ValorDemaisDespesas',      ftCurrency);         // 50 Despesas Diversas 568/577 010 Num�rico 2 decimais
    Add('ComplementoRegistro',      ftString,    19);    // 51 Compl. Registro 578/596 019 Alfanum�rico
    Add('SeqRegistroArquivo',       ftSmallint);         // 52 Seq Registro Arquivo 597/600 004 Num�rico
  end;
  FMemTransacao.CreateDataSet;
end;

procedure TCRAMemManager.PrepareTrailler;
begin
  with FMemTrailler.FieldDefs do
  begin
    Clear;
    Add('IdentificacaoRegistro', ftSmallint);            // 01 Identifica��o do Registro 001/001 001 Num�rico
    Add('CodigoPortador',       ftSmallint);            // 02 C�digo do Portador 002/004 003 Num�rico
    Add('NomePortador',         ftString,   40);        // 03 Nome do Portador 005/044 040 Alfanum�rico
    Add('DataMovimento',        ftString,    8);        // 04 Data do Movimento 045/052 008 Num�rico
    Add('SomatorioQtd',         ftSmallint);            // 05 Somat�rio Qtde Remessa 053/057 005 Num�rico
    Add('SomatorioValor',       ftCurrency);            // 06 Somat�rio Valor Remessa 058/075 018 Num�rico 2 decimais
    Add('ComplementoRegistro',  ftString,  521);        // 07 Compl. Registro 076/596 521 Alfanum�rico
    Add('SeqRegistroArquivo',   ftInteger);             // 08 Seq Registro Arquivo 597/600 004 Num�rico
  end;
  FMemTrailler.CreateDataSet;
end;

procedure TCRAMemManager.ImportFromFile(const AFileName: string);
var
  Reader: TStreamReader;
  Line: string;
begin
  FMemHeader.EmptyDataSet;
  FMemTransacao.EmptyDataSet;
  FMemTrailler.EmptyDataSet;
  Reader := TStreamReader.Create(AFileName, TEncoding.ANSI, True, 65536);
  try
    while not Reader.EndOfStream do
    begin
      Line := Reader.ReadLine;
      if Line.IsEmpty then
        Continue;

      case Line[1] of
        '0':  // HEADER
          begin
            FMemHeader.Append;
            FMemHeader.FieldByName('IdentificacaoRegistro').AsInteger := StrToIntDef(Copy(Line, 1, 1), 0);
            FMemHeader.FieldByName('CodigoPortador').AsInteger := StrToIntDef(Copy(Line, 2, 3), 0);
            FMemHeader.FieldByName('NomePortador').AsString := Trim(Copy(Line, 5, 40));
            FMemHeader.FieldByName('DataMovimento').AsString := Copy(Line, 45, 8);
            FMemHeader.FieldByName('TransacaoRemetente').AsString := Copy(Line, 53, 3);
            FMemHeader.FieldByName('TransacaoDestinatario').AsString := Copy(Line, 56, 3);
            FMemHeader.FieldByName('TransacaoTipo').AsString := Copy(Line, 59, 3);
            FMemHeader.FieldByName('SequenciaRemessa').AsInteger := StrToIntDef(Copy(Line, 62, 6), 0);
            FMemHeader.FieldByName('QuantidadeRegistros').AsInteger := StrToIntDef(Copy(Line, 68, 4), 0);
            FMemHeader.FieldByName('QuantidadeTitulos').AsInteger := StrToIntDef(Copy(Line, 72, 4), 0);
            FMemHeader.FieldByName('QuantidadeIndicacoes').AsInteger := StrToIntDef(Copy(Line, 76, 4), 0);
            FMemHeader.FieldByName('QuantidadeOriginais').AsInteger := StrToIntDef(Copy(Line, 80, 4), 0);
            FMemHeader.FieldByName('AgenciaCentralizadora').AsString := Copy(Line, 84, 6);
            FMemHeader.FieldByName('VersaoLayout').AsInteger := StrToIntDef(Copy(Line, 90, 3), 0);
            FMemHeader.FieldByName('CodigoMunicipio').AsString := Copy(Line, 93, 7);
            FMemHeader.FieldByName('ComplementoRegistro').AsString := Copy(Line, 100, 497);
            FMemHeader.FieldByName('SeqRegistroArquivo').AsInteger := StrToIntDef(Copy(Line, 597, 4), 0);
            FMemHeader.Post;
          end;
        '1': // TRANSA��O
          begin
            FMemTransacao.Append;
            FMemTransacao.FieldByName('IdentificacaoRegistro').AsInteger := StrToIntDef(Copy(Line, 1, 1), 0);
            FMemTransacao.FieldByName('CodigoPortador').AsInteger := StrToIntDef(Copy(Line, 2, 3), 0);
            FMemTransacao.FieldByName('AgenciaCedente').AsString := Copy(Line, 5, 15);
            FMemTransacao.FieldByName('NomeCedente').AsString := Copy(Line, 20, 45);
            FMemTransacao.FieldByName('NomeSacador').AsString := Copy(Line, 65, 45);
            FMemTransacao.FieldByName('DocumentoSacador').AsString := Copy(Line, 110, 14);
            FMemTransacao.FieldByName('EnderecoSacador').AsString := Copy(Line, 124, 45);
            FMemTransacao.FieldByName('CEPSacador').AsString := Copy(Line, 169, 8);
            FMemTransacao.FieldByName('CidadeSacador').AsString := Copy(Line, 177, 20);
            FMemTransacao.FieldByName('UFSacador').AsString := Copy(Line, 197, 2);
            FMemTransacao.FieldByName('NossoNumero').AsString := Copy(Line, 199, 15);
            FMemTransacao.FieldByName('EspecieTitulo').AsString := Copy(Line, 214, 3);
            FMemTransacao.FieldByName('NumeroTitulo').AsString := Copy(Line, 217, 11);
            FMemTransacao.FieldByName('DataEmissao').AsString := Copy(Line, 228, 8);
            FMemTransacao.FieldByName('DataVencimento').AsString := Copy(Line, 236, 8);
            FMemTransacao.FieldByName('TipoMoeda').AsString := Copy(Line, 244, 3);
            FMemTransacao.FieldByName('ValorTitulo').AsCurrency := StrToCurrDef(Copy(Line, 247, 14), 0) / 100;
            FMemTransacao.FieldByName('SaldoTitulo').AsCurrency := StrToCurrDef(Copy(Line, 261, 14), 0) / 100;
            FMemTransacao.FieldByName('PracaProtesto').AsString := Copy(Line, 275, 20);
            FMemTransacao.FieldByName('TipoEndosso').AsString := Copy(Line, 295, 1);
            FMemTransacao.FieldByName('Aceite').AsString := Copy(Line, 296, 1);
            FMemTransacao.FieldByName('ControleDevedor').AsInteger := StrToIntDef(Copy(Line, 297, 1), 0);
            FMemTransacao.FieldByName('NomeDevedor').AsString := Copy(Line, 298, 45);
            FMemTransacao.FieldByName('TipoIDDevedor').AsString := Copy(Line, 343, 3);
            FMemTransacao.FieldByName('NumeroIDDevedor').AsInteger := StrToIntDef(Copy(Line, 346, 14), 0);
            FMemTransacao.FieldByName('DocumentoDevedor').AsString := Copy(Line, 360, 11);
            FMemTransacao.FieldByName('EnderecoDevedor').AsString := Copy(Line, 371, 45);
            FMemTransacao.FieldByName('CEPDevedor').AsString := Copy(Line, 416, 8);
            FMemTransacao.FieldByName('CidadeDevedor').AsString := Copy(Line, 424, 20);
            FMemTransacao.FieldByName('UFDevedor').AsString := Copy(Line, 444, 2);
            FMemTransacao.FieldByName('CodigoCartorio').AsInteger := StrToIntDef(Copy(Line, 446, 2), 0);
            FMemTransacao.FieldByName('ProtocoloCartorio').AsString := Copy(Line, 448, 10);
            FMemTransacao.FieldByName('TipoOcorrencia').AsString := Copy(Line, 458, 1);
            FMemTransacao.FieldByName('DataProtocolo').AsString := Copy(Line, 459, 8);
            FMemTransacao.FieldByName('ValorCustasCartorio').AsCurrency := StrToCurrDef(Copy(Line, 467, 10), 0) / 100;
            FMemTransacao.FieldByName('DeclaracaoPortador').AsString := Copy(Line, 477, 1);
            FMemTransacao.FieldByName('DataOcorrencia').AsString := Copy(Line, 478, 8);
            FMemTransacao.FieldByName('CodigoIrregularidade').AsString := Copy(Line, 486, 2);
            FMemTransacao.FieldByName('BairroDevedor').AsString := Copy(Line, 488, 20);
            FMemTransacao.FieldByName('ValorCustasDistribuidor').AsCurrency := StrToCurrDef(Copy(Line, 508, 10), 0) / 100;
            FMemTransacao.FieldByName('RegistroDistribuicao').AsInteger := StrToIntDef(Copy(Line, 518, 6), 0);
            FMemTransacao.FieldByName('ValorGravacao').AsCurrency := StrToCurrDef(Copy(Line, 524, 10), 0) / 100;
            FMemTransacao.FieldByName('NumeroOperacaoBanco').AsString := Copy(Line, 534, 5);
            FMemTransacao.FieldByName('NumeroContratoBanco').AsString := Copy(Line, 539, 15);
            FMemTransacao.FieldByName('ParcelaContrato').AsInteger := StrToIntDef(Copy(Line, 554, 3), 0);
            FMemTransacao.FieldByName('TipoLetraCambio').AsString := Copy(Line, 557, 1);
            FMemTransacao.FieldByName('ComplCodIrregularidade').AsString := Copy(Line, 558, 8);
            FMemTransacao.FieldByName('ProtestoFalencia').AsString := Copy(Line, 566, 1);
            FMemTransacao.FieldByName('InstrumentoProtesto').AsString := Copy(Line, 567, 1);
            FMemTransacao.FieldByName('ValorDemaisDespesas').AsCurrency := StrToCurrDef(Copy(Line, 568, 10), 0) / 100;
            FMemTransacao.FieldByName('ComplementoRegistro').AsString := Copy(Line, 578, 19);
            FMemTransacao.FieldByName('SeqRegistroArquivo').AsInteger := StrToIntDef(Copy(Line, 597, 4), 0);
            FMemTransacao.Post;
          end;
        '9': // TRAILER
          begin
            FMemTrailler.Append;
            FMemTrailler.FieldByName('IdentificacaoRegistro').AsInteger := StrToIntDef(Copy(Line, 1, 1), 0);
            FMemTrailler.FieldByName('CodigoPortador').AsInteger := StrToIntDef(Copy(Line, 2, 3), 0);
            FMemTrailler.FieldByName('NomePortador').AsString := Copy(Line, 5, 40);
            FMemTrailler.FieldByName('DataMovimento').AsString := Copy(Line, 45, 8);
            FMemTrailler.FieldByName('SomatorioQtd').AsInteger := StrToIntDef(Copy(Line, 53, 5), 0);
            FMemTrailler.FieldByName('SomatorioValor').AsCurrency := StrToCurrDef(Copy(Line, 58, 18), 0) / 100;
            FMemTrailler.FieldByName('ComplementoRegistro').AsString := Copy(Line, 76, 521);
            FMemTrailler.FieldByName('SeqRegistroArquivo').AsInteger := StrToIntDef(Copy(Line, 597, 4), 0);
            FMemTrailler.Post;
          end;
      end;
    end;
  finally
    Reader.Free;
  end;
end;

end.

