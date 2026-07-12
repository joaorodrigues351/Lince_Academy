import 'leitura.dart';

/// Agrupa as leituras carregadas e calcula as estatisticas dos relatorios
class Estatisticas {
  Estatisticas(List<Leitura> leituras) : _leituras = leituras;

  final List<Leitura> _leituras;

  /// Siglas dos estados presentes na base, em ordem alfabetica
  List<String> get estados {
    final siglas = _leituras.map((leitura) => leitura.estado).toSet().toList();

    return siglas..sort();
  }

  /// Anos presentes na base, em ordem crescente
  List<int> anosDoEstado(String estado) {
    final anos = _doEstado(estado).map((leitura) => leitura.ano).toSet().toList();

    return anos..sort();
  }

  /// Meses com leituras do estado, em ordem crescente
  List<int> mesesDoEstado(String estado) {
    final meses = _doEstado(estado).map((leitura) => leitura.mes).toSet().toList();

    return meses..sort();
  }

  /// Horas com leituras do estado, em ordem crescente
  List<int> horasDoEstado(String estado) {
    final horas = _doEstado(estado).map((leitura) => leitura.hora).toSet().toList();

    return horas..sort();
  }

  Iterable<Leitura> _doEstado(String estado) =>
      _leituras.where((leitura) => leitura.estado == estado);

  Iterable<Leitura> _doMes(String estado, int mes) =>
      _doEstado(estado).where((leitura) => leitura.mes == mes);

  Iterable<Leitura> _daHora(String estado, int hora) =>
      _doEstado(estado).where((leitura) => leitura.hora == hora);

  double _media(Iterable<double> valores) {
    if (valores.isEmpty) {
      return 0;
    }

    return valores.reduce((total, valor) => total + valor) / valores.length;
  }

  double _maximo(Iterable<double> valores) =>
      valores.reduce((maior, valor) => valor > maior ? valor : maior);

  double _minimo(Iterable<double> valores) =>
      valores.reduce((menor, valor) => valor < menor ? valor : menor);

  /// Valor que mais se repete, usado para a direcao do vento
  int _moda(Iterable<int> valores) {
    final frequencias = <int, int>{};

    for (final valor in valores) {
      frequencias[valor] = (frequencias[valor] ?? 0) + 1;
    }

    var direcao = valores.first;
    var maiorFrequencia = 0;

    frequencias.forEach((valor, frequencia) {
      if (frequencia > maiorFrequencia) {
        direcao = valor;
        maiorFrequencia = frequencia;
      }
    });

    return direcao;
  }

  // Temperatura -------------------------------------------------------------

  double temperaturaMediaPorAno(String estado) =>
      _media(_doEstado(estado).map((leitura) => leitura.temperatura));

  double temperaturaMediaPorMes(String estado, int mes) =>
      _media(_doMes(estado, mes).map((leitura) => leitura.temperatura));

  double temperaturaMaximaPorAno(String estado) =>
      _maximo(_doEstado(estado).map((leitura) => leitura.temperatura));

  double temperaturaMaximaPorMes(String estado, int mes) =>
      _maximo(_doMes(estado, mes).map((leitura) => leitura.temperatura));

  double temperaturaMinimaPorAno(String estado) =>
      _minimo(_doEstado(estado).map((leitura) => leitura.temperatura));

  double temperaturaMinimaPorMes(String estado, int mes) =>
      _minimo(_doMes(estado, mes).map((leitura) => leitura.temperatura));

  double temperaturaMediaPorHorario(String estado, int hora) =>
      _media(_daHora(estado, hora).map((leitura) => leitura.temperatura));

  // Umidade -----------------------------------------------------------------

  double umidadeMediaPorAno(String estado) =>
      _media(_doEstado(estado).map((leitura) => leitura.umidade));

  double umidadeMediaPorMes(String estado, int mes) =>
      _media(_doMes(estado, mes).map((leitura) => leitura.umidade));

  double umidadeMaximaPorAno(String estado) =>
      _maximo(_doEstado(estado).map((leitura) => leitura.umidade));

  double umidadeMaximaPorMes(String estado, int mes) =>
      _maximo(_doMes(estado, mes).map((leitura) => leitura.umidade));

  double umidadeMinimaPorAno(String estado) =>
      _minimo(_doEstado(estado).map((leitura) => leitura.umidade));

  double umidadeMinimaPorMes(String estado, int mes) =>
      _minimo(_doMes(estado, mes).map((leitura) => leitura.umidade));

  // Vento -------------------------------------------------------------------

  /// Nos arquivos dos sensores, a direcao 0 sempre aparece junto de uma
  /// velocidade 0 m/s: sao registros de calmaria, e nao uma direcao de vento.
  /// Por isso eles ficam de fora do calculo da direcao mais frequente.
  Iterable<Leitura> _comVento(Iterable<Leitura> leituras) =>
      leituras.where((leitura) => leitura.velocidadeDoVento > 0);

  int direcaoMaisFrequentePorAno(String estado) =>
      _moda(_comVento(_doEstado(estado)).map((l) => l.direcaoDoVento));

  int direcaoMaisFrequentePorMes(String estado, int mes) =>
      _moda(_comVento(_doMes(estado, mes)).map((l) => l.direcaoDoVento));

  /// Numero de leituras sem vento (0 m/s), desconsideradas na direcao
  int registrosDeCalmariaPorAno(String estado) =>
      _doEstado(estado).length - _comVento(_doEstado(estado)).length;

  double velocidadeMediaPorAno(String estado) =>
      _media(_doEstado(estado).map((leitura) => leitura.velocidadeDoVento));

  double velocidadeMediaPorMes(String estado, int mes) =>
      _media(_doMes(estado, mes).map((leitura) => leitura.velocidadeDoVento));

  double velocidadeMaximaPorAno(String estado) =>
      _maximo(_doEstado(estado).map((leitura) => leitura.velocidadeDoVento));
}
