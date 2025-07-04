// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\URegistrar_Linha349_Métodomuitolongo.pas
// Linha: 7

// Trecho original:
// ------------------
procedure TFrmRegistrar.CarregarLinguagem;
var
  IniFile: TIniFile;
  I: Integer;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\Config.ini');
  try
    FLinguagem :=IniFile.ReadString('Traducao', 'Linguagem', '');

   if FLinguagem = 'Portuguese' then
   begin
     lblRazao.Text        := 'Razão Social / Nome';
     lblCnpj_cpf.Text     := 'CNPJ / CPF';
     lblIe.Text           := 'Inscrição Estadual';
     lblIm.Text           := 'Inscrição Municipal';
     lblEndereco.Text     := 'Endereço';
     lblNumero.Text       := 'Número';
     LblComplemento.Text  := 'Complemento';
     LblBairro.Text       := 'Bairro';
     LblCidade.Text       := 'Cidade';
     LblResponnsavel.Text := 'Nome do responsável pelo registro';
     LblTelefone.Text     := 'Telefone/WhatsApp';
     LblEmail.Text        := 'E-mail';
     BtnRegistrar.Text    := '&Registrar';
     LblTitulo.Text       := 'Registro do Wheel Pro';
     lblCEP.Text          := 'CEP';
     FrmRegistrar.Caption := 'Registro do Wheel Pro';
     TabItem1.Text        := 'Cadastro';
     TabItem2.Text        := 'Gerar senha';
     TabItem3.Text        := 'Enviar Serial';
     TabItem4.Text        := 'Inserir Contra-Senha';
     lblEntreseuCNPJ.Text := 'Entre seu CNPJ';
     lblSeuSerial.Text    := 'Seu Serial';
     lblNumserialHD.Text  := 'O número serial do seu HD é:';
     lblseuSErialBios.Text:= 'Seu Serial da Bios é :';
     lblContraSenha.Text  := 'Contra - Senha';
   end
   else if FLinguagem = 'Ingles' then
   begin
     lblRazao.Text        := 'Corporate Name / Name';
     lblCnpj_cpf.Text     := 'Tax Identification Number - TIN';
     lblIe.Visible        := False;
     EdtInscricaoEstadual.Visible:= False;
     lblIe.Text           := 'Inscrição Estadual';
     lblIm.Visible        := False;
     EdtIncricaoMunicipal.Visible:= False;
     lblIm.Text           := 'Inscrição Municipal';
     lblEndereco.Text     := 'Address';
     lblNumero.Text       := 'Number';
     LblComplemento.Text  := 'Complement';
     LblBairro.Text       := 'Neighborhood';
     LblCidade.Text       := 'City';
     LblResponnsavel.Text := 'Name of person responsible for registration';
     LblTelefone.Text     := 'Phone/WhatsApp';
     LblEmail.Text        := 'E-mail';
     lblCEP.Text          := 'ZIP CODE';
     BtnRegistrar.Text    := '&Register';
     LblTitulo.Text       := 'Wheel Pro registration';
     FrmRegistrar.Caption := 'Wheel Pro registration';
     TabItem1.Text        := 'Register';
     TabItem2.Text        := 'Generate Password';
     TabItem3.Text        := 'Send Serial';
     TabItem4.Text        := 'Enter Password';
     lblEntreseuCNPJ.Text := 'Enter your EIN';
     lblSeuSerial.Text    := 'Your Serial';
     lblNumserialHD.Text  := 'Serial number of your HD is:';
     lblseuSErialBios.Text:= 'Your Bios Serial is:';
     lblContraSenha.Text  := 'Password';
   end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
