void main() {
  String nome = 'João';
  String sobrenome = 'Rodrigues';
  int idade = 19;
  bool ativo = true;
  double peso = 72.5;
  String? nacionalidade = null;

 print('Nome Completo: $nome $sobrenome');  
 
 if (idade >= 18){
   print('Idade: $idade (maior idade)');
 } else {
  print('Idade: $idade (menor idade)');
 }
 if (ativo) {
    print("Situação: Ativo");
  } else {
    print("Situação: Inativo");
  }

print('Peso: ${peso.toStringAsFixed(2)}');

if (nacionalidade != null) {
  print('Nacionalidade: $nacionalidade');
} else {
  print('Nacionalidade: Não informada');
}
}