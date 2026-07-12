import 'dart:collection';
import 'dart:math';

void main() {
  final fila = FilaDoMercado();
  final gerador = GeradorDeNomes();

  for (var i = 0; i < 10; i++) {
    fila.entrar(Pessoa(gerador.gerarNomeAleatorio()));
  }

  while (fila.possuiPessoas) {
    fila.atender();
  }
}

class Pessoa {
  Pessoa(this.nome);

  /// Nome e sobrenome da pessoa
  final String nome;
}

/// Responsavel apenas por gerar nomes aleatorios
class GeradorDeNomes {
  final _random = Random();

  final _nomes = <String>[
    'Ana', 'Francisco', 'Joao', 'Pedro', 'Gabriel', 'Rafaela', 'Marcio',
    'Jose', 'Carlos', 'Patricia', 'Helena', 'Camila', 'Mateus', 'Maria',
    'Samuel', 'Karina', 'Antonio', 'Daniel', 'Joel', 'Cristiana', 'Paula',
  ];

  final _sobrenomes = <String>[
    'Silva', 'Ferreira', 'Almeida', 'Azevedo', 'Braga', 'Barros', 'Campos',
    'Cardoso', 'Teixeira', 'Costa', 'Santos', 'Rodrigues', 'Souza', 'Alves',
    'Pereira', 'Lima', 'Gomes', 'Ribeiro', 'Carvalho', 'Lopes', 'Barbosa',
  ];

  String gerarNomeAleatorio() {
    final nome = _nomes[_random.nextInt(_nomes.length)];
    final sobrenome = _sobrenomes[_random.nextInt(_sobrenomes.length)];

    return '$nome $sobrenome';
  }
}

class FilaDoMercado {
  /// Queue e a estrutura de dart:collection especializada em manipular as
  /// extremidades da colecao: entra no fim e e atendido pelo inicio (FIFO)
  final Queue<Pessoa> _pessoas = Queue<Pessoa>();

  bool get possuiPessoas => _pessoas.isNotEmpty;

  /// Coloca uma pessoa no fim da fila
  void entrar(Pessoa pessoa) {
    _pessoas.addLast(pessoa);
    print('${pessoa.nome} entrou na fila');
  }

  /// Atende a primeira pessoa da fila, quem entrou primeiro sai primeiro
  void atender() {
    final pessoa = _pessoas.removeFirst();
    print('${pessoa.nome} foi atendido(a)');
  }
}
