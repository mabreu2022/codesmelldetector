// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Registro_Linha739_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelRegistro.GravarRegistro(
  aRegistro: TModelRegistro; achave: String): Boolean;
var
  qry: TFDQuery;
  data: TDateTime;
begin
  qry:= TFDQuery.Create(nil);
  qry.Connection := TConexaoLicencas.CreateConnection;
  qry.Connection.StartTransaction;
  try
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO REGISTRO      ' +
                 '(id,                      ' +
                 'id_chave,                 ' +
                 'chave,                    ' +
                 'data_inc,                 ' +
                 'data_exp,                 ' +
                 'contrasenha,              ' +
                 'ativado,                  ' +
                 'serialhd                  ' +
               //  'WHERE id_chave =:id_chave ' +
                 ')                         ' +
                 'VALUES (                  ' +
                 ':id,                      ' +
                 ':id_chave,                ' +
                 ':chave,                   ' +
                 ':data_inc,                ' +
                 ':data_exp,                ' +
                 ':contrasenha,             ' +
                 ':ativado,                 ' +
                 ':serialhd                 ' +
                 ')                         ');

     qry.ParamByName('id').DataType :=ftinteger;
     qry.ParamByName('id_chave').DataType:= ftInteger;

     qry.ParamByName('chave').DataType     := ftString;
     qry.ParamByName('chave').AsString      := aChave;

     qry.ParamByName('Data_inc').DataType   := ftDateTime;
     qry.ParamByName('Data_inc').AsDateTime := Date;

     Data := Date;

     qry.ParamByName('Data_exp').DataType    := ftDateTime;
     qry.ParamByName('Data_exp').AsDateTime  :=Data;

     //ShowMessage(DateToStr(Data+30));
     qry.ParamByName('serialhd').DataType    := ftDateTime;
     qry.ParamByName('serialhd').AsString    :=aRegistro.serialhd;

     qry.ParamByName('contrasenha').AsString :='0';
     qry.ParamByName('ativado').AsString     :='N';

     //Ver como fazer?
     //qry.ParamByName('id_chave').AsInteger := //qry2.FieldByName('ID_Chave').AsInteger;

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
