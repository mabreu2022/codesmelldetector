// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja3\Loja3\Unit_Login.pas
// Linha: 104

// Trecho original:
// ------------------
with D2Bridge.Items.add do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
