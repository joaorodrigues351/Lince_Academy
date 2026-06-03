void main(){
  final mapa = {
    'João': 19,
    'Maria': 20,
    'Guilherme': 22,
    'Felipe': null,
    'Carlos': 56,
    'Joana': null,
  };

  for (final nome in mapa.keys) {
    final idade = mapa[nome];

    print('$nome - ${idade ?? 'idade nao informada'}');
  }
}