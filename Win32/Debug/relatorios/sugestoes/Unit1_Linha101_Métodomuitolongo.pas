// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Cargas\cargas\Painel\Unit1.pas
// Linha: 101

// Trecho original:
// ------------------
procedure TForm1.VerificaFila;
begin
  // Criar a Thread anonima
  TThread.CreateAnonymousThread(
    procedure
    var
      QryLocal, QryBoNota, QryChamados: TFDquery;
      LBoNota: String;
      Fila: TQueue<string>;
      Placa, Local: string;
      proximo: string;
      i: Integer;

      SearchString: string;
      LineIndex: Integer;
    begin
      Fila := TQueue<string>.Create;
      Queue := TQueue<string>.Create;

      QryLocal := TFDquery.Create(nil);
      QryLocal.Connection := FDConnection1;
      try
        QryLocal.Close;
        QryLocal.SQL.Clear;
        QryLocal.SQL.Add('select f.*, v.*, v.placa,l.local from fila f');
        QryLocal.SQL.Add
          (' inner join veiculos v on(f.idveiculo = v.idveiculos) ');
        QryLocal.SQL.Add(' inner join locais l on(f.idlocal = l.idlocais)');
        QryLocal.SQL.Add(' where f.ativo=''S'' '); // se comentar pega todos os
        QryLocal.SQL.Add(' order by f.datahoraentrada');

        // Se a conexão cair reconectar
        if not FDConnection1.Connected then
          FDConnection1.Connected := True;

        QryLocal.Open();

        {$IFDEF DEBUG}
          Showmessage('QryLocal Qtde Registros é de: ' +
          IntToStr(QryLocal.RecordCount));
        {$ENDIF}

        if QryLocal.RecordCount > 0 then
        begin

          // Adicionar Todas as placas ao Memo1
          Memo1.Clear; // Limpa o Memo1 antes de adicionar novos dados
          QryLocal.First;
          while not QryLocal.Eof do
          begin
            Placa := QryLocal.FieldByName('placa').AsString;
            Local := QryLocal.FieldByName('local').AsString;
            TThread.Synchronize(nil,
              procedure
              begin
                Memo1.Lines.Add(Placa + ' - ' + Local);
                // Adiciona a linha ao Memo1
              end);
            Placa := QryLocal.FieldByName('placa').AsString;
            Fila.Enqueue(Placa);
            QryLocal.Next;
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
