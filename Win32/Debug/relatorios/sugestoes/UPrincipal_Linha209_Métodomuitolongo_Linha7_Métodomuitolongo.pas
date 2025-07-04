// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UPrincipal_Linha209_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
    procedure Circle1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Circle1Click(Sender: TObject);
    procedure Circle1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Circle1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Layout1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Image4Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Circle1DblClick(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
    procedure MenuItemFabricantesCategoriasClick(Sender: TObject);
    procedure NewImagemDbClick(Sender: TObject);
    procedure NewImagemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure NewImagemGesture(Sender: TObject;
              const EventInfo: TGestureEventInfo;
              var Handled: Boolean);
    procedure NewImagemMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormShow(Sender: TObject);
    procedure BtnCarregarFotoClick(Sender: TObject);
    procedure MenuItemConfiguracoesSistemaClick(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure BtnCopiarFotoClick(Sender: TObject);
    procedure Image4MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
    procedure TrackBar1Change(Sender: TObject);
    procedure CBMarcasChange(Sender: TObject);
    procedure CBModeloChange(Sender: TObject);
    procedure CBFabricantesChange(Sender: TObject);
    procedure CBCategoriasChange(Sender: TObject);
    procedure CBLinhasChange(Sender: TObject);
    procedure CBProdutosChange(Sender: TObject);
    procedure BtnCopiarRodaClick(Sender: TObject);
    procedure MenuItemClientesDadosClick(Sender: TObject);
    procedure MenuItemClientesVeiculosClick(Sender: TObject);
    procedure MenuItemFabricantesDadosClick(Sender: TObject);
    procedure MenuItemClientesOrcamentosClick(Sender: TObject);
    procedure MenuItemRegistrarClick(Sender: TObject);
    procedure BtnCarregarRodaCalotaClick(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure LogOffExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MediaReceiverProfileResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure MediaReceiverManagerRequestManagerPassword(const Sender: TObject;
      const ARemoteIdentifier: string; var Password: string);
    procedure MenuItemFabricanteProdutosClick(Sender: TObject);
    procedure MenuItemFabricantesDeVeiculosClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure ImageLogoClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItemBackupClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);


  private
    { Private declarations }
    MoveObjeto: Boolean;
    OffSet: TPointF;
    NewCircle: TCircle;
    NewImagem: TImage;
    FIdMarcaSelecionada: integer;
    FIdFabricante: integer;
    FIdCategoria: integer;
    FidLinha: integer;
    FMemoryStream: TMemoryStream;
    FBlobStream: TStream;
    FIdProduto: integer;
    FValorTotalOrcamento: Double;
    ProdutoDS: TDataSet;
    qry: TFDQuery;
    FConexao: TFDConnection;
    CurrentDateTime: TDateTime; //Para uso com o Log
    DateTimeStr: string;        //Para uso com o Log
    FArquivoLogo: String; //Nome do Arquivo da Logo a Ser carregado

    procedure Modo_Edicao(editar: Boolean);
    procedure Modo_Edicao2(editar: Boolean);
    procedure NewImagemMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
    procedure SetidUsuario(const Value: Integer);
    procedure SaveBitmapToFile(Bitmap: TBitmap; const FileName: string);
    procedure EnviarImagemWhatsApp(const FileName: string);
    procedure EnviarAnexoWhatsApp(const FileName: string);
    function ImageToBase64(const FileName: string): string;
    function DesabilitaEdtWhatsApp:Boolean;

    function CapturaTela:TBitMap;

  public
    { Public declarations }
     FidUsuario: Integer;
     FLinguagem: string;
     property idUsuario: Integer read FidUsuario write SetidUsuario;
     procedure CarregarCores;
     procedure CarregarLinguagem;
     procedure CarregarLogo;
     constructor create;
     destructor destroy;override;

  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
