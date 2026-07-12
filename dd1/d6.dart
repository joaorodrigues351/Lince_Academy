void main() {
  List<int> numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];

  numeros.sort();

  for (final numero in numeros) {
    print(
      'decimal: $numero, '
      'binário: ${numero.toRadixString(2)}, '
      'octal: ${numero.toRadixString(8)}, '
      'hexadecimal: ${numero.toRadixString(16)}',
    );
  }
}
