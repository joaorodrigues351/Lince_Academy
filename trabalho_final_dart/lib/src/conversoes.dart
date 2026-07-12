import 'dart:math' as math;

/// Nomes dos meses usados nos relatorios
const nomesDosMeses = <String>[
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro',
];

String nomeDoMes(int mes) => nomesDosMeses[mes - 1];

/// Conversoes de temperatura, a partir de graus Celsius
extension Temperatura on double {
  double get emFahrenheit => this * 9 / 5 + 32;

  double get emKelvin => this + 273.15;
}

/// Conversoes de velocidade do vento, a partir de metros por segundo
extension VelocidadeDoVento on double {
  double get emQuilometrosPorHora => this * 3.6;

  double get emMilhasPorHora => this * 2.236936;
}

/// Conversoes de direcao do vento, a partir de graus
extension DirecaoDoVento on num {
  double get emRadianos => this * math.pi / 180;
}
