// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CRM2\crm-master\UnitPrincipal.pas
// Linha: 120

// Trecho original:
// ------------------
with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
