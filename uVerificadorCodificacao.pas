ï»¿Ã¯Â»Â¿ÃƒÂ¯Ã‚Â»Ã‚Â¿ÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¿unit uVerificadorCodificacao;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils;

procedure VerificarCodificacaoArquivos(const Diretorio: string);

implementation

function EhUTF8SemBOM(const FileName: string): Boolean;
var
  Bytes: TBytes;
  Texto: string;
begin
  Bytes := TFile.ReadAllBytes(FileName);
  // Verifica se comeÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§a com BOM (EF BB BF)
  if (Length(Bytes) >= 3) and (Bytes[0] = $EF) and (Bytes[1] = $BB) and (Bytes[2] = $BF) then
    Exit(False); // Tem BOM

  try
    Texto := TEncoding.UTF8.GetString(Bytes);
    Result := True;
  except
    Result := False;
  end;
end;

function EhUTF8ComBOM(const FileName: string): Boolean;
var
  Bytes: TBytes;
begin
  Bytes := TFile.ReadAllBytes(FileName);
  Result := (Length(Bytes) >= 3) and (Bytes[0] = $EF) and (Bytes[1] = $BB) and (Bytes[2] = $BF);
end;

procedure VerificarCodificacaoArquivos(const Diretorio: string);
var
  Arquivos: TArray<string>;
  Arq: string;
begin
  Arquivos := TDirectory.GetFiles(Diretorio, '*.pas', TSearchOption.soAllDirectories);

  for Arq in Arquivos do
  begin
    if EhUTF8SemBOM(Arq) then
      Writeln('ÃƒÆ’Ã‚Â¢Ãƒâ€¦Ã¢â‚¬Å“ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦ UTF-8 sem BOM: ' + Arq)
    else if EhUTF8ComBOM(Arq) then
      Writeln('ÃƒÆ’Ã‚Â¢Ãƒâ€¦Ã‚Â¡Ãƒâ€šÃ‚Â ÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â UTF-8 com BOM: ' + Arq)
    else
      Writeln('ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚ÂÃƒâ€¦Ã¢â‚¬â„¢ NÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢O ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â© UTF-8: ' + Arq);
  end;
end;

end.
