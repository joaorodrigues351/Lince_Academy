void main(){
 try {
   programa(2);
   print('Entrada correta, o valor é par');
 } on Exception catch (e) {
  print(e);
 }
}

void programa(int numero) {
  if (numero.isOdd){
    throw Exception('Entrada inválida. insira apenas números pares');
  }
}