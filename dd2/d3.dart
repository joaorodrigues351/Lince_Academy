void main() {
  final biblioteca = BibliotecaDeMusicas(<Musica>[
    Musica('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 354),
    Musica('Love of My Life', 'Queen', 'A Night at the Opera', 219),
    Musica('Imagine', 'John Lennon', 'Imagine', 183),
    Musica('Hotel California', 'Eagles', 'Hotel California', 391),
    Musica('Wish You Were Here', 'Pink Floyd', 'Wish You Were Here', 334),
    Musica('Comfortably Numb', 'Pink Floyd', 'The Wall', 382),
    Musica('Another Brick in the Wall', 'Pink Floyd', 'The Wall', 239),
    Musica('Garota de Ipanema', 'Tom Jobim', 'Getz/Gilberto', 325),
  ]);

  biblioteca.imprimir();

  biblioteca.imprimirBusca('título', 'Imagine', biblioteca.buscarPorTitulo('Imagine'));
  biblioteca.imprimirBusca('artista', 'Pink Floyd', biblioteca.buscarPorArtista('Pink Floyd'));
  biblioteca.imprimirBusca('album', 'The Wall', biblioteca.buscarPorAlbum('The Wall'));
}

class Musica {
  Musica(this.titulo, this.artista, this.album, this.duracaoEmSegundos);

  /// Titulo da musica
  final String titulo;

  /// Nome do artista
  final String artista;

  /// Nome do album
  final String album;

  /// Duracao em segundos
  final int duracaoEmSegundos;

  @override
  String toString() => '$titulo - $artista ($album) - ${duracaoEmSegundos}s';
}

class BibliotecaDeMusicas {
  BibliotecaDeMusicas(this._musicas);

  final List<Musica> _musicas;

  /// Numero de musicas cadastradas na biblioteca
  int get numeroDeMusicas => _musicas.length;

  /// Tempo total, em horas, de todas as musicas da biblioteca
  double get tempoTotalEmHoras {
    final segundos = _musicas.fold<int>(
      0,
      (total, musica) => total + musica.duracaoEmSegundos,
    );

    return segundos / 3600;
  }

  /// Imprime no console as musicas cadastradas e os totais da biblioteca
  void imprimir() {
    print('Musicas cadastradas:');
    for (final musica in _musicas) {
      print(' > $musica');
    }

    print('Numero de musicas: $numeroDeMusicas');
    print('Tempo total: ${tempoTotalEmHoras.toStringAsFixed(2)} horas');
  }

  /// Imprime no console o resultado de uma busca
  void imprimirBusca(String parametro, String valor, List<Musica> encontradas) {
    print('\nBusca por $parametro: $valor');

    if (encontradas.isEmpty) {
      print(' > Nenhuma musica encontrada');
      return;
    }

    for (final musica in encontradas) {
      print(' > $musica');
    }
  }

  /// Busca musicas pelo titulo
  List<Musica> buscarPorTitulo(String titulo) {
    return _musicas.where((musica) => _combina(musica.titulo, titulo)).toList();
  }

  /// Busca musicas pelo nome do artista
  List<Musica> buscarPorArtista(String artista) {
    return _musicas.where((musica) => _combina(musica.artista, artista)).toList();
  }

  /// Busca musicas pelo nome do album
  List<Musica> buscarPorAlbum(String album) {
    return _musicas.where((musica) => _combina(musica.album, album)).toList();
  }

  bool _combina(String campo, String valor) {
    return campo.toLowerCase().contains(valor.toLowerCase());
  }
}
