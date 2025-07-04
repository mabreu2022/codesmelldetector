// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\UPrincipal.pas
// Linha: 416

// Trecho original:
// ------------------
procedure TFrmPrincipal.BtnCopiarRodaClick(Sender: TObject);
begin
  if MoveObjeto then
    Modo_Edicao(False);

  if NOT Assigned(NewCircle) then
    begin
      // Create a new TCircle component
      NewCircle := TCircle.Create(Self);

      // Copy the properties of the original TCircle component
      NewCircle.Position.X := Circle1.Position.X + 50;
      NewCircle.Position.Y := Circle1.Position.Y + 50;
      NewCircle.Width      := Circle1.Width;
      NewCircle.Height     := Circle1.Height;
      NewCircle.Fill.Color := Circle1.Fill.Color;

      //Criar o TImage dentro do NewCircle
      NewImagem:= TImage.Create(NewCircle);
      NewImagem.Parent:= NewCircle;
      NewImagem.Bitmap.Assign(TImage(Circle1.Children[0]).Bitmap);
      NewImagem.Align:=  TalignLayout.Client;

      // Eventos
      //NewImagem.OnClick      :=  NewImagemClick;
      NewImagem.OnDblClick   :=  NewImagemDbClick;
      NewImagem.OnGesture    :=  NewImagemGesture;
      NewImagem.OnMouseDown  :=  NewImagemMouseDown;
      NewImagem.OnMouseUp    :=  NewImagemMouseUp;
      NewImagem.OnMouseWheel :=  NewImagemMouseWheel;

      NewCircle.Parent := Self; //Cria no Formulário Principal
    end
    else //apagar o mesmo ou receber a copia da Matrix Atual
    begin
      //Criar o TImage dentro do NewCircle
      NewImagem.BitMap.Clear($000000);
      NewImagem:= TImage.Create(nil); //NewCircle - original
      NewImagem.Parent:= NewCircle;
      NewImagem.Bitmap.Assign(TImage(Circle1.Children[0]).Bitmap);
      NewImagem.Align:=  TalignLayout.Client;

      // Copy the events from the original TImage to the new TImage
      //NewImagem.OnClick      :=  NewImagemClick; //Ficou com o clique esquerdo sem função
      NewImagem.OnDblClick   :=  NewImagemDbClick;
      NewImagem.OnGesture    :=  NewImagemGesture;
      NewImagem.OnMouseDown  :=  NewImagemMouseDown;
      NewImagem.OnMouseUp    :=  NewImagemMouseUp;
      NewImagem.OnMouseWheel :=  NewImagemMouseWheel;

      //Exit;
    end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
