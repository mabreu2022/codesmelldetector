// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\DAO\DAO.ConexaoLicencas.pas
// Linha: 72

// Trecho original:
// ------------------
with Connection.Params do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
