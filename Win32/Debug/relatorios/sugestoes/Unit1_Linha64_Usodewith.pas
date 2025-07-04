// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja2\Unit1.pas
// Linha: 64

// Trecho original:
// ------------------
with D2Bridge.Items.add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
