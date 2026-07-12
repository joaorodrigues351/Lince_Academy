void main() {
  List<int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

  print('for: ${somarComFor(numeros)}');
  print('while: ${somarComWhile(numeros)}');
  print('recursão: ${somarComRecursao(numeros)}');
  print('lista: ${somarComColecao(numeros)}');
}

int somarComFor(List<int> numeros) {
  var soma = 0;

  for (var i = 0; i < numeros.length; i++) {
    soma += numeros[i];
  }

  return soma;
}

int somarComWhile(List<int> numeros) {
  var soma = 0;
  var i = 0;

  while (i < numeros.length) {
    soma += numeros[i];
    i++;
  }

  return soma;
}

int somarComRecursao(List<int> numeros) {
  if (numeros.isEmpty) {
    return 0;
  }

  return numeros.first + somarComRecursao(numeros.sublist(1));
}

int somarComColecao(List<int> numeros) {
  return numeros.fold(0, (soma, numero) => soma + numero);
}
