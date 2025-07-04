// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\analisdordehints\UGeradorRelatorio.pas
// Linha: 14

// Trecho original:
// ------------------
procedure GerarRelatorioUnico(const Relatorios: TList<TRelatorioProjeto>; const DestinoRelatorio: string);
procedure ExportarCSV(const Relatorios: TList<TRelatorioProjeto>; const DestinoRelatorio: string);

implementation


procedure GerarRelatorioUnico(const Relatorios: TList<TRelatorioProjeto>; const DestinoRelatorio: string);
var
  HTML: TStringList;
  Relatorio: TRelatorioProjeto;
  Linha, HTMLFile, Codigo, Msg: string;
  Match: TMatch;
  Sugestao: TSugestaoIA;
begin
  if DestinoRelatorio <> '' then
    HTMLFile := TPath.Combine(DestinoRelatorio, 'RelatorioCompleto.html')
  else
    HTMLFile := 'RelatorioCompleto.html';

  HTML := TStringList.Create;
  try
    HTML.Add('<html><head><meta charset="utf-8"><style>');
    HTML.Add('body{font-family:Arial;} h2{color:#003366;} h3{color:#333;} ul{margin-left:20px;}');
    HTML.Add('li{margin-bottom:8px;} .hint{color:green;} .warning{color:orange;}');
    HTML.Add('</style></head><body>');
    HTML.Add('<h1>Relatório Consolidado de Hints e Warnings</h1>');

    for Relatorio in Relatorios do
    begin
      HTML.Add('<hr><h2>' + Relatorio.NomeProjeto + '</h2>');

      if Relatorio.Hints.Count > 0 then
      begin
        HTML.Add('<h3>Hints</h3><ul>');
        for Linha in Relatorio.Hints do
        begin
          HTML.Add('<li class="hint">' + Linha);

          Match := TRegEx.Match(Linha, '^.+\(\d+\):\s+\[([HW]\d{4})\]\s+(.*)$');
          if Match.Success then
          begin
            Codigo := Match.Groups[1].Value;
            Msg := Match.Groups[2].Value;

            if USugestoesCache.ObterCache.TryGetValue(Codigo, Sugestao) then
            begin
              if Sugestao.Origem = osDocWiki then
                HTML.Add('<br><i>?? <a href="' +
                         Sugestao.Solucao.Replace('Consulte a documentação oficial: ', '') +
                         '">Ver documentação oficial</a></i>')
              else
                HTML.Add('<br><i>? Nenhuma sugestão encontrada</i>');
            end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
