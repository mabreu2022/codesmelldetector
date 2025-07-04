// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Unit_D2Bridge_Server_Console_Linha220_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
class procedure TD2BridgeServerConsole.Run;
begin
 D2BridgeServerController:= TCRMWebAppGlobal.Create(TApplication.Create(nil));
 vServerPort:= D2BridgeServerController.Prism.INIConfig.ServerPort(8888);
 vServerName:= D2BridgeServerController.Prism.INIConfig.ServerName('D2Bridge Server');

 D2BridgeServerController.APPName:= 'CRM';
 //D2BridgeServerController.APPDescription:= 'My D2Bridge Web APP';

 //Security
 {
 D2BridgeServerController.Prism.Options.Security.Enabled:= false; //True Default
 D2BridgeServerController.Prism.Options.Security.IP.IPv4BlackList.EnableSpamhausList:= false; //Disable Default Blocked Spamhaus list
 D2BridgeServerController.Prism.Options.Security.IP.IPv4BlackList.Add('192.168.10.31'); //Block just IP
 D2BridgeServerController.Prism.Options.Security.IP.IPv4BlackList.Add('200.200.200.0/24'); //Block CDIR
 D2BridgeServerController.Prism.Options.Security.IP.IPv4BlackList.EnableSelfDelist:= false; //Disable Delist
 D2BridgeServerController.Prism.Options.Security.IP.IPv4WhiteList.Add('192.168.0.1'); //Add IP or CDIR to WhiteList
 D2BridgeServerController.Prism.Options.Security.IP.IPConnections.LimitNewConnPerIPMin:= 30; //Limite Connections from IP *minute
 D2BridgeServerController.Prism.Options.Security.IP.IPConnections.LimitActiveSessionsPerIP:= 50; //Limite Sessions from IP
 D2BridgeServerController.Prism.Options.Security.UserAgent.EnableCrawlerUserAgents:= false; //Disable Default Blocked Crawler User Agents
 D2BridgeServerController.Prism.Options.Security.UserAgent.Add('NewUserAgent'); //Block User Agent
 D2BridgeServerController.Prism.Options.Security.UserAgent.Delete('MyUserAgent'); //Allow User Agent
 }

 D2BridgeServerController.PrimaryFormClass:= TFrmPrincipal;

 //seconds to Send Session to TimeOut and Destroy after Disconnected
 //D2BridgeServerController.Prism.Options.SessionTimeOut:= 300;

 //secounds to set Session in Idle
 //D2BridgeServerController.Prism.Options.SessionIdleTimeOut:= 0;


 D2BridgeServerController.Prism.Options.IncludeJQuery:= true;

 //D2BridgeServerController.Prism.Options.DataSetLog:= true;

 D2BridgeServerController.Prism.Options.CoInitialize:= true;

 //D2BridgeServerController.Prism.Options.VCLStyles:= false;

 //D2BridgeServerController.Prism.Options.ShowError500Page:= false;

 //Uncomment to Dual Mode force http just in Debug Mode
 //if IsDebuggerPresent then
 // D2BridgeServerController.Prism.Options.SSL:= false
 //else
 //D2BridgeServerController.Prism.Options.SSL:= true;

 D2BridgeServerController.Languages:= [TD2BridgeLang.Portuguese];

 if D2BridgeServerController.Prism.Options.SSL then
 begin
  //Cert File
  D2BridgeServerController.Prism.SSLOptions.CertFile:= '';
  //Cert Key Domain File
  D2BridgeServerController.Prism.SSLOptions.KeyFile:= '';
  //Cert Intermediate (case Let?s Encrypt)
  D2BridgeServerController.Prism.SSLOptions.RootCertFile:= '';
 end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
