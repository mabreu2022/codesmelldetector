// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit1_Linha90_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
