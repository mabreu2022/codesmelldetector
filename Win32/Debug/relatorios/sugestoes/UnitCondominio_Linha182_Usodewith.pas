// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\CRM\UnitCondominio.pas
// Linha: 182

// Trecho original:
// ------------------
With Popup('PopupPix', 'Pagamento Pix').Items.Add do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
