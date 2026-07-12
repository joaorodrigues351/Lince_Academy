import 'conversoes.dart';
import 'estatisticas.dart';
import 'leitura.dart';
import 'relatorio.dart';

/// Monta os tres relatorios pedidos por Marcelo a partir das leituras
class GeradorDeRelatorios {
  GeradorDeRelatorios(List<Leitura> leituras)
      : _estatisticas = Estatisticas(leituras);

  final Estatisticas _estatisticas;

  /// Temperatura em Celsius (vermelho), Fahrenheit (amarelo) e Kelvin (azul)
  Relatorio temperatura() {
    final linhas = <Linha>[];

    for (final estado in _estatisticas.estados) {
      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('Estado: $estado'))
        ..add(Linha.texto(''));

      final anos = _estatisticas.anosDoEstado(estado).join(', ');

      linhas
        ..add(Linha.texto('  Por ano ($anos)'))
        ..add(
          _temperatura(
            '    Média',
            _estatisticas.temperaturaMediaPorAno(estado),
          ),
        )
        ..add(
          _temperatura(
            '    Máxima',
            _estatisticas.temperaturaMaximaPorAno(estado),
          ),
        )
        ..add(
          _temperatura(
            '    Mínima',
            _estatisticas.temperaturaMinimaPorAno(estado),
          ),
        )
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Média por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _temperatura(
            '    ${_mes(mes)}',
            _estatisticas.temperaturaMediaPorMes(estado, mes),
          ),
        );
      }

      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Máxima por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _temperatura(
            '    ${_mes(mes)}',
            _estatisticas.temperaturaMaximaPorMes(estado, mes),
          ),
        );
      }

      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Mínima por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _temperatura(
            '    ${_mes(mes)}',
            _estatisticas.temperaturaMinimaPorMes(estado, mes),
          ),
        );
      }

      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Média por horário'));

      for (final hora in _estatisticas.horasDoEstado(estado)) {
        linhas.add(
          _temperatura(
            '    ${hora.toString().padLeft(2, '0')}h',
            _estatisticas.temperaturaMediaPorHorario(estado, hora),
          ),
        );
      }
    }

    return Relatorio(
      titulo: 'RELATÓRIO DE TEMPERATURA',
      prefixoDoArquivo: 'clima',
      linhas: linhas,
    );
  }

  /// Umidade media (verde), maxima (vermelho) e minima (azul)
  Relatorio umidade() {
    final linhas = <Linha>[];

    for (final estado in _estatisticas.estados) {
      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('Estado: $estado'))
        ..add(Linha.texto(''));

      final anos = _estatisticas.anosDoEstado(estado).join(', ');

      linhas
        ..add(Linha.texto('  Por ano ($anos)'))
        ..add(
          _umidade(
            '    Média',
            _estatisticas.umidadeMediaPorAno(estado),
            CorDaInformacao.verde,
          ),
        )
        ..add(
          _umidade(
            '    Máxima',
            _estatisticas.umidadeMaximaPorAno(estado),
            CorDaInformacao.vermelho,
          ),
        )
        ..add(
          _umidade(
            '    Mínima',
            _estatisticas.umidadeMinimaPorAno(estado),
            CorDaInformacao.azul,
          ),
        )
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Média por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _umidade(
            '    ${_mes(mes)}',
            _estatisticas.umidadeMediaPorMes(estado, mes),
            CorDaInformacao.verde,
          ),
        );
      }

      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Máxima por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _umidade(
            '    ${_mes(mes)}',
            _estatisticas.umidadeMaximaPorMes(estado, mes),
            CorDaInformacao.vermelho,
          ),
        );
      }

      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Mínima por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _umidade(
            '    ${_mes(mes)}',
            _estatisticas.umidadeMinimaPorMes(estado, mes),
            CorDaInformacao.azul,
          ),
        );
      }
    }

    return Relatorio(
      titulo: 'RELATÓRIO DE UMIDADE',
      prefixoDoArquivo: 'umidade',
      linhas: linhas,
    );
  }

  /// Direcao do vento, sempre em amarelo, acompanhada da velocidade media
  Relatorio vento() {
    final linhas = <Linha>[];

    for (final estado in _estatisticas.estados) {
      linhas
        ..add(Linha.texto(''))
        ..add(Linha.texto('Estado: $estado'))
        ..add(Linha.texto(''));

      final anos = _estatisticas.anosDoEstado(estado).join(', ');

      linhas
        ..add(Linha.texto('  Direção com maior frequência por ano ($anos)'))
        ..add(
          _direcao(
            '    Direção',
            _estatisticas.direcaoMaisFrequentePorAno(estado),
          ),
        )
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Direção com maior frequência por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _direcao(
            '    ${_mes(mes)}',
            _estatisticas.direcaoMaisFrequentePorMes(estado, mes),
          ),
        );
      }

      final calmarias = _estatisticas.registrosDeCalmariaPorAno(estado);

      linhas
        ..add(Linha.texto(''))
        ..add(
          Linha.texto(
            '  Leituras sem vento (0 m/s), desconsideradas na direção: '
            '$calmarias',
          ),
        )
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Velocidade do vento por ano ($anos)'))
        ..add(
          _velocidade(
            '    Média',
            _estatisticas.velocidadeMediaPorAno(estado),
          ),
        )
        ..add(
          _velocidade(
            '    Máxima',
            _estatisticas.velocidadeMaximaPorAno(estado),
          ),
        )
        ..add(Linha.texto(''))
        ..add(Linha.texto('  Velocidade média por mês'));

      for (final mes in _estatisticas.mesesDoEstado(estado)) {
        linhas.add(
          _velocidade(
            '    ${_mes(mes)}',
            _estatisticas.velocidadeMediaPorMes(estado, mes),
          ),
        );
      }
    }

    return Relatorio(
      titulo: 'RELATÓRIO DE DIREÇÃO E VELOCIDADE DO VENTO',
      prefixoDoArquivo: 'vento',
      linhas: linhas,
    );
  }

  /// Celsius em vermelho, Fahrenheit em amarelo e Kelvin em azul
  Linha _temperatura(String rotulo, double celsius) {
    return Linha(<Trecho>[
      Trecho(_rotulo(rotulo)),
      Trecho(
        '${celsius.toStringAsFixed(2)} °C'.padRight(12),
        CorDaInformacao.vermelho,
      ),
      const Trecho(' | '),
      Trecho(
        '${celsius.emFahrenheit.toStringAsFixed(2)} °F'.padRight(12),
        CorDaInformacao.amarelo,
      ),
      const Trecho(' | '),
      Trecho(
        '${celsius.emKelvin.toStringAsFixed(2)} K',
        CorDaInformacao.azul,
      ),
    ]);
  }

  Linha _umidade(String rotulo, double umidade, CorDaInformacao cor) {
    return Linha(<Trecho>[
      Trecho(_rotulo(rotulo)),
      Trecho('${umidade.toStringAsFixed(6)} kg/kg', cor),
    ]);
  }

  /// Direcao do vento sempre em amarelo, em graus e radianos
  Linha _direcao(String rotulo, int graus) {
    return Linha(<Trecho>[
      Trecho(_rotulo(rotulo)),
      Trecho('$graus°'.padRight(12), CorDaInformacao.amarelo),
      const Trecho(' | '),
      Trecho(
        '${graus.emRadianos.toStringAsFixed(4)} rad',
        CorDaInformacao.amarelo,
      ),
    ]);
  }

  /// Velocidade do vento em m/s, km/h e mph
  Linha _velocidade(String rotulo, double metrosPorSegundo) {
    return Linha(<Trecho>[
      Trecho(_rotulo(rotulo)),
      Trecho(
        '${metrosPorSegundo.toStringAsFixed(2)} m/s'.padRight(12),
        CorDaInformacao.amarelo,
      ),
      const Trecho(' | '),
      Trecho(
        '${metrosPorSegundo.emQuilometrosPorHora.toStringAsFixed(2)} km/h'
            .padRight(13),
        CorDaInformacao.amarelo,
      ),
      const Trecho(' | '),
      Trecho(
        '${metrosPorSegundo.emMilhasPorHora.toStringAsFixed(2)} mph',
        CorDaInformacao.amarelo,
      ),
    ]);
  }

  String _rotulo(String texto) => '${texto.padRight(16)}: ';

  String _mes(int mes) => nomeDoMes(mes);
}
