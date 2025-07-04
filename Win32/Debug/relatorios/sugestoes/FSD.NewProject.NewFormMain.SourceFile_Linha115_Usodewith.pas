// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\NewProject\FSD.NewProject.NewFormMain.SourceFile.pas
// Linha: 115

// Trecho original:
// ------------------
with TStringList.Create do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
