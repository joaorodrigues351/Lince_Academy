import 'dart:math';

void main(){
final random = Random();

final lista = List.generate(50, (_) => random.nextInt(16));

print('Primeira lista: ${lista.join('  ;  ')}');

lista.removeWhere((Item) => Item.isEven);

print('Lista sem números pares: ${lista.join('   ;   ')}');

}