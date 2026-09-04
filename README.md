# Gerenciador de Ambientes — downloads

Vitrine pública do **Gerenciador de Ambientes**, a ferramenta interna que
provisiona, atualiza e sobe ambientes do Protheus.

Aqui só ficam os pacotes prontos para baixar. O código-fonte é privado.

## Baixar

O `.zip` de cada versão está em **[Releases](../../releases)**, na seção
*Assets*. Extraia numa pasta e rode o `GerenciadorAmbientes.exe` — ele pede
elevação, que é necessária para escrever as permissões das pastas do Protheus.

Só a versão mais recente fica anexada. Versões antigas continuam listadas, com
as notas do que mudou, mas sem o arquivo.

## Atualização

A partir da versão 2.7.0 o programa se atualiza sozinho: verifica se há versão
nova, baixa em segundo plano e troca o executável na abertura seguinte.

Não é preciso voltar aqui a cada versão — este download é só o primeiro.

Em **Configurações → Atualização** dá para verificar na hora, desligar a
atualização automática ou voltar à versão anterior.

## `latest.json`

O arquivo na raiz deste repositório é o manifesto que o programa instalado
consulta: versão publicada, link do pacote, `sha256` e o que mudou. Ele é
gravado pela automação de release — não edite à mão.
