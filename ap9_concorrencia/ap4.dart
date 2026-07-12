Future<void> buscarDados() async {
  print('Inicio da busca de dados');

  await Future.delayed(Duration(seconds: 2));
  print('Meio da busca de dados');

  await Future.delayed(Duration(seconds: 2));
  print('Fim da busca de dados');
}

Future<void> main() async {
  await buscarDados();
}
