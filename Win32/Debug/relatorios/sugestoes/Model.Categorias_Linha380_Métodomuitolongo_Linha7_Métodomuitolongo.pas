// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Categorias_Linha380_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelCategorias.SalvarCategoria(
  aCategoria: TCategorias): Boolean;
var
  qry             : TFDQuery;
  Ativo           : string;
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
                ' fulanorodas.categoria  ' +
                '(idcategorias,          ' +   //1
                'categoria,              ' +   //2
                'ativo,                  ' +   //3
                'datacadastro,           ' +   //4
                'dataalteracao,          ' +   //5
                'dataexclusao            ' +   //6
                ')                       ' +
                'VALUES (                ' +
                ':idcategorias,          ' +   //1 ok
                ':categoria,             ' +   //2 ok
                ':ativo,                 ' +   //3 ok
                ':datacadastro,          ' +   //4 ok
                ':dataalteracao,         ' +   //5 ok
                ':dataexclusao           ' +   //6 ok
                ')                       ');

     qry.ParamByName('idcategorias').DataType  := ftInteger;            //1

     qry.ParamByName('categoria').DataType     := ftString;
     qry.ParamByName('categoria').AsString     := aCategoria.categoria; //2


     qry.ParamByName('ativo').DataType         := ftString;
     if Length(aCategoria.ativo) > 0 then
       Ativo := Copy(aCategoria.ativo, 1, 1)
     else
       Ativo := '';

     qry.ParamByName('ativo').AsString         := Ativo;               //3

     qry.ParamByName('datacadastro').DataType  := ftDateTime;
     qry.ParamByName('datacadastro').AsDateTime:= Now;                 //4

     qry.ParamByName('dataalteracao').DataType  := ftDateTime;         //5
     qry.ParamByName('dataalteracao').AsDateTime:= Now;

     qry.ParamByName('dataexclusao').DataType := ftDateTime;
     qry.ParamByName('dataexclusao').AsDateTime:= aCategoria.dataExclusao; //6

     //CarregarFGravarLog;

     if FGravarLogs then
       qry.SQL.SaveToFile('C:\CategoriasSQL.txt');

     qry.ExecSQL;
     qry.Connection.Commit;

     Result := True;
  Except
     on E: Exception do
      begin
        Result := False;
        ShowMessage('Ocorreu um erro ao salvar a categoria: ' + E.Message);
        qry.Connection.Rollback;
        qry.Close;

        if True then
        begin
          LogManager:= TLogManager.Create;
          try
            CurrentDateTime := Now;
            DateTimeStr     := FormatDateTime('yyyy-mm-dd hh:nn:ss', CurrentDateTime);
            LogManager.AddLog('Classe Model.Categoria - Linha : 460 - Finalizou o Alterar Categoria finalizou qry às '+ DateTimeStr);
            LogManager.SaveLogToFile('Log_Model_Categorias.txt');
          finally
            LogManager.Free;
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
