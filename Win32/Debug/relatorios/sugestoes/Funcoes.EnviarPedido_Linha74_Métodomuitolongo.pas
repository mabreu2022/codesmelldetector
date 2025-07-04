// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Funcoes\Funcoes.EnviarPedido.pas
// Linha: 74

// Trecho original:
// ------------------
    procedure SetidCliente(const Value: Integer);
    procedure SetStatusPedido(const Value: Integer);
    procedure SetTotalPedido(const Value: currency);
    procedure Setbairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure Setcidade(const Value: string);
    procedure Setcnpj(const Value: string);
    procedure Setcomplemento(const Value: string);
    procedure Setcontato(const Value: string);
    procedure Setemail(const Value: string);
    procedure Setendereco(const Value: string);
    procedure Setie(const Value: string);
    procedure Setim(const Value: string);
    procedure Setnumero(const Value: integer);
    procedure Setrazao(const Value: string);
    procedure Setresponsavel(const Value: string);
    procedure Settelcontato(const Value: string);
    procedure Settelefone(const Value: string);
    procedure Setuf(const Value: string);
    procedure SetidPedido(const Value: Integer);
    procedure SetidProduto(const Value: Integer);
    procedure SetPrecoUnitario(const Value: Currency);
    procedure SetQuantidade(const Value: Integer);
    procedure SetTotaldoItem(const Value: Currency);
    procedure SetCelularContato(const Value: String);
    procedure SetEmailContato(const Value: String);
    procedure SetNomeContato(const Value: String);
    procedure SetTelefoneConteto(const Value: String);
    procedure SetLinguagem(const Value: string);

    public
      //Dados do Pedido
      property IdPedido: Integer read FIdPedido write SetIdPedido;
      property idCliente: Integer read FidCliente write SetidCliente;
      property StatusPedido: Integer read FStatusPedido write SetStatusPedido;
      property TotalPedido: currency read FTotalPedido write SetTotalPedido;

      //Itens do Pedido
      property idProduto: Integer read FidProduto write SetidProduto;
      property Quantidade: Integer read FQuantidade write SetQuantidade;
      property PrecoUnitario: Currency read FPrecoUnitario write SetPrecoUnitario;
      property TotaldoItem: Currency read FTotaldoItem write SetTotaldoItem;

      //Dados do cliente
       property razao       : string read Frazao write Setrazao;
       property cnpj        : string read Fcnpj write Setcnpj;
       property ie          : string read Fie write Setie;
       property im          : string read Fim write Setim;
       property endereco    : string read Fendereco write Setendereco;
       property numero      : integer read Fnumero write Setnumero;
       property complemento : string read Fcomplemento write Setcomplemento;
       property bairro      : string read Fbairro write Setbairro;
       property cidade      : string read Fcidade write Setcidade;
       property uf          : string read Fuf write Setuf;
       property CEP         : string read FCEP write SetCEP;
       property responsavel : string read Fresponsavel write Setresponsavel;
       property contato     : string read Fcontato write Setcontato;
       property telcontato  : string read Ftelcontato write Settelcontato;
       property telefone    : string read Ftelefone write Settelefone;
       property email       : string read Femail write Setemail;
       property NomeContato: String read FNomeContato write SetNomeContato;
       property TelefoneConteto: String read FTelefoneConteto write SetTelefoneConteto;
       property CelularContato: String read FCelularContato write SetCelularContato;
       property EmailContato: String read FEmailContato write SetEmailContato;
       property Linguagem   : string read FLinguagem write SetLinguagem;

      function enviarPedido(aEmail: String): Boolean;
      procedure PrencherDadosDoPedido(aidcliente: Integer;aStatusPedido:Integer;aTotalPedido: Currency);
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
