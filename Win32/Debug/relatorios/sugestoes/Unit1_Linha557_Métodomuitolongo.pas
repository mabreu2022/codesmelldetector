// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\carregar vumeter em panel\Unit1.pas
// Linha: 557

// Trecho original:
// ------------------
procedure TForm1.ToggleFullScreen;
const
  ID_FULLSCREEN = 897;
begin
  if MPCHandle = 0 then Exit;

  if not MPCFullScreenMode then
  begin
    // === Entrar em tela cheia ===

    // Remove do painel
    Winapi.Windows.SetParent(MPCHandle, 0);

    // Restaura bordas/janela
    SetWindowLong(MPCHandle, GWL_STYLE,
      GetWindowLong(MPCHandle, GWL_STYLE) or WS_CAPTION or WS_THICKFRAME);

    // Traz para frente
    SetForegroundWindow(MPCHandle);

    // Entra em fullscreen (Alt+Enter)
    SendMessage(MPCHandle, WM_COMMAND, ID_FULLSCREEN, 0);

    // Marca estado
    MPCFullScreenMode := True;

    // Atualiza texto do botão
    btnToggleFull.Caption := 'Voltar ao Painel';
  end
  else
  begin
    // === Voltar ao painel ===

    // Sai do fullscreen
    SendMessage(MPCHandle, WM_COMMAND, ID_FULLSCREEN, 0);
    Sleep(300);

    // Remove bordas
    SetWindowLong(MPCHandle, GWL_STYLE,
      GetWindowLong(MPCHandle, GWL_STYLE) and not WS_CAPTION and not WS_THICKFRAME);

    // Volta ao painel
    Winapi.Windows.SetParent(MPCHandle, Panel3.Handle);

    // Redimensiona
    SetWindowPos(MPCHandle, 0, 0, 0, Panel3.Width, Panel3.Height, SWP_NOZORDER or SWP_SHOWWINDOW);

    // Marca estado
    MPCFullScreenMode := False;

    // Atualiza texto do botão
    btnToggleFull.Caption := 'Tela Cheia';
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
