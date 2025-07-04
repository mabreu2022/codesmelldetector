// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitCondonimos_Linha134_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with D2Bridge.Items.add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
