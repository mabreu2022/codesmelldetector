// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\uModelJSON_Linha57_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class procedure TJSONModel.CarregarJSONArrayGenerico(
  const Caminho: string;
  Pagina, LinhasPorPagina: Integer;
  DataSet: TClientDataSet;
  TreeView: TTreeView;
  out Total: Integer;
  ProgressBar: TProgressBar = nil);
var
  JSONStr: string;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  Campos: TDictionary<string, TFieldType>;
  ListaCampos: TArray<string>;
  Campo: string;
  Pair: TJSONPair;
  DummyInt: Integer;
  i, j, StartIdx, EndIdx: Integer;
  Obj: TJSONObject;
  Fld: TField;
  Objeto: TJSONObject;
  RootNode, Sub: TTreeNode;
begin
  JSONStr := TFile.ReadAllText(Caminho, TEncoding.UTF8);
  JSONStr := CorrigirJSONSimples(JSONStr);
  JSONValue := TJSONObject.ParseJSONValue(JSONStr);

  if not Assigned(JSONValue) then
    raise Exception.Create('Conteúdo JSON inválido.');

  if JSONValue is TJSONArray then
    JSONArray := TJSONArray(JSONValue)
  else if JSONValue is TJSONObject then
  begin
    JSONArray := TJSONArray.Create;
    JSONArray.AddElement(JSONValue); // transfere a posse
  end
  else
    raise Exception.Create('JSON não é um array ou objeto.');

  Total := JSONArray.Count;
  if Total = 0 then Exit;

  Campos := TDictionary<string, TFieldType>.Create;
  try
    for i := 0 to JSONArray.Count - 1 do
    begin
      if JSONArray.Items[i] is TJSONObject then
      begin
        Obj := JSONArray.Items[i] as TJSONObject;
        for j := 0 to Obj.Count - 1 do
        begin
          Pair := Obj.Pairs[j];
          Campo := Pair.JsonString.Value;
          if not Campos.ContainsKey(Campo) then
          begin
            if TryStrToInt(Pair.JsonValue.Value, DummyInt) then
              Campos.Add(Campo, ftInteger)
            else if SameText(Pair.JsonValue.Value, 'true') or SameText(Pair.JsonValue.Value, 'false') then
              Campos.Add(Campo, ftBoolean)
            else
              Campos.Add(Campo, ftString);
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
