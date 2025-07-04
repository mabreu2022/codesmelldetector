// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\CriadorDeBancoWheelPro\uPrincipal.pas
// Linha: 94

// Trecho original:
// ------------------
procedure TFrmPrincipal.BtnCriarBaseClick(Sender: TObject);
var
  Connection: TFDConnection;
  Query: TFDQuery;
  ScriptFile: TStringList;
  OpenDialog: TOpenDialog;
  ScriptText: string;
  ScriptsPath: string;
  DatabaseName: string;
begin
  ScriptsPath := ExtractFilePath(Application.ExeName) + 'scripts\'; // Caminho para a pasta "scripts" da aplicação

  OpenDialog            := TOpenDialog.Create(nil);
  OpenDialog.Filter     := 'Arquivos SQL (*.sql)|*.sql'; // Filtro para selecionar apenas arquivos SQL
  OpenDialog.InitialDir := ScriptsPath; // Define a pasta inicial do OpenDialog como a pasta "scripts" da aplicação

  if OpenDialog.Execute then
  begin
    Connection := TFDConnection.Create(nil);
    try
      Connection.DriverName := 'MySQL'; // Driver do FireDAC para MySQL
      Connection.Params.Add('Server=localhost'); // Endereço do servidor MySQL
      Connection.Params.Add('User_Name=root'); // Usuário do MySQL
      Connection.Params.Add('Password=19741974'); // Senha do MySQL

      Connection.Connected := True;

      Query := TFDQuery.Create(nil);
      try
        Query.Connection := Connection;

        ScriptFile := TStringList.Create;
        try
          ScriptFile.LoadFromFile(OpenDialog.FileName); // Carrega o script do arquivo selecionado

          ScriptText := ScriptFile.Text; // Obtém o texto do script

          // Substitui o texto "fulanorodas2" pelo valor do TEdit (Edit1.Text)
          ScriptText := StringReplace(ScriptText, 'fulanorodas2', Edit1.Text, [rfReplaceAll]);

          Query.SQL.Text := ScriptText; // Define o script carregado como texto SQL do Query

          // Procura o nome do banco de dados dentro do script
          DatabaseName := ExtractDatabaseNameFromScript(ScriptText);

          if DatabaseName <> '' then
          begin
            // Adiciona informações ao Memo1.Text
            Memo1.Lines.Add('Criando o banco de dados: ' + DatabaseName);

            // Cria o banco de dados com o nome extraído
            Query.SQL.Text := 'CREATE SCHEMA IF NOT EXISTS `' + DatabaseName + '`';
            Query.ExecSQL;

            Memo1.Lines.Add('Banco de dados criado com sucesso.');

            // Adiciona informações ao Memo1.Text
            Memo1.Lines.Add('Executando o restante do script...');

            // Executa o restante do script
            Query.SQL.Text := ScriptText;
            Query.ExecSQL;

            // Adicionar registro à tabela de login
            Memo1.Lines.Add('Adicionando o usuario admin à tabela de login...');

            Query.SQL.Text :=
              'INSERT INTO login (usuario, senha, email, tipo, ativo, idcliente) ' +
              'VALUES (:usuario, :senha, :email, :tipo, :ativo, :idcliente)';
            Query.Params.ParamByName('usuario').AsString    := 'admin';
            Query.Params.ParamByName('senha').AsString      := '123';
            Query.Params.ParamByName('email').AsString      := Edit2.Text;
            Query.Params.ParamByName('tipo').AsString       := 'A';
            Query.Params.ParamByName('ativo').AsString      := 'S';
            Query.Params.ParamByName('idcliente').AsInteger := 1;
            Query.ExecSQL;

            Memo1.Lines.Add('Banco de dados criado e script executado com sucesso: ' + DatabaseName);

            //se é demo temos que adicionar a data do termino do demo na tabela registro
            if cbDemo.Checked then
            begin

              //id, id_chave, chave, data_inc (now) ,  data_exp now+30, contrasenha, ativado ='S' e serialhd
              Query.SQL.Clear;
              Query.SQL.Text :=
              'INSERT INTO registro (id, id_chave, data_inc, data_exp, contrasenha, ativo, serialhd ) ' +
              'VALUES (:id, :id_chave, :data_inc, :data_exp, :contrasenha, :ativo, :serialhd)';
              Query.Params.ParamByName('id').AsString          := '1';
              Query.Params.ParamByName('id_chave').AsString    := '1';
              Query.Params.ParamByName('data_inc').AsDate      := now;
              Query.Params.ParamByName('data_exp').AsDate      := now+30;
              Query.Params.ParamByName('contrasenha').AsString := 'Conect';
              Query.Params.ParamByName('ativo').AsString       := 'S';
              Query.Params.ParamByName('serialhd').AsString    := '0';
              Query.ExecSQL;

              Memo1.Lines.Add('Foi criada uma data de expiração ' + DateToStr(Now+30) + ' , pois o programa foi marcado como Demo');
            end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
