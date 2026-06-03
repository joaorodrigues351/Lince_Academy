Algoritmo "EX10"
Var

   num: vetor[1..5] de real
   copia_num: vetor[1..5] de real
   aux: real
   i, j: inteiro
   maior, menor, soma, media: real
   soma_pares, soma_impares: real
Inicio
   para i de 1 ate 5 faca
     escreva("Digite o ", i, " número: ")
   leia(num[i])
copia_num[i] <- num[i] /
     soma <- soma + num[i]
      se (alg_para_int(num[i]) mod 2 = 0) entao
soma_pares <- soma_pares + num[i]
     senao
     soma_impares <- soma_impares + num[i]
      fimse
   fimpara
   media <- soma / 5

   para i de 1 ate 4 faca
      para j de i+1 ate 5 faca
       se (num[i] > num[j]) entao
       aux <- num[i]
    num[i] <- num[j]
       num[j] <- aux
   fimse
   fimpara
   fimpara

   menor <- num[1]
   maior <- num[5]

   escreva("a) Ordem crescente: ")
   para i de 1 ate 5 faca
      escreva(num[i]: " ")
   fimpara
   escreval()

   escreva("b) Ordem decrescente: ")
   para i de 5 ate 1 passo -1 faca
      escreva(num[i]: " ")
   fimpara
   escreval()
   escreval("c) Maior número:", maior:)
   escreval("d) Menor número:", menor:)
   escreval("e) Soma dos números:", soma:)
   escreval("f) Média dos números:", media:)
   escreval("g) Soma dos números pares:", soma_pares:)
   escreval("h) Soma dos números ímpares:", soma_impares:)
Fimalgoritmo
