// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Cargas\cargas\View\View.GerenciaFila.pas
// Linha: 112

// Trecho original:
// ------------------
procedure TFrmGerenciarFila.FormShow(Sender: TObject);
begin
  //Enviar os e-mails do agendamento - ver a Thread para essa parte
  TTHread.CreateAnonymousThread(procedure
  var
    qryEmviarEmail, qry2: TFDQuery;
    LEnviar : TModelAgendamento;
    LSubject: string;
    LEmail: String;
    LMemo: String;
    LDataEnvio: TDate;
    LPlaca: String;
    LLocal: String;
    LNF: Integer;
    LTelefone: String;
    LHora: TTime;
    LOBs: String;
  begin
    qryEmviarEmail:= TFDquery.Create(nil);
    qryEmviarEmail.Connection:= DataModule3.FDConnection1;
    try
      qryEmviarEmail.Close;
      qryEmviarEmail.SQL.Clear;
      qryEmviarEmail.SQL.Add('select * from email');
      qryEmviarEmail.sql.Add(' where enviado=''N'' ');
      qryEmviarEmail.Open;

      if qryEmviarEmail.RecordCount > 0 then
      begin
        LSubject   := qryEmviarEmail.FieldByName('subject').AsString;
        LEmail     := qryEmviarEmail.FieldByName('email').AsString;
        LMemo      := qryEmviarEmail.FieldByName('memo').AsString;
        LDataEnvio := qryEmviarEmail.FieldByName('dataenvio').AsDateTime;
        LPlaca     := qryEmviarEmail.FieldByName('placa').AsString;;
        LLocal     := qryEmviarEmail.FieldByName('local').AsString;;
        LNF        := qryEmviarEmail.FieldByName('nf').AsInteger;
        LTelefone  := qryEmviarEmail.FieldByName('telefone').AsString;
        LHora      := qryEmviarEmail.FieldByName('hora').AsVariant;
        LOBs       := qryEmviarEmail.FieldByName('memo').AsString;


        qryEmviarEmail.First;
        while not qryEmviarEmail.Eof do
        begin
          LEnviar := TModelAgendamento.Create;
          try
            if LEnviar.EnviarEmail2(LSubject, LPlaca, LNF, LLocal, LTelefone, LEmail, LDataEnvio, TimeToStr(LHora) , LObs) then
            begin
                LEnviar.EditarEmailEnviado;
                //update da tabela email o campo enviado tem que mudar para S
                qry2:= TFDquery.Create(nil);
                qry2.Connection:= DM.DataModule3.FDConnection1;
                try
                  qry2.SQL.clear;
                  qry2.SQL.Text :=
                  'UPDATE email  ' +
                  'SET enviado = ''S'' ' +  //Nono N veiculos não vão para o monitor
                  'WHERE idemail = :idemail';

                  qry2.ParamByName('idemail').AsInteger := qryEmviarEmail.FieldByName('idemail').AsInteger;

                  qry2.ExecSQL;
                finally
                  qry2.Free;
                end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
