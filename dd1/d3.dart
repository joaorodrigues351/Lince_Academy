void main() {
  const paragrafo =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Nam venenatis nunc et posuere vehicula. '
      'Mauris lobortis quam id lacinia porttitor.';

  print('parágrafo: $paragrafo');
  print('Numero de palavras: ${contarPalavras(paragrafo)}');
  print('Tamanho do texto: ${paragrafo.length}');
  print('Numero de frases: ${contarFrases(paragrafo)}');
  print('Numero de vogais: ${contarVogais(paragrafo)}');
  print('Consoantes encontradas: ${consoantes(paragrafo).join(', ')}');
}

int contarPalavras(String texto) {
  return texto.split(RegExp(r'\s+')).where((palavra) => palavra.isNotEmpty).length;
}

int contarFrases(String texto) {
  return texto.split('.').where((frase) => frase.trim().isNotEmpty).length;
}

int contarVogais(String texto) {
  return texto.toLowerCase().split('').where(ehVogal).length;
}

List<String> consoantes(String texto) {
  final encontradas = texto
      .toLowerCase()
      .split('')
      .where((letra) => RegExp(r'[a-z]').hasMatch(letra) && !ehVogal(letra))
      .toSet()
      .toList();

  encontradas.sort();

  return encontradas;
}

bool ehVogal(String letra) {
  return 'aeiou'.contains(letra);
}
