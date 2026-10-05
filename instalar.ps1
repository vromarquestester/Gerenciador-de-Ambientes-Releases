# Instala o Gerenciador de Ambientes baixando o setup sem passar pelo navegador.
#
# Por que existe: arquivo baixado pelo navegador, Teams ou Outlook ganha a
# "marca da internet" (stream Zone.Identifier) e o SmartScreen barra o setup sem
# assinatura. O Invoke-WebRequest do Windows PowerShell 5.1 não grava essa marca,
# então o único aviso que sobra é o UAC do próprio setup.
#
# Uso (PowerShell normal, não precisa abrir como administrador):
#   irm <url deste script> | iex
# ou, com o script local:
#   powershell -ExecutionPolicy Bypass -File .\instalar.ps1 [-Url <setup>] [-Sha256 <hash>]

param(
    [string]$Url    = $(if ($env:GA_SETUP_URL)    { $env:GA_SETUP_URL }    else { 'https://github.com/vromarquestester/Gerenciador-de-Ambientes-Releases/releases/latest/download/GerenciadorAmbientes_Setup.exe' }),
    [string]$Sha256 = $(if ($env:GA_SETUP_SHA256) { $env:GA_SETUP_SHA256 } else { '' })
)

$ErrorActionPreference = 'Stop'
$ProgressPreference    = 'SilentlyContinue'   # a barra do iwr no 5.1 deixa o download lento
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$destino = Join-Path $env:TEMP 'GerenciadorAmbientes_Setup.exe'

try {
    Write-Host "Baixando o instalador do Gerenciador de Ambientes..."
    Invoke-WebRequest -Uri $Url -OutFile $destino -UseBasicParsing

    if ($Sha256) {
        $obtido = (Get-FileHash -Path $destino -Algorithm SHA256).Hash
        if ($obtido -ne $Sha256.ToUpper()) {
            throw "O arquivo baixado não confere com o hash esperado. Instalação cancelada."
        }
        Write-Host "Hash conferido."
    }

    # Garantia extra: se algum proxy ou ferramenta tiver marcado o arquivo, tira.
    Unblock-File -Path $destino

    Write-Host "Abrindo o instalador (o Windows vai pedir permissão de administrador)..."
    $processo = Start-Process -FilePath $destino -Wait -PassThru
    if ($processo.ExitCode -eq 0) {
        Write-Host "Gerenciador de Ambientes instalado."
    } else {
        Write-Host "O instalador terminou com código $($processo.ExitCode) (cancelado ou com erro)."
    }
}
catch {
    Write-Host "Falha: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    Remove-Item -Path $destino -Force -ErrorAction SilentlyContinue
}
