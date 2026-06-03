Algoritmo "ex5"
Var
   a, b, c: real
   delta: real
   x1, x2: real
Inicio
   escreva("Digite o valor de A: ")
   leia(a)
   escreva("Digite o valor de B: ")
   leia(b)
   escreva("Digite o valor de C: ")
   leia(c)

   delta <- (b * b) - (4 * a * c)

   x1 <- (-b + raizq(delta)) / (2 * a)
   x2 <- (-b - raizq(delta)) / (2 * a)

   escreval("X1:", x1)
   escreval("X2:", x2)
Fimalgoritmo