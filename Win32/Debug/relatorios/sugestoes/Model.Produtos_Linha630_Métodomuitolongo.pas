// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Produtos.pas
// Linha: 630

// Trecho original:
// ------------------
class function TModelProduto.SalvarProduto(aProduto: TProduto): Boolean;
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
                ' fulanorodas.Produtos ' +
                '(idprodutos,          ' +   //1
                'produto,              ' +   //2
                'foto,                 ' +   //3
                'preco,                ' +   //4
                'aro,                  ' +   //5
                'idFabricante,         ' +   //6
                'datainclusao,         ' +   //7
                'dataalteracao,        ' +   //8
                'dataexclusao,         ' +   //9
                'ativo,                ' +   //10
                'lancamento,           ' +   //11
                'furacao,              ' +   //12
                'offset_et,            ' +   //13
                'idlinha,              ' +   //14
                'idacabamento          ' +   //15
                ')                     ' +
                'VALUES (              ' +
                ':idprodutos,          ' +   //1 ok
                ':produto,             ' +   //2 ok
                ':foto,                ' +   //3 ok
                ':preco,               ' +   //4 ok
                ':aro,                 ' +   //5 ok
                ':idFabricante,        ' +   //6 ok
                ':datainclusao,        ' +   //7 ok
                ':dataalteracao,       ' +   //8 ok
                ':dataexclusao,        ' +   //9 ok
                ':ativo,               ' +   //10 ok
                ':lancamento,          ' +   //11 ok
                ':furacao,             ' +   //12 ok
                ':offset_et,           ' +   //13 ok
                ':idlinha,             ' +   //14 ok
                ':idacabamento         ' +   //15 ok
                ')                     ');

     qry.ParamByName('idprodutos').DataType    := ftInteger;               //1

     qry.ParamByName('produto').DataType         := ftString;
     qry.ParamByName('produto').AsString         := aProduto.produto;      //2
     qry.ParamByName('foto').DataType            := ftStream;
     qry.ParamByName('foto').AsStream            := aProduto.foto;         //3 - Verificar
     qry.ParamByName('preco').DataType           := ftCurrency;
     qry.ParamByName('preco').AsCurrency         := aProduto.preco;        //4
     qry.ParamByName('aro').DataType             := ftInteger;
     qry.ParamByName('aro').AsInteger            := aProduto.aro;          //5
     qry.ParamByName('idfabricante').DataType    := ftInteger;
     qry.ParamByName('idfabricante').AsInteger   := aProduto.idfabricante; //6
     qry.ParamByName('datainclusao').DataType    := ftDateTime;
     qry.ParamByName('datainclusao').AsDateTime  := Now;                   //7
     qry.ParamByName('dataalteracao').DataType   := ftDateTime;
     qry.ParamByName('dataalteracao').AsDateTime := Now;                   //8
     //qry.ParamByName('dataexclusao').DataType    := ftDateTime;
     //qry.ParamByName('dataexclusao').AsDateTime  := Now;                 //9

     qry.ParamByName('ativo').DataType           := ftString;
     if Length(aProduto.ativo) > 0 then
       Ativo := Copy(aProduto.ativo, 1, 1)
     else
       Ativo := '';

     qry.ParamByName('ativo').AsString           := Ativo;                 //10

     qry.ParamByName('lancamento').DataType      := ftString;
     qry.ParamByName('lancamento').AsString      := aProduto.lancamento;   //11
     qry.ParamByName('furacao').DataType         := ftInteger;
     qry.ParamByName('furacao').AsInteger        := aProduto.furacao;      //12
     qry.ParamByName('offset_et').DataType       := ftInteger;
     qry.ParamByName('offset_et').AsInteger      := aProduto.OffsetEt;     //13
     qry.ParamByName('idlinha').DataType         := ftInteger;
     qry.ParamByName('idlinha').AsInteger        := aProduto.idlinha;      //14
     qry.ParamByName('idacabamento').DataType    := ftInteger;
     qry.ParamByName('idacabamento').AsInteger   := aProduto.idacabamento; //15

     CarregarFGravarLog;

     if FGravarLogs then
       qry.SQL.SaveToFile('C:\ProdutosSQL.txt');

     qry.ExecSQL;
     qry.Connection.Commit;

     Result := True;
  Except
     on E: Exception do
      begin
        Result := False;
        ShowMessage('Ocorreu um erro ao salvar o produto: ' + E.Message);
        qry.Connection.Rollback;
        qry.Close;

        if True then
        begin
          LogManager:= TLogManager.Create;
          try
            CurrentDateTime := Now;
            DateTimeStr     := FormatDateTime('yyyy-mm-dd hh:nn:ss', CurrentDateTime);
            LogManager.AddLog('Classe Model.Produtos - Linha : 271 - Finalizou o salvar produto finalizou qry às ' + DateTimeStr);
            LogManager.SaveLogToFile('Log_Model_Produtos.txt');
          finally
            LogManager.Free;
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
