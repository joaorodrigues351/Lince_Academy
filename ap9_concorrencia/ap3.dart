Future<void> main() async {
  print('Iniciando lançamento');

  for (int i = 10; i > 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    print(i);
  }

  print('Foguete lançado!');
}
