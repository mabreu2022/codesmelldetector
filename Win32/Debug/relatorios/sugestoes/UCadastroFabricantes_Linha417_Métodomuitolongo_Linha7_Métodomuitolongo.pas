// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\UCadastroFabricantes_Linha417_Métodomuitolongo.pas
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
     LblRazao.Text           := 'Razão Social / Nome';
     LblCnpj.Text            := 'CNPJ / CPF';
     LblEndereco.Text        := 'Endereço';
     LblNumero.Text          := 'Número';
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


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
