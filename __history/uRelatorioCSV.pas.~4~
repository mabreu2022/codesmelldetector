unit uRelatorioCSV;

interface

uses
  System.Generics.Collections, uSmellTypes;

procedure SalvarRelatorioCSV(const Lista: TObjectList<TCodeSmell>; const CaminhoCompleto: string);

implementation

uses
  System.Classes, System.SysUtils;

procedure SalvarRelatorioCSV(const Lista: TObjectList<TCodeSmell>; const CaminhoCompleto: string);
var
  CSV: TStringList;
  Smell: TCodeSmell;
begin
  CSV := TStringList.Create;
  try
    CSV.Add('Arquivo;Smell;Linha;Trecho');
    for Smell in Lista do
      CSV.Add(Format('%s;%s;%d;"%s"',
        [Smell.Arquivo, Smell.Smell, Smell.Linha, StringReplace(Smell.Trecho, '"', '""', [rfReplaceAll])]));
    CSV.SaveToFile(CaminhoCompleto);
  finally
    CSV.Free;
  end;
end;

end.
