// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\api\modules\restrequest4delphi\src\RESTRequest4D.Request.FPHTTPClient.pas
// Linha: 43

// Trecho original:
// ------------------
    procedure ExecuteRequest(const AMethod: TMethodRequest);
    function AcceptEncoding: string; overload;
    function AcceptEncoding(const AAcceptEncoding: string): IRequest; overload;
    function AcceptCharset: string; overload;
    function AcceptCharset(const AAcceptCharset: string): IRequest; overload;
    function Accept: string; overload;
    function Accept(const AAccept: string): IRequest; overload;
    function Timeout: Integer; overload;
    function Timeout(const ATimeout: Integer): IRequest; overload;
    function Adapters(const AAdapter: IRequestAdapter): IRequest; overload;
    function Adapters(const AAdapters: TArray<IRequestAdapter>): IRequest; overload;
    function Adapters: TArray<IRequestAdapter>; overload;
    function BaseURL(const ABaseURL: string): IRequest; overload;
    function BaseURL: string; overload;
    function Resource(const AResource: string): IRequest; overload;
    function RaiseExceptionOn500: Boolean; overload;
    function RaiseExceptionOn500(const ARaiseException: Boolean): IRequest; overload;
    function Resource: string; overload;
    function ResourceSuffix(const AResourceSuffix: string): IRequest; overload;
    function ResourceSuffix: string; overload;
    function Token(const AToken: string): IRequest;
    function TokenBearer(const AToken: string): IRequest;
    function BasicAuthentication(const AUsername, APassword: string): IRequest;
    function Retry(const ARetries: Integer): IRequest;
    function OnBeforeExecute(const AOnBeforeExecute: TRR4DCallbackOnBeforeExecute): IRequest;
    function OnAfterExecute(const AOnAfterExecute: TRR4DCallbackOnAfterExecute): IRequest;
    function Get: IResponse;
    function Post: IResponse;
    function Put: IResponse;
    function Delete: IResponse;
    function Patch: IResponse;
    function FullRequestURL(const AIncludeParams: Boolean = True): string;
    function ClearBody: IRequest;
    function AddBody(const AContent: string): IRequest; overload;
    function AddBody(const AContent: TJSONObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TJSONArray; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TStream; const AOwns: Boolean = True): IRequest; overload;
    function AddUrlSegment(const AName, AValue: string): IRequest;
    function ClearHeaders: IRequest;
    function AddHeader(const AName, AValue: string): IRequest;
    function ClearParams: IRequest;
    function ContentType(const AContentType: string): IRequest; overload;
    function ContentType: string; overload;
    function UserAgent(const AName: string): IRequest;
    function AddCookies(const ACookies: Tstrings): IRequest;
    function AddCookie(const ACookieName, ACookieValue: string): IRequest;
    function AddParam(const AName, AValue: string): IRequest;
    function AddField(const AFieldName: string; const AValue: string): IRequest; overload;
    function AddFile(const AFieldName: string; const AFileName: string; const AContentType: string = ''): IRequest; overload;
    function AddFile(const AFieldName: string; const AValue: TStream; const AFileName: string = ''; const AContentType: string = ''): IRequest; overload;
    function MakeURL(const AIncludeParams: Boolean = True): string;
    function Proxy(const AServer, APassword, AUsername: string; const APort: Integer): IRequest;
    function DeactivateProxy: IRequest;
  protected
    procedure DoAfterExecute(const Sender: TObject; const AResponse: IResponse); virtual;
    procedure DoBeforeExecute(const Sender: TFPHTTPClient); virtual;
  public
    constructor Create;
    class function New: IRequest;
    destructor Destroy; override;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
