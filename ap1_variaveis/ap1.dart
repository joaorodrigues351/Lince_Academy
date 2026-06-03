void main() { 
  const nota1 = 7.0;
  const nota2 = 8.0;
  const nota3 = 5.3;
  const nota4 = 9.7;
    final media = (nota1 + nota2 + nota3 + nota4) / 4;
 print(
    'A das notas [ ${nota1.toStringAsFixed(1)} , ${nota2.toStringAsFixed(1)} , ${nota3.toStringAsFixed(1)} , ${nota4.toStringAsFixed(1)}  ] é = ${media.toStringAsFixed(1)}',
  );

}