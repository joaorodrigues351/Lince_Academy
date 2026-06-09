void main() {
  final cavalo = Cavalo();
  cavalo.comer();
  cavalo.beber();
  cavalo.correr();
  }


abstract class Animal {
  void comer(){
    print('O animal esta comendo');
  }
  void beber(){
    print('O animal esta bebendo');
  }
}

class Cavalo extends Animal{
  void correr(){
    print('O cavalo esta correndo');
  }
}

