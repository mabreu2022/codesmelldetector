// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\salaoexecencias\Dao\uDAO.Categoria.pas
// Linha: 118

// Trecho original:
// ------------------
with TFDQuery.Create(nil) do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
