// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitCondonimos_Linha138_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
With Row.Items.Add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
