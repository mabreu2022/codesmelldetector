// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\obtendo numero serial do hd\UnitGerarSerial.pas
// Linha: 306

// Trecho original:
// ------------------
procedure TFRMGERARSERIAL.Button4Click(Sender: TObject);
var
    IdSMTP1: TIdSMTP;
    Idmessage: TIdMessage;
    TextoMsg: TidText;
    IdSSL: TIdSSLIOHandlerSocketOpenSSL;
    contatol:string;
    emaill:string;
    telcontatol:string;
    const
    CRFL = #13#10;

begin
    IdSMTP1                 := TIdSMTP.create(nil);
    IdSMTP1.ConnectTimeout  := 10000;
    IdSMTP1.ReadTimeout     := 10000;

    IdMessage               := TIdMessage.create(nil);
    IdMessage.Clear;
    IdMessage.CharSet       := 'iso-8859-1';
    IdMessage.Encoding      := MeMIME;
    IdMessage.ContentType   := 'multipart/related'   ;
    IdMessage.subject       := 'Novo Serial Gerado do cliente: ' +FDQuery2.FieldByName('razao').AsString ;

    textomsg                := TIdText.Create(IdMessage.MessageParts);
    //textomsg.Body.Text      := 'Se você consegue ler isto então é porque funcionou o teste!';
    contatol    := FDQuery2.FieldByName('contato').AsString;
    emaill      := FDQuery2.FieldByName('email').AsString;
    telcontatol := FDQuery2.FieldByName('telcontato').AsString;
    Memo1.Lines.Add(contatol);
    Memo1.Lines.Add(emaill);
    Memo1.Lines.Add(telcontatol);
    //TextoMsg.Body.Text      :=Memo1.Lines.Text + #13 + 'Serial gerado: '+Label5.Caption;

    //TextoMsg.Body.Text      :=Memo1.Lines.Text;
    TextoMsg.Body.Add('Chave Gerada: '+Label5.Caption+'<br/>');
    TextoMsg.Body.Add(contatol+'<br/>');
    TextoMsg.Body.Add(emaill+'<br/>');
    TextoMsg.Body.Add(telcontatol+'<br/>');


    textomsg.ContentType    := 'text/html';

    if ((cbtipo.itemindex = 0) or (cbtipo.itemindex = 2)) then
    begin
        // GMAIL e YAHOO

        if cbtipo.itemindex = 0 then
        begin
            idSMTP1.Host            := 'smtp.gmail.com';
            idSMTP1.Username        := 'delphi.send@gmail.com';
            idSMTP1.Password        := 'delphi.send12345';
        end
        else begin
            idSMTP1.Host            := 'smtp.mail.yahoo.com';
            idSMTP1.Username        := 'email@yahoo.com.br';
            idSMTP1.Password        := 'senha';
        end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
