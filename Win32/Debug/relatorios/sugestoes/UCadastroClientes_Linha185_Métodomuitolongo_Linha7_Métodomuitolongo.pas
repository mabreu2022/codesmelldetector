// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UCadastroClientes_Linha185_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure CBAtivoExit(Sender: TObject);
    procedure EdtNumeroKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EdtCnpjKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EdtCepKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure TabItemPesquisaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCnpjExit(Sender: TObject);
  private
    { Private declarations }
    FConexao: TFDConnection;
    FCliente: TClientes;
    FContato: TContato;
    PodeGravar: Boolean;
    FUFCliente: string;
    FAtivoCliente: string;
    qry: TFDQuery;
    RegrasDeNegocios: TModelCliente;
    FModelContato: TModelContato;
    FTipo: String;
    FController: TControllerCliente;
    CDS: TClientDataSet;
    FLinguagem: string;
    CurrentDateTime: TDateTime; //Para uso com o Log
    DateTimeStr: string;        //Para uso com o Log
    FGravarLog: Boolean;        //Para uso com o Log
    FHabilitarLogsSistema: string;
    FNextIDContato: Integer;
    FGravacaoSucesso: Boolean;
    procedure DesabilitaBotoes(const BotaoSet:TBotaoSet);
    Procedure PopularGridClientes;
    procedure PreencheDadosEncontradosDoCliente;
    procedure PopularDataSet;
    procedure CarregarConfiguracao;
    procedure PopularContatos;
    function LerSalvarLogsBancoDeDados: Boolean;
    function GravarLogsBancoDeDados: Boolean;
  public
    { Public declarations }
    DataSet: TClientDataSet;
    FSomenteAtivos: string;
    FSemContatos  : string;
    FBtnUltimo    : string;
    Function CriarDataSet(aDadaSet: TClientDataSet): TClientDataSet;
    procedure OnDataSetChange;
    procedure PopularClientes;
    procedure CarregarCores;
    procedure CarregarLinguagem;
    function ProximoIDContato: integer;


  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
