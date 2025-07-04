// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\cxSchedulerEventEditor_Linha393_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
    procedure OnChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cbAllDayEventPropertiesChange(Sender: TObject);
    procedure StartDateChanged(Sender: TObject);
    procedure cbReminderClick(Sender: TObject);
    procedure cbReminderMinutesBeforeStartPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cbReminderMinutesBeforeStartPropertiesPopup(Sender: TObject);
    procedure OnEventTimeChanged(Sender: TObject);
    procedure btnRecurrenceClick(Sender: TObject);
    procedure OnResourceIDChanged(Sender: TObject);
    procedure btnFindTimeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure seTaskCompleteChange(Sender: TObject);
    procedure cbxTaskStatusChange(Sender: TObject);
    procedure cbResourcesPropertiesClickCheck(Sender: TObject;
      ItemIndex: Integer; var AllowToggle: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    FRecurrenceInfoHeight: Integer;
    procedure DoApplyEventTime(Sender: TObject);
    function GetAllowHiddenEvents: Boolean;
    function GetDeleteExceptions: Boolean;
    function GetEventName: string;
    function GetForceSeries: Boolean;
    function GetHelper: TcxSchedulerEventStandardEditorFormHelper;
    procedure SetAllowHiddenEvents(AValue: Boolean);
    procedure SetDeleteExceptions(AValue: Boolean);
    procedure SetForceSeries(AValue: Boolean);
  protected
    procedure ApplyEventTime;
    procedure CheckControlStates; virtual;
    function CheckTimeRange(var AStart, AFinish: TDateTime): Boolean; virtual;
    procedure CheckVisible; virtual;
    procedure ClearModifiedFlag; override;
    procedure DoHelperChanged; override;
    function DoHelperIsValid: Boolean; override;
    procedure DoHelperSaveChanges; override;
    function FindAvailableTime: Boolean; virtual;
    procedure GetEditingEventTime(var AStart, AFinish: TDateTime; var AState: Integer); virtual;
    function GetFormColor: TColor; override;
    function GetHelperClass: TcxSchedulerEditorHelperClass; override;
    function GetRecurrenceDescription: string; virtual;
    function GetResourcesPanelVisible: Boolean; virtual;
    procedure Initialize(AEventInfo: TcxSchedulerEventEditInfo;
      AEditingInfo: TcxSchedulerEditingEventInfo); override;
    procedure InitializeControls; override;
    procedure InitializeHelper(AEvent: TcxSchedulerControlEvent); override;
    procedure InitializeTimeControls(const AStart, AFinish: TDateTime; AllDayEvent: Boolean); virtual;
    procedure InitLabelColor;
    procedure InitReminderPanel;
    procedure InitResources;
    procedure InitShowTimeAsPanel;
    procedure InitTaskCompletePanel;
    function IsValid: Boolean; virtual;
    procedure LoadEventValuesIntoControls; override;
    procedure RefreshRecurrenceInfo; virtual;
    procedure SaveResourceID; virtual;
    procedure SetActiveControl; virtual;
    procedure SetCaptions; virtual;
    procedure SetReminderMinutesBeforeStart; virtual;

    property DeleteExceptions: Boolean read GetDeleteExceptions write SetDeleteExceptions;
    property Helper: TcxSchedulerEventStandardEditorFormHelper read GetHelper;
  public
    property AllowHiddenEvents: Boolean read GetAllowHiddenEvents write SetAllowHiddenEvents;
    property EventName: string read GetEventName;
    property ForceSeries: Boolean read GetForceSeries write SetForceSeries;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
