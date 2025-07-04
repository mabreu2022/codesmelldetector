// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit_D2Bridge_Server_Linha93_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with Button_Options.ClientToScreen(point(0, 1 + Button_Options.Height)) do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
