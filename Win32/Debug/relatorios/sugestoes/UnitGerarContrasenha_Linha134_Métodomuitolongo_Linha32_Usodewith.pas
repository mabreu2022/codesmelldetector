// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitGerarContrasenha_Linha134_M�todomuitolongo.pas
// Linha: 32

// Trecho original:
// ------------------
with FDQuery1 do;

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
