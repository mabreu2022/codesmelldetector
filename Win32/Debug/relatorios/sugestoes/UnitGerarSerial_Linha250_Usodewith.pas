// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\obtendo numero serial do hd\UnitGerarSerial.pas
// Linha: 250

// Trecho original:
// ------------------
with FDQuery2 do;

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
