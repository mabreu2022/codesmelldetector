// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\Cargas\cargas\DAO\DAO.ConexaoLicencas.pas
// Linha: 73

// Trecho original:
// ------------------
with Connection.Params do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
