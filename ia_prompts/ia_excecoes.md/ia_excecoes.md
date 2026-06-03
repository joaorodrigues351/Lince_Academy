# IA - Exceções em Dart

## Pergunta 1

**Qual a diferença entre um erro e uma exceção em Dart?**

### Resposta obtida

Erros representam problemas graves na execução do programa e geralmente não devem ser tratados. Exceções representam situações inesperadas que podem ser capturadas e tratadas pelo desenvolvedor.

### Minha observação

Entendi que erros normalmente indicam falhas mais sérias, enquanto exceções são situações que o programa pode prever e tratar para continuar funcionando.

---

## Pergunta 2

**O que fazem os blocos try, catch e finally em Dart?**

### Resposta obtida

* `try`: contém o código que pode gerar uma exceção.
* `catch`: captura e trata a exceção.
* `finally`: executa sempre, independentemente de ocorrer uma exceção ou não.

### Minha observação

Percebi que o bloco `finally` é útil para garantir que determinadas ações sejam executadas, como fechar arquivos ou conexões.

---

## Pergunta 3

**Por que eu precisaria lançar uma exceção em meu código?**

### Resposta obtida

Lançar uma exceção permite informar que ocorreu uma situação inválida ou inesperada que impede a continuação correta da execução.

### Minha observação

Entendi que lançar exceções ajuda a tornar os erros mais claros e facilita a identificação de problemas.

---

## Pergunta 4

**Qual a diferença entre usar assert e lançar uma exceção?**

### Resposta obtida

O `assert` é utilizado principalmente durante o desenvolvimento para verificar condições que deveriam ser verdadeiras. Já as exceções são usadas para tratar problemas que podem ocorrer durante a execução normal do programa.

### Minha observação

Aprendi que o `assert` serve mais para testes e validações durante o desenvolvimento, enquanto exceções são usadas em situações reais que podem acontecer com o usuário.

---

## Pergunta 5

**Como os erros e exceções afetam a execução do programa?**

### Resposta obtida

Se não forem tratados, podem interromper a execução do programa. Quando uma exceção é capturada corretamente, o programa pode continuar executando normalmente.

### Minha observação

Compreendi a importância do tratamento de exceções para evitar que o programa seja encerrado inesperadamente.

---

## Conclusão

Com esta atividade aprendi a diferença entre erros e exceções, como utilizar os blocos `try`, `catch` e `finally`, quando lançar exceções e em quais situações utilizar `assert`. Também entendi que o tratamento adequado de exceções torna os programas mais seguros e confiáveis.
