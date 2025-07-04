# Caminho base do projeto (altere se necessário)
$basePath = "C:\Fontes\CodeSmellDetector"

# Caminho do relatório
$relatorioPath = Join-Path $basePath "relatorio_conversao.txt"
$arquivosAlterados = @()

# Extensoes de arquivos Delphi
$extensions = @("*.pas", "*.dpr", "*.dfm")

# Substituicoes Unicode → ASCII (usando códigos Unicode)
$substituicoes = @{
    "`u00e1" = "a"; "`u00e0" = "a"; "`u00e3" = "a"; "`u00e2" = "a"
    "`u00e9" = "e"; "`u00ea" = "e"
    "`u00ed" = "i"
    "`u00f3" = "o"; "`u00f5" = "o"; "`u00f4" = "o"
    "`u00fa" = "u"
    "`u00e7" = "c"
    "`u00c1" = "A"; "`u00c0" = "A"; "`u00c3" = "A"; "`u00c2" = "A"
    "`u00c9" = "E"; "`u00ca" = "E"
    "`u00cd" = "I"
    "`u00d3" = "O"; "`u00d5" = "O"; "`u00d4" = "O"
    "`u00da" = "U"
    "`u00c7" = "C"
    "`u26a0" = "[!]"; "`u2705" = "[OK]"; "`u274c" = "[X]"; "`u2714" = "[v]"
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
        $unicodeChar = [char]([convert]::ToInt32($chave.Replace("`u", ""), 16))
        $texto = $texto -replace [regex]::Escape($unicodeChar), $substituicoes[$chave]
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

# Limpa relatorio anterior
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

# Gera relatorio
if ($arquivosAlterados.Count -gt 0) {
    "Arquivos convertidos e limpos:" | Out-File -FilePath $relatorioPath -Encoding UTF8
    $arquivosAlterados | Out-File -Append -FilePath $relatorioPath -Encoding UTF8
    Write-Host "`nRelatorio salvo em: $relatorioPath"
    Write-Host "`nConteudo do relatorio:"
    Get-Content $relatorioPath
} else {
    Write-Host "`nNenhum arquivo ANSI encontrado para conversao."
}