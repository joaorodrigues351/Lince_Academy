import 'dart:io';

import 'package:trabalho_final_dart/trabalho_final_dart.dart';
import 'package:yaansi/yaansi.dart';

/// Diretorio onde os arquivos dos sensores devem estar gravados
const diretorioDosSensores = r'C:\clima\sensores';

/// Diretorio onde os relatorios em texto sao gravados
const diretorioDosRelatorios = 'relatorios';

Future<void> main(List<String> argumentos) async {
  // O diretorio padrao pode ser trocado pelo primeiro argumento, o que facilita
  // executar o programa com a base de dados em outro lugar
  final diretorio =
      argumentos.isNotEmpty ? argumentos.first : diretorioDosSensores;

  final repositorio = RepositorioDeLeituras(diretorio);
  const exportador = ExportadorDeRelatorios(diretorioDosRelatorios);

  var executando = true;

  while (executando) {
    _exibirMenu();

    final opcao = stdin.readLineSync()?.trim();

    switch (opcao) {
      case '1':
      case '2':
      case '3':
        await _gerarRelatorio(opcao!, repositorio, exportador);
      case '0':
        executando = false;
        print('\nAté logo!');
      default:
        print('\nOpção inválida, escolha uma das opções do menu.'.red);
    }
  }
}

void _exibirMenu() {
  print('\nOlá, Marcelo. Que relatório você precisa?');
  print('  1 - Temperatura');
  print('  2 - Umidade');
  print('  3 - Direção do vento');
  print('  0 - Sair');
  stdout.write('      Digite o número da opção desejada: ');
}

Future<void> _gerarRelatorio(
  String opcao,
  RepositorioDeLeituras repositorio,
  ExportadorDeRelatorios exportador,
) async {
  try {
    print('\nLendo os arquivos dos sensores...');

    final leituras = await repositorio.carregar();
    final gerador = GeradorDeRelatorios(leituras);

    final relatorio = switch (opcao) {
      '1' => gerador.temperatura(),
      '2' => gerador.umidade(),
      _ => gerador.vento(),
    };

    _exibirRelatorio(relatorio);
    await _salvarRelatorio(relatorio, exportador);
  } on FalhaDoPrograma catch (falha) {
    // Falhas previstas: diretorio vazio, arquivo ilegivel ou conteudo invalido
    print('\n${falha.mensagem}'.red);
  } catch (erro) {
    print('\nFalha inesperada na execução do programa: $erro'.red);
  }
}

void _exibirRelatorio(Relatorio relatorio) {
  print('\n${relatorio.titulo}'.bold);

  for (final linha in relatorio.linhas) {
    print(linha.colorida);
  }
}

Future<void> _salvarRelatorio(
  Relatorio relatorio,
  ExportadorDeRelatorios exportador,
) async {
  stdout.write('\nDeseja salvar esse relatório em um arquivo? (s/N): ');

  final resposta = stdin.readLineSync()?.trim().toLowerCase();

  if (resposta != 's') {
    return;
  }

  try {
    final caminho = await exportador.salvar(relatorio);
    print('Relatório salvo em: $caminho');
  } on IOException catch (erro) {
    print('Falha ao salvar o relatório em arquivo: $erro'.red);
  }
}
