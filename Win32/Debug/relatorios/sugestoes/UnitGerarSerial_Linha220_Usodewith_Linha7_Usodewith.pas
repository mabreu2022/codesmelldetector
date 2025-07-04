// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitGerarSerial_Linha220_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with FDQuery2 do;

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
