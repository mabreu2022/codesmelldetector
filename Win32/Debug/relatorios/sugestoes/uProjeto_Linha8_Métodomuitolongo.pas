// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\uProjeto.pas
// Linha: 8

// Trecho original:
// ------------------
function ObterArquivosDoProjeto(const ProjetoPath: string): TArray<string>;

implementation

uses
  System.IOUtils, Xml.XMLDoc, Xml.XMLIntf;

function ObterArquivosDoProjeto(const ProjetoPath: string): TArray<string>;
var
  DprojFile: string;
  ArquivosDproj: TArray<string>;
  XML: IXMLDocument;
  Root, ItemGroup, Ref: IXMLNode;
  Lista: TList<string>;
  BaseDir, FilePath: string;
  PastasIgnoradas: TArray<string>;
  Ignorar: Boolean;
  Pasta: string;
  i, j: Integer;
begin
  Lista := TList<string>.Create;
  try
    // Localiza o primeiro .dproj no diretório
    ArquivosDproj := TDirectory.GetFiles(ProjetoPath, '*.dproj');
    if Length(ArquivosDproj) = 0 then
      raise Exception.Create('Arquivo .dproj não encontrado no diretório.');

    DprojFile := ArquivosDproj[0];

    XML := TXMLDocument.Create(nil);
    XML.LoadFromFile(DprojFile);
    XML.Active := True;

    BaseDir := ExtractFilePath(DprojFile);
    PastasIgnoradas := ['\lib\', '\thirdparty\', '\vendor\', '\external\', '\packages\'];

    Root := XML.DocumentElement;

    for i := 0 to Root.ChildNodes.Count - 1 do
    begin
      ItemGroup := Root.ChildNodes[i];
      if SameText(ItemGroup.NodeName, 'ItemGroup') then
      begin
        for j := 0 to ItemGroup.ChildNodes.Count - 1 do
        begin
          Ref := ItemGroup.ChildNodes[j];
          if SameText(Ref.NodeName, 'DCCReference') then
          begin
            if Ref.HasAttribute('Include') then
            begin
              FilePath := TPath.Combine(BaseDir, Ref.Attributes['Include']);
              FilePath := TPath.GetFullPath(FilePath);

              Ignorar := False;
              for Pasta in PastasIgnoradas do
                if FilePath.ToLower.Contains(Pasta) then
                begin
                  Ignorar := True;
                  Break;
                end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
