// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Funcoes.CNPJCPF_Linha97_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
function TCNPJCPF.ValidarCPF(const CPF: string): Boolean;
var
  Digito, Soma, i, j: Integer;
  CPFCalc: string;
  Multiplicador: array[1..11] of Integer;
begin
  Result := False;

  // Remove caracteres não numéricos do CPF
  CPFCalc := '';
  for i := 1 to Length(CPF) do
    if CharInSet(CPF[i], ['0'..'9']) then
      CPFCalc := CPFCalc + CPF[i];

  // Verifica se o CPF possui 11 dígitos
  if Length(CPFCalc) <> 11 then
    Exit;

  // Verifica se todos os dígitos são iguais
  if (CPFCalc = '00000000000') or (CPFCalc = '11111111111') or
    (CPFCalc = '22222222222') or (CPFCalc = '33333333333') or
    (CPFCalc = '44444444444') or (CPFCalc = '55555555555') or
    (CPFCalc = '66666666666') or (CPFCalc = '77777777777') or
    (CPFCalc = '88888888888') or (CPFCalc = '99999999999') then
    Exit;

  // Calcula o primeiro dígito verificador
  Soma := 0;
  Multiplicador[1] := 10;
  Multiplicador[2] := 9;
  Multiplicador[3] := 8;
  Multiplicador[4] := 7;
  Multiplicador[5] := 6;
  Multiplicador[6] := 5;
  Multiplicador[7] := 4;
  Multiplicador[8] := 3;
  Multiplicador[9] := 2;
  for i := 1 to 9 do
    Soma := Soma + (StrToInt(CPFCalc[i]) * Multiplicador[i]);
  Digito := 11 - (Soma mod 11);
  if Digito >= 10 then
    Digito := 0;
  if Digito <> StrToInt(CPFCalc[10]) then
    Exit;

  // Calcula o segundo dígito verificador
  Soma := 0;
  Multiplicador[1] := 11;
  Multiplicador[2] := 10;
  Multiplicador[3] := 9;
  Multiplicador[4] := 8;
  Multiplicador[5] := 7;
  Multiplicador[6] := 6;
  Multiplicador[7] := 5;
  Multiplicador[8] := 4;
  Multiplicador[9] := 3;
  Multiplicador[10] := 2;
  for i := 1 to 10 do
    Soma := Soma + (StrToInt(CPFCalc[i]) * Multiplicador[i]);
  Digito := 11 - (Soma mod 11);
  if Digito >= 10 then
    Digito := 0;
  if Digito <> StrToInt(CPFCalc[11]) then
    Exit;

  Result := True;

end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
