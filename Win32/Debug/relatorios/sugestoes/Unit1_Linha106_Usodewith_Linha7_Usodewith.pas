// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit1_Linha106_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with FDQuery1 do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
