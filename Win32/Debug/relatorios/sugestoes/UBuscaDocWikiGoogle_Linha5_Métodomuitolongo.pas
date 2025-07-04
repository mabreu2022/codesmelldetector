// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\analisdordehints\UBuscaDocWikiGoogle.pas
// Linha: 5

// Trecho original:
// ------------------
function BuscarDocWikiGoogle(const Codigo, Mensagem: string): string;

implementation

uses
  System.SysUtils, System.Classes, System.JSON, System.NetEncoding,
  IdHTTP, IdSSLOpenSSL;

const
  API_KEY = 'AIzaSyAOKWVgjABtxStLv-iRTYxheI_PX5y_H8Y'; // ?? Substitua por sua chave de API
  CSE_ID = '03399718856334828';      // ? Seu ID de mecanismo de busca

function BuscarDocWikiGoogle(const Codigo, Mensagem: string): string;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  URL, Resposta, Query: string;
  JSONRoot, Item: TJSONObject;
  Items: TJSONArray;
  I: Integer;
  Stream: TStringStream;
begin
  Result := '';
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Stream := TStringStream.Create('', TEncoding.UTF8);
  try
    HTTP.IOHandler := SSL;
    HTTP.HandleRedirects := True;
    HTTP.Request.UserAgent := 'Mozilla/5.0 (Delphi Indy)';
    HTTP.Request.AcceptEncoding := 'utf-8';

    Query := TNetEncoding.URL.Encode('Delphi ' + Codigo + ' ' + Mensagem);
    URL := Format(
      'https://www.googleapis.com/customsearch/v1?key=%s&cx=%s&q=%s',
      [API_KEY, CSE_ID, Query]
    );

    Resposta := HTTP.Get(URL);

    JSONRoot := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;
    try
      if Assigned(JSONRoot) and JSONRoot.TryGetValue<TJSONArray>('items', Items) then
      begin
        for I := 0 to Items.Count - 1 do
        begin
          Item := Items.Items[I] as TJSONObject;
          if Item.TryGetValue<string>('link', Result) then
          begin
            if Result.StartsWith('https://docwiki.embarcadero.com/') then
              Exit
            else
              Result := ''; // ignora se não for docwiki
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
