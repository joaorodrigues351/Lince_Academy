import 'dart:convert';
import 'dart:io';

import 'excecoes.dart';
import 'leitura.dart';

/// Le os arquivos CSV dos sensores gravados no diretorio configurado
class RepositorioDeLeituras {
  const RepositorioDeLeituras(this.diretorio);

  /// Diretorio onde os arquivos dos sensores estao gravados
  final String diretorio;

  /// Padrao do nome do arquivo: [SIGLA_DO_ESTADO]_[ANO]_[MES].csv
  static final _padraoDoNome = RegExp(
    r'^([A-Za-z]{2})_(\d{4})_(\d{1,2})\.csv$',
  );

  /// Carrega todas as leituras dos arquivos do diretorio
  Future<List<Leitura>> carregar() async {
    final pasta = Directory(diretorio);

    if (!await pasta.exists()) {
      throw NenhumArquivoEncontrado(diretorio);
    }

    final arquivos = <File>[];

    await for (final item in pasta.list()) {
      if (item is File && _padraoDoNome.hasMatch(_nomeDoArquivo(item))) {
        arquivos.add(item);
      }
    }

    if (arquivos.isEmpty) {
      throw NenhumArquivoEncontrado(diretorio);
    }

    // Os arquivos sao lidos em paralelo, cada um em sua propria Future
    final leiturasPorArquivo = await Future.wait(arquivos.map(_lerArquivo));

    return <Leitura>[
      for (final leituras in leiturasPorArquivo) ...leituras,
    ];
  }

  Future<List<Leitura>> _lerArquivo(File arquivo) async {
    final nome = _nomeDoArquivo(arquivo);
    final partes = _padraoDoNome.firstMatch(nome)!;

    final estado = partes.group(1)!.toUpperCase();
    final ano = int.parse(partes.group(2)!);

    late final String conteudo;

    try {
      // Os arquivos sao gravados em latin-1, por causa dos acentos do cabecalho
      final bytes = await arquivo.readAsBytes();
      conteudo = latin1.decode(bytes);
    } on IOException catch (erro) {
      throw FalhaNaLeituraDeArquivo(nome, erro);
    }

    final linhas = const LineSplitter().convert(conteudo);
    final leituras = <Leitura>[];

    // A primeira linha e o cabecalho, os dados comecam na segunda
    for (var i = 1; i < linhas.length; i++) {
      final linha = linhas[i].trim();

      if (linha.isEmpty) {
        continue;
      }

      leituras.add(_lerLinha(linha, nome, estado, ano, i + 1));
    }

    return leituras;
  }

  Leitura _lerLinha(
    String linha,
    String arquivo,
    String estado,
    int ano,
    int numeroDaLinha,
  ) {
    try {
      final colunas = linha.split(',');

      if (colunas.length < 8) {
        throw const FormatException('numero de colunas inesperado');
      }

      return Leitura(
        estado: estado,
        ano: ano,
        mes: int.parse(colunas[0]),
        dia: int.parse(colunas[1]),
        hora: int.parse(colunas[2]),
        temperatura: double.parse(colunas[3]),
        umidade: double.parse(colunas[4]),
        densidadeDoAr: double.parse(colunas[5]),
        velocidadeDoVento: double.parse(colunas[6]),
        direcaoDoVento: int.parse(colunas[7]),
      );
    } on FormatException catch (erro) {
      throw FalhaAoExtrairInformacoes(arquivo, numeroDaLinha, erro.message);
    }
  }

  String _nomeDoArquivo(File arquivo) => arquivo.uri.pathSegments.last;
}
