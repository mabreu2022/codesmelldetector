// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\NewProject\FSD.NewProject.NewUnit.Component.ConnectionInterfaces.pas
// Linha: 27

// Trecho original:
// ------------------
with TStringList.Create do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
