// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Fabricantes_Linha306_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelFabricante.SalvarFabricante(
  aFabricante: TFabricante): Boolean;
var
  qry   : TFDQuery;
  Ativo : string;
  UF    : string;
begin
  Result:= False;

  qry:=TFDQuery.Create(nil);
  qry.Connection := TConnection.CreateConnection;
  qry.Connection.StartTransaction;
  try

    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO '     +
                ' fabricantes '    +
                '(idfabricantes, ' +
                'razao, '          +
                'cnpj, '           +
                'endereco, '       +
                'numero, '         +
                'complemento, '    +
                'cep, '            +
                'cidade, '         +
                'bairro, '         +
                'ativo, '          +
                'datacadastro, '   +
                'dataalteracao, '  +
//                'dataexclusao, '   +
                'uf) '             +
                'VALUES ('         +
                ':idclientes, '    +
                ':razao, '         +
                ':cnpj_cpf, '      +
                ':endereco, '      +
                ':numero,  '       +
                ':complemento, '   +
                ':cep, '           +
                ':cidade, '        +
                ':bairro, '        +
                ':ativo, '         +
                ':datacadastro, '  +
                ':dataalteracao, ' +
//                ':dataexclusao, '  +
                ':uf)');

     qry.ParamByName('idclientes').DataType    := ftInteger;
     qry.ParamByName('razao').DataType         := ftString;
     qry.ParamByName('razao').AsString         := aFabricante.razaosocial;
     qry.ParamByName('cnpj_cpf').DataType      := ftString;
     qry.ParamByName('cnpj_cpf').AsString      := aFabricante.cnpj ;
     qry.ParamByName('endereco').DataType      := ftString;
     qry.ParamByName('endereco').AsString      := aFabricante.endereco;
     qry.ParamByName('numero').DataType        := ftInteger;
     qry.ParamByName('numero').AsInteger       := aFabricante.numero;
     qry.ParamByName('complemento').DataType   := ftString;
     qry.ParamByName('complemento').AsString   := aFabricante.complemento;
     qry.ParamByName('cep').DataType           := ftString;
     qry.ParamByName('cep').AsString           := aFabricante.CEP;
     qry.ParamByName('cidade').DataType        := ftString;
     qry.ParamByName('cidade').AsString        := aFabricante.Cidade;
     qry.ParamByName('bairro').DataType        := ftString;
     qry.ParamByName('bairro').AsString        := aFabricante.Bairro;

     qry.ParamByName('uf').DataType            := ftString;
     if Length(aFabricante.UF) > 0 then
       UF := Copy(aFabricante.UF, 1, 2)
     else
       UF := '';

     qry.ParamByName('uf').AsString            := UF;

     qry.ParamByName('ativo').DataType         := ftString;
     if Length(aFabricante.ativo) > 0 then
       Ativo := Copy(aFabricante.ativo, 1, 1)
     else
       Ativo := '';

     qry.ParamByName('ativo').AsString         := Ativo;

     qry.ParamByName('datacadastro').DataType:= ftDateTime;
     qry.ParamByName('datacadastro').AsDateTime:= Now;

     qry.ParamByName('dataalteracao').DataType:= ftDateTime;
     qry.ParamByName('dataalteracao').AsDateTime:= Now;

     qry.ExecSQL;
     qry.Connection.Commit;

     Result:=True;

  Except
     on E: Exception do
      begin
        ShowMessage('Ocorreu um erro ao tentar salvar o fabricante : ' + E.Message);
        qry.Connection.Rollback;
        qry.Close;
        qry.Free;
      end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
