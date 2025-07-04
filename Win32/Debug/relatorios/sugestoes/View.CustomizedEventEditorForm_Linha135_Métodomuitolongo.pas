// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Cargas\cargas\View\View.CustomizedEventEditorForm.pas
// Linha: 135

// Trecho original:
// ------------------
procedure TcxSchedulerEventEditorCustomized.btnOkClick(Sender: TObject);
var
  //EnviarConfirmacao: TModelAgendamento;
  LIdLocal: integer;
  qryIdLocal: TFDQuery;
  qryIdVeiculo:TFDQuery;
  qryFila: TFDQuery;
begin
  inherited;

  //localizar o veiculo pela placa no cadastro para pegar o idveiculo
  qryIdVeiculo:= TFDQuery.Create(nil);
  qryIdVeiculo.Connection:= DataModule3.FDConnection1;
  try
    qryIdVeiculo.SQL.Add('select idveiculos from veiculos');
    qryIdVeiculo.SQL.Add(' where placa = :placa');
    qryIdVeiculo.parambyname('placa').AsString := Event.GetCustomFieldValueByName('Placa'); //CBPlacasVeiculos.EditValue;//cxTextEdit1.editValue;
    qryIdVeiculo.open;

    if qryIdVeiculo.RecordCount > 0 then
    begin
      //Preenche parâmetros a serem enviados no e-mail
      LSubject    := teSubject.EditValue;
      LLocal      := Event.GetCustomFieldValueByName('Locais');// cxDBComboBoxLocais.;//cxDBComboBoxLocais.EditValue;     //como pegar o valor selecionado
      LPlaca      := Event.GetCustomFieldValueByName('Placa');//CBPlacasVeiculos.Text;//cxTextEdit1.EditValue;
      LNF         := cxTextEdit2.EditValue;
      LidVeiculo  := qryIdVeiculo.FieldByName('idveiculos').AsInteger;
      LNotaFiscal := cxTextEdit2.editValue;
      LTelefone   := cxTextEdit3.EditValue;
      LEmail      := cxTextEdit4.EditValue;
      LData       := deStart.EditingValue;
      LHora       := teStart.EditValue;
      LObs        := meMessage.EditValue;

      LMemo := TStringList.Create;
      LMemo.Add(LSubject);
      LMemo.Add('Local    :' + LLocal);
      LMemo.Add('Placa    :' + LPlaca);
      LMemo.Add('NF       :' + IntToStr(LNotaFiscal));
      LMemo.Add('Telefone :' + LTelefone);
      LMemo.Add('E-mail   :' + LEMail);
      LMemo.Add('Data     :' + DateTimeToStr(LData));
      LMemo.Add('Hora     :' + LHora);
      LMemo.Add('Obs.     :' + LObs);

    end
    else
    begin
      TThread.Synchronize(nil,
      procedure
      begin
        ShowMessage('Veiculo Não cadastrado!');
        //Inserir o veiculo na tabela veiculos
        Application.CreateForm(TFrmEntradaVeiculos, FrmEntradaVeiculos);
        FrmEntradaVeiculos.ShowModal;
      end);
    end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
