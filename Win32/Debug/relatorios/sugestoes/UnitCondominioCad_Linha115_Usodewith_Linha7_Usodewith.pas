// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitCondominioCad_Linha115_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with row.Items.Add do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
