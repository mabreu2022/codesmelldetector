// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\cxSchedulerEventEditor_Linha1606_Usodewith.pas
// Linha: 7

// Trecho original:
// ------------------
with TcxCheckComboBoxItem(Add) do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
