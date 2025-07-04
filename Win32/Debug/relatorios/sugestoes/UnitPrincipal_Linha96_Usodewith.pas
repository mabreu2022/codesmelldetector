// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM2\crm-master\UnitPrincipal.pas
// Linha: 96

// Trecho original:
// ------------------
with D2Bridge.Items.add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
