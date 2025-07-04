// Sugest�o de corre��o para o smell: M�todo muito longo
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\URegistrar_Linha349_M�todomuitolongo.pas
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
     lblRazao.Text        := 'Raz�o Social / Nome';
     lblCnpj_cpf.Text     := 'CNPJ / CPF';
     lblIe.Text           := 'Inscri��o Estadual';
     lblIm.Text           := 'Inscri��o Municipal';
     lblEndereco.Text     := 'Endere�o';
     lblNumero.Text       := 'N�mero';
     LblComplemento.Text  := 'Complemento';
     LblBairro.Text       := 'Bairro';
     LblCidade.Text       := 'Cidade';
     LblResponnsavel.Text := 'Nome do respons�vel pelo registro';
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
     lblNumserialHD.Text  := 'O n�mero serial do seu HD �:';
     lblseuSErialBios.Text:= 'Seu Serial da Bios � :';
     lblContraSenha.Text  := 'Contra - Senha';
   end
   else if FLinguagem = 'Ingles' then
   begin
     lblRazao.Text        := 'Corporate Name / Name';
     lblCnpj_cpf.Text     := 'Tax Identification Number - TIN';
     lblIe.Visible        := False;
     EdtInscricaoEstadual.Visible:= False;
     lblIe.Text           := 'Inscri��o Estadual';
     lblIm.Visible        := False;
     EdtIncricaoMunicipal.Visible:= False;
     lblIm.Text           := 'Inscri��o Municipal';
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


// Sugest�o:
// Divida o m�todo em subm�todos menores com nomes descritivos.
