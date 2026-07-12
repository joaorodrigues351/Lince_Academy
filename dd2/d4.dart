import 'dart:math' as math;

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geometricas
  // OBJETIVO 2: todas sao tratadas como FormaGeometrica (polimorfismo)
  final formas = <FormaGeometrica>[
    Circulo('Circulo A', 3),
    Circulo('Circulo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    Quadrado('Quadrado A', 5),
    // OBJETIVOS 4, 5, 6 e 7: novas formas geometricas
    TrianguloEquilatero('Triângulo equilátero A', 9),
    TrianguloRetangulo('Triângulo retângulo A', 6, 8),
    PentagonoRegular('Pentágono regular A', 7),
    HexagonoRegular('Hexágono regular A', 6),
  ];

  final maiorArea = comparador.deMaiorArea(formas);
  print(
    'A maior area e ${maiorArea.area.toStringAsFixed(2)} '
    'e pertence a ${maiorArea.nome}',
  );

  final maiorPerimetro = comparador.deMaiorPerimetro(formas);
  print(
    'O maior perímetro e ${maiorPerimetro.perimetro.toStringAsFixed(2)} '
    'e pertence a ${maiorPerimetro.nome}',
  );
}

// OBJETIVO 1: classe base para a heranca de todas as formas geometricas
// OBJETIVO 2: area e perimetro sao abstratos, cada forma tem sua propria regra
/// Representa qualquer forma geometrica do sistema
abstract class FormaGeometrica {
  FormaGeometrica(this.nome);

  final String nome;

  /// Retorna a area dessa forma
  double get area;

  /// Retorna o perimetro dessa forma
  double get perimetro;
}

/// Representa a forma geometrica "círculo"
class Circulo extends FormaGeometrica {
  /// Construtor padrao, recebe o [raio] do círculo.
  Circulo(super.nome, this.raio);

  final double raio;

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

/// Representa a forma geometrica "retângulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo extends FormaGeometrica {
  /// Construtor padrao, recebe a [altura] e [largura] do retângulo
  Retangulo(super.nome, this.altura, this.largura);

  final double largura;
  final double altura;

  @override
  double get area => altura * largura;

  @override
  double get perimetro => (altura * 2) + (largura * 2);
}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado extends Retangulo {
  /// Construtor padrao, recebe o [lado] do quadrado
  Quadrado(String nome, double lado) : super(nome, lado, lado);
}

/// Representa a forma geometrica "triângulo equilátero", triângulo onde os
/// tres lados possuem o mesmo tamanho.
class TrianguloEquilatero extends FormaGeometrica {
  /// Construtor padrao, recebe o [lado] do triângulo
  TrianguloEquilatero(super.nome, this.lado);

  final double lado;

  @override
  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double get perimetro => lado * 3;
}

/// Representa a forma geometrica "triângulo retângulo", triângulo com um
/// angulo reto (90 graus) formado pelos dois catetos.
class TrianguloRetangulo extends FormaGeometrica {
  /// Construtor padrao, recebe os catetos [base] e [altura] do triângulo
  TrianguloRetangulo(super.nome, this.base, this.altura);

  final double base;
  final double altura;

  /// Lado oposto ao angulo reto
  double get hipotenusa => math.sqrt(math.pow(base, 2) + math.pow(altura, 2));

  @override
  double get area => (base * altura) / 2;

  @override
  double get perimetro => base + altura + hipotenusa;
}

/// Representa a forma geometrica "pentágono regular", poligono de cinco lados
/// de mesmo tamanho.
class PentagonoRegular extends FormaGeometrica {
  /// Construtor padrao, recebe o [lado] do pentágono
  PentagonoRegular(super.nome, this.lado);

  final double lado;

  @override
  double get area => (5 * math.pow(lado, 2)) / (4 * math.tan(math.pi / 5));

  @override
  double get perimetro => lado * 5;
}

/// Representa a forma geometrica "hexágono regular", poligono de seis lados
/// de mesmo tamanho.
class HexagonoRegular extends FormaGeometrica {
  /// Construtor padrao, recebe o [lado] do hexágono
  HexagonoRegular(super.nome, this.lado);

  final double lado;

  @override
  double get area => (3 * math.sqrt(3) / 2) * math.pow(lado, 2);

  @override
  double get perimetro => lado * 6;
}

// OBJETIVO 3: o comparador possui apenas dois metodos, um para area e um para
// perimetro, e atende qualquer forma geometrica do sistema
/// Compara caracteristicas de formas geometricas
class ComparadorFormasGeometricas {
  /// Retorna a forma com a maior area, ou a primeira caso as areas sejam iguais
  FormaGeometrica deMaiorArea(List<FormaGeometrica> formas) {
    return formas.reduce(
      (maior, forma) => forma.area > maior.area ? forma : maior,
    );
  }

  /// Retorna a forma com o maior perimetro, ou a primeira caso os perimetros
  /// sejam iguais
  FormaGeometrica deMaiorPerimetro(List<FormaGeometrica> formas) {
    return formas.reduce(
      (maior, forma) => forma.perimetro > maior.perimetro ? forma : maior,
    );
  }
}
