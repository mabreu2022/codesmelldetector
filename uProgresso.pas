unit uProgresso;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.IOUtils, uSmellTypes;

procedure RegistrarProgresso(const Smell: TCodeSmell; const PastaRelatorios: string);
procedure RegistrarErro(const Smell: TCodeSmell; const PastaRelatorios: string);
function JaProcessado(const Smell: TCodeSmell; const PastaRelatorios: string): Boolean;

implementation

procedure RegistrarProgresso(const Smell: TCodeSmell; const PastaRelatorios: string);
var
  Lista: TJSONArray;
  Obj: TJSONObject;
  Caminho: string;
begin
  Caminho := TPath.Combine(PastaRelatorios, 'progresso.json');
  if TFile.Exists(Caminho) then
    Lista := TJSONObject.ParseJSONValue(TFile.ReadAllText(Caminho, TEncoding.UTF8)) as TJSONArray
  else
    Lista := TJSONArray.Create;

  Obj := TJSONObject.Create;
  Obj.AddPair('arquivo', Smell.Arquivo);
  Obj.AddPair('linha', TJSONNumber.Create(Smell.Linha));
  Lista.AddElement(Obj);

  TFile.WriteAllText(Caminho, Lista.ToJSON, TEncoding.UTF8);
  Lista.Free;
end;

procedure RegistrarErro(const Smell: TCodeSmell; const PastaRelatorios: string);
var
  Obj: TJSONObject;
  Caminho: string;
begin
  Caminho := TPath.Combine(PastaRelatorios, 'erro_ultimo.json');
  Obj := TJSONObject.Create;
  try
    Obj.AddPair('arquivo', Smell.Arquivo);
    Obj.AddPair('linha', TJSONNumber.Create(Smell.Linha));
    TFile.WriteAllText(Caminho, Obj.ToJSON, TEncoding.UTF8);
  finally
    Obj.Free;
  end;
end;

function JaProcessado(const Smell: TCodeSmell; const PastaRelatorios: string): Boolean;
var
  Caminho: string;
  Lista: TJSONArray;
  Item: TJSONValue;
  Arq: string;
  Linha: Integer;
begin
  Result := False;
  Caminho := TPath.Combine(PastaRelatorios, 'progresso.json');
  if not TFile.Exists(Caminho) then Exit(False);

  Lista := TJSONObject.ParseJSONValue(TFile.ReadAllText(Caminho, TEncoding.UTF8)) as TJSONArray;
  try
    for Item in Lista do
    begin
      Arq := Item.GetValue<string>('arquivo');
      Linha := Item.GetValue<Integer>('linha');
      if (Arq = Smell.Arquivo) and (Linha = Smell.Linha) then
        Exit(True);
    end;
  finally
    Lista.Free;
  end;
end;

end.