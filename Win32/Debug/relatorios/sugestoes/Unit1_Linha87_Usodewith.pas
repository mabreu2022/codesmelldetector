// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja2\Unit1.pas
// Linha: 87

// Trecho original:
// ------------------
with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
