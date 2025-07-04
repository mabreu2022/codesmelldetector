// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\FSD.MainMenu.Wizard_Linha36_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
     function GetWindowsDefaultLanguage: string;

     procedure CreateMenu;

     procedure OnClickNovoWizard(Sender: TObject);
     procedure OnClickDocWiki(Sender: TObject);
     //procedure OnClickLoja(Sender: TObject);
     procedure OnClickMenuHistoryProjects(Sender: TObject);

     {Vagas}
     procedure OnClickVagasDelphi(Sender: TObject);

     {Utilitários}
     procedure OnClickSQLite(Sender: TObject);
     procedure OnClickMySQL(Sender: TObject);
     procedure OnClickForumDelphi(Sender: TObject);
     procedure OnClickPostGres(Sender: TObject);
     procedure OnClickPostman(Sender: TObject);
     procedure OnClickChatGPT(Sender: TObject);
     procedure OnClickAnalisarHints(Sender: TObject);
     procedure OnClickIBExpert(Sender: TObject);
     procedure OnClickSQLSErverManagerStudio(Sender: TObject);
     procedure OnClickJSONtoDelphiClass(Sender: TObject);
     procedure OnClickJSONFormater(Sender: TObject);
     procedure OnClickIconFinder(Sender: TObject);
     procedure OnClickIcons8(Sender: TObject);
     procedure OnClickAcoplamentosUnits(Sender: TObject);
     procedure OnClickimGetIt(Sender: TObject);


     {Cursos}
     procedure OnClickNutror(Sender: TOBject);
     procedure OnClickNovoEAD(Sender: TObject);
     procedure OnClickDevPoint(Sender: TObject);
     procedure OnclickGitHubBozon(Sender: TObject);
     procedure OnclickPostGresBozon(Sender: TObject);

     {YouTube}
     procedure OnClickEmbarcaderoBrasil(Sender: TObject);
     procedure OnClickEmbarcadero(Sender: TObject);
     procedure onClickYouTubeConectSolutions(Sender: Tobject);
     procedure onClickVoiceEnabledApp(Sender: TObject);
     procedure OnClickGitHubCurso(Sender: TObject);
     procedure OnClickCursoApiREst(Sender: TObject);
     procedure OnClickOpenToosAPI(Sender: TObject);
     procedure OnClickBossSSH(Sender: TObject);
     procedure OnClickDelphicon2023_day1(Sender: TObject);
     procedure OnClickDelphicon2023_day2(Sender: TObject);
     procedure OnClickDelphicon2023_day3(Sender: TObject);
     procedure OnClickmqfb(Sender: TObject);
     procedure OnClickChapmanWorld(Sender: TObject);

     procedure OnClickOTA(Sender: TObject);
     procedure OnclickDelphiBasics(Sender: TObject);

     procedure OnClickHorseBasicAuth(Sender: TObject);
     procedure OnClickHandleException(Sender: TObject);
     procedure OnClickHorseJWT(Sender: TObject);

     {Git Hubs}
     procedure OnClickSynopseSynPDF(Sender: TObject);
     procedure OnClickNewAudio(Sender: TObject);
     procedure OnClickRedisClient(Sender: TObject);
     procedure OnClickFireBase4Delphi(Sender: TObject);
     procedure OnClickTurboPackVCL(Sender: TObject);
     procedure OnClickFortesReportCE(Sender: TObject);
     procedure OnClickDelphiJose(Sebder: TObject);
     procedure OnClickXPAD(Sender: TObject);
     procedure OnClickHorse(Sender: TObject);
     procedure OnClickSimpleORM(Sender: TObject);
     procedure OnClickHorseETag(Sender: TObject);
     procedure OnClickDelphiMVCFrameWork(Sender: TObject);
     procedure OnclickJEDIJCL(Sender: TObject);
     procedure OnclickJEDIJVCL(Sender: TObject);
     procedure OnclickJediInc(Sender: TObject);
     procedure OnclickDelphiMessageBus(Sender: TObject);
     procedure OnclickDelphiDocker(Sender: TObject);
     procedure OnclickEmbarcaderoGitHub(Sender: TObject);
     procedure OnclickChromiumGitHub(Sender: TObject);
     procedure OnclickSkia4Delphi(Sender: TObject);
     procedure OnclickUserControl(Sender: TObject);
     procedure OnclickAeggys(Sender: TObject);

     {Blogs}
     procedure OnClickBlogConectSolutions(Sender: TObject);
     procedure OnClickBlogAndreCelestino(Sender: TObject);
     procedure OnClickBlogEmbarcadero(Sender: TObject);
     procedure OnClickBlogMarcoCantu(Sender: TObject);
     procedure OnClickBlogZettaOmmnis(Sender: TObject);
     procedure OnClickBlogChapmanWorld(Sender: TObject);
     procedure OnClickBlogRoadToDelphi(Sender: TObject);
     procedure OnClickBlogLandgrafDev(Sender: TObject);
     procedure OnClickBlogStephenBalls(Sender: TObject);
     procedure OnClickBlogKonopka(Sender: TObject);
     procedure OnClickBlogAndys(Sender: TObject);

     {Ferramentas para Download}
     procedure OnClickFerramentasIbExpert(Sender: TObject);
     procedure OnClickFerramentasFirebird(Sender: TObject);
     procedure OnClickFerramentasMySQL(Sender: TObject);
     procedure OnClickFerramentasSQLiteExpert(Sender: TObject);
     procedure OnClickFerramentasInnoSetup(Sender: TObject);
     procedure OnClickFerramentasCNPack(Sender: TObject);
     procedure OnClickFerramentasInnoScriptStudio(Sender: TObject);
     procedure OnClickFerramentasInsomnia(Sender: TObject);
     procedure OnClickFerramentasNavicat(Sender: TObject);
     procedure OnClickFerramentasIdeFixPack(Sender: TObject);
     procedure OnClickFerramentasToolsFree(Sender: TObject);
     procedure OnClickFerramentasSiteGitIgnore(Sender: TObject);
     procedure OnClickFerramentasSiteRegexLib(Sender: TObject);
     procedure OnClickFerramentasGoogleMeeting(Sender: TObject);
     procedure OnClickFaceBookVideo(Sender: TObject);
     procedure OnClickLinkedinVideo(Sender: TObject);


     {Grupos de Facebook}
     procedure OnClickFacebookDelphiTips(Sender: TObject);
     procedure OnClickFacebookLiteratudaDelphi(Sender: TObject);

     {Livros}
     procedure OnClickLivroDelphiAndroid(Sender: TObject);
     procedure OnClickLivroObjectPascal(Sender: TObject);



     function CreateSubMenu(AParent: TMenuItem;
                            ACaption: String;
                            AName: String;
                            AOnClick: TNotifyEvent;
                            AImageIndex: Integer = -1): TMenuItem;

     procedure AddImageToImageList;
     procedure OnClickYouTube(Sender: TObject);
     procedure VoiceEnabledApp(Sender: TObject);



  protected
     function GetIDString: string;
     function GetName: string;
     function GetState: TWizardState;


    { Launh the AddIn }
    procedure Execute;

  public

  constructor create;
end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
