// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit1_Linha90_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TForm1.ListWMIClasses;
var
  Locator: OLEVariant;
  Services: OLEVariant;
  ClassesEnum: IEnumvariant;
  WMIClass: OLEVariant;
  PropertiesEnum: IEnumvariant;
  Prop: OLEVariant;
  Fetched: Cardinal;
  CurrClass: string;
  ScriptBuilder: TStringList;
  ClassProps: TStringList;
  i: Integer;
  FirebirdType: string;
  DatabasePath, User, Password: string;
begin
  ScriptBuilder := TStringList.Create;
  ClassProps := TStringList.Create;
  ClassProps.Sorted := True;
  ClassProps.Duplicates := dupIgnore;

  // Ajuste aqui o caminho, usuário e senha do banco Firebird desejado
  DatabasePath := 'C:\bancoWMI.fdb';
  User := 'SYSDBA';
  Password := 'masterkey';

  CoInitialize(nil);
  try
    try
      Locator := CreateOleObject('WbemScripting.SWbemLocator');
      Services := Locator.ConnectServer('.', 'root\cimv2');
      ClassesEnum := IUnknown(Services.ExecQuery('SELECT * FROM meta_class', 'WQL', 0)._NewEnum) as IEnumVariant;

      // Criação do banco de dados no script
      ScriptBuilder.Add('-- Script gerado para criação do banco Firebird e tabelas das classes WMI');
      ScriptBuilder.Add(Format('CREATE DATABASE ''%s'' USER ''%s'' PASSWORD ''%s'';', [DatabasePath, User, Password]));
      ScriptBuilder.Add('');

      while ClassesEnum.Next(1, WMIClass, Fetched) = 0 do
      begin
        CurrClass := WMIClass.Path_.Class;

        Memo1.Lines.Add('Classe: ' + CurrClass);
        Memo1.Lines.Add('  Propriedades:');

        ClassProps.Clear;

        PropertiesEnum := IUnknown(WMIClass.Properties_._NewEnum) as IEnumVariant;

        while PropertiesEnum.Next(1, Prop, Fetched) = 0 do
        begin
          FirebirdType := CIMTypeToFirebirdType(Prop.CIMType);

          ClientDataSet1.Append;
          ClientDataSet1.FieldByName('Tabela').AsString := CurrClass;
          ClientDataSet1.FieldByName('Campos').AsString := Prop.Name;
          ClientDataSet1.FieldByName('Tamanho').AsString := VarToStr(Prop.CIMType);
          ClientDataSet1.Post;

          Memo1.Lines.Add('    ' + Prop.Name + ' : ' + VarToStr(Prop.CIMType));

          ClassProps.Add(Format('  "%s" %s', [Prop.Name, FirebirdType]));

          Prop := Unassigned;
        end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
