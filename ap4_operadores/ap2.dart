void main(){
  final textos = ['10', '2XXL7', 'JOJ0', '99', '381', 'AD44', '47', '2B', '123', '78'];

   final numeros = converterLista(textos);
   print('Lista convertida: ${numeros.join(', ')}');
}
List<int> converterLista(List<String> textos) {
  final Lista = <int>[];

  for(var texto in textos){
    int? numero = int.tryParse(texto);

    numero ??= 0;

    Lista.add(numero);
  }
return Lista;

}
