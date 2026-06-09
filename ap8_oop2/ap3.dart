void main(){
    final joao = Joao();

    joao.jogar();
    joao.fazerGol();
}


abstract class Jogador {
  void jogar();
}

abstract class Atacante{
  void fazerGol();
}

 class Joao implements Jogador, Atacante{
    void jogar(){
      print('Joao esta jogando');
    }

    void fazerGol(){
      print('Joao fez gol');
    }
 }