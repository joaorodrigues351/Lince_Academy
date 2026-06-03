import 'dart:math';

void main() {
   
    final random = Random();
    final numA = random.nextInt(100);
    final numB = random.nextInt(100);
    final resultado = numA / numB;
    final parteInteira = resultado.floor();
    final parteDecimal = (resultado.floor() - resultado).abs();

    print(" VALORES DAS VARIAVEIS ");
    print("valorA: $numA");
    print("valorB: $numB");
    print("resultado: $resultado");
    print("parteInteira: $parteInteira");
    print("parteDecimal: $parteDecimal");
}