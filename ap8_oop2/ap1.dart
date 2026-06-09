import 'dart:math';

enum GenerosMusicais {
  rock,
  trap,
  pop,
  jazz,
}

  void main() {
      final numeroAleatorio = Random().nextInt(GenerosMusicais.values.length);
      print(numeroAleatorio);

      final generoFavorito  = GenerosMusicais.values[numeroAleatorio];
      switch (generoFavorito) {
        case GenerosMusicais.rock:
          print('Meu gênero musical favorito é o rock');
          break;
        case GenerosMusicais.trap:
          print('Meu gênero musical favorito é o trap');
          break;
        case GenerosMusicais.pop:
          print('Meu gênero musical favorito é o pop');
          break;
        case GenerosMusicais.jazz:
          print('Meu gênero musical favorito é o jazz');
          break;           
              }
  }