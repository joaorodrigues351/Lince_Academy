Algoritmo "ex4"
Var
   num1: inteiro
   num2: inteiro
   mmc: inteiro
Inicio

   escreva("Digite o primeiro número inteiro: ")
   leia(num1)
   escreva("Digite o segundo número inteiro: ")
   leia(num2)

   mmc <- num1 

   enquanto (mmc % num1 <> 0) ou (mmc % num2 <> 0) faca
      mmc <- mmc + 1
   fimenquanto

   escreval("O menor múltiplo comum é:", mmc)
Fimalgoritmo