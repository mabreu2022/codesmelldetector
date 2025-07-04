// Sugest�o de corre��o para o smell: M�todo muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Funcoes\Funcoes.CNPJCPF.pas
// Linha: 22

// Trecho original:
// ------------------
function TCNPJCPF.ValidarCNPJ(const CNPJ: string): Boolean;
var
  Digito, Soma, i, j: Integer;
  CNPJCalc: string;
  Multiplicador: array[1..14] of Integer;
begin
  Result := False;

  // Remove caracteres n�o num�ricos do CNPJ
  CNPJCalc := '';
  for i := 1 to Length(CNPJ) do
    if CharInSet(CNPJ[i], ['0'..'9']) then
      CNPJCalc := CNPJCalc + CNPJ[i];

  // Verifica se o CNPJ possui 14 d�gitos
  if Length(CNPJCalc) <> 14 then
    Exit;

  // Verifica se todos os d�gitos s�o iguais
  if (CNPJCalc = '00000000000000') or (CNPJCalc = '11111111111111') or
    (CNPJCalc = '22222222222222') or (CNPJCalc = '33333333333333') or
    (CNPJCalc = '44444444444444') or (CNPJCalc = '55555555555555') or
    (CNPJCalc = '66666666666666') or (CNPJCalc = '77777777777777') or
    (CNPJCalc = '88888888888888') or (CNPJCalc = '99999999999999') then
    Exit;

  // Calcula o primeiro d�gito verificador
  Soma := 0;
  Multiplicador[1] := 5;
  Multiplicador[2] := 4;
  Multiplicador[3] := 3;
  Multiplicador[4] := 2;
  Multiplicador[5] := 9;
  Multiplicador[6] := 8;
  Multiplicador[7] := 7;
  Multiplicador[8] := 6;
  Multiplicador[9] := 5;
  Multiplicador[10] := 4;
  Multiplicador[11] := 3;
  Multiplicador[12] := 2;
  for i := 1 to 12 do
    Soma := Soma + (StrToInt(CNPJCalc[i]) * Multiplicador[i]);
  Digito := 11 - (Soma mod 11);
  if Digito >= 10 then
    Digito := 0;
  if Digito <> StrToInt(CNPJCalc[13]) then
    Exit;

  // Calcula o segundo d�gito verificador
  Soma := 0;
  Multiplicador[1] := 6;
  Multiplicador[2] := 5;
  Multiplicador[3] := 4;
  Multiplicador[4] := 3;
  Multiplicador[5] := 2;
  Multiplicador[6] := 9;
  Multiplicador[7] := 8;
  Multiplicador[8] := 7;
  Multiplicador[9] := 6;
  Multiplicador[10] := 5;
  Multiplicador[11] := 4;
  Multiplicador[12] := 3;
  Multiplicador[13] := 2;
  for i := 1 to 13 do
    Soma := Soma + (StrToInt(CNPJCalc[i]) * Multiplicador[i]);
  Digito := 11 - (Soma mod 11);
  if Digito >= 10 then
    Digito := 0;
  if Digito <> StrToInt(CNPJCalc[14]) then
    Exit;

  Result := True;

end;


// Sugest�o:
// Divida o m�todo em subm�todos menores com nomes descritivos.
