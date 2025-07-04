// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja3\Loja3\Unit_Login.pas
// Linha: 109

// Trecho original:
// ------------------
with Card do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
