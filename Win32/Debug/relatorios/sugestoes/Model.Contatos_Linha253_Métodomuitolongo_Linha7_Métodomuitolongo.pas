// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Contatos_Linha253_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelContato.SalvarContato(aContato: TContato; aCliente: TClientes): Boolean;
var
  qry        : TFDQuery;
  Ativo      : string;
  UF         : string;
  LogManager : TLogManager;
begin
  Result:= False;

  qry:=TFDQuery.Create(nil);
  qry.Connection := TConnection.CreateConnection;
  qry.Connection.StartTransaction;
  try
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO     ' +
                  'idcontatos,     ' +
                  'idcliente,      ' +
                  'telefone,       ' +
                  'celular,        ' +
                  'email,          ' +
                  'datacadastro    ' +
                  'dataalteracao,  ' +
                  'cnpjrevenda,    ' +
                  'ativo,          ' +
                  'nomecontato)    ' +
                  'VALUES(         ' +
                  ':idcontatos,    ' +
                  ':idcliente,     ' +
                  ':telefone,      ' +
                  ':celular,       ' +
                  ':email,         ' +
                  ':datacadastro   ' +
                  ':dataalteracao, ' +
                  ':cnpjrevenda,   ' +
                  ':ativo,         ' +
                  ':nomecontato)   ');

     qry.ParamByName('idcontatos').DataType      := ftInteger;
     qry.ParamByName('idcliente').DataType       := ftInteger;
     qry.ParamByName('idcliente').AsInteger      := aCliente.idcliente;
     qry.ParamByName('telefone').DataType        := ftString;
     qry.ParamByName('telefone').AsString        := aContato.telefone;
     qry.ParamByName('celular').DataType         := ftString;
     qry.ParamByName('celular').AsString         := aContato.celular;
     qry.ParamByName('email').DataType           := ftString;
     qry.ParamByName('email').AsString           := aContato.email;
     qry.ParamByName('datacadastro').DataType    := ftDateTime;
     qry.ParamByName('datacadastro').AsDateTime  := Now;
     qry.ParamByName('dataalteracao').DataType   := ftDateTime;
     qry.ParamByName('dataalteracao').AsDateTime := Now;
     qry.ParamByName('cnpjrevenda').DataType     := ftString;
     qry.ParamByName('cnpjrevenda').AsString     := aContato.cnpjrevenda;
     qry.ParamByName('ativo').DataType           := ftString;

     qry.ParamByName('ativo').DataType           := ftString;
     if Length(aContato.ativo) > 0 then
       Ativo := Copy(aContato.ativo, 1, 1)
     else
       Ativo := '';

     qry.ParamByName('ativo').AsString           := Ativo;

     qry.ParamByName('ativo').AsString           := aContato.ativo;

     qry.ParamByName('nomecontato').DataType     := ftString;
     qry.ParamByName('nomecontato').AsString     := aContato.NomeContato;

     qry.ExecSQL;
     qry.Connection.Commit;

     Result:=True;

  Except
    on E: Exception do
    begin
      Result:= False;
      qry.Connection.Rollback;
      ShowMessage('Houve um erro ao gravar os dados do contato' + E.Message);
      qry.Close;
      qry.Free;

      if True then

      LogManager := TLogManager.Create;
      try
        LogManager.SaveLogToFile('Log_Model_Contatos.txt');
        LogManager.AddLog('Saiu na Model.Contatos - SalvarContato: Linha 320: e deu erro ao gravar o contato.');
      finally
        LogManager.Free;
      end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
