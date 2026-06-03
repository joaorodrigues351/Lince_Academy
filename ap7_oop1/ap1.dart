import 'dart:math';

void main(){
   final conta = ContaBancaria(95000.0, "Eduardo");
  conta.depositar(2000.00);
  conta.sacar(225.00);

  print("saldo da conta: ${conta.saldo}");
}

class ContaBancaria {
  ContaBancaria(this.saldo, this.titular);
    double saldo;
    String titular;

    void depositar(double valor){
      saldo += valor;
    }

    void sacar(double valor){
      if (valor <= saldo){
        saldo -= valor;
      } else {
        print("Saldo insuficiente. ");
      }
    }
}