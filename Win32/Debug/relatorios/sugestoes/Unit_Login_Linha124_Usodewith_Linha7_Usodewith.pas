// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit_Login_Linha124_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with Col.Items.add do //Example Edit + Button same row and col

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
