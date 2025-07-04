// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Registro.pas
// Linha: 70

// Trecho original:
// ------------------
      procedure Setativo(const Value: string);
      procedure Setbairro(const Value: string);
      procedure Setcidade(const Value: string);
      procedure Setcnpj(const Value: string);
      procedure Setcomplemento(const Value: string);
      procedure Setemail(const Value: string);
      procedure Setendereco(const Value: string);
      procedure Setnumero(const Value: integer);
      procedure Setrazao(const Value: string);
      procedure Setresponsavel(const Value: string);
      procedure Settelefone(const Value: string);
      procedure Setuf(const Value: string);
      procedure Setdataregistro(const Value: TDatetime);
      procedure SetCEP(const Value: string);
      procedure Setie(const Value: string);
      procedure Setim(const Value: string);
      procedure SetLinguagem(const Value: string);
      procedure Setcontato(const Value: string);
      procedure Settelcontato(const Value: string);
      procedure Setserial(const Value: string);
      function  GetWMIstring(const WMIClass, WMIProperty:string): string;
      procedure SetOnLabel6TextChanged(const Value: TNotifyEvent);
      procedure Setserialhd(const Value: string);
      procedure SetContraSenha(const Value: String);
      procedure SetData_exp(const Value: TDateTime);
    procedure Setid_chave(const Value: string);
    public
      property razao       : string    read Frazao write Setrazao;
      property cnpj        : string    read Fcnpj write Setcnpj;
      property ie          : string    read Fie write Setie;
      property im          : string    read Fim write Setim;
      property endereco    : string    read Fendereco write Setendereco;
      property numero      : integer   read Fnumero write Setnumero;
      property complemento : string    read Fcomplemento write Setcomplemento;
      property bairro      : string    read Fbairro write Setbairro;
      property cidade      : string    read Fcidade write Setcidade;
      property uf          : string    read Fuf write Setuf;
      property CEP         : string    read FCEP write SetCEP;
      property ativo       : string    read Fativo write Setativo;
      property responsavel : string    read Fresponsavel write Setresponsavel;
      property contato     : string    read Fcontato write Setcontato;
      property telcontato  : string    read Ftelcontato write Settelcontato;
      property telefone    : string    read Ftelefone write Settelefone;
      property email       : string    read Femail write Setemail;
      property dataregistro: TDatetime read Fdataregistro write Setdataregistro;
      property Linguagem   : string    read FLinguagem write SetLinguagem;
      property serial      : string    read Fserial write Setserial;  //transferir do projeto antigo para esse
      property serialhd    : string    read Fserialhd write Setserialhd;
      property ContraSenha : String    read FContraSenha write SetContraSenha;
      property Data_exp    : TDateTime read FData_exp write SetData_exp;
      property id_chave    : string    read Fid_chave write Setid_chave;

      //Verificar se será necessário criar mais propertys para a tabela Registro
      property OnLabel6TextChanged: TNotifyEvent read FOnLabel6TextChanged write SetOnLabel6TextChanged;
      procedure enviarEmail; //Já chama  aqui a gravação no banco de  licenças
      function GerarSerial: string;
      class function validarDados(aRegistro: TModelRegistro ; aLingua: string) : boolean;
      class function GravarNoBancoLicencas(aRegistro : TModelRegistro): Boolean;  //Tabela Chaves
      class function ValidarLicenca(adata: TDateTime; acnpj: string): Boolean;
      class function GravarRegistro(aRegistro: TModelRegistro; achave: String): Boolean;
      class function GravarContraSenha(aRegistro: TModelRegistro): Boolean;

      constructor create;
      destructor destroy;override;

  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
