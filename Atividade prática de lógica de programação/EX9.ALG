Algoritmo "EX9"
Var
   texto, letra: caractere
   i, tam: inteiro
   vogais, consoantes, letras, palavras: inteiro
Inicio
   escreva("Digite um texto: ")
   leia(texto)
   tam <- compr(texto)
   texto <- maiusc(texto)
   se tam > 0 entao
      palavras <- 1
   fimse
   para i de 1 ate tam faca
    letra <- copia(texto, i, 1)
 se (letra = "A") ou (letra = "E") ou (letra = "I") ou (letra = "O") ou (letra = "U") entao
    vogais <- vogais + 1
         letras <- letras + 1
  senao
  se (letra >= "A") e (letra <= "Z") entao
      consoantes <- consoantes + 1
         letras <- letras + 1
       senao
       se letra = " " entao
          palavras <- palavras + 1
  fimse
   fimse
   fimse
   fimpara
   
   escreval("a) Quantidade de vogais:", vogais)
   escreval("b) Quantidade de consoantes:", consoantes)
   escreval("c) Quantidade total de letras:", letras)
   escreval("d) Quantidade de palavras:", palavras)
Fimalgoritmo