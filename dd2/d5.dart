import 'dart:math';

void main() {
  final listaDeCompras = ListaDeCompras();

  listaDeCompras.incluirItem('Arroz', 2);
  listaDeCompras.incluirItem('Feijao', 1);
  listaDeCompras.incluirItem('Cafe', 3);
  listaDeCompras.incluirItem('Leite', 6);
  listaDeCompras.incluirItem('Chocolate', 4);

  listaDeCompras.marcarComoComprado('Arroz');
  listaDeCompras.marcarComoComprado('Leite');
  listaDeCompras.marcarSemEstoque('Chocolate');

  listaDeCompras.exibirItensDesejados();

  final pendente = listaDeCompras.itemPendenteAleatorio();
  print('Proximo item: ${pendente?.nome ?? 'nenhum item pendente'}');

  print(listaDeCompras.progresso);
}

class Item {
  Item(this.nome, this.quantidade);

  /// Nome do item a ser comprado
  final String nome;

  /// Quantidade desejada desse item
  final int quantidade;

  @override
  String toString() => '$nome (${quantidade}x)';
}

class ListaDeCompras {
  final List<Item> _desejados = <Item>[];
  final List<Item> _comprados = <Item>[];
  final List<Item> _semEstoque = <Item>[];

  /// Total de itens incluidos na lista, independente da situacao
  int get totalDeItens =>
      _desejados.length + _comprados.length + _semEstoque.length;

  /// Inclui um novo item desejado
  void incluirItem(String nome, int quantidade) {
    _desejados.add(Item(nome, quantidade));
  }

  /// Separa um item ja comprado dos itens desejados
  void marcarComoComprado(String nome) {
    final item = _removerDosDesejados(nome);

    if (item != null) {
      _comprados.add(item);
    }
  }

  /// Separa um item sem estoque dos itens desejados
  void marcarSemEstoque(String nome) {
    final item = _removerDosDesejados(nome);

    if (item != null) {
      _semEstoque.add(item);
    }
  }

  /// Exibe no console os itens desejados, com as suas quantidades
  void exibirItensDesejados() {
    print('Itens desejados:');

    for (final item in _desejados) {
      print(' > $item');
    }
  }

  /// Escolhe um item pendente aleatoriamente
  Item? itemPendenteAleatorio() {
    if (_desejados.isEmpty) {
      return null;
    }

    return _desejados[Random().nextInt(_desejados.length)];
  }

  /// Indicador de progresso: itens comprados contra o total de itens
  String get progresso => 'Progresso: ${_comprados.length}/$totalDeItens';

  Item? _removerDosDesejados(String nome) {
    for (var i = 0; i < _desejados.length; i++) {
      if (_desejados[i].nome == nome) {
        return _desejados.removeAt(i);
      }
    }

    return null;
  }
}
