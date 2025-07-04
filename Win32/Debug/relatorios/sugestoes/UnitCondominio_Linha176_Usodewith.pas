// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\UnitCondominio.pas
// Linha: 176

// Trecho original:
// ------------------
With Row.Items.Add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
