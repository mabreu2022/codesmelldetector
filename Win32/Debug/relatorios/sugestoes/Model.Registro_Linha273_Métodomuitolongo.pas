// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Model\Model.Registro.pas
// Linha: 273

// Trecho original:
// ------------------
function TModelRegistro.GerarSerial: string;
var
  x:string;
  Y:string;
  z:string;
  data : TDateTime;
  qry, qry2: TFDQuery;
  Registrarfrm: TFrmRegistrar;
begin
  Result:= '';
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  X:=Trim(GetWMIstring('Win32_BIOS','SerialNumber')); //Serial da Bios
  Y:=Trim(GetWMIstring('Win32_PhysicalMedia','SerialNumber')); //Serial do HD

  //label6.Caption:= x;
  //label4.Caption:= y;
  z:=x+y+(DateToStr(date));
  //label5.Caption:=z;
  Result:= z;

  qry:= TFDquery.Create(nil);
  qry.Connection  := TConexaoLicencas.CreateConnection;
  try
    qry.SQL.Clear;
    qry.SQL.Add('select * from registro');
    qry.SQL.Add('');

    qry.ExecSQL;
    qry.Connection.Commit;

    with qry do

     //FDQuery1.Edit;
     //Desabilitar botao Geral Serial
     //Edit1.Enabled:=False;
     //BtnRegistrar.Enabled:=False;
     //Button1.Enabled:=False;
     //PageControl1.Pages[1].TabVisible := False;
     // fim


     qry.FieldByName('chave').AsString      := z;
     qry.FieldByName('Data_inc').AsDateTime := Date;
     Data := date;
     qry.FieldByName('Data_exp').AsDateTime:=Data;
     //ShowMessage(DateToStr(Data+30));
     qry.FieldByName('serialhd').AsString:=y;

     qry.FieldByName('ID_Chave').AsInteger := qry2.FieldByName('ID_Chave').AsInteger;

     qry.FieldByName('contrasenha').AsString:='0';
     qry.FieldByName('ativado').AsString:='N';
     qry.Post;

  finally
     qry.Free;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
