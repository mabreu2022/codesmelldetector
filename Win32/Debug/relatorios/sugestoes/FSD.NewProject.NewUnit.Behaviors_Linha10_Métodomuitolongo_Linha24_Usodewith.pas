// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\FSD.NewProject.NewUnit.Behaviors_Linha10_M�todomuitolongo.pas
// Linha: 24

// Trecho original:
// ------------------
with TStringList.Create do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
