import 'dart:math' ;

void main(){
 final random = Random();

 final Lista = List.generate(11, (_) => random.nextInt(101));

 for (var indice = 1; indice < Lista.length; indice++){
  print('Posicap: $indice, Valor: ${Lista[indice]}');
 }
}