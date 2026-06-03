algoritmo "ex2"
var
  numero, i: inteiro
inicio
    para i de 1 até 5 passo 1 faca
      escreva("Digite o ", i, " número: ")
      leia(numero)
      se (numero % 2 <> 0) entao
         escreval("Número ímpar recebido: ", numero)
      fimse
   fimpara
fimalgoritmo