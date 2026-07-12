import 'dart:collection';
import 'dart:math';

void main() {
  final album = Album(figurasDoAlbum);

  // Gera novos pacotes ate o album ser completado
  while (!album.completo) {
    album.colarPacote(PacoteDeFiguras.aleatorio(figurasDoAlbum));
  }

  print('Figuras repetidas: ${album.totalDeRepetidas}');
  album.imprimir();
}

/// Lista com as vinte figuras que compoem o album
final figurasDoAlbum = <Figura>[
  Figura(1, 'Goleiro'),
  Figura(2, 'Lateral direito'),
  Figura(3, 'Zagueiro central'),
  Figura(4, 'Zagueiro'),
  Figura(5, 'Lateral esquerdo'),
  Figura(6, 'Volante'),
  Figura(7, 'Primeiro volante'),
  Figura(8, 'Meia central'),
  Figura(9, 'Meia armador'),
  Figura(10, 'Camisa 10'),
  Figura(11, 'Ponta esquerda'),
  Figura(12, 'Ponta direita'),
  Figura(13, 'Centroavante'),
  Figura(14, 'Segundo atacante'),
  Figura(15, 'Goleiro reserva'),
  Figura(16, 'Tecnico'),
  Figura(17, 'Auxiliar tecnico'),
  Figura(18, 'Preparador fisico'),
  Figura(19, 'Escudo do time'),
  Figura(20, 'Estadio'),
];

class Figura {
  Figura(this.codigo, this.nome);

  /// Codigo unico da figura
  final int codigo;

  /// Nome da figura
  final String nome;

  @override
  String toString() => '$codigo - $nome';
}

/// Pacote inicializado com 4 figuras aleatorias do album
class PacoteDeFiguras {
  PacoteDeFiguras(this.figuras);

  factory PacoteDeFiguras.aleatorio(List<Figura> disponiveis) {
    final random = Random();

    return PacoteDeFiguras(<Figura>[
      for (var i = 0; i < 4; i++) disponiveis[random.nextInt(disponiveis.length)],
    ]);
  }

  final List<Figura> figuras;
}

class Album {
  Album(List<Figura> figurasDoAlbum)
      : _totalDeFiguras = figurasDoAlbum.length;

  /// Numero de figuras necessarias para completar o album
  final int _totalDeFiguras;

  /// SplayTreeMap mantem as figuras coladas ordenadas pelo codigo e impede
  /// que uma figura repetida seja colada duas vezes
  final SplayTreeMap<int, Figura> _coladas = SplayTreeMap<int, Figura>();

  /// Estrutura extra para armazenar as figuras repetidas
  final List<Figura> _repetidas = <Figura>[];

  /// O album esta completo quando todas as figuras definidas foram coladas
  bool get completo => _coladas.length == _totalDeFiguras;

  /// Numero de figuras repetidas obtidas nos pacotes
  int get totalDeRepetidas => _repetidas.length;

  /// Cola no album as figuras de um pacote, guardando as repetidas
  void colarPacote(PacoteDeFiguras pacote) {
    for (final figura in pacote.figuras) {
      if (_coladas.containsKey(figura.codigo)) {
        _repetidas.add(figura);
      } else {
        _coladas[figura.codigo] = figura;
      }
    }
  }

  /// Imprime no console as figuras coladas, em ordem conforme o codigo
  void imprimir() {
    print('Figuras coladas no album:');

    for (final figura in _coladas.values) {
      print(' > $figura');
    }
  }
}
