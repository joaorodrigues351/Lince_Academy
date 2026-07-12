import 'dart:math';

void main() {
  print('Nome: ${sugerirNome()}');
}

String sugerirNome() {
  const nomes = [
    'Ana', 'Francisco', 'Joao', 'Pedro', 'Gabriel', 'Rafaela', 'Marcio',
    'Jose', 'Carlos', 'Patricia', 'Helena', 'Camila', 'Mateus', 'Gabriel',
    'Maria', 'Samuel', 'Karina', 'Antonio', 'Daniel', 'Joel', 'Cristiana',
    'Sebastião', 'Paula',
  ];

  const sobrenomes = [
    'Silva', 'Ferreira', 'Almeida', 'Azevedo', 'Braga', 'Barros', 'Campos',
    'Cardoso', 'Teixeira', 'Costa', 'Santos', 'Rodrigues', 'Souza', 'Alves',
    'Pereira', 'Lima', 'Gomes', 'Ribeiro', 'Carvalho', 'Lopes', 'Barbosa',
  ];

  final random = Random();
  final nome = nomes[random.nextInt(nomes.length)];
  final sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];

  return '$nome $sobrenome';
}
