// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\UnitPrincipal.pas
// Linha: 163

// Trecho original:
// ------------------
with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
