// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\FSD.NewProject.NewUnit.Component.ConnectionFiredac_Linha10_Métodomuitolongo.pas
// Linha: 151

// Trecho original:
// ------------------
with TStringList.Create do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
