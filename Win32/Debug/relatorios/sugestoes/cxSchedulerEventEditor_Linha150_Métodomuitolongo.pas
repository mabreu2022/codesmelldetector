// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Cargas\cargas\View\cxSchedulerEventEditor.pas
// Linha: 150

// Trecho original:
// ------------------
    function HasStorageEvent: Boolean;
    procedure SetAllowDelete(AValue: Boolean);
    procedure SetAllowRecurrence(AValue: Boolean);
    procedure SetIntersection(const Value: Boolean);
    procedure SetIsIntersectionValid(const Value: Boolean);
  protected
    procedure ApplyEventTime;
    procedure CalculateIntersection;
    procedure UpdateEditingInfo;

    procedure DoExecuteAction(var AModalResult: TModalResult); override;
    procedure DoInitialize(AEventInfo: TcxSchedulerEventEditInfo;
      AEditingInfo: TcxSchedulerEditingEventInfo); virtual;
    procedure DoRefresh; override;
    function GetEvent: TcxSchedulerControlEvent; override;
    procedure NormalizeTopMostWindows;
    function PostEvent: TcxSchedulerEvent; virtual;
    procedure RefreshRecurrenceInfo;

    procedure Cancel(var AModalResult: TModalResult); override;
    procedure Close(var AModalResult: TModalResult); override;
    procedure Delete(var AModalResult: TModalResult); override;
    procedure Save(var AModalResult: TModalResult); override;

    property Source: TcxSchedulerEvent read FSource;
    property CanDelete: Boolean read FCanDelete;
    property EditingInfo: TcxSchedulerEditingEventInfo read FEditingInfo;
    property IsEventRecurring: Boolean read FIsEventRecurring;
  public
    constructor Create(AForm: TForm; AEvent: TcxSchedulerControlEvent); override;
    destructor Destroy; override;

    function CanClose: Boolean;
    function GetRecurrenceDescription: string;
    procedure Initialize(AEventInfo: TcxSchedulerEventEditInfo;
      AEditingInfo: TcxSchedulerEditingEventInfo);
    function IsNewEvent: Boolean;
    function CanDeleteEvent: Boolean;
    procedure PopulateLabelColor(AProperties: TcxImageComboBoxProperties);
    procedure PopulateShowTimeAsPanel(AProperties: TcxImageComboBoxProperties);

    property AllowDelete: Boolean read FAllowDelete write SetAllowDelete;
    property AllowHiddenEvents: Boolean read FAllowHiddenEvents write FAllowHiddenEvents;
    property AllowRecurrence: Boolean read FAllowRecurrence write SetAllowRecurrence;
    property AllowShare: Boolean read FAllowShare write FAllowShare;
    property BiasTime: TDateTime read FBiasTime write FBiasTime;
    property DeleteExceptions: Boolean read FDeleteExceptions write FDeleteExceptions;
    property DeleteSeries: Boolean read FDeleteSeries write FDeleteSeries;
    property Duration: TDateTime read FDuration write FDuration;
    property Intersection: Boolean read FIntersection write SetIntersection;
    property IsIntersectionValid: Boolean read FIsIntersectionValid write SetIsIntersectionValid;
    property IsRemindersActive: Boolean read FIsRemindersActive;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel;
    property NeedCheckLossOfExceptions: Boolean read FNeedCheckLossOfExceptions
      write FNeedCheckLossOfExceptions;
    property PatternStart: TDateTime read FPatternStart write FPatternStart;
    property PatternFinish: TDateTime read FPatternFinish write FPatternFinish;
    property RecurrenceActivate: Boolean read FRecurrenceActivate write FRecurrenceActivate;
    property RecurrenceInfo: TcxSchedulerEventRecurrenceInfo read FRecurrenceInfo;
    property ShowResources: Boolean read FShowResources write FShowResources;
    property ShowTaskComplete: Boolean read FShowTaskComplete write FShowTaskComplete;
    property OnDelete: TcxOnDeleteEventFunc read FOnDelete write FOnDelete;
    property OnApplyEventTime: TNotifyEvent read FOnApplyEventTime write FOnApplyEventTime;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
