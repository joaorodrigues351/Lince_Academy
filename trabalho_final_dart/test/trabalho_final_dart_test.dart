import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:trabalho_final_dart/trabalho_final_dart.dart';

const _cabecalho =
    'Mês,Dia,Hora,Temperatura {C},Umidade {kg/kg},Densidade do ar {kg/m3},'
    'Velocidade do Vento {m/s},Direção do Vento {graus}';

/// Cria um diretorio temporario com os arquivos informados, no mesmo formato
/// dos arquivos originais dos sensores (CSV em latin-1)
Directory _diretorioComArquivos(Map<String, List<String>> arquivos) {
  final pasta = Directory.systemTemp.createTempSync('sensores_teste');

  arquivos.forEach((nome, linhas) {
    final conteudo = <String>[_cabecalho, ...linhas].join('\n');
    File('${pasta.path}/$nome').writeAsBytesSync(latin1.encode(conteudo));
  });

  return pasta;
}

void main() {
  group('RepositorioDeLeituras', () {
    test('le os arquivos do diretório e extrai estado, ano e medidas', () async {
      final pasta = _diretorioComArquivos({
        'SC_2024_1.csv': <String>[
          '1,1,1,23.8,0.018474922,1.146,5,220',
          '1,1,2,23.1,0.017805430,1.151,2,210',
        ],
      });

      final leituras = await RepositorioDeLeituras(pasta.path).carregar();

      expect(leituras, hasLength(2));
      expect(leituras.first.estado, 'SC');
      expect(leituras.first.ano, 2024);
      expect(leituras.first.mes, 1);
      expect(leituras.first.hora, 1);
      expect(leituras.first.temperatura, 23.8);
      expect(leituras.first.umidade, 0.018474922);
      expect(leituras.first.velocidadeDoVento, 5);
      expect(leituras.first.direcaoDoVento, 220);

      pasta.deleteSync(recursive: true);
    });

    test('avisa quando nenhum arquivo é encontrado', () async {
      final pasta = _diretorioComArquivos({});

      await expectLater(
        RepositorioDeLeituras(pasta.path).carregar(),
        throwsA(isA<NenhumArquivoEncontrado>()),
      );

      pasta.deleteSync(recursive: true);
    });

    test('avisa quando o diretório não existe', () {
      expect(
        const RepositorioDeLeituras('diretorio/inexistente').carregar(),
        throwsA(isA<NenhumArquivoEncontrado>()),
      );
    });

    test('avisa quando uma linha do arquivo está corrompida', () async {
      final pasta = _diretorioComArquivos({
        'SP_2024_3.csv': <String>['3,1,1,vinte graus,0.01,1.1,2,180'],
      });

      await expectLater(
        RepositorioDeLeituras(pasta.path).carregar(),
        throwsA(isA<FalhaAoExtrairInformacoes>()),
      );

      pasta.deleteSync(recursive: true);
    });
  });

  group('Conversões', () {
    test('temperatura em Fahrenheit e Kelvin', () {
      expect(0.0.emFahrenheit, 32);
      expect(100.0.emFahrenheit, 212);
      expect(0.0.emKelvin, 273.15);
    });

    test('velocidade do vento em km/h e mph', () {
      expect(10.0.emQuilometrosPorHora, closeTo(36, 0.001));
      expect(10.0.emMilhasPorHora, closeTo(22.369, 0.001));
    });

    test('direção do vento em radianos', () {
      expect(180.emRadianos, closeTo(3.1416, 0.0001));
      expect(90.emRadianos, closeTo(1.5708, 0.0001));
    });
  });

  group('Estatisticas', () {
    final leituras = <Leitura>[
      const Leitura(
        estado: 'SC',
        ano: 2024,
        mes: 1,
        dia: 1,
        hora: 1,
        temperatura: 20,
        umidade: 0.010,
        densidadeDoAr: 1.1,
        velocidadeDoVento: 2,
        direcaoDoVento: 90,
      ),
      const Leitura(
        estado: 'SC',
        ano: 2024,
        mes: 1,
        dia: 2,
        hora: 1,
        temperatura: 30,
        umidade: 0.020,
        densidadeDoAr: 1.1,
        velocidadeDoVento: 4,
        direcaoDoVento: 90,
      ),
      const Leitura(
        estado: 'SC',
        ano: 2024,
        mes: 2,
        dia: 1,
        hora: 2,
        temperatura: 10,
        umidade: 0.005,
        densidadeDoAr: 1.1,
        velocidadeDoVento: 6,
        direcaoDoVento: 180,
      ),
      const Leitura(
        estado: 'SP',
        ano: 2024,
        mes: 1,
        dia: 1,
        hora: 1,
        temperatura: 15,
        umidade: 0.008,
        densidadeDoAr: 1.1,
        velocidadeDoVento: 1,
        direcaoDoVento: 270,
      ),
    ];

    final estatisticas = Estatisticas(leituras);

    test('separa os estados presentes na base', () {
      expect(estatisticas.estados, <String>['SC', 'SP']);
    });

    test('temperatura média, máxima e mínima por estado por ano', () {
      expect(estatisticas.temperaturaMediaPorAno('SC'), 20);
      expect(estatisticas.temperaturaMaximaPorAno('SC'), 30);
      expect(estatisticas.temperaturaMinimaPorAno('SC'), 10);
    });

    test('temperatura média, máxima e mínima por estado por mês', () {
      expect(estatisticas.temperaturaMediaPorMes('SC', 1), 25);
      expect(estatisticas.temperaturaMaximaPorMes('SC', 1), 30);
      expect(estatisticas.temperaturaMinimaPorMes('SC', 2), 10);
    });

    test('temperatura média por horário por estado', () {
      expect(estatisticas.temperaturaMediaPorHorario('SC', 1), 25);
      expect(estatisticas.temperaturaMediaPorHorario('SC', 2), 10);
    });

    test('umidade média, máxima e mínima por estado', () {
      expect(estatisticas.umidadeMediaPorMes('SC', 1), closeTo(0.015, 1e-9));
      expect(estatisticas.umidadeMaximaPorAno('SC'), 0.020);
      expect(estatisticas.umidadeMinimaPorAno('SC'), 0.005);
    });

    test('direção do vento com maior frequência por estado', () {
      expect(estatisticas.direcaoMaisFrequentePorAno('SC'), 90);
      expect(estatisticas.direcaoMaisFrequentePorMes('SC', 2), 180);
      expect(estatisticas.direcaoMaisFrequentePorAno('SP'), 270);
    });

    test('velocidade média do vento por estado', () {
      expect(estatisticas.velocidadeMediaPorAno('SC'), 4);
      expect(estatisticas.velocidadeMediaPorMes('SC', 1), 3);
    });

    test('leituras sem vento não contam como direção', () {
      // Nos arquivos originais, direção 0 sempre vem com velocidade 0 m/s:
      // e calmaria, nao uma direcao, mesmo sendo o valor mais repetido
      final comCalmaria = Estatisticas(<Leitura>[
        for (var dia = 1; dia <= 5; dia++)
          Leitura(
            estado: 'SC',
            ano: 2024,
            mes: 1,
            dia: dia,
            hora: 1,
            temperatura: 20,
            umidade: 0.01,
            densidadeDoAr: 1.1,
            velocidadeDoVento: 0,
            direcaoDoVento: 0,
          ),
        const Leitura(
          estado: 'SC',
          ano: 2024,
          mes: 1,
          dia: 6,
          hora: 1,
          temperatura: 20,
          umidade: 0.01,
          densidadeDoAr: 1.1,
          velocidadeDoVento: 3,
          direcaoDoVento: 45,
        ),
      ]);

      expect(comCalmaria.direcaoMaisFrequentePorAno('SC'), 45);
      expect(comCalmaria.registrosDeCalmariaPorAno('SC'), 5);
    });
  });

  group('Relatórios', () {
    final gerador = GeradorDeRelatorios(<Leitura>[
      const Leitura(
        estado: 'SC',
        ano: 2024,
        mes: 1,
        dia: 1,
        hora: 1,
        temperatura: 20,
        umidade: 0.010,
        densidadeDoAr: 1.1,
        velocidadeDoVento: 2,
        direcaoDoVento: 90,
      ),
    ]);

    test('temperatura exibe Celsius, Fahrenheit e Kelvin nas cores exigidas', () {
      final linhas = gerador.temperatura().linhas;
      final media = linhas.firstWhere((linha) => linha.simples.contains('Média'));

      expect(media.simples, contains('20.00 °C'));
      expect(media.simples, contains('68.00 °F'));
      expect(media.simples, contains('293.15 K'));

      final cores = <String, CorDaInformacao>{
        for (final trecho in media.trechos) trecho.texto.trim(): trecho.cor,
      };

      expect(cores['20.00 °C'], CorDaInformacao.vermelho);
      expect(cores['68.00 °F'], CorDaInformacao.amarelo);
      expect(cores['293.15 K'], CorDaInformacao.azul);
    });

    test('umidade usa verde na média, vermelho na máxima e azul na mínima', () {
      final linhas = gerador.umidade().linhas;

      CorDaInformacao corDa(String rotulo) => linhas
          .firstWhere((linha) => linha.simples.contains(rotulo))
          .trechos
          .last
          .cor;

      expect(corDa('Média'), CorDaInformacao.verde);
      expect(corDa('Máxima'), CorDaInformacao.vermelho);
      expect(corDa('Mínima'), CorDaInformacao.azul);
    });

    test('vento exibe graus e radianos sempre em amarelo', () {
      final linhas = gerador.vento().linhas;
      final direcao =
          linhas.firstWhere((linha) => linha.simples.contains('Direção  '));

      expect(direcao.simples, contains('90°'));
      expect(direcao.simples, contains('1.5708 rad'));

      final informacoes = direcao.trechos.skip(1).where(
            (trecho) => trecho.texto.trim() != '|',
          );

      expect(
        informacoes.every((trecho) => trecho.cor == CorDaInformacao.amarelo),
        isTrue,
      );
    });
  });

  group('ExportadorDeRelatorios', () {
    test('nomeia os arquivos conforme o padrão pedido', () {
      const exportador = ExportadorDeRelatorios('relatorios');
      final momento = DateTime(2025, 1, 1);

      const relatorio = Relatorio(
        titulo: 'RELATÓRIO DE TEMPERATURA',
        prefixoDoArquivo: 'clima',
        linhas: <Linha>[],
      );

      expect(
        exportador.nomeDoArquivo(relatorio, momento),
        'clima_2025-01-01_00-00.txt',
      );
    });

    test('grava o relatório sem os códigos de cor', () async {
      final pasta = Directory.systemTemp.createTempSync('relatorios_teste');
      final exportador = ExportadorDeRelatorios(pasta.path);

      final relatorio = Relatorio(
        titulo: 'RELATÓRIO DE UMIDADE',
        prefixoDoArquivo: 'umidade',
        linhas: <Linha>[
          const Linha(<Trecho>[
            Trecho('    Média          : '),
            Trecho('0.010000 kg/kg', CorDaInformacao.verde),
          ]),
        ],
      );

      final caminho = await exportador.salvar(relatorio);
      final conteudo = await File(caminho).readAsString();

      expect(conteudo, contains('RELATÓRIO DE UMIDADE'));
      expect(conteudo, contains('0.010000 kg/kg'));
      expect(conteudo, isNot(contains('[')));

      pasta.deleteSync(recursive: true);
    });
  });
}
