import 'dart:collection';

void main() {
  final baralho = Baralho();

  baralho.empilhar(Carta('A', Naipe.paus));
  baralho.empilhar(Carta('A', Naipe.copas));
  baralho.empilhar(Carta('A', Naipe.espadas));
  baralho.empilhar(Carta('A', Naipe.ouros));

  print('Cartas no baralho: ${baralho.quantidade}');

  while (baralho.possuiCartas) {
    print('Carta removida do topo: ${baralho.removerDoTopo()}');
  }

  print('Cartas no baralho: ${baralho.quantidade}');
}

/// Naipes validos de uma carta
enum Naipe {
  paus('♣'),
  copas('♥'),
  espadas('♠'),
  ouros('♦');

  const Naipe(this.simbolo);

  /// Simbolo do naipe exibido no console
  final String simbolo;
}

class Carta {
  Carta(this.valor, this.naipe);

  /// Valor da carta (A, 2, 3, ..., J, Q, K)
  final String valor;

  /// Naipe da carta, sempre um dos naipes validos
  final Naipe naipe;

  @override
  String toString() => '$valor ${naipe.simbolo}';
}

class Baralho {
  /// Queue e a estrutura de dart:collection especializada em manipular as
  /// extremidades da colecao, o topo do baralho e o ultimo item empilhado
  final Queue<Carta> _cartas = Queue<Carta>();

  /// Numero de cartas atualmente no baralho
  int get quantidade => _cartas.length;

  bool get possuiCartas => _cartas.isNotEmpty;

  /// Empilha uma carta por vez no topo do baralho
  void empilhar(Carta carta) {
    _cartas.addLast(carta);
  }

  /// Remove uma carta por vez, sempre a carta que esta no topo do baralho
  Carta removerDoTopo() {
    return _cartas.removeLast();
  }
}
