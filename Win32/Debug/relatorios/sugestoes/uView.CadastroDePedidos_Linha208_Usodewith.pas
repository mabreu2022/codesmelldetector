// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\calculadora precos minimos\view\uView.CadastroDePedidos.pas
// Linha: 208

// Trecho original:
// ------------------
with mtbItensPedido.FieldDefs do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
