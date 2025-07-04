// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\UPrincipal.pas
// Linha: 1459

// Trecho original:
// ------------------
With FrmPrincipal do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
