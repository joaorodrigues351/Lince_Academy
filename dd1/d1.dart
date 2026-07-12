import 'dart:math';

void main() {
  List<num> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for (final raio in raios) {
    final area = pi * pow(raio, 2);
    final perimetro = 2 * pi * raio;

    print(
      'Raio: $raio, area: ${area.toStringAsFixed(2)}, '
      'perímetro: ${perimetro.toStringAsFixed(2)}.',
    );
  }
}
