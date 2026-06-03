void main(){
  final retangulo = Retangulo(7.9, 2.7);
    double area = retangulo.calcularArea();

    print("Área do reângulo: $area");
}

class Retangulo{
  Retangulo(this.largura, this.altura);

  final double altura;
  final double largura;

    double calcularArea(){
      return altura * largura;
    }
}