// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\UnitCondonimosCad.pas
// Linha: 115

// Trecho original:
// ------------------
with row.Items.Add do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
