import 'dart:math';

void main(){
  final random = Random();
  final numero = random.nextInt(100);

  final resultado = Calculadora.dobro(numero);

  print('O dobro do número $numero é: $resultado');
}

abstract class Calculadora{
    static int dobro(int numero) {
      return numero * 2;
    }
}