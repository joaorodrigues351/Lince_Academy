# IA como apoio - Operadores em Dart

Aluno: João Eduardo Pereira Rodrigues  
Curso: Sistemas de Informação  
Disciplina: Lince Tech Academy  

---

# Pergunta 1

## Prompt utilizado

O que acontece se eu comparar valores de tipos diferentes usando operadores relacionais em Dart?

## Resposta resumida

Em Dart, alguns tipos diferentes podem ser comparados, mas normalmente é necessário que sejam compatíveis. Comparar tipos incompatíveis pode gerar erro.

## Observações

Aprendi que Dart possui tipagem forte e isso evita muitos erros.

---

# Pergunta 2

## Prompt utilizado

Qual a diferença entre os operadores de divisão '/' e '~/'?

## Resposta resumida

O operador `/` retorna divisão com casas decimais.

Exemplo:

```dart
10 / 3
```

Resultado:

```dart
3.3333
```

O operador `~/` retorna apenas a parte inteira.

Exemplo:

```dart
10 ~/ 3
```

Resultado:

```dart
3
```

## Observações

Entendi que `~/` funciona como divisão inteira.

---

# Pergunta 3

## Prompt utilizado

Como verifico se uma variável é de um determinado tipo em Dart?

## Resposta resumida

Usa-se o operador `is`.

Exemplo:

```dart
if (valor is String) {
  print("É texto");
}
```

## Observações

O operador `is` ajuda na verificação de tipos.

---

# Pergunta 4

## Prompt utilizado

Qual a função do operador '?' em testes de tipo?

## Resposta resumida

O `?` indica que a variável pode ser nula.

Exemplo:

```dart
int? numero;
```

## Observações

Aprendi sobre null safety no Dart.

---

# Pergunta 5

## Prompt utilizado

Como uso os operadores '&&' e '||' para combinar condições?

## Resposta resumida

`&&` significa E.

```dart
idade >= 18 && possuiCNH
```

As duas condições precisam ser verdadeiras.

`||` significa OU.

```dart
isAdmin || isGerente
```

Apenas uma precisa ser verdadeira.

## Observações

Esses operadores são muito usados em validações.

---

# Pergunta 6

## Prompt utilizado

Qual a diferença entre usar 'if-else' e expressões condicionais?

## Resposta resumida

O ternário deixa códigos simples mais curtos.

Exemplo:

```dart
String resultado = idade >= 18 ? "Maior" : "Menor";
```

Já `if-else` é melhor para lógicas maiores.

## Observações

Aprendi que ternário em excesso pode dificultar leitura.

---

# Pergunta 7

## Prompt utilizado

Em quais situações a notação em cascata pode tornar o código mais legível?

## Resposta resumida

A notação em cascata (`..`) evita repetir o nome do objeto.

Exemplo:

```dart
final pessoa = Pessoa()
  ..nome = "João"
  ..idade = 19;
```

## Observações

O código fica mais limpo e organizado.

---

# Pergunta 8

## Prompt utilizado

Traga exemplos de mau uso do ternário.

## Resposta resumida

Ternários muito grandes dificultam leitura.

Exemplo ruim:

```dart
resultado = valor > 10
  ? "A"
  : valor > 5
    ? "B"
    : "C";
```

## Observações

Em casos complexos é melhor usar `if-else`.

---

# Conclusão

Durante a atividade aprendi melhor sobre operadores em Dart, principalmente operadores lógicos, null safety e notação em cascata. Também entendi quando usar ternário e como evitar códigos difíceis de ler.