// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Cargas\cargas\View\cxSchedulerEventEditor.pas
// Linha: 1632

// Trecho original:
// ------------------
with cbxTaskStatus.Properties do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
