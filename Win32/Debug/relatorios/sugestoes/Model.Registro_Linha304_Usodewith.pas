// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Registro.pas
// Linha: 304

// Trecho original:
// ------------------
with qry do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
