// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Registro_Linha354_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelRegistro.GravarContraSenha(
  aRegistro: TModelRegistro): Boolean;
var
  qry: TFDQuery;
begin
  Result := False;
  qry:= TFDQuery.Create(nil);
  qry.Connection := TConexaoLicencas.CreateConnection;
  //Checar se a CONTRASENHA Existe se não avisar ao usuário que a Contra Senha está errada e encerrar o programa?
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select contrasenha from registro');
    qry.SQL.Add(' where contrasenha = :contrasenha');
    qry.ParamByName('contrasenha').DataType := ftString;
    qry.ParamByName('contrasenha').AsString := aRegistro.ContraSenha;
    qry.Open;

    if qry.RecordCount > 0 then //Encontrou a ContraSenha faz o update
    begin
      qry.Connection.StartTransaction;
      try
        qry.close;
        qry.SQL.Clear;

        qry.SQL.Text:='UPDATE LICENCAS.REGISTRO      ' +
                      'SET                           ' +
                     // 'ID           = :id,           ' +
                     // 'ID_CHAVE     = :ID_CHAVE,     ' +
                     // 'CHAVE        = :CHAVE,        ' +
                      'DATA_INC     = :DATA_INC,     ' +
                      'DATA_EXP     = :DATA_EXP,     ' +
                      'CONTRASENHA  = :CONTRASENHA,  ' +
                      'ATIVADO      = :ATIVADO,      ' +
                    //  'SERIALHD     = :SERIALHD      ' +
                      'WHERE                         ' +
                      'CONTRASENHA     = :CONTRASENHA      ';


        qry.ParamByName('DATA_INC').DataType     := ftDate;
        qry.ParamByName('DATA_INC').AsDateTime   := Now;
        qry.ParamByName('DATA_EXP').DataType     := ftDate;
        qry.ParamByName('DATA_EXP').AsDate       := aRegistro.Data_exp + 30;
        qry.ParamByName('CONTRASENHA').DataType  := ftString;
        qry.ParamByName('CONTRASENHA').AsString  := aRegistro.ContraSenha;
        qry.ParamByName('ATIVADO').DataType      := ftString;
        qry.ParamByName('ATIVADO').AsString      := aRegistro.ativo;

        qry.ExecSQL;
        qry.Connection.Commit;

        Result := True;
      Except
      On E: Exception do
        begin
           Showmessage('Erro ao gravar tabela registro!'+ E.Message);
           qry.Connection.Rollback;
           Result := False;
        end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
