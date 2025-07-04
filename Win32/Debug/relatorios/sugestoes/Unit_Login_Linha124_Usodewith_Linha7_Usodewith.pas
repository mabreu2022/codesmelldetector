// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit_Login_Linha124_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with Col.Items.add do //Example Edit + Button same row and col

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
