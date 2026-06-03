import 'dart:math';

void main (){
  final randon = Random();

  for(var i = 0; i < 5; i++){
    final numeroAleatorio = randon.nextInt(25) + 1;
    final letraCorrespondente = pegarLetra(numeroAleatorio);

    print('Numero $numeroAleatorio => Letra $letraCorrespondente');
  }
}

String pegarLetra(int numero) {
  int valorASCIILetraA = 'A'.codeUnitAt(0);
  int codigoASCII = valorASCIILetraA + numero - 1;
  return String.fromCharCode(codigoASCII);
} 