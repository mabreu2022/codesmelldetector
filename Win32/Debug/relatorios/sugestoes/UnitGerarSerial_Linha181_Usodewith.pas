// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\obtendo numero serial do hd\UnitGerarSerial.pas
// Linha: 181

// Trecho original:
// ------------------
with FDQuery1,FDQuery2 do

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
