// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\obtendo numero serial do hd\Unit1.pas
// Linha: 166

// Trecho original:
// ------------------
with FDQuery2 do;

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
