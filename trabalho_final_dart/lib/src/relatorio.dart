import 'package:yaansi/yaansi.dart';

/// Cores exigidas para cada tipo de informacao do relatorio
enum CorDaInformacao {
  /// Temperatura em Celsius e umidades maximas
  vermelho,

  /// Temperatura em Fahrenheit e direcao do vento
  amarelo,

  /// Temperatura em Kelvin e umidades minimas
  azul,

  /// Umidades medias
  verde,

  /// Textos que nao representam uma informacao convertida
  nenhuma,
}

/// Um pedaco de uma linha do relatorio, com a cor da informacao que carrega
class Trecho {
  const Trecho(this.texto, [this.cor = CorDaInformacao.nenhuma]);

  final String texto;
  final CorDaInformacao cor;

  /// Texto colorido para o terminal
  String get colorido => switch (cor) {
        CorDaInformacao.vermelho => texto.red,
        CorDaInformacao.amarelo => texto.yellow,
        CorDaInformacao.azul => texto.blue,
        CorDaInformacao.verde => texto.green,
        CorDaInformacao.nenhuma => texto,
      };
}

/// Uma linha do relatorio, formada por um ou mais trechos
class Linha {
  const Linha(this.trechos);

  /// Linha de texto puro, sem informacao colorida
  Linha.texto(String texto) : trechos = <Trecho>[Trecho(texto)];

  final List<Trecho> trechos;

  /// Linha colorida, exibida no terminal
  String get colorida => trechos.map((trecho) => trecho.colorido).join();

  /// Linha sem cores, gravada no arquivo de relatorio
  String get simples => trechos.map((trecho) => trecho.texto).join();
}

/// Um relatorio pronto para ser exibido no terminal ou salvo em arquivo
class Relatorio {
  const Relatorio({
    required this.titulo,
    required this.prefixoDoArquivo,
    required this.linhas,
  });

  /// Titulo exibido no topo do relatorio
  final String titulo;

  /// Prefixo do arquivo de texto gerado (clima, umidade ou vento)
  final String prefixoDoArquivo;

  final List<Linha> linhas;
}
