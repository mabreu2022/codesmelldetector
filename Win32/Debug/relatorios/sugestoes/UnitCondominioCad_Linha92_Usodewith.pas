// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CRM2\crm-master\UnitCondominioCad.pas
// Linha: 92

// Trecho original:
// ------------------
with row.Items.Add do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
