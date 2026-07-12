// NAO PODE SER MODIFICADO
// -----------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

// -----------------------------------------------------------
// ADICIONAR IMPLEMENTACAO RESTANTE ABAIXO DESSA LINHA
// -----------------------------------------------------------

/// Contrato comum a todos os meios de comunicacao capazes de fazer ligacoes
abstract class MeioDeComunicacao {
  /// Identificacao do meio de comunicacao exibida no console
  String get tipo;

  void fazerLigacao(String numero) {
    print('[$tipo] Ligando para $numero...');
  }
}

class Telefone extends MeioDeComunicacao {
  @override
  String get tipo => 'TELEFONE';
}

class Celular extends MeioDeComunicacao {
  @override
  String get tipo => 'CELULAR';
}

class Orelhao extends MeioDeComunicacao {
  @override
  String get tipo => 'ORELHÃO';
}
