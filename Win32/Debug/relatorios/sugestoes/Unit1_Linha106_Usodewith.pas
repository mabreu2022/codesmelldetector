// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\obtendo numero serial do hd\Unit1.pas
// Linha: 106

// Trecho original:
// ------------------
with FDQuery1 do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
