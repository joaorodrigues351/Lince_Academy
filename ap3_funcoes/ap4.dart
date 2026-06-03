import 'dart:math';

void main(){
  final randon = Random();

  final temperaturas = List.generate(15, (_) => randon.nextInt(5000) + 1);

  imprimirNumeros(temperaturas);
}

void imprimirNumeros(List<int> numeros) {
  numeros.sort();

  for (final numero in numeros) {
    print(
      'decimal: ${converterParaDecimal(numero)}, '
      'binário: ${converterParaBinario(numero)}, '
      'octal: ${converterParaOctal(numero)}, '
      'hexadecimal: ${converterParaHexadecimal(numero)}'
    );
  }
}

String converterParaDecimal(int numero) => numero.toString();
String converterParaBinario(int numero) => numero.toRadixString(2);
String converterParaOctal(int numero)   => numero.toRadixString(8);
String converterParaHexadecimal(int numero) => numero.toRadixString(16);