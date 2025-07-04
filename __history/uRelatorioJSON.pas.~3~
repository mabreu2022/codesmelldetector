unit uRelatorioJSON;

interface

uses
  System.JSON;

procedure SalvarRelatorioJSON(const JsonArray: TJSONArray; const CaminhoCompleto: string);

implementation

uses
  System.Classes;

procedure SalvarRelatorioJSON(const JsonArray: TJSONArray; const CaminhoCompleto: string);
var
  JsonStr: TStringList;
begin
  JsonStr := TStringList.Create;
  try
    JsonStr.Text := JsonArray.ToJSON;
    JsonStr.SaveToFile(CaminhoCompleto);
  finally
    JsonStr.Free;
  end;
end;

end.
