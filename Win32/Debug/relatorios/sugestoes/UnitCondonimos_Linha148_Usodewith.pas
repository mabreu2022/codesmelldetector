// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\backup\UnitCondonimos.pas
// Linha: 148

// Trecho original:
// ------------------
With Popup('PopupCondominioCad', 'Cadastro de Condominios').Items.Add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
