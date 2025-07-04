// Sugest�o de corre��o para o smell: M�todo muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\FSD.MainMenu.Wizard_Linha282_M�todomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TFSDMainMenuWizard.CreateMenu;
var
  menu: TMainMenu;
  menuName: string;
  itemFormacao: TMenuItem;
  itemUtilitarios: TMenuItem;
  itemCursos: TMenuItem;
  itemGitHubs: TMenuItem;
  itemYoutube: TMenuItem;
  itemAPI: TMenuItem;
  itemBlogs: TMenuItem;
  itemGruposFaceBook: TMenuItem;
  itemFerramentas: TMenuItem;
  itemLivros: TMenuItem;
  itemLoja: TMenuItem;
  itemVagas: TMenuItem;

  Lingua: string;
begin
  menu := (BorlandIDEServices as INTAServices).MainMenu;
  menuName := 'Informacao';

  if menu.FindComponent(menuName) <> nil then
    menu.FindComponent(menuName).Free;

  itemFormacao := TMenuItem.Create(menu);
  itemFormacao.Name := menuName;
  itemFormacao.Caption := 'Estagi�rio Eletr�nico';

  menu.Items.Add(itemFormacao);

 // CreateSubMenu(itemFormacao, 'Novo Wirzard', 'imNovoWizard', OnClickNovoWizard);
  CreateSubMenu(itemFormacao, 'Hist�rico Projetos', 'imHistoricoProjetos', OnclickMenuHistoryProjects);
  CreateSubMenu(itemFormacao, 'Embarcadero Doc Wiki', 'imDocWiki', OnClickDocWiki);
  CreateSubMenu(itemFormacao, 'Transmitir via Google Meeting', 'imFerramentasGoogleMeeeting', OnClickFerramentasGoogleMeeting);
  CreateSubMenu(itemFormacao, 'Transmitir via FaceBook', 'imFaceBookVideo', OnClickFaceBookVideo);
  CreateSubMenu(itemFormacao, 'Transmitir via Linkedin', 'imLinkedinVideo', OnClickLinkedinVideo);


  //CreateSuBMenu(itemFormacao, 'Loja', 'imLoja', OnClickLoja);

  {Livros} //Recurso de Linguagem ainda em testes.
  FLingua:= GetWindowsDefaultLanguage;
  if FLingua <> 'Portugu�s(Brasil)' then
  begin
    itemLivros := CreateSubMenu(itemFormacao, 'Livros de Delphi (Compras)', 'imLivros', nil);
    CreateSubMenu(itemLivros, 'Delphi para Android e iOS: Desenvolvendo Aplicativos M�veis', 'imLivrosDelphiAndroid', OnClickLivroDelphiAndroid);
    CreateSubMenu(itemLivros, 'Object Pascal Para Delphi', 'imLivrosObjectPascal', OnClickLivroObjectPascal);
  end
  else
  begin
    itemLivros := CreateSubMenu(itemFormacao, 'Books Delphi (Buy)', 'imLivros', nil);
    CreateSubMenu(itemLivros, 'Delphi for Android and iOS: Desenvolvendo Aplicativos M�veis', 'imLivrosDelphiAndroid', OnClickLivroDelphiAndroid);
    CreateSubMenu(itemLivros, 'Object Pascal for Delphi', 'imLivrosObjectPascal', OnClickLivroObjectPascal);
  end;


// Sugest�o:
// Divida o m�todo em subm�todos menores com nomes descritivos.
