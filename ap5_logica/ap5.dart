import 'dart:math';

void main(){
  final randon = Random();
  final opcao = randon.nextInt(6);

  switch (opcao){
     case 1:
     case 2:
     case 3:
     case 4:
      print('Encontrar: $opcao');
      break;

      default:
      print('Opcao invalida');

       
  }
}