void main(){
    final valorOriginalDoProduto = 25.90;
    final valorComDesconto = 15.90;

    print(
      'O produto custava $valorOriginalDoProduto reais '
      'e foi vendido por $valorComDesconto reais ',
    );

    final desconto = descobrirDesconto(valorOriginalDoProduto, valorComDesconto);

    print('O desconto foi de $desconto%. ');
}

int descobrirDesconto(double valorOriginal, double valorComDesconto){
  final percentual = (valorComDesconto * 100 ) ~/ valorOriginal;

  return 100 - percentual;
}