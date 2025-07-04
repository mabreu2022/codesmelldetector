// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Agendamento_Linha171_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelAgendamento.EnviarEmail(const AAssunto, ADestino, AAnexo: String; ACorpo: String): Boolean;
var
  IniFile              : TIniFile;
  sFrom                : String;
  sBccList             : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;

  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      //Criação e leitura do arquivo INI com as configurações
      IniFile                          := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
      sFrom                            := IniFile.ReadString('Email' , 'From'     , sFrom);
      sBccList                         := IniFile.ReadString('Email' , 'BccList'  , sBccList);
      sHost                            := IniFile.ReadString('Email' , 'Host'     , sHost);
      iPort                            := IniFile.ReadInteger('Email', 'Port'     , iPort);
      sUserName                        := IniFile.ReadString('Email' , 'UserName' , sUserName);
      sPassword                        := IniFile.ReadString('Email' , 'Password' , sPassword);

      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      //Variável referente a mensagem
      idMsg                            := TIdMessage.Create;
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := 'Agendamento do Centro de Distribuição Nome do Centro';
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := AAssunto;

      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ADestino;
      idMsg.CCList.EMailAddresses     := 'Comercial@conectsolutionsti.COM.BR';
      idMsg.BccList.EMailAddresses    := sBccList;
      //idMsg.BccList.EMailAddresses    := 'conectsolutions@hotmail.COM'; //Cópia Oculta

      //Variável do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(ACorpo);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      //Prepara o Servidor
      IdSMTP                           := TIdSMTP.Create;
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseExplicitTLS;//utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := sHost;
      IdSMTP.Port                      := iPort;
      IdSMTP.Username                  := sUserName;
      IdSMTP.Password                  := sPassword;

      //Conecta e Autentica
      IdSMTP.Authenticate;
      IdSMTP.Connect;


      if AAnexo <> EmptyStr then
        if FileExists(AAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo);

      //Se a conexão foi bem sucedida, envia a mensagem
      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Erro ao tentar enviar: ' + E.Message);
          end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
