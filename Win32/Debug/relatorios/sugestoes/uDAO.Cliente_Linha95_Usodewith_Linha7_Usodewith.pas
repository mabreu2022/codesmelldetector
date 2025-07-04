// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\uDAO.Cliente_Linha95_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with TFDQuery.Create(nil) do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
