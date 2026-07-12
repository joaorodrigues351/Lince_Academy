import 'dart:io';

import 'relatorio.dart';

/// Grava os relatorios exibidos no terminal em arquivos de texto
class ExportadorDeRelatorios {
  const ExportadorDeRelatorios(this.diretorio);

  /// Diretorio onde os arquivos de relatorio sao gravados
  final String diretorio;

  /// Padrao de nomenclatura: [prefixo]_[DATA]_[HORA].txt
  /// Exemplo: clima_2025-01-01_00-00.txt
  String nomeDoArquivo(Relatorio relatorio, DateTime momento) {
    final data = <String>[
      momento.year.toString().padLeft(4, '0'),
      momento.month.toString().padLeft(2, '0'),
      momento.day.toString().padLeft(2, '0'),
    ].join('-');

    final hora = <String>[
      momento.hour.toString().padLeft(2, '0'),
      momento.minute.toString().padLeft(2, '0'),
    ].join('-');

    return '${relatorio.prefixoDoArquivo}_${data}_$hora.txt';
  }

  /// Salva o relatorio sem as cores e devolve o caminho do arquivo gerado
  Future<String> salvar(Relatorio relatorio) async {
    final pasta = Directory(diretorio);

    if (!await pasta.exists()) {
      await pasta.create(recursive: true);
    }

    final arquivo = File('$diretorio/${nomeDoArquivo(relatorio, DateTime.now())}');

    final conteudo = <String>[
      relatorio.titulo,
      for (final linha in relatorio.linhas) linha.simples,
    ].join('\n');

    await arquivo.writeAsString('$conteudo\n');

    return arquivo.path;
  }
}
