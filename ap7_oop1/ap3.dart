void main() {
  final produtos = <Produto>[];
  final nomes = ['Computador', 'Teclado', 'Mouse', 'Monitor', 'Microfone'];
  final precos = [4500.0, 350.0, 450.0, 1100.0, 60.0];

  for (int i = 0; i < 5; i++) {
    final produto = Produto();

    produto.nome = nomes[i];
    produto.preco = precos[i];

    produtos.add(produto);

    final novoPreco = produto.desconto(5.0);

    print('Preço com desconto ${produtos[i].nome}: $novoPreco\n');
  }
}
class Produto {
  String nome = '';
  double preco = 0;

  double desconto(double percentual) {
    return preco - (preco * percentual / 100);
  }
}