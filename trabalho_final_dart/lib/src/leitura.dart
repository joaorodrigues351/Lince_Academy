/// Uma leitura horaria dos sensores de um estado
class Leitura {
  const Leitura({
    required this.estado,
    required this.ano,
    required this.mes,
    required this.dia,
    required this.hora,
    required this.temperatura,
    required this.umidade,
    required this.densidadeDoAr,
    required this.velocidadeDoVento,
    required this.direcaoDoVento,
  });

  /// Sigla do estado onde a leitura foi coletada (ex.: SC)
  final String estado;

  final int ano;
  final int mes;
  final int dia;

  /// Hora da leitura, conforme o arquivo de origem (1 a 24)
  final int hora;

  /// Temperatura em graus Celsius
  final double temperatura;

  /// Umidade em kg/kg
  final double umidade;

  /// Densidade do ar em kg/m3
  final double densidadeDoAr;

  /// Velocidade do vento em metros por segundo
  final double velocidadeDoVento;

  /// Direcao do vento em graus
  final int direcaoDoVento;
}
