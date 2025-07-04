// Sugest�o de corre��o para o smell: M�todo muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UCadastroFabricantes_Linha417_M�todomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TFrmFabricantes.CarregarLinguagem;
var
  IniFile: TIniFile;
  I: Integer;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\Config.ini');
  try
    FLinguagem :=IniFile.ReadString('Traducao', 'Linguagem', '');

   if FLinguagem = 'Portuguese' then
   begin
     LblCodCliente.Text      := 'Cod. Fabricante';
     LblRazao.Text           := 'Raz�o Social / Nome';
     LblCnpj.Text            := 'CNPJ / CPF';
     LblEndereco.Text        := 'Endere�o';
     LblNumero.Text          := 'N�mero';
     LblComplemento.Text     := 'Complemento';
     LblCEP.Text             := 'CEP';
     LblCidade.Text          := 'Cidade';
     LblCEP.Text             := 'CEP';
     LblUF.Text              := 'UF';
     LblAtivo.Text           := 'Ativo';
     LblPesquisar.Text       := 'Pesquisar';
     BtnNovo.Text            := '&Novo';
     BtnAlterar.Text         := '&Alterar';
     BtnExcluir.Text         := '&Excluir';
     BtnSalvar.Text          := '&Salvar';
     TabItemCadastro.Text    := 'Cadastro';
     TabItemPesquisa.Text    := 'Pesquisa';
     TabItemContato.Text     := 'Contato';
     lblTitulo.Text          := 'Cadastro do Fabricantes';
     FrmFabricantes.Caption  := 'Cadastro do Fabricantes';

   end
   else if FLinguagem = 'Ingles' then
   begin
     LblCodCliente.Text      := 'Id. Manufacturer';
     LblRazao.Text           := 'Corporate Name / Name';
     LblCnpj.Text            := 'Tax Identification Number - TIN';
     LblEndereco.Text        := 'Address';
     LblNumero.Text          := 'Number';
     LblComplemento.Text     := 'Complement';
     LblCidade.Text          := 'City';
     LblCEP.Text             := 'Zip Code';
     LblUF.Text              := 'State';
     LblAtivo.Text           := 'Active';
     LblPesquisar.Text       := 'Search';
     BtnNovo.Text            := '&New';
     BtnAlterar.Text         := '&Alter';
     BtnExcluir.Text         := '&Delete';
     BtnSalvar.Text          := '&Save';
     TabItemCadastro.Text    := 'Register';
     TabItemPesquisa.Text    := 'Search';
     TabItemContato.Text     := 'Contact';
     lblTitulo.Text          := 'Manufacturer Registration';
     FrmFabricantes.Caption  := 'Manufacturer Registration';
   end;


// Sugest�o:
// Divida o m�todo em subm�todos menores com nomes descritivos.
