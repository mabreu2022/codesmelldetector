unit uBackup;

interface

procedure FazerBackup(const ArquivoOriginal, PastaRaiz: string);
procedure ReverterBackup(const PastaRaiz: string);

implementation

uses
  System.SysUtils, System.IOUtils;

function GetRelativePath(const BasePath, TargetPath: string): string;
var
  Base, Target: string;
begin
  Base := IncludeTrailingPathDelimiter(TPath.GetFullPath(BasePath));
  Target := TPath.GetFullPath(TargetPath);

  if Pos(Base, Target) = 1 then
    Result := Copy(Target, Length(Base) + 1, MaxInt)
  else
    Result := ExtractFileName(Target); // fallback: só o nome do arquivo
end;

procedure FazerBackup(const ArquivoOriginal, PastaRaiz: string);
var
  Relativo, Destino: string;
begin
  Relativo := GetRelativePath(PastaRaiz, ArquivoOriginal);
  Destino := TPath.Combine(PastaRaiz, '.backup_CodeSmell\' + Relativo);
  TDirectory.CreateDirectory(TPath.GetDirectoryName(Destino));
  if not TFile.Exists(Destino) then
    TFile.Copy(ArquivoOriginal, Destino, True);
end;

procedure ReverterBackup(const PastaRaiz: string);
var
  BackupRoot, ArquivoBackup, ArquivoOriginal: string;
  Arquivos: TArray<string>;
begin
  BackupRoot := TPath.Combine(PastaRaiz, '.backup_CodeSmell');
  if not TDirectory.Exists(BackupRoot) then
  begin
    Writeln('Nenhum backup encontrado para reverter.');
    Exit;
  end;

  Arquivos := TDirectory.GetFiles(BackupRoot, '*.*', TSearchOption.soAllDirectories);
  for ArquivoBackup in Arquivos do
  begin
    ArquivoOriginal := TPath.Combine(PastaRaiz, GetRelativePath(BackupRoot, ArquivoBackup));
    TFile.Copy(ArquivoBackup, ArquivoOriginal, True);
    Writeln('Restaurado: ' + ArquivoOriginal);
  end;

  Writeln('✅ Reversão concluída.');
end;

end.
