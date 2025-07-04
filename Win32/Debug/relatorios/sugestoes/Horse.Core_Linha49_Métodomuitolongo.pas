// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Curso Horse\modules\horse\src\Horse.Core.pas
// Linha: 49

// Trecho original:
// ------------------
    class function TrimPath(const APath: string): string;
    class function RegisterRoute(const AHTTPType: TMethodType; const APath: string; const ACallback: THorseCallback): THorseCore;
    class var FDefaultHorse: THorseCore;

    function InternalRoute(const APath: string): IHorseCoreRoute<THorseCore>;
    function InternalGroup: IHorseCoreGroup<THorseCore>;
    function InternalGetRoutes: THorseRouterTree;
    procedure InternalSetRoutes(const AValue: THorseRouterTree);
    class function GetRoutes: THorseRouterTree; static;
    class procedure SetRoutes(const AValue: THorseRouterTree); static;
    class function MakeHorseModule: THorseModule;

    class function GetCallback(const ACallbackRequest: THorseCallbackRequestResponse): THorseCallback; overload;
    class function GetCallback(const ACallbackRequest: THorseCallbackRequest): THorseCallback; overload;
{$IFNDEF FPC}
    class function GetCallback(const ACallbackResponse: THorseCallbackResponse): THorseCallback; overload;
{$ENDIF}
    class function GetCallbacks: TArray<THorseCallback>;
    class function RegisterCallbacksRoute(const AMethod: TMethodType; const APath: string): THorseCore;
  public
    constructor Create; virtual;
    class function ToModule: THorseModule;
    class destructor UnInitialize; {$IFNDEF FPC}virtual; {$ENDIF}
    class function AddCallback(const ACallback: THorseCallback): THorseCore;
    class function AddCallbacks(const ACallbacks: TArray<THorseCallback>): THorseCore;

    class function Group: IHorseCoreGroup<THorseCore>;
    class function Route(const APath: string): IHorseCoreRoute<THorseCore>;

    class function Use(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Use(const ACallback: THorseCallback): THorseCore; overload;
    class function Use(const APath: string; const ACallbacks: array of THorseCallback): THorseCore; overload;
    class function Use(const ACallbacks: array of THorseCallback): THorseCore; overload;

    class function All(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function All(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function All(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function All(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
    class function Get(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Get(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function Get(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function Get(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
    class function Put(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Put(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function Put(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function Put(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
{$IF (DEFINED(FPC) or (CompilerVersion > 27.0))}
    class function Patch(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Patch(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function Patch(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function Patch(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
{$IFEND}
    class function Head(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Head(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function Head(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function Head(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
    class function Post(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Post(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function Post(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function Post(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
{$IF (defined(fpc) or (CompilerVersion > 27.0))}
    class function Delete(const APath: string; const ACallback: THorseCallback): THorseCore; overload;
    class function Delete(const APath: string; const ACallback: THorseCallbackRequestResponse): THorseCore; overload;
    class function Delete(const APath: string; const ACallback: THorseCallbackRequest): THorseCore; overload;
{$IFNDEF FPC}
    class function Delete(const APath: string; const ACallback: THorseCallbackResponse): THorseCore; overload;
{$IFEND}
{$IFEND}
    class property Routes: THorseRouterTree read GetRoutes write SetRoutes;
    class function GetInstance: THorseCore;
    class function Version: string;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
