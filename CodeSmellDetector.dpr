program CodeSmellDetector;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  System.IOUtils,
  Windows,
  uAnalyzer in 'uAnalyzer.pas',
  uRelatorioJSON in 'uRelatorioJSON.pas',
  uRelatorioCSV in 'uRelatorioCSV.pas',
  uRelatorioHTML in 'uRelatorioHTML.pas',
  uProjeto in 'uProjeto.pas',
  uSugestoes in 'uSugestoes.pas',
  uSmellTypes in 'uSmellTypes.pas',
  uIARefatorador in 'uIARefatorador.pas',
  uConversorUTF8 in 'uConversorUTF8.pas',
  uLogger in 'uLogger.pas',
  uBackup in 'uBackup.pas',
  Xml.omnixmldom in 'Xml.omnixmldom.pas',
  uProgresso in 'uProgresso.pas';

function CopiarProjetoParaTemp(const Origem: string): string;
var
  Destino: string;
begin
  Destino := TPath.Combine(TPath.GetTempPath,
    'CodeSmellTemp_' + TPath.GetFileName(Origem) + '_' + FormatDateTime('yyyymmdd_hhnnss', Now));

  try
    TDirectory.Copy(Origem, Destino, True);
    Log('📁 Projeto copiado para pasta temporária: ' + Destino);
    Result := Destino;
  except
    on E: Exception do
    begin
      LogErro('Erro ao copiar projeto para pasta temporária: ' + E.Message);
      Halt(1);
    end;
  end;
end;

var
  DirOriginal, Dir, ExecutavelPath, PastaRelatorios, CaminhoLog: string;
  Silencioso: Boolean;

begin
  try
    if (ParamCount >= 2) and SameText(ParamStr(1), '--reverter') then
    begin
      ReverterBackup(ParamStr(2));
      Exit;
    end;

    Silencioso := False;
    for var i := 1 to ParamCount do
      if SameText(ParamStr(i), '--silencioso') then
        Silencioso := True;

    if ParamCount < 1 then
    begin
      Writeln('Uso: CodeSmellDetector <diretorio do projeto Delphi> [--silencioso]');
      Writeln('     CodeSmellDetector --reverter <diretorio do projeto Delphi>');
      Exit;
    end;

    DirOriginal := ParamStr(1);
    if not TDirectory.Exists(DirOriginal) then
    begin
      Writeln('Diretório não encontrado: ' + DirOriginal);
      Exit;
    end;

    ExecutavelPath := TPath.GetDirectoryName(ParamStr(0));
    PastaRelatorios := TPath.Combine(ExecutavelPath, 'relatorios');
    CaminhoLog := TPath.Combine(ExecutavelPath, 'analisador.log');

    InicializarLogger(CaminhoLog, Silencioso);

    Dir := CopiarProjetoParaTemp(DirOriginal);

    if not TDirectory.Exists(PastaRelatorios) then
      TDirectory.CreateDirectory(PastaRelatorios);

    Log('🔧 Convertendo arquivos para UTF-8...');
    ConverterArquivosParaUTF8(Dir, True);

    Log('🔍 Iniciando análise do projeto em: ' + Dir);
    AnalisarDiretorio(Dir, PastaRelatorios);
    Log('✅ Análise concluída com sucesso.');
    Log('📁 Relatórios e sugestões gerados em: ' + PastaRelatorios);
  except
    on E: Exception do
    begin
      LogErro('Erro durante a execução: ' + E.ClassName + ' - ' + E.Message);
      Log(E.StackTrace);
    end;
  end;
end.
