// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Registro.pas
// Linha: 426

// Trecho original:
// ------------------
class function TModelRegistro.GravarNoBancoLicencas(
  aRegistro: TModelRegistro): Boolean;
var
  qry   : TFDQuery;
  Ativo : string;
  UF    : string;
  idChave : integer;
begin
  //Testar se a Licença já existe no banco de dados  buscar pelo cnpj  trazer o id e pesquisar na tabela registro
  //Se já existir o cnpj na tabela chaves e estiver aguardando a gravação da contrasenha na tabela registro o que fazer?
  // Informar o usuário que está aguardando a contrasenha e pular fora?
  qry:= TFDquery.Create(nil);
  qry.Connection := TConexaoLicencas.CreateConnection;
  qry.Connection.StartTransaction;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('Select * from chaves');
    qry.SQL.Add(' where cnpj =:cnpj');
    qry.ParamByName('cnpj').DataType := ftString;
    qry.ParamByName('cnpj').AsString := aRegistro.cnpj;
    qry.Open;

    if qry.RecordCount > 0 then //O registro dos dados do cliente existe na tabela chaves
    begin
      ShowMessage('Registro encontrado');
      idChave:= qry.FieldByName('id_chave').AsInteger;

      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add('Select contrasenha from registro');
      qry.SQL.Add(' where id_chave=:id_chave');
      qry.ParamByName('id_chave').DataType  := ftInteger;
      qry.ParamByName('id_chave').AsInteger := idChave;
      qry.Open;

      if (qry.RecordCount > 0) and (qry.fieldbyname('contrasenha').AsString='') then
      begin
          //Gravar no Banco primeiro registro
          qry:= TFDquery.Create(nil);
          qry.Connection := TConexaoLicencas.CreateConnection;
          qry.Connection.StartTransaction;
          try
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('INSERT INTO      ' +
                        ' licencas.chaves ' +
                        '(id_chave,       ' + //1
                        'razao,           ' + //2
                        'cnpj,            ' + //3
                        'ie,              ' + //4
                        'im,              ' + //5
                        'endereco,        ' + //6
                        'numero,          ' + //7
                        'complemento,     ' + //8
                        'bairro,          ' + //9
                        'cidade,          ' + //10
                        'cep,             ' + //11
                        'uf,              ' + //12
                        'ativo,           ' + //13
                        'contato,         ' + //14
                        'telcontato,      ' + //15
                        'email,           ' + //16
                        'datacadastro,    ' + //17
                        'dataalteracao    ' + //18
                       // 'dataexclusao   ' + //19
                        ')                ' +
                        'VALUES (         ' +
                        ':id_chave,       ' + //1 ok
                        ':razao,          ' + //2 ok
                        ':cnpj,           ' + //3 ok
                        ':ie,             ' + //4 ok
                        ':im,             ' + //5 ok
                        ':endereco,       ' + //6 ok
                        ':numero,         ' + //7 ok
                        ':complemento,    ' + //8 ok
                        ':bairro,         ' + //9 ok
                        ':cidade,         ' + //10 ok
                        ':cep,            ' + //11 ok
                        ':uf,             ' + //12 ok
                        ':ativo,          ' + //13 ok
                        ':contato,        ' + //14
                        ':telcontato,     ' + //15
                        ':email,          ' + //16
                        ':datacadastro,   ' + //17 ok
                        ':dataalteracao   ' + //18 ok
                      //  ':dataexclusao, ' + //19 ok
                        ')                ');

             qry.ParamByName('id_chave').DataType    := ftInteger;             //1
             qry.ParamByName('razao').DataType       := ftString;
             qry.ParamByName('razao').AsString       := aRegistro.razao;       //2
             qry.ParamByName('cnpj').DataType        := ftString;
             qry.ParamByName('cnpj').AsString        := aRegistro.cnpj ;       //3
             qry.ParamByName('ie').DataType          := ftString;
             qry.ParamByName('ie').AsString          := aRegistro.ie;          //4
             qry.ParamByName('im').DataType          := ftString;
             qry.ParamByName('im').AsString          := aRegistro.im;          //5
             qry.ParamByName('endereco').DataType    := ftString;
             qry.ParamByName('endereco').AsString    := aRegistro.endereco;    //6
             qry.ParamByName('numero').DataType      := ftInteger;
             qry.ParamByName('numero').AsInteger     := aRegistro.numero;      //7
             qry.ParamByName('complemento').DataType := ftString;
             qry.ParamByName('complemento').AsString := aRegistro.complemento; //8
             qry.ParamByName('cep').DataType         := ftString;
             qry.ParamByName('cep').AsString         := aRegistro.CEP;         //9
             qry.ParamByName('cidade').DataType      := ftString;
             qry.ParamByName('cidade').AsString      := aRegistro.Cidade;      //10
             qry.ParamByName('bairro').DataType      := ftString;
             qry.ParamByName('bairro').AsString      := aRegistro.Bairro;      //11
             qry.ParamByName('uf').DataType          := ftString;
             if Length(aRegistro.UF) > 0 then
               UF := Copy(aRegistro.UF, 1, 2)
             else
               UF := '';

             qry.ParamByName('uf').AsString          := UF;                    //12

             qry.ParamByName('ativo').DataType       := ftString;
             if Length(aRegistro.ativo) > 0 then
               Ativo := Copy(aRegistro.ativo, 1, 1)
             else
               Ativo := '';

             qry.ParamByName('ativo').AsString       := Ativo;                 //13

             qry.ParamByName('contato').DataType     := ftString;
             qry.ParamByName('contato').AsString     := aRegistro.contato;     //14

             qry.ParamByName('telcontato').DataType     := ftString;
             qry.ParamByName('telcontato').AsString     := aRegistro.telcontato; //15

             qry.ParamByName('email').DataType     := ftString;
             qry.ParamByName('email').AsString     := aRegistro.email;           //16

             qry.ParamByName('datacadastro').DataType  := ftDateTime;
             qry.ParamByName('datacadastro').AsDateTime:= Now;                 //17

             qry.ParamByName('dataalteracao').DataType  := ftDateTime;         //18
             qry.ParamByName('dataalteracao').AsDateTime:= Now;

        //     qry.ParamByName('dataexclusao').DataType := ftDateTime;
        //     qry.ParamByName('dataexclusao').AsDateTime:= aCliente.dataExclusao; //19

             qry.ExecSQL;
             qry.Connection.Commit;

             Result := True;
          Except
           On E: Exception do
              begin
                if aRegistro.Linguagem='Portugues' then
                  ShowMessage('Erro ao tentar gravar licença!' + E.Message)
                else
                  ShowMessage('Error trying to write license!!' + E.Message);

                qry.Connection.Rollback;
                qry.Free;
              end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
