// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\api\modules\restrequest4delphi\src\RESTRequest4D.Request.Client.pas
// Linha: 206

// Trecho original:
// ------------------
with FRESTRequest.Params.AddItem do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
