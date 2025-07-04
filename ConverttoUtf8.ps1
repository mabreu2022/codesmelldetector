# Caminho base do projeto (altere se necessário)
$basePath = "C:\Fontes\CodeSmellDetector"

# Caminho do relatório
$relatorioPath = Join-Path $basePath "relatorio_conversao.txt"
$arquivosAlterados = @()

# Extensões de arquivos Delphi
$extensions = @("*.pas", "*.dpr", "*.dfm")

# Mapeamento de substituições Unicode → ASCII
$substituicoes = @{
    "á" = "a"; "à" = "a"; "ã" = "a"; "â" = "a"; "ä" = "a"
    "é" = "e"; "è" = "e"; "ê" = "e"; "ë" = "e"
    "í" = "i"; "ì" = "i"; "î" = "i"; "ï" = "i"
    "ó" = "o"; "ò" = "o"; "õ" = "o"; "ô" = "o"; "ö" = "o"
    "ú" = "u"; "ù" = "u"; "û" = "u"; "ü" = "u"
    "ç" = "c"; "ñ" = "n"
    "Á" = "A"; "À" = "A"; "Ã" = "A"; "Â" = "A"; "Ä" = "A"
    "É" = "E"; "È" = "E"; "Ê" = "E"; "Ë" = "E"
    "Í" = "I"; "Ì" = "I"; "Î" = "I"; "Ï" = "I"
    "Ó" = "O"; "Ò" = "O"; "Õ" = "O"; "Ô" = "O"; "Ö" = "O"
    "Ú" = "U"; "Ù" = "U"; "Û" = "U"; "Ü" = "U"
    "Ç" = "C"; "Ñ" = "N"
    "⚠️" = "[!]"; "✅" = "[OK]"; "❌" = "[X]"; "✔️" = "[v]"
}

function IsAnsiFile($filePath) {
    $bytes = [System.IO.File]::ReadAllBytes($filePath)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        return $false
    }
    foreach ($b in $bytes) {
        if ($b -gt 127) { return $true }
    }
    return $false
}

function LimparUnicode($texto) {
    foreach ($chave in $substituicoes.Keys) {
        $texto = $texto -replace [regex]::Escape($chave), $substituicoes[$chave]
    }
    return $texto
}

function ConverterArquivo($filePath) {
    $backupPath = "$filePath.bak"
    Copy-Item $filePath $backupPath -Force

    $conteudo = Get-Content $filePath -Raw -Encoding Default
    $conteudoLimpo = LimparUnicode $conteudo
    [System.IO.File]::WriteAllText($filePath, $conteudoLimpo, [System.Text.Encoding]::UTF8)

    $arquivosAlterados += $filePath
    Write-Host "[v] Convertido e limpo: $filePath"
}

# Limpa relatório anterior
if (Test-Path $relatorioPath) {
    Remove-Item $relatorioPath -Force
}

# Processa todos os arquivos
foreach ($ext in $extensions) {
    Get-ChildItem -Path $basePath -Recurse -Filter $ext | ForEach-Object {
        if (IsAnsiFile $_.FullName) {
            ConverterArquivo $_.FullName
        } else {
            Write-Host "[=] Ja esta em UTF-8: $($_.FullName)"
        }
    }
}

# Gera relatório
if ($arquivosAlterados.Count -gt 0) {
    "Arquivos convertidos e limpos:" | Out-File -FilePath $relatorioPath -Encoding UTF8
    $arquivosAlterados | Out-File -Append -FilePath $relatorioPath -Encoding UTF8
    Write-Host "`nRelatorio salvo em: $relatorioPath"
    Write-Host "`nConteudo do relatorio:"
    Get-Content $relatorioPath
} else {
    Write-Host "`nNenhum arquivo ANSI encontrado para conversao."
}