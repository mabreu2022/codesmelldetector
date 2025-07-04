// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UPrincipal_Linha109_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure FDQuery1ativoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnDesmarcarItensClick(Sender: TObject);
    procedure BtnExrpotarTabelaDeItensClick(Sender: TObject);
    procedure CBCabosClick(Sender: TObject);
    procedure ClientDataSet1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);

  private
    { Private declarations }
     ShiftClick: Boolean;
     ShiftStartRow, ShiftEndRow: Integer;
     ListaItens: TStringList;

     procedure CarregarGrid;
    procedure DesmarcarTodosItens;
    procedure ExpDOC(DataSet: TDataSet; Arq: string);
    procedure FiltrarRegistros;
    procedure CriarDataSet;
  public
    { Public declarations }
    qryFabricantes: TFDQuery;
    numero: integer;
    PartNumbers: TPartNumberInfo; //TStringList;
    procedure ExportToUTF8Text(descritivo: string; outputPath: string);
    procedure CopiarParaAreaDeTransferencia(const texto: string);
    procedure ExportSelectedRecordsToTextFiles;
    procedure SelectRows(StartRow, EndRow: Integer);
    procedure Swap(var A, B: Integer);
    procedure GerarArquivoWord;
    procedure ConcatenateWordFiles(const FilePaths: array of string; const OutputFile: string);
    function FindAllDocxFiles(const DirectoryPath: string): TArray<string>;
    function FiltrarNomeArquivo(const NomeOriginal: string): string;
    procedure GerarAruivoWordunico;
    function ExtrairNomeArquivo(const NomeOriginal: string): string;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
