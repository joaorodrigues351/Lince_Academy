Algoritmo "ex3"
Var
   num1: real
   num2: real
   resultado: real
Inicio
   escreva("Digite o primeiro número: ")
   leia(num1)
   escreva("Digite o segundo número: ")
   leia(num2)
 se (num1 > num2) entao
      resultado <- num1 - num2
 senao
      resultado <- num2 - num1
 fimse

   escreval("O valor absoluto da subtração é:", resultado)
Fimalgoritmo