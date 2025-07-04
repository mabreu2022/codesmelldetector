// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Cargas\cargas\View\cxSchedulerEventEditor.pas
// Linha: 1606

// Trecho original:
// ------------------
with TcxCheckComboBoxItem(Add) do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
