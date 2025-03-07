# Portfolio Delphi
Orientação a objetos, MVC e camada de persistencia com RTTI

## Banco de dados
MySQL 5.7.44.0 - Usando docker

```
docker run --name mysql5.7 -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Banco12345* mysql:5.7
```

DUMP.sql, com os scripts de criação do banco, tabelas e alguns inserts.

## Configurações
Configuracoes.ini, ficando ao lado do .exe

libmysql.dll, versao 5.7.44.0 x86

Teste_WK_Rod.exe

## Delphi 12 Update 1 - Community edition
Sistema de Pedidos e Itens, usando Orientação a objetos, MVC e camada de persistencia com RTTI

Property|Description
-|-
file_path|Path to the XEX file.
patch_file_path|Path to the XEXP file. This is not required if the game has no title updates.
patched_file_path|Path to the patched XEX file. XenonRecomp will create this file automatically if it is missing and reuse it in subsequent recompilations. It does nothing if no XEXP file is specified. You can pass this output file to XenonAnalyse.
out_directory_path|Path to the directory that will contain the output C++ code. This directory must exist before running the recompiler.
switch_table_file_path|Path to the TOML file containing the jump table definitions. The recompiler uses this file to convert jump tables to real switch cases.
