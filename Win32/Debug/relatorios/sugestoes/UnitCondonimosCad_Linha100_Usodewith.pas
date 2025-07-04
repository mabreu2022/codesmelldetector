// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\UnitCondonimosCad.pas
// Linha: 100

// Trecho original:
// ------------------
with D2Bridge.Items.add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
