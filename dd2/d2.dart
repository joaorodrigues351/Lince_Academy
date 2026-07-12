import 'dart:math';

void main() {
  final pessoa = Pessoa();

  print('Situação inicial:');
  pessoa.informacoes();
  print('');

  // OBJETIVO 5: as refeicoes acontecem enquanto o nivel de calorias exigir
  while (pessoa.precisaDeRefeicao) {
    // OBJETIVO 2: um novo fornecedor aleatorio para cada refeicao
    pessoa.refeicao(fornecedorAleatorio());
  }

  print('\nSituação final:');
  pessoa.informacoes();
}

// OBJETIVO 2: sorteia um dos fornecedores disponiveis no sistema
Fornecedor fornecedorAleatorio() {
  final fornecedores = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorDeUltraCaloricos(),
  ];

  return fornecedores[Random().nextInt(fornecedores.length)];
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

// OBJETIVO 3: status do nivel de calorias da pessoa
enum StatusDeCalorias {
  deficitExtremo('Deficit extremo de calorias'),
  deficit('Deficit de calorias'),
  satisfeita('Pessoa está satisfeita'),
  excesso('Excesso de calorias');

  const StatusDeCalorias(this.descricao);

  final String descricao;

  static StatusDeCalorias porCalorias(int calorias) {
    if (calorias <= 500) {
      return StatusDeCalorias.deficitExtremo;
    } else if (calorias <= 1800) {
      return StatusDeCalorias.deficit;
    } else if (calorias <= 2500) {
      return StatusDeCalorias.satisfeita;
    }

    return StatusDeCalorias.excesso;
  }
}

/// Contrato comum a todos os fornecedores de produtos
abstract class Fornecedor {
  /// Nome do fornecedor
  String get nome;

  /// Produtos que este fornecedor pode oferecer
  List<Produto> get produtosDisponiveis;

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return produtosDisponiveis[Random().nextInt(produtosDisponiveis.length)];
  }
}

class FornecedorDeBebidas extends Fornecedor {
  @override
  String get nome => 'Bebidas';

  @override
  List<Produto> get produtosDisponiveis => <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];
}

// OBJETIVO 1: novos fornecedores
class FornecedorDeSanduiches extends Fornecedor {
  @override
  String get nome => 'Sanduiches';

  @override
  List<Produto> get produtosDisponiveis => <Produto>[
    Produto('Sanduiche natural', 250),
    Produto('X-salada', 480),
    Produto('X-bacon', 620),
    Produto('Hamburguer', 540),
    Produto('Misto quente', 320),
  ];
}

class FornecedorDeBolos extends Fornecedor {
  @override
  String get nome => 'Bolos';

  @override
  List<Produto> get produtosDisponiveis => <Produto>[
    Produto('Bolo de cenoura', 380),
    Produto('Bolo de chocolate', 420),
    Produto('Bolo de fuba', 300),
    Produto('Cupcake', 260),
  ];
}

class FornecedorDeSaladas extends Fornecedor {
  @override
  String get nome => 'Saladas';

  @override
  List<Produto> get produtosDisponiveis => <Produto>[
    Produto('Salada verde', 80),
    Produto('Salada caesar', 190),
    Produto('Salada de frutas', 150),
    Produto('Salada de grãos', 220),
  ];
}

class FornecedorDePetiscos extends Fornecedor {
  @override
  String get nome => 'Petiscos';

  @override
  List<Produto> get produtosDisponiveis => <Produto>[
    Produto('Batata frita', 340),
    Produto('Amendoim', 200),
    Produto('Pipoca', 120),
    Produto('Coxinha', 290),
  ];
}

class FornecedorDeUltraCaloricos extends Fornecedor {
  @override
  String get nome => 'Ultra-caloricos';

  @override
  List<Produto> get produtosDisponiveis => <Produto>[
    Produto('Feijoada', 950),
    Produto('Pizza', 1100),
    Produto('Lasanha', 870),
    Produto('Milkshake', 780),
  ];
}

class Pessoa {
  // OBJETIVO 4: nivel inicial de calorias definido aleatoriamente
  int _caloriasConsumidas = Random().nextInt(3000);

  // OBJETIVO 6: acumulador de refeicoes realizadas
  int _refeicoesRealizadas = 0;

  /// Status atual do nivel de calorias dessa pessoa
  StatusDeCalorias get status => StatusDeCalorias.porCalorias(_caloriasConsumidas);

  // OBJETIVO 5: a pessoa so precisa comer enquanto estiver em deficit
  bool get precisaDeRefeicao =>
      status == StatusDeCalorias.deficitExtremo ||
      status == StatusDeCalorias.deficit;

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
    // OBJETIVO 3: status do nivel de calorias
    print('Status: ${status.descricao}');
    // OBJETIVO 6: numero de refeicoes realizadas
    print('Refeições realizadas: $_refeicoesRealizadas');
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print(
      'Consumindo ${produto.nome} (${produto.calorias} calorias) '
      'fornecido por ${fornecedor.nome}',
    );

    _caloriasConsumidas += produto.calorias;
    _refeicoesRealizadas++;
  }
}
