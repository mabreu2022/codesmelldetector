// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Loja\Loja3\Loja3\Unit_Login.pas
// Linha: 124

// Trecho original:
// ------------------
with Col.Items.add do //Example Edit + Button same row and col

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
