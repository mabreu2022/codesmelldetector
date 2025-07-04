unit uIARefatorador;

interface

function RefatorarMetodoCopilot(const TrechoOriginal: string): string;

implementation

uses
  System.SysUtils, System.Classes, System.Net.HttpClient, System.JSON,
  System.Net.URLClient, System.Hash, System.Generics.Collections, System.SyncObjs;

var
  RefatoracaoCache: TDictionary<string, string>;
  CacheLock: TCriticalSection;

  function RefatorarMetodoCopilot(const TrechoOriginal: string): string;
var
  Hash, Prompt: string;
  Client: THttpClient;
  Response: IHTTPResponse;
  JSONReq, JSONResp: TJSONObject;
  Stream: TStringStream;
  JSONText: string;
begin
  Result := '';
  Hash := THashMD5.GetHashString(TrechoOriginal);

  CacheLock.Acquire;
  try
    if RefatoracaoCache.TryGetValue(Hash, Result) then
      Exit;
  finally
    CacheLock.Release;
  end;

  Prompt := 'Refatore o seguinte metodo Delphi em submetodos menores com nomes descritivos. Mantenha a logica original:' + sLineBreak + TrechoOriginal;

  JSONReq := TJSONObject.Create;
  try
    JSONReq.AddPair('model', 'mistral');
    JSONReq.AddPair('prompt', Prompt);
    JSONReq.AddPair('stream', TJSONBool.Create(False));

    Client := THttpClient.Create;
    try
      Client.ConnectionTimeout := 300000; // 5 minutos
      Client.ResponseTimeout := 300000;

      Stream := TStringStream.Create(JSONReq.ToJSON, TEncoding.UTF8, False); // sem BOM
      try
        Response := Client.Post(
          'http://localhost:11434/api/generate',
          Stream,
          nil,
          [TNameValuePair.Create('Content-Type', 'application/json')]
        );
      finally
        Stream.Free;
      end;

      if Response.StatusCode = 200 then
      begin
        JSONText := Response.ContentAsString(TEncoding.UTF8);
        if JSONText.Trim = '' then
          raise Exception.Create('Resposta vazia da IA.');

        JSONResp := TJSONObject.ParseJSONValue(JSONText) as TJSONObject;
        try
          if Assigned(JSONResp) and JSONResp.TryGetValue('response', Result) then
          begin
            Result := Result.Trim;
            CacheLock.Acquire;
            try
              RefatoracaoCache.AddOrSetValue(Hash, Result);
            finally
              CacheLock.Release;
            end;
          end
          else
            raise Exception.Create('Campo "response" não encontrado na resposta da IA.');
        finally
          JSONResp.Free;
        end;
      end
      else
        raise Exception.Create('Erro na chamada ao modelo local: ' + Response.StatusText);
    finally
      Client.Free;
    end;
  finally
    JSONReq.Free;
  end;
end;

initialization
  RefatoracaoCache := TDictionary<string, string>.Create;
  CacheLock := TCriticalSection.Create;

finalization
  RefatoracaoCache.Free;
  CacheLock.Free;

end.
