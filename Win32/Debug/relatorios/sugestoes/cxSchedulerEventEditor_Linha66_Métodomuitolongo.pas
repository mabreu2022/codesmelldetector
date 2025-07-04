// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Cargas\cargas\View\cxSchedulerEventEditor.pas
// Linha: 66

// Trecho original:
// ------------------
  TcxSchedulerEditorIsValidEvent = function: Boolean of object;

  TcxSchedulerCustomEditorFormHelper = class
  private
    FEvent: TcxSchedulerControlEvent;
    FForceSeries: Boolean;
    FForm: TForm;
    FLockCount: Integer;
    FModified: Boolean;
    FReadOnly: Boolean;
    FOnChanged: TNotifyEvent;
    FOnIsValid: TcxSchedulerEditorIsValidEvent;
    FOnSaveChanges: TNotifyEvent;

    function GetStorage: TcxCustomSchedulerStorage;
    function IsValid: Boolean;
    procedure SetModified(AValue: Boolean);
    procedure SetReadOnly(AValue: Boolean);
  protected
    procedure DoChanged; virtual;
    procedure DoExecuteAction(var AModalResult: TModalResult); virtual;
    function DoIsValid: Boolean; virtual;
    procedure DoRefresh; virtual;
    procedure DoSaveChanges; virtual;
    function GetEvent: TcxSchedulerControlEvent; virtual;
    function IsEditorModal: Boolean; virtual;

    procedure Cancel(var AModalResult: TModalResult); virtual;
    procedure Close(var AModalResult: TModalResult); virtual;
    procedure Delete(var AModalResult: TModalResult); virtual;
    procedure Save(var AModalResult: TModalResult); virtual;

    property Form: TForm read FForm;
    property OnIsValid: TcxSchedulerEditorIsValidEvent read FOnIsValid write FOnIsValid;
  public
    constructor Create(AForm: TForm; AEvent: TcxSchedulerControlEvent); virtual;

    procedure ExecuteAction(AModalResult: TModalResult);
    procedure Changed;
    function ValidateOccurrenceDate(AEvent: TcxSchedulerControlEvent; ANewStart, ANewFinish: TDateTime): Boolean;

    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure EndUpdate;
    function IsUpdating: Boolean;

    property Event: TcxSchedulerControlEvent read GetEvent;
    property ForceSeries: Boolean read FForceSeries write FForceSeries;
    property Modified: Boolean read FModified write SetModified;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property Storage: TcxCustomSchedulerStorage read GetStorage;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnSaveChanges: TNotifyEvent read FOnSaveChanges write FOnSaveChanges;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
