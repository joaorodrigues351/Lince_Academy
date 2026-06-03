import 'dart:math';

void main(){
final resultado1 = funcaoA(funcaoB);
final resultado2 = funcaoA(funcaoB);

print('A(B) = $resultado1');
print('A(C) = $resultado2');
}

int funcaoA(int Function(int) funcaoParametro) {
  final random = Random();
  final resultado1 = funcaoParametro(random.nextInt(999));
  final resultado2 = funcaoParametro(random.nextInt(999));
  final soma = resultado1 + resultado2;

  return soma;
}

int funcaoB(int parametro) {
  return parametro * 2;
}