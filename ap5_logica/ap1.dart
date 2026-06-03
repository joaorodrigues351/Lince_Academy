void main(){
  final numerosImpares = gerarNumerosImpares(20);

  for (var numero in numerosImpares) {
    print('Impar: $numero');
  }
}

List<int> gerarNumerosImpares(int maximo){
  var contador = 0;
  var sequencia = <int>[];

  while (contador < maximo){
    if (contador.isOdd){
      sequencia.add(contador);
    }
    contador++;
  } 
  return sequencia;
}