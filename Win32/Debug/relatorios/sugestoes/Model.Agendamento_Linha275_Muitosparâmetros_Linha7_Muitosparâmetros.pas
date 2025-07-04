// Sugestão de correção para o smell: Muitos parâmetros
// Arquivo original: c:\fontes\CodeSmellDetector\Win32\Debug\relatorios\sugestoes\Model.Agendamento_Linha275_Muitosparâmetros.pas
// Linha: 7

// Trecho original:
// ------------------
class function TModelAgendamento.enviarEmail2(aSubject: string;aPlaca: String;aNF: Integer;aLocais: string;aTelefone: string;aEmail:string; aData: TDateTime; aHora: string; aObs:String): Boolean;

// Sugestão:
// Agrupe os parâmetros em um record ou classe para melhorar a legibilidade.
