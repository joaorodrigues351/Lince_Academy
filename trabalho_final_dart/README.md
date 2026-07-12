# Trabalho final Dart — Relatório climático (SC x SP)

Programa de linha de comando que lê os arquivos CSV dos sensores meteorológicos
e monta os relatórios de comparação climática entre Santa Catarina e São Paulo
pedidos pelo Marcelo.

## Como executar

Os arquivos dos sensores devem estar no diretório `C:\clima\sensores`, com o nome
no padrão `[SIGLA_DO_ESTADO]_[ANO]_[MÊS].csv` (ex.: `SC_2024_1.csv`).

```bash
dart pub get
dart run bin/trabalho_final_dart.dart
```

Ao abrir, o programa exibe o menu:

```
Olá, Marcelo. Que relatório você precisa?
  1 - Temperatura
  2 - Umidade
  3 - Direção do vento
  0 - Sair
      Digite o número da opção desejada:
```

Depois de exibir o relatório, o programa pergunta se ele deve ser salvo em um
arquivo de texto. Os arquivos são gravados na pasta `relatorios/`, seguindo a
nomenclatura pedida: `clima_[DATA]_[HORA].txt`, `umidade_[DATA]_[HORA].txt` e
`vento_[DATA]_[HORA].txt` (ex.: `clima_2025-01-01_00-00.txt`). O conteúdo é
gravado sem os códigos de cor.

Para rodar com a base em outro diretório (útil em testes), basta passar o
caminho como argumento:

```bash
dart run bin/trabalho_final_dart.dart caminho/para/os/csv
```

## O que cada relatório traz

| Relatório | Informações |
| --- | --- |
| Temperatura | Média, máxima e mínima por estado por ano e por mês, e média por horário por estado |
| Umidade | Média, máxima e mínima por estado por ano e por mês |
| Direção do vento | Direção com maior frequência por estado por ano e por mês, com a velocidade média e máxima |

### Unidades e cores

- **Temperatura**: Celsius (vermelho), Fahrenheit (amarelo) e Kelvin (azul)
- **Umidade**: médias em verde, máximas em vermelho e mínimas em azul
- **Vento**: direção em graus e radianos, velocidade em m/s, km/h e mph, sempre em amarelo

As cores no terminal são aplicadas com a biblioteca externa
[yaansi](https://pub.dev/packages/yaansi).

## Organização do código

```
bin/trabalho_final_dart.dart          menu de linha de comando
lib/src/leitura.dart                  uma leitura horária dos sensores
lib/src/repositorio_de_leituras.dart  leitura assíncrona dos CSV (dart:io)
lib/src/estatisticas.dart             médias, máximas, mínimas e moda
lib/src/relatorios.dart               montagem dos três relatórios
lib/src/relatorio.dart                linhas e trechos coloridos (yaansi)
lib/src/exportador_de_relatorios.dart gravação dos .txt
lib/src/conversoes.dart               Fahrenheit, Kelvin, km/h, mph e radianos
lib/src/excecoes.dart                 falhas previstas do programa
test/                                 testes automatizados
```

A separação entre `Trecho` (texto + cor) e a renderização permite exibir a mesma
linha colorida no terminal e sem cor nenhuma no arquivo de texto, sem duplicar a
formatação.

## Jornada de desenvolvimento

**Leitura dos arquivos.** Os CSV estão codificados em **latin-1**, não em UTF-8 —
lidos como UTF-8, o cabeçalho vem com `M�s` e `Dire��o`. O repositório lê os bytes
e decodifica com `latin1`. Os 24 arquivos são lidos em paralelo com `Future.wait`,
e o estado e o ano são extraídos do próprio nome do arquivo.

**Direção do vento: o dado que engana.** O valor mais frequente de direção é `0°`
(1889 leituras em SC). Investigando os dados, **em todas essas leituras a
velocidade do vento é 0 m/s**: são registros de calmaria, não uma direção real.
Reportar "0°" como a direção predominante seria enganoso, então as leituras sem
vento ficam fora do cálculo da moda, e o relatório informa quantas foram
desconsideradas. Com isso, a direção predominante em SC passa a ser 30°, que é
de fato a mais frequente entre as leituras com vento.

**Cores e arquivo de texto.** Colorir a string inteira impediria usar cores
diferentes por unidade na mesma linha (Celsius em vermelho, Fahrenheit em amarelo
e Kelvin em azul). Por isso cada linha é uma lista de trechos com sua própria cor:
o terminal recebe a versão colorida e o arquivo `.txt`, a versão limpa.

**Tratamento de erros.** As falhas previstas (diretório sem arquivos, arquivo
ilegível, linha corrompida) têm exceções próprias com mensagens explicando o que
aconteceu, capturadas no menu para que o programa não quebre e continue rodando.

## Testes

```bash
dart test
```

Os testes cobrem a leitura dos CSV (inclusive latin-1 e arquivos corrompidos), as
conversões de unidade, as estatísticas, as cores exigidas em cada relatório e a
nomenclatura dos arquivos gerados.
