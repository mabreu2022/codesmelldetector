// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja3\Loja3\Unit_D2Bridge_Server.pas
// Linha: 93

// Trecho original:
// ------------------
with Button_Options.ClientToScreen(point(0, 1 + Button_Options.Height)) do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
