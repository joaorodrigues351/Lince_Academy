import 'dart:math';
void main(){
  final randon = Random();
  
  final numero = randon.nextInt(900) + 100;
  final soma = somaDosPares(numero);

  print('A soma dos números pares entre 0 e $numero e $soma');
}

 int somaDosPares(int maximo) {
  int acumulador = 0;

  for(int indice = 1; indice <= maximo; indice++){
    if (indice.isEven){
      acumulador += indice;
    }
  }
  return acumulador;
 }