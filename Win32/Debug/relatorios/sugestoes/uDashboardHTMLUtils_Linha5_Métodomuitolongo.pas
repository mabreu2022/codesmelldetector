// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Analisador\Utils\uDashboardHTMLUtils.pas
// Linha: 5

// Trecho original:
// ------------------
procedure GerarGraficoHTMLEmbed;

implementation

uses
  System.SysUtils, System.Classes;

procedure GerarGraficoHTMLEmbed;
var
  SL, SLJson: TStringList;
  PastaGraficos, CaminhoHTML, LinhaJSON: string;
  Ferramentas: TArray<string>;
  i: Integer;
  NomeJson, IDCanvas: string;
begin
  SetLength(Ferramentas, 5);
  Ferramentas[0] := 'queryanalizer';
  Ferramentas[1] := 'solidchcker';
  Ferramentas[2] := 'scanneracoplamento';
  Ferramentas[3] := 'analisadorhints';
  Ferramentas[4] := 'verificadorcodigomorto';

  PastaGraficos := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'graficos\';
  CaminhoHTML := PastaGraficos + 'grafico.html';

  SL := TStringList.Create;
  try
    SL.Add('<!DOCTYPE html>');
    SL.Add('<html><head>');
    SL.Add('<meta charset="UTF-8">');
    SL.Add('<title>Dashboard</title>');
    SL.Add('<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>');
    SL.Add('<style>');
    SL.Add('body { font-family: Arial; margin: 40px; background: #f4f4f4; }');
    SL.Add('.grid { display: grid; grid-template-columns: 1fr 1fr; gap: 40px; }');
    SL.Add('.grafico { background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }');
    SL.Add('canvas { width: 100%; height: 300px !important; }');
    SL.Add('</style></head><body>');
    SL.Add('<h1>?? Painel Integrado</h1>');
    SL.Add('<div class="grid">');

    for i := 0 to High(Ferramentas) do
    begin
      NomeJson := PastaGraficos + Ferramentas[i] + '.json';
      if FileExists(NomeJson) then
      begin
        SLJson := TStringList.Create;
        try
          SLJson.LoadFromFile(NomeJson, TEncoding.UTF8);
          LinhaJSON := SLJson.Text.Replace(#13#10, '').Replace('"', '\"');
          IDCanvas := 'canvas' + IntToStr(i+1);

          SL.Add('<div class="grafico">');
          SL.Add('<h3>' + Ferramentas[i] + '</h3>');
          SL.Add('<canvas id="' + IDCanvas + '"></canvas>');
          SL.Add('<script>');
          SL.Add('var data = JSON.parse("' + LinhaJSON + '");');
          SL.Add('new Chart(document.getElementById("' + IDCanvas + '"), { type: "line", data: data, options: { responsive: true, plugins: { legend: { position: "bottom" } } } });');
          SL.Add('</script>');
          SL.Add('</div>');
        finally
          SLJson.Free;
        end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
