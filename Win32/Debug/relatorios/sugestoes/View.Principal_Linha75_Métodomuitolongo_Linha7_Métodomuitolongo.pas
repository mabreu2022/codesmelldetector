// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\View.Principal_Linha75_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TFrmPrincipal.BtnEncriptarClick(Sender: TObject);
var
  IniFile: TIniFile;
  EncryptedServer   : string;
  EncryptedPassword : string;
  EncryptedDataBase : string;
  EncryptedUserName : string;
  EncryptedServerLicencas   : string;
  EncryptedPasswordLicencas : string;
  EncryptedDataBaseLicencas : string;
  EncryptedUserNameLicencas : string;
  Funcoes: TCriptografia;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Server.ini');
  Funcoes:= TCriptografia.Create;
  try
     EncryptedServer   := Funcoes.EncryptString(EdtDadosBancoServer.Text, 123);
     EncryptedPassword := Funcoes.EncryptString(EdtDadosBancoPassword.Text, 123);
     EncryptedDataBase := Funcoes.EncryptString(EdtDadosBancoDataBase.Text,123);
     EncryptedUserName := Funcoes.EncryptString(EdtDadosBancoUserName.Text,123);

     EncryptedServerLicencas   := Funcoes.EncryptString(EdtDadosLicenasServer.Text,123);
     EncryptedPasswordLicencas := Funcoes.EncryptString(EdtDadosLicencasPassword.Text,123);
     EncryptedDataBaseLicencas := Funcoes.EncryptString(EdtDadosLicenasDataBase.Text,123);
     EncryptedUserNameLicencas := Funcoes.EncryptString(EdtDadosLicencasUserName.Text,123);

     //Escreve no arquivo ini
     IniFile.WriteString('Banco de Dados', 'Server', EncryptedServer);
     IniFile.WriteString('Banco de Dados', 'Password', EncryptedPassword);
     IniFile.WriteString('Banco de Dados', 'Database', EncryptedDataBase);
     IniFile.WriteString('Banco de Dados', 'User_Name', EncryptedUserName);

     IniFile.WriteString('BancoLicencas', 'Server',    EncryptedServerLicencas);
     IniFile.WriteString('BancoLicencas', 'Password',  EncryptedPasswordLicencas);
     IniFile.WriteString('BancoLicencas', 'Database',  EncryptedDataBaseLicencas);
     IniFile.WriteString('BancoLicencas', 'User_Name', EncryptedUserNameLicencas);

     //Preenche os Edits da Aba Encriptada - Banco
     EdtEncryptadosBancoServer.Text   := EncryptedServer;
     EdtEncryptadosBancoPassword.Text := EncryptedPassword;
     EdtEncryptadosBancoDataBase.Text := EncryptedDataBase;
     EdtEncryptadosBancoUserName.Text := EncryptedUserName;

     //Preenche os Edits da Aba Encriptada - Banco Licenças
     EdtEncryptadosBancoLicencasServer.Text   := EncryptedServerLicencas;
     EdtEncryptadosBancoLicencasPassword.Text := EncryptedPasswordLicencas;
     EdtEncryptadosBancoLicencasDataBase.Text := EncryptedDataBaseLicencas;
     EdtEncryptadosBancoLicencasUserName.Text := EncryptedUserNameLicencas;

     inifile.UpdateFile;

  finally
    IniFile.Free;
    Funcoes.Free;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
