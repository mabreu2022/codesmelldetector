// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\api\modules\restrequest4delphi\src\RESTRequest4D.Request.Client.pas
// Linha: 23

// Trecho original:
// ------------------
    procedure ExecuteRequest;
    procedure DoJoinComponents;
    function PrepareUrlSegments(const AValue: string): string;
    function AcceptEncoding: string; overload;
    function AcceptEncoding(const AAcceptEncoding: string): IRequest; overload;
    function AcceptCharset: string; overload;
    function AcceptCharset(const AAcceptCharset: string): IRequest; overload;
    function Accept: string; overload;
    function Accept(const AAccept: string): IRequest; overload;
    function Adapters(const AAdapter: IRequestAdapter): IRequest; overload;
    function Adapters(const AAdapters: TArray<IRequestAdapter>): IRequest; overload;
    function Adapters: TArray<IRequestAdapter>; overload;
    function BaseURL(const ABaseURL: string): IRequest; overload;
    function BaseURL: string; overload;
    function Resource(const AResource: string): IRequest; overload;
    function Resource: string; overload;
    function ResourceSuffix(const AResourceSuffix: string): IRequest; overload;
    function ResourceSuffix: string; overload;
    function Timeout(const ATimeout: Integer): IRequest; overload;
    function Timeout: Integer; overload;
    function RaiseExceptionOn500: Boolean; overload;
    function RaiseExceptionOn500(const ARaiseException: Boolean): IRequest; overload;
    function FullRequestURL(const AIncludeParams: Boolean = True): string;
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
    function ClearBody: IRequest;
    function AddParam(const AName, AValue: string; const AKind: TRESTRequestParameterKind = {$IF COMPILERVERSION < 33}TRESTRequestParameterKind.pkGETorPOST{$ELSE}TRESTRequestParameterKind.pkQUERY{$ENDIF}; const AOptions: TRESTRequestParameterOptions = []): IRequest;
    function AddBody(const AContent: string; const AContentType: TRESTContentType = ctAPPLICATION_JSON): IRequest; overload;
    function AddBody(const AContent: TJSONObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TJSONArray; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TStream; const AOwns: Boolean = True): IRequest; overload;
    function FallbackCharsetEncoding(const AFallbackCharsetEncoding: string): IRequest;
    function AddUrlSegment(const AName, AValue: string): IRequest;
    function SynchronizedEvents(const AValue: Boolean): IRequest;
    function ClearHeaders: IRequest;
    function AddHeader(const AName, AValue: string; const AOptions: TRESTRequestParameterOptions = []): IRequest;
    function ClearParams: IRequest;
    function ContentType(const AContentType: string): IRequest; overload;
    function ContentType: string; overload;
    function UserAgent(const AName: string): IRequest;
    function AddCookies(const ACookies: TStrings): IRequest;
    function AddCookie(const ACookieName, ACookieValue: string): IRequest;
    function AddField(const AFieldName: string; const AValue: string): IRequest; overload;
    function AddFile(const AFieldName: string; const AFileName: string; const AContentType: TRESTContentType = TRESTContentType.ctNone): IRequest; overload;
    function AddFile(const AFieldName: string; const AValue: TStream; const AFileName: string = ''; const AContentType: TRESTContentType = TRESTContentType.ctNone): IRequest; overload;
    function Proxy(const AServer, APassword, AUsername: string; const APort: Integer): IRequest;
    function DeactivateProxy: IRequest;
  protected
    procedure DoAfterExecute(Sender: TCustomRESTRequest); virtual;
    procedure DoBeforeExecute(Sender: TCustomRESTRequest); virtual;
    procedure DoHTTPProtocolError(Sender: TCustomRESTRequest); virtual;
  public
    constructor Create; virtual;
    class function New: IRequest;
    destructor Destroy; override;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
