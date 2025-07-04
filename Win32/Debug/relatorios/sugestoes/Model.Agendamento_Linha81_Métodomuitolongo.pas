// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Cargas\cargas\Model\Model.Agendamento.pas
// Linha: 81

// Trecho original:
// ------------------
      procedure SetAllDayEvent(const Value: Boolean);
      procedure SetEmail(const Value: string);
      procedure SetEndTime(const Value: TDateTime);
      procedure SetLabel01(const Value: string);
      procedure SetLocais(const Value: string);
      procedure SetLocation(const Value: string);
      procedure SetMenssagem(const Value: string);
      procedure SetNF(const Value: Integer);
      procedure SetOption(const Value: Integer);
      procedure SetParentID(const Value: Integer);
      procedure SetPlaca(const Value: string);
      procedure SetRecurrenceIndex(const Value: Integer);
      procedure SetRecurrenceInfo(const Value: TBlob);
      procedure SetReminderDate(const Value: TDateTime);
      procedure SetReminderMinutesBeforeStart(const Value: Integer);
      procedure SetRemindResourceData(const Value: TDateTime);
      procedure SetResourceID(const Value: Integer);
      procedure SetStart(const Value: TDateTime);
      procedure SetStarTime(const Value: TDateTime);
      procedure SetState(const Value: Integer);
      procedure Setsubject(const Value: string);
      procedure SetTaskCompleteField(const Value: Integer);
      procedure SetTaskIndexField(const Value: Integer);
      procedure SetTaskLinksField(const Value: TBlob);
      procedure SetTaskStatusField(const Value: Integer);
      procedure SetTelefone(const Value: string);
      procedure SetObs(const Value: string);
      procedure SetHora(const Value: TTime);


    public
      //Campos originais da tabela
      property subject  : string read Fsubject write Setsubject;
      property Menssagem: string read FMenssagem write SetMenssagem;
      property Option: Integer read FOption write SetOption;
      property ParentID: Integer read FParentID write SetParentID;
      property RecurrenceIndex: Integer read FRecurrenceIndex write SetRecurrenceIndex;
      property RecurrenceInfo: TBlob read FRecurrenceInfo write SetRecurrenceInfo;
      property ReminderDate: TDateTime read FReminderDate write SetReminderDate;
      property ReminderMinutesBeforeStart: Integer read FReminderMinutesBeforeStart write SetReminderMinutesBeforeStart;
      property RemindResourceData: TDateTime read FRemindResourceData write SetRemindResourceData;
      property ResourceID: Integer read FResourceID write SetResourceID;
      property Start: TDateTime read FStart write SetStart;
      property State: Integer read FState write SetState;
      property TaskCompleteField: Integer read FTaskCompleteField write SetTaskCompleteField;
      property TaskIndexField: Integer read FTaskIndexField write SetTaskIndexField;
      property TaskLinksField: TBlob read FTaskLinksField write SetTaskLinksField;
      property TaskStatusField: Integer read FTaskStatusField write SetTaskStatusField;
      property Placa: string read FPlaca write SetPlaca;

      property Location : string read FLocation write SetLocation;
      //da tela de agendamento
      property Label01  : string read FLabel01 write SetLabel01;
      property StarTime : TDateTime read FStarTime write SetStarTime;
      property EndTime  : TDateTime read FEndTime write SetEndTime;
      property AllDayEvent : Boolean read FAllDayEvent write SetAllDayEvent;

      //Campo criados
      property Locais: string read FLocais write SetLocais;
      property NF: Integer read FNF write SetNF;
      property Telefone: string read FTelefone write SetTelefone;
      property Email: string read FEmail write SetEmail;
      property Obs: string read FObs write SetObs;
      property Hora: TTime read FHora write SetHora;

      class function enviarEmail2(aSubject: string;aPlaca: String;aNF: Integer;aLocais: string;aTelefone: string;aEmail:string; aData: TDateTime; aHora: string; aObs:String): Boolean;
      class function EnviarEmail(const AAssunto, ADestino, AAnexo: String; ACorpo: String): Boolean;

      procedure EditarEmailEnviado;

      constructor create;
      destructor destroy;override;

  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
