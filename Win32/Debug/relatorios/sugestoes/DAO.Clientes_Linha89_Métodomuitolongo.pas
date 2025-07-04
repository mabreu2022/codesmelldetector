// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\DAO\DAO.Clientes.pas
// Linha: 89

// Trecho original:
// ------------------
function TClientes.AlterarCliente(Cliente: TClientes): Boolean;
begin
  //Alterar oo cliente do parâmetro acNPJ
  Result:=False;
  qry:=qry.Create(nil);
  qry.Connection := FConn;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Text:='UPDATE fulanorodas.clientes  ' +
                  'SET                          ' +
                  'idclientes  = :idclientes,   ' +
                  'razao       = :razao,        ' +
                  'cnpj_cpf    = :cnpj_cpf,     ' +
                  'endereco    = :endereco,     ' +
                  'numero      = :numero,       ' +
                  'complemento = :complemento,  ' +
                  'cep         = :cep,          ' +
                  'cidade      = :cidade,       ' +
                  'bairro      = :bairro,       ' +
                  'ativo       = :ativo,        ' +
                  'uf          = :uf            ' +
                  'WHERE                        ' +
                  'idclientes = :CNPJ           ';

     qry.ParamByName('idclientes').DataType    := ftInteger;
     qry.ParamByName('razao').DataType         := ftString;
     qry.ParamByName('razao').AsString         := Cliente.razaosocial;
     qry.ParamByName('cnpj_cpf').DataType      := ftString;
     qry.ParamByName('cnpj_cpf').AsString      := Cliente.cnpj ;
     qry.ParamByName('endereco').DataType      := ftString;
     qry.ParamByName('endereco').AsString      := Cliente.endereco;
     qry.ParamByName('numero').DataType        := ftInteger;
     qry.ParamByName('numero').AsInteger       := Cliente.numero;
     qry.ParamByName('complemento').DataType   := ftString;
     qry.ParamByName('complemento').AsString   := Cliente.complemento;
     qry.ParamByName('cep').DataType           := ftString;
     qry.ParamByName('cep').AsString           := Cliente.CEP;
     qry.ParamByName('cidade').DataType        := ftString;
     qry.ParamByName('cidade').AsString        := Cliente.Cidade;
     qry.ParamByName('bairro').DataType        := ftString;
     qry.ParamByName('bairro').AsString        := Cliente.Bairro;

     qry.ParamByName('uf').DataType            := ftString; //ver como vai ser pois é CB

     if Length(Cliente.UF) > 0 then
       UF := Copy(Cliente.UF, 1, 2)
     else
       UF := '';

     qry.ParamByName('uf').AsString            := UF; //ver como vai ser pois é CB

     qry.ParamByName('ativo').DataType         := ftString; //ver como vai ser pois é CB

     if Length(Cliente.ativo) > 0 then
       Ativo := Copy(Cliente.ativo, 1, 1)
     else
       Ativo := '';

    qry.ParamByName('ativo').AsString         := Ativo; //ver como vai ser pois é CB
    qry.ParamByName('CNPJ').DataType:= ftString;
    qry.ParamByName('CNPJ').AsString:= Cliente.cnpj;

    qry.ExecSQL;

    Result:=True;

  finally
    qry.Free;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
