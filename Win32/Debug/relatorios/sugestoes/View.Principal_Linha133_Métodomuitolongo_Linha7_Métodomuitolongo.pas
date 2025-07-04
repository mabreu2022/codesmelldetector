// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\View.Principal_Linha133_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TFrmPrincipal.CarregarEdits;
var
  IniFile: TIniFile;
  EncryptedServer    : string;
  DecryptedServer    : string;
  EncryptedPassword  : string;
  DecryptedPassword  : string;
  EncryptedDataBase  : string;
  DescryptedDataBase : string;
  EncryptedUserName  : string;
  DescryptedUserName : string;

  EncryptedServerLicencas    : string;
  DecryptedServerLicencas    : string;
  EncryptedPasswordLicencas  : string;
  DecryptedPasswordLicencas  : string;
  EncryptedDataBaseLicencas  : string;
  DescryptedDataBaseLicencas : string;
  EncryptedUserNameLicencas  : string;
  DescryptedUserNameLicencas : string;

  Funcao: TCriptografia;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\Server.ini');
  Funcao  := TCriptografia.Create;
  try
    EncryptedServer   := IniFile.ReadString('Banco de Dados', 'Server', '');
    EncryptedPassword := IniFile.ReadString('Banco de Dados', 'Password', '');
    EncryptedDataBase := IniFile.ReadString('Banco de Dados', 'Database', '');
    EncryptedUserName := IniFile.ReadString('Banco de Dados', 'User_Name', '');

    DecryptedServer    := Funcao.DecryptString(EncryptedServer, 123);
    DecryptedPassword  := Funcao.DecryptString(EncryptedPassword, 123);
    DescryptedDataBase := Funcao.DecryptString(EncryptedDataBase, 123);
    DescryptedUserName := Funcao.DecryptString(EncryptedUserName, 123);

    EncryptedServerLicencas   := IniFile.ReadString('BancoLicencas', 'Server', '');
    EncryptedPasswordLicencas := IniFile.ReadString('BancoLicencas', 'Password', '');
    EncryptedDataBaseLicencas := IniFile.ReadString('BancoLicencas', 'Database', '');
    EncryptedUserNameLicencas := IniFile.ReadString('BancoLicencas', 'User_Name', '');

    DecryptedServerLicencas    := Funcao.DecryptString(EncryptedServer, 123);
    DecryptedPasswordLicencas  := Funcao.DecryptString(EncryptedPassword, 123);
    DescryptedDataBaseLicencas := Funcao.DecryptString(EncryptedDataBase, 123);
    DescryptedUserNameLicencas := Funcao.DecryptString(EncryptedUserName, 123);

    // Carregar Edits Aba Banco - GroupBox Banco
    EdtDadosBancoServer.Text   := DecryptedServer;
    EdtDadosBancoPassword.Text := DecryptedPassword;
    EdtDadosBancoDataBase.Text := DescryptedDataBase;
    EdtDadosBancoUserName.Text := DescryptedUserName;

    //Carregar Edits Aba Dados Encryptados - GroupBox Licenças
    EdtEncryptadosBancoLicencasServer.Text   := DecryptedServerLicencas;
    EdtEncryptadosBancoLicencasPassword.Text := DecryptedPasswordLicencas;
    EdtEncryptadosBancoLicencasDataBase.Text := DescryptedDataBaseLicencas;
    EdtEncryptadosBancoLicencasUserName.Text := DescryptedUserNameLicencas;

  finally
    IniFile.Free;
    Funcao.Free;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
