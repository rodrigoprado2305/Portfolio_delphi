unit uFormat;

interface

uses System.SysUtils, System.Classes, System.MaskUtils, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormato = (CNPJ, CPF, InscricaoEstadual, CNPJorCPF, TelefoneFixo, Celular,
              Personalizado, Valor, Money, CEP, Dt, Peso);

  procedure Formatar(Obj: TObject; Formato : TFormato; sRotulo : string = '');
  function SomenteNumero(sValor : string) : string;
  procedure LimparFormatacao(Obj: TObject);

implementation

function SomenteNumero(sValor : string) : string;
var
  x : integer;
begin
  Result := EmptyStr;
  for x := 0 to Length(sValor) - 1 do
    //if (sValor.Chars[x] In ['0'..'9']) then
    if CharInSet(sValor.Chars[x],['0'..'9']) then
      Result := Result + sValor.Chars[x];
end;

function FormataPeso(sValor : string) : string;
begin
  if sValor.IsEmpty then
    sValor := '0';

  try
    Result := FormatFloat('#,##0.000', strtofloat(sValor) / 1000);
  except
    Result := FormatFloat('#,##0.000', 0);
  end;
end;

function Mask(sMascara, sValor : string) : string;
var
  i, j : integer;
begin
  j := 0;
  Result := EmptyStr;

  if sValor.IsEmpty then
    exit;

  for i := 0 to Length(sMascara) - 1 do
  begin
    if sMascara.Chars[i] = '#' then
    begin
      Result := Result + sValor.Chars[j];
      inc(j);
    end
    else
      Result := Result + sMascara.Chars[i];

    if j = Length(sValor) then
      break;
  end;
end;

function FormataIE(sNum, sUF: string): string;
var
  Mascara : string;
begin
  Mascara := EmptyStr;
  IF sUF = 'AC' Then Mascara := '##.###.###/###-##';
  IF sUF = 'AL' Then Mascara := '#########';
  IF sUF = 'AP' Then Mascara := '#########';
  IF sUF = 'AM' Then Mascara := '##.###.###-#';
  IF sUF = 'BA' Then Mascara := '######-##';
  IF sUF = 'CE' Then Mascara := '########-#';
  IF sUF = 'DF' Then Mascara := '###########-##';
  IF sUF = 'ES' Then Mascara := '#########';
  IF sUF = 'GO' Then Mascara := '##.###.###-#';
  IF sUF = 'MA' Then Mascara := '#########';
  IF sUF = 'MT' Then Mascara := '##########-#';
  IF sUF = 'MS' Then Mascara := '#########';
  IF sUF = 'MG' Then Mascara := '###.###.###/####';
  IF sUF = 'PA' Then Mascara := '##-######-#';
  IF sUF = 'PB' Then Mascara := '########-#';
  IF sUF = 'PR' Then Mascara := '########-##';
  IF sUF = 'PE' Then Mascara := '##.#.###.#######-#';
  IF sUF = 'PI' Then Mascara := '#########';
  IF sUF = 'RJ' Then Mascara := '##.###.##-#';
  IF sUF = 'RN' Then Mascara := '##.###.###-#';
  IF sUF = 'RS' Then Mascara := '###/#######';
  IF sUF = 'RO' Then Mascara := '###.#####-#';
  IF sUF = 'RR' Then Mascara := '########-#';
  IF sUF = 'SC' Then Mascara := '###.###.###';
  IF sUF = 'SP' Then Mascara := '###.###.###.###';
  IF sUF = 'SE' Then Mascara := '#########-#';
  IF sUF = 'TO' Then Mascara := '###########';

  Result := Mask(mascara, sNum);
end;

function FormataData(sValor : string): string;
begin
  sValor := Copy(sValor, 1, 8);

  if Length(sValor) < 8 then
    Result := Mask('##/##/####', sValor)
  else
  begin
    try
      sValor := Mask('##/##/####', sValor);
      strtodate(sValor);
      Result := sValor;
    except
      Result := EmptyStr;
    end;
  end;
end;

procedure LimparFormatacao(Obj: TObject);
begin
  if obj is TEdit then
    TEdit(obj).Text := SomenteNumero(TEdit(obj).Text)
  else if obj is TLabeledEdit then
    TLabeledEdit(obj).Text := SomenteNumero(TLabeledEdit(obj).Text)
  else if obj is TLabel then
    TLabel(obj).Caption := SomenteNumero(TLabel(obj).Caption);
end;

function FormataValor(sValor : string) : string;
begin
  if sValor = EmptyStr then
    sValor := '0';

  try
    Result := FormatFloat('#0.00', strtofloat(sValor) / 100);
  except
    Result := FormatFloat('#,##0.00', 0);
  end;
end;

procedure Formatar(Obj: TObject; Formato : TFormato; sRotulo : string = '');
var
  sValor : string;
begin
  if obj is TEdit then
    sValor := TEdit(obj).Text
  else if obj is TLabeledEdit then
    sValor := TLabeledEdit(obj).Text
  else if obj is TLabel then
    sValor := TLabel(obj).Caption;

  if formato = TelefoneFixo then
    sValor := Mask('(##) ####-####', SomenteNumero(sValor))
  else if formato = Celular then
    sValor := Mask('(##) #####-####', SomenteNumero(sValor))
  else if formato = CNPJ then
    sValor := Mask('##.###.###/####-##', SomenteNumero(sValor))
  else if formato = CPF then
    sValor := Mask('###.###.###-##', SomenteNumero(sValor))
  else if formato = InscricaoEstadual then
    sValor := FormataIE(SomenteNumero(sValor), sRotulo)
  else if formato = CNPJorCPF then
  begin
    if Length(SomenteNumero(sValor)) <= 11 then
      sValor := Mask('###.###.###-##', SomenteNumero(sValor))
    else
      sValor := Mask('##.###.###/####-##', SomenteNumero(sValor));
  end
  else if formato = Personalizado then
    sValor := Mask(sRotulo, SomenteNumero(sValor))
  else if Formato = Valor then
    sValor := FormataValor(sValor) //FormataValor(SomenteNumero(sValor))
  else if Formato = Money then
  begin
    if sRotulo = EmptyStr then
      sRotulo := 'R$';
    sValor := sRotulo + ' ' + FormataValor(SomenteNumero(sValor));
  end
  else if Formato = CEP then
    sValor := Mask('##.###-###', SomenteNumero(sValor))
  else if formato = Dt then
    sValor := FormataData(SomenteNumero(sValor))
  else if Formato = Peso then
    sValor := FormataPeso(SomenteNumero(sValor));

  if obj is TEdit then
  begin
    TEdit(obj).Text := sValor;
  end
  else if obj is TLabeledEdit then
    TLabeledEdit(obj).Text := sValor
  else if obj is TLabel then
    TLabel(obj).Caption := sValor;
end;

end.

