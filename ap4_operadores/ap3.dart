void main(){
  final ListaPrimaria = ['Futebol', 'Tenis De Mesa', 'Padel', 'Tenis', 'Volei', 'Natação', 'Basket'];

  final seguntaLista = removerElemento(
    lista: ListaPrimaria,
    elemento: 'Padel',
  );

  for (var item in seguntaLista){
    print('Esporte: $item');
  }
}

List<String> removerElemento({
  List<String>? lista,
  String? elemento,
}) {
  lista?.remove(elemento);

  return lista ??[];
}