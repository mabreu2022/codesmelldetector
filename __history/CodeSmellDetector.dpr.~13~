program CodeSmellDetector;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  System.IOUtils,
  uAnalyzer in 'uAnalyzer.pas',
  uRelatorioJSON in 'uRelatorioJSON.pas',
  uRelatorioCSV in 'uRelatorioCSV.pas',
  uRelatorioHTML in 'uRelatorioHTML.pas',
  uProjeto in 'uProjeto.pas',
  uSugestoes in 'uSugestoes.pas',
  uSmellTypes in 'uSmellTypes.pas',
  uIARefatorador in 'uIARefatorador.pas',
  Xml.omnixmldom in 'Xml.omnixmldom.pas';

// ? integração com IA local

var
  Dir, ExecutavelPath, PastaRelatorios: string;

begin
  try
    if ParamCount < 1 then
    begin
      Writeln('Uso: CodeSmellDetector <diretório do projeto Delphi>');
      Exit;
    end;

    Dir := ParamStr(1);

    if not TDirectory.Exists(Dir) then
    begin
      Writeln('Erro: diretório não encontrado: ', Dir);
      Exit;
    end;

    ExecutavelPath := TPath.GetDirectoryName(ParamStr(0));
    PastaRelatorios := TPath.Combine(ExecutavelPath, 'relatorios');

    if not TDirectory.Exists(PastaRelatorios) then
      TDirectory.CreateDirectory(PastaRelatorios);

    Writeln('?? Iniciando análise do projeto em: ', Dir);
    AnalisarDiretorio(Dir, PastaRelatorios);
    Writeln('? Análise concluída com sucesso.');
    Writeln('?? Relatórios e sugestões gerados em: ', PastaRelatorios);
  except
    on E: Exception do
      Writeln('? Erro durante a execução: ', E.Message);
  end;
end.
