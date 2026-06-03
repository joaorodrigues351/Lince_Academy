import 'dart:math';

void main(){

  final randon = Random();

 final lista1 = List.generate(5, (_) => randon.nextInt(101));
 final lista2 = List.generate(5, (_) => randon.nextInt(101));

 imprimirLista(lista1);
 imprimirLista(lista2);

 final lista3 = somarListas(lista1, lista2);
 imprimirLista(lista3);
}

void imprimirLista(List<int> lista) {
  if (lista.length > 0) {
    print('Lista: ${lista.join(' , ')}');
  } else {
    print('Lista vazia');
  }
}
 List<int> somarListas(List<int> lista1, List<int> lista2){
  if (lista1.length != lista2.length){
return[];
  }
final resultado = <int>[];

  for (var indice = 0; indice < lista1.length; indice++){
final valorLista1 = lista1[indice];
final valorLista2 = lista2[indice];
final soma = valorLista1 + valorLista2;

print('${valorLista1}+${valorLista2}');

resultado.add(soma);
  }
 return resultado;
 }