unit uBiblioteca;

interface

uses
  Vcl.Forms, System.SysUtils;

  Function fnNomeExe: String;
  Function fnCaminhoExe: String;

implementation

uses uConstantes;

function fnCaminhoExe: String;
begin
   result := ExtractFilePath(Application.ExeName);
end;

function fnNomeExe: String;
begin
   result := ExtractFileName(Application.ExeName);
end;

end.

