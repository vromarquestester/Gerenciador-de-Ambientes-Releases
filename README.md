# Gerenciador de Ambientes — downloads

Vitrine pública do **Gerenciador de Ambientes**, a ferramenta interna que
provisiona, atualiza e sobe ambientes do Protheus.

Aqui só ficam os pacotes prontos para baixar. O código-fonte é privado.

## Instalar no Windows (recomendado)

Abra o **PowerShell** (não precisa ser como administrador), cole o comando
abaixo e tecle Enter:

```powershell
irm https://raw.githubusercontent.com/vromarquestester/Gerenciador-de-Ambientes-Releases/main/instalar.ps1 | iex
```

O comando baixa o instalador da versão mais recente e o abre. O único aviso
que aparece é o do Windows pedindo permissão de administrador (UAC), necessária
para instalar em *Arquivos de Programas*. Depois é só seguir as telas.

O que o instalador faz:

- instala em `C:\Program Files\Gerenciador de Ambientes`;
- cria o atalho no menu Iniciar e, se você marcar, na área de trabalho;
- registra o programa em **Configurações → Aplicativos → Aplicativos
  instalados**, de onde ele pode ser desinstalado.

O script que o comando executa é o [`instalar.ps1`](instalar.ps1), na raiz
deste repositório: dá para ler antes de rodar.

Ao abrir, o Gerenciador continua pedindo permissão de administrador. Isso é
esperado: ele escreve as permissões das pastas do Protheus, cria a fonte ODBC
e inicia o serviço do SQL Server.

## Alternativa: baixar o instalador pelo navegador

Em **[Releases](../../releases/latest)**, na seção *Assets*, baixe o
`GerenciadorAmbientes_Setup.exe` e execute.

Por esse caminho o Windows mostra uma tela azul, **"O Windows protegeu o
computador"** (Microsoft Defender SmartScreen). Ela aparece porque o instalador
**ainda não tem assinatura digital** (certificado de *code signing*) e o
Windows marca como "vindo da internet" tudo o que é baixado pelo navegador,
Teams ou e-mail. Não é sinal de vírus: é o aviso padrão para programa sem
editor registrado.

Para continuar:

1. clique em **Mais informações**;
2. confira que o arquivo é `GerenciadorAmbientes_Setup.exe`;
3. clique em **Executar assim mesmo**.

O aviso aparece só no instalador. O programa instalado e as atualizações
seguintes não passam por ele. Pelo comando `irm` acima a tela não aparece,
porque o download feito pelo PowerShell não recebe a marca da internet.

Se a sua máquina não mostrar o botão **Executar assim mesmo** (política da
empresa), use o comando `irm`.

## Versão portátil (zip)

O `.zip` de cada versão continua em [Releases](../../releases), em *Assets*.
Extraia numa pasta e rode o `GerenciadorAmbientes.exe`. Ele pede elevação e,
na primeira vez, também pode mostrar o aviso do SmartScreen explicado acima.

Só a versão mais recente fica anexada. Versões antigas continuam listadas, com
as notas do que mudou, mas sem o arquivo.

## Atualização

A partir da versão 2.7.0 o programa se atualiza sozinho, instalado ou portátil:
verifica se há versão nova, baixa em segundo plano e troca o executável na
abertura seguinte.

Não é preciso voltar aqui a cada versão — este download é só o primeiro.

Em **Configurações → Atualização** dá para verificar na hora, desligar a
atualização automática ou voltar à versão anterior.

## `latest.json`

O arquivo na raiz deste repositório é o manifesto que o programa instalado
consulta: versão publicada, link do pacote, `sha256` e o que mudou. Ele é
gravado pela automação de release — não edite à mão.
