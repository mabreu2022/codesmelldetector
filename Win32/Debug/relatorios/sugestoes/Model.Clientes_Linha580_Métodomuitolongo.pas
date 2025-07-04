// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Clientes.pas
// Linha: 580

// Trecho original:
// ------------------
class function TModelCliente.SalvarCliente(aCliente: TClientes): Boolean;
var
  qry             : TFDQuery;
  Ativo           : string;
  UF              : string;
  LogManager      : TLogManager;
  CurrentDateTime : TDateTime;
  DateTimeStr     : string;
begin
  Result:= False;

  qry:=TFDQuery.Create(nil);
  qry.Connection := TConnection.CreateConnection;
  qry.Connection.StartTransaction;
  try

    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO '  +
                ' fulanorodas.Clientes ' +
                '(idclientes,          ' +   //1
                'razao,                ' +   //2
                'cnpj_cpf,             ' +   //3
                'endereco,             ' +   //4
                'numero,               ' +   //5
                'complemento,          ' +   //6
                'cep,                  ' +   //7
                'cidade,               ' +   //8
                'bairro,               ' +   //9
                'ativo,                ' +   //10
                'uf,                   ' +   //11
                'datacadastro,         ' +   //12
                'dataalteracao,        ' +   //13
               // 'dataexclusao,       ' +   //14
                'idmodelocarro         ' +   //15
                ')                     ' +
                'VALUES (              ' +
                ':idclientes,          ' +   //1 ok
                ':razao,               ' +   //2 ok
                ':cnpj_cpf,            ' +   //3 ok
                ':endereco,            ' +   //4 ok
                ':numero,              ' +   //5 ok
                ':complemento,         ' +   //6 ok
                ':cep,                 ' +   //7 ok
                ':cidade,              ' +   //8 ok
                ':bairro,              ' +   //9 ok
                ':ativo,               ' +   //10 ok
                ':uf,                  ' +   //11 ok
                ':datacadastro,        ' +   //12 ok
                ':dataalteracao,       ' +   //13 ok
              //  ':dataexclusao,        ' + //14 ok
                ':idmodelocarro        ' +   //15 ok
                ')                     ');

     qry.ParamByName('idclientes').DataType    := ftInteger;            //1

     qry.ParamByName('razao').DataType         := ftString;
     qry.ParamByName('razao').AsString         := aCliente.razaosocial; //2
     qry.ParamByName('cnpj_cpf').DataType      := ftString;
     qry.ParamByName('cnpj_cpf').AsString      := aCliente.cnpj ;       //3
     qry.ParamByName('endereco').DataType      := ftString;
     qry.ParamByName('endereco').AsString      := aCliente.endereco;    //4
     qry.ParamByName('numero').DataType        := ftInteger;
     qry.ParamByName('numero').AsInteger       := aCliente.numero;      //5
     qry.ParamByName('complemento').DataType   := ftString;
     qry.ParamByName('complemento').AsString   := aCliente.complemento; //6
     qry.ParamByName('cep').DataType           := ftString;
     qry.ParamByName('cep').AsString           := aCliente.CEP;         //7
     qry.ParamByName('cidade').DataType        := ftString;
     qry.ParamByName('cidade').AsString        := aCliente.Cidade;      //8
     qry.ParamByName('bairro').DataType        := ftString;
     qry.ParamByName('bairro').AsString        := aCliente.Bairro;      //9

     qry.ParamByName('ativo').DataType         := ftString;
     if Length(aCliente.ativo) > 0 then
       Ativo := Copy(aCliente.ativo, 1, 1)
     else
       Ativo := '';

     qry.ParamByName('ativo').AsString         := Ativo;               //10

     qry.ParamByName('uf').DataType            := ftString;
     if Length(aCliente.UF) > 0 then
       UF := Copy(aCliente.UF, 1, 2)
     else
       UF := '';

     qry.ParamByName('uf').AsString            := UF;                  //11

     qry.ParamByName('datacadastro').DataType  := ftDateTime;
     qry.ParamByName('datacadastro').AsDateTime:= Now;                 //12

     qry.ParamByName('dataalteracao').DataType  := ftDateTime;         //13
     qry.ParamByName('dataalteracao').AsDateTime:= Now;

//     qry.ParamByName('dataexclusao').DataType := ftDateTime;
//     qry.ParamByName('dataexclusao').AsDateTime:= aCliente.dataExclusao; //14

     qry.ParamByName('idmodelocarro').DataType := ftInteger;
     qry.ParamByName('idmodelocarro').AsInteger:= aCliente.Idmodelocarro; //15

     CarregarFGravarLog;

     if FGravarLogs then
       qry.SQL.SaveToFile('C:\ClientesSQL.txt');

     qry.ExecSQL;
     qry.Connection.Commit;

     Result := True;
  Except
     on E: Exception do
      begin
        Result := False;
        ShowMessage('Ocorreu um erro ao salvar o cliente: ' + E.Message);
        qry.Connection.Rollback;
        qry.Close;

        if True then
        begin
          LogManager:= TLogManager.Create;
          try
            CurrentDateTime := Now;
            DateTimeStr     := FormatDateTime('yyyy-mm-dd hh:nn:ss', CurrentDateTime);
            LogManager.AddLog('Classe Model.Clientes - Linha : 629 - Finalizou o Alterar Cliente finalizou qry às '+ DateTimeStr);
            LogManager.SaveLogToFile('Log_Model_Clientes.txt');
          finally
            LogManager.Free;
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
