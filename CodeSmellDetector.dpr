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

// ? integra��o com IA local

var
  Dir, ExecutavelPath, PastaRelatorios: string;

begin
  try
    if ParamCount < 1 then
    begin
      Writeln('Uso: CodeSmellDetector <diret�rio do projeto Delphi>');
      Exit;
    end;

    Dir := ParamStr(1);

    if not TDirectory.Exists(Dir) then
    begin
      Writeln('Erro: diret�rio n�o encontrado: ', Dir);
      Exit;
    end;

    ExecutavelPath := TPath.GetDirectoryName(ParamStr(0));
    PastaRelatorios := TPath.Combine(ExecutavelPath, 'relatorios');

    if not TDirectory.Exists(PastaRelatorios) then
      TDirectory.CreateDirectory(PastaRelatorios);

    Writeln('?? Iniciando an�lise do projeto em: ', Dir);
    AnalisarDiretorio(Dir, PastaRelatorios);
    Writeln('? An�lise conclu�da com sucesso.');
    Writeln('?? Relat�rios e sugest�es gerados em: ', PastaRelatorios);
  except
    on E: Exception do
      Writeln('? Erro durante a execu��o: ', E.Message);
  end;
end.
