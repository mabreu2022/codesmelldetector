// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja3\Loja3\Unit1.pas
// Linha: 90

// Trecho original:
// ------------------
with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
