// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\RESTRequest4D.Request.Client_Linha206_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with FRESTRequest.Params.AddItem do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
