// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitGerarSerial_Linha181_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with FDQuery1,FDQuery2 do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
