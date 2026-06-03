Algoritmo "EX7"
Var
   num_decimal: real
   num_inteiro: inteiro
   fatorial: inteiro
   i: inteiro

Inicio

      escreva("Digite um nuumero decimal: ")
       leia(num_decimal)

       num_inteiro <- int(num_decimal)

       fatorial <- -1

       para i de 1 ate num_inteiro faca
            fatorial <- fatorial * i
       fimpara

      escreval("O fatorial de: ", num_inteiro, " é : ", fatorial)
Fimalgoritmo