unit uRelatorioHTML;

interface

uses
  System.Generics.Collections, uSmellTypes;

procedure SalvarRelatorioHTML(const Lista: TObjectList<TCodeSmell>; const CaminhoCompleto: string);

implementation

uses
  System.Classes, System.SysUtils;

function EscaparHTML(const Texto: string): string;
begin
  Result := StringReplace(Texto, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
end;

procedure SalvarRelatorioHTML(const Lista: TObjectList<TCodeSmell>; const CaminhoCompleto: string);
var
  HTML: TStringList;
  Smell: TCodeSmell;
begin
  HTML := TStringList.Create;
  try
    HTML.Add('<!DOCTYPE html>');
    HTML.Add('<html><head><meta charset="utf-8"><title>Relatório de Code Smells</title>');
    HTML.Add('<style>');
    HTML.Add('body { font-family: Arial, sans-serif; margin: 20px; }');
    HTML.Add('table { border-collapse: collapse; width: 100%; }');
    HTML.Add('th, td { border: 1px solid #ccc; padding: 8px; text-align: left; vertical-align: top; }');
    HTML.Add('th { background-color: #f0f0f0; }');
    HTML.Add('pre { background-color: #f9f9f9; padding: 8px; border: 1px solid #ddd; overflow-x: auto; }');
    HTML.Add('</style>');
    HTML.Add('</head><body>');
    HTML.Add('<h2>Relatório de Code Smells</h2>');
    HTML.Add('<table>');
    HTML.Add('<tr><th>Arquivo</th><th>Smell</th><th>Linha</th><th>Trecho</th></tr>');

    for Smell in Lista do
    begin
      HTML.Add('<tr>');
      HTML.Add('<td>' + EscaparHTML(Smell.Arquivo) + '</td>');
      HTML.Add('<td>' + EscaparHTML(Smell.Smell) + '</td>');
      HTML.Add('<td>' + IntToStr(Smell.Linha) + '</td>');
      HTML.Add('<td><pre>' + EscaparHTML(Smell.Trecho) + '</pre></td>');
      HTML.Add('</tr>');
    end;

    HTML.Add('</table>');
    HTML.Add('</body></html>');

    HTML.SaveToFile(CaminhoCompleto);
  finally
    HTML.Free;
  end;
end;

end.
