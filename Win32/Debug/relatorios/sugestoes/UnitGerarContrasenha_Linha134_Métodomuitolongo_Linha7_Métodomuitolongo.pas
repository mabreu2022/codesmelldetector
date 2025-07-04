// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UnitGerarContrasenha_Linha134_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TFRMGerarContraSenha.Button1Click(Sender: TObject);
var
  strsql: string;
  strsql2: string;
  contrasenha: string;
  senhafinal: string;
  i: Integer;
const
  str = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%?';
  max = 15;
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Entre com a chave.');
    Edit1.SetFocus;
  end
  else
  begin
    if EdtData.Text = '' then
    begin
      ShowMessage('Entre com a data de vencimento.');
      EdtData.SetFocus;
    end
    else
    begin
      with FDQuery1 do;
      begin
        strsql := 'select * from registro where chave=' + #39 +
          Edit1.Text + #39;
        strsql := strsql + ' and contrasenha=0';

        strsql2 :=
          'select razao from chaves,registro where chaves.id_chave= registro.id_chave and registro.chave='
          + #39 + Edit1.Text + #39;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add(strsql2);
        FDQuery2.Open();
        Label6.Caption := FDQuery2.FieldByName('razao').AsString;

        // ShowMessage(strsql);
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(strsql);
        FDQuery1.Open();
        if (FDQuery1.RecordCount) = 1 then
        begin
          ShowMessage('Chave encontrada');
          // rotina de gerar a contra-senha
          contrasenha := FDQuery1.FieldByName('chave').AsString;
          // ShowMessage(contrasenha);
          // Gerar contra-senha
          Randomize;
          Label3.Caption := '';
          for i := 1 to max do
          begin
            try
              FDConnection1.StartTransaction;

              FDQuery1.Edit;
              Label3.Caption := Label3.Caption + str[Random(Length(str)) + 1];
              FDQuery1.FieldByName('contrasenha').AsString := contrasenha +
              Label3.Caption;
              senhafinal := contrasenha + Label3.Caption;

              Memo1.Lines.Clear;
              Memo1.Lines.Add(senhafinal);

              // Encriptar
              // Memo1.Lines.Add(Crypt('D',senhafinal));
              // fim de encriptar

              FDQuery1.FieldByName('ativado').AsString := 'S';
              FDQuery1.FieldByName('data_exp').AsDateTime :=
              StrToDateTime(EdtData.Text);
              FDQuery1.Post;
              FDCOnnection1.Commit;

             Except
             on E: Exception do
             begin
               ShowMessage('Erro ao gravar Contra Senha' + e.Message);
               FDConnection1.Rollback;
               Exit;
             end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
