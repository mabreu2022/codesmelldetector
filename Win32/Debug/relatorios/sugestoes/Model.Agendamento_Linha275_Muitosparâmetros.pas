// Sugest�o de corre��o para o smell: Muitos par�metros
// Arquivo original: c:\fontes\Cargas\cargas\Model\Model.Agendamento.pas
// Linha: 275

// Trecho original:
// ------------------
class function TModelAgendamento.enviarEmail2(aSubject: string;aPlaca: String;aNF: Integer;aLocais: string;aTelefone: string;aEmail:string; aData: TDateTime; aHora: string; aObs:String): Boolean;

// Sugest�o:
// Agrupe os par�metros em um record ou classe para melhorar a legibilidade.
