// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\obtendo numero serial do hd\Unitsendemail.pas
// Linha: 126

// Trecho original:
// ------------------
with idSMTP1 do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
