// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\salaoexecencias\Dao\uDAO.Procedimento.pas
// Linha: 92

// Trecho original:
// ------------------
with TFDQuery.Create(nil) do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
