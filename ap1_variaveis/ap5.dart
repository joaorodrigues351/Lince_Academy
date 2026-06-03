import 'dart:math';

void main() {
  final random = Random();
  var valorA = random.nextInt(1);
  var valorB = random.nextInt(100);

  print(" VALORES ALEATORIOS ");
  print("Valor A: $valorA");
  print("Valor B: $valorB");

  final auxiliar = valorA;
  valorA = valorB;
  valorB = auxiliar;

  print(" VALORES INVERTIDOS ");
  print("Valor A: $valorA");
  print("Valor B: $valorB");
}