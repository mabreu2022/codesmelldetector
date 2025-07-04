// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\backup\UnitCondonimos.pas
// Linha: 134

// Trecho original:
// ------------------
with D2Bridge.Items.add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
