import 'dart:math';
 void main(){

  final random = Random();

  final lista = List.generate(50, (_) => random.nextInt(12) + 10);

  print('Primeira Lista: ${lista.join('  ;   ')}');

  final itensUnicos = lista.toSet();

  print('Valores unicos são ${itensUnicos.join('  ;  ')}');
 }
