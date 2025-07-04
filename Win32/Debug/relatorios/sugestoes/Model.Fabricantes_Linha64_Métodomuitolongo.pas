// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Fabricantes.pas
// Linha: 64

// Trecho original:
// ------------------
class function TModelFabricante.AlterarFabricante(
  aFabricante: TFabricante): Boolean;
var
   qry: TFDQuery;
   UF: String;
   Ativo: String;
begin
  Result:=False;

  qry:=TFDQuery.Create(nil);
  qry.Connection := TConnection.CreateConnection;
  qry.Connection.StartTransaction;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Text:='UPDATE FABRICANTES              ' +
                  'SET                             ' +
                  'idfabricantes = :idfabricantes, ' +
                  'razao         = :razao,         ' +
                  'cnpj          = :cnpj,          ' +
                  'endereco      = :endereco,      ' +
                  'numero        = :numero,        ' +
                  'complemento   = :complemento,   ' +
                  'cep           = :cep,           ' +
                  'cidade        = :cidade,        ' +
                  'bairro        = :bairro,        ' +
                  'ativo         = :ativo,         ' +
                  'uf            = :uf,            ' +
                  'datacadastro  = now,            ' +
                  'datalateracao = now,            ' +
                  'WHERE                           ' +
                  'CNPJ          = :CNPJ           ';

    qry.ParamByName('idfabricantes').DataType   := ftInteger;
    qry.ParamByName('idfabricantes').AsInteger  := aFabricante.idFabricantes;
    qry.ParamByName('razao').DataType           := ftString;
    qry.ParamByName('razao').AsString           := aFabricante.razaosocial;
    qry.ParamByName('cnpj').DataType            := ftString;
    qry.ParamByName('cnpj').AsString            := aFabricante.cnpj ;
    qry.ParamByName('endereco').DataType        := ftString;
    qry.ParamByName('endereco').AsString        := aFabricante.endereco;
    qry.ParamByName('numero').DataType          := ftInteger;
    qry.ParamByName('numero').AsInteger         := aFabricante.numero;
    qry.ParamByName('complemento').DataType     := ftString;
    qry.ParamByName('complemento').AsString     := aFabricante.complemento;
    qry.ParamByName('cep').DataType             := ftString;
    qry.ParamByName('cep').AsString             := aFabricante.CEP;
    qry.ParamByName('cidade').DataType          := ftString;
    qry.ParamByName('cidade').AsString          := aFabricante.Cidade;
    qry.ParamByName('bairro').DataType          := ftString;
    qry.ParamByName('bairro').AsString          := aFabricante.Bairro;

    qry.ParamByName('uf').DataType              := ftString;

    if Length(aFabricante.UF) > 0 then
      UF := Copy(aFabricante.UF, 1, 2)
    else
      UF := '';

    qry.ParamByName('uf').AsString              := UF;

    qry.ParamByName('ativo').DataType           := ftString;
    if Length(aFabricante.ativo) > 0 then
      Ativo := Copy(aFabricante.ativo, 1, 1)
    else
      Ativo := '';

    qry.ParamByName('ativo').AsString           := Ativo;

    qry.ParamByName('dataalteracao').DataType   := ftDatetime;
    qry.ParamByName('dataalteracao').AsDateTime := aFabricante.DataAlteracao;

    qry.ParamByName('CNPJ').DataType            := ftString;
    qry.ParamByName('CNPJ').AsString            := aFabricante.cnpj;

    qry.ExecSQL;
    qry.connection.Commit;

    Result:=True;

  Except
     on E: Exception do
      begin
        ShowMessage('Ocorreu um erro ao tentar atualizar o fabricante : ' + E.Message);
        qry.Connection.Rollback;
        qry.Close;
        qry.Free;
      end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
