# IA como apoio - Flutter: Widgets básicos

Aluno: João Eduardo Pereira Rodrigues
Disciplina: Lince Tech Academy

---

## Pergunta 1

### Prompt utilizado
Explique o conceito de um widget Row em Flutter.

### Resposta resumida
O Row organiza seus widgets filhos na horizontal, um ao lado do outro. Recebe uma lista no parâmetro `children` e distribui os elementos da esquerda para a direita.

### Observações
Entendi que Row é para layout em linha (horizontal).

---

## Pergunta 2

### Prompt utilizado
Como posso adicionar espaçamento uniforme entre os widgets em um Row?

### Resposta resumida
Dá para usar `MainAxisAlignment.spaceEvenly`, `spaceBetween` ou `spaceAround` para distribuir o espaço automaticamente. Outra forma é colocar `SizedBox(width: X)` entre os widgets ou usar `Spacer()`.

### Observações
Aprendi que spaceEvenly deixa o espaçamento igual inclusive nas bordas.

---

## Pergunta 3

### Prompt utilizado
Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Row?

### Resposta resumida
No Row, o `MainAxisAlignment` controla o alinhamento na horizontal (eixo principal) e o `CrossAxisAlignment` controla o alinhamento na vertical (eixo cruzado).

### Observações
No Row o eixo principal é horizontal; no Column é o contrário.

---

## Pergunta 4

### Prompt utilizado
Explique o conceito de um widget Column em Flutter.

### Resposta resumida
O Column organiza seus widgets filhos na vertical, um embaixo do outro. Funciona igual ao Row, só que no sentido de cima para baixo.

### Observações
Row e Column são quase iguais, só muda a direção.

---

## Pergunta 5

### Prompt utilizado
Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Column?

### Resposta resumida
No Column é o inverso do Row: o `MainAxisAlignment` controla o alinhamento na vertical (eixo principal) e o `CrossAxisAlignment` controla o alinhamento na horizontal (eixo cruzado).

### Observações
O eixo principal sempre segue a direção do widget (vertical no Column).

---

## Pergunta 6

### Prompt utilizado
Explique o conceito de um widget Stack em Flutter.

### Resposta resumida
O Stack permite sobrepor widgets, um em cima do outro, como camadas. O primeiro da lista fica embaixo e os seguintes vão empilhando por cima.

### Observações
Serve para colocar um texto ou botão em cima de uma imagem, por exemplo.

---

## Pergunta 7

### Prompt utilizado
Quais as vantagens de usar Stack em vez de Row ou Column?

### Resposta resumida
O Stack é útil quando os elementos precisam se sobrepor, algo que Row e Column não fazem (eles só colocam lado a lado ou um abaixo do outro). Ideal para banners com texto sobreposto, selos e badges.

### Observações
Row/Column organizam em sequência; Stack sobrepõe.

---

## Pergunta 8

### Prompt utilizado
Como posso posicionar widgets específicos dentro de um Stack?

### Resposta resumida
Usando o widget `Positioned` dentro do Stack, com propriedades como `top`, `bottom`, `left` e `right` para definir a distância das bordas. Widgets sem Positioned seguem o alinhamento geral do Stack.

### Observações
O Positioned dá controle exato da posição dentro do Stack.

---

## Pergunta 9

### Prompt utilizado
Como posso exibir uma imagem de um arquivo local em Flutter?

### Resposta resumida
Usa-se `Image.asset('caminho/da/imagem.png')`. Antes é preciso declarar a pasta de imagens no `pubspec.yaml`, na seção `assets`.

### Observações
Aprendi que sem registrar no pubspec.yaml a imagem local não aparece.

---

## Pergunta 10

### Prompt utilizado
Quais propriedades posso usar para controlar a aparência do texto (fonte, tamanho, cor)?

### Resposta resumida
Usa-se o parâmetro `style` com um `TextStyle`, que aceita `fontSize`, `color`, `fontWeight`, `fontStyle`, `letterSpacing`, entre outros.

### Observações
Toda a aparência do texto fica dentro do TextStyle.

---

## Pergunta 11

### Prompt utilizado
Como posso exibir um texto em várias linhas?

### Resposta resumida
O texto quebra sozinho quando não cabe no espaço. Dá para controlar com `maxLines` (número máximo de linhas) e `overflow` (o que fazer quando estoura, como `TextOverflow.ellipsis` para virar "...").

### Observações
maxLines + ellipsis é ótimo para não estourar o layout.

---

## Pergunta 12

### Prompt utilizado
Como posso criar uma lista de rolagem vertical em Flutter?

### Resposta resumida
Com o widget `ListView`, que já vem com rolagem automática. Basta passar os widgets no `children` e, se a lista for maior que a tela, ele rola sozinho.

### Observações
O ListView já resolve a rolagem sem precisar configurar nada.

---

## Pergunta 13

### Prompt utilizado
Como posso adicionar itens dinamicamente a um ListView?

### Resposta resumida
Usando o `ListView.builder`, que cria os itens a partir de uma lista de dados através do `itemCount` e do `itemBuilder`. Ele constrói os itens sob demanda, o que é eficiente para listas grandes.

### Observações
O builder só cria o que aparece na tela, economizando memória.

---

## Pergunta 14

### Prompt utilizado
Quais as diferenças entre ListView.builder e ListView.separated?

### Resposta resumida
Os dois criam listas dinâmicas, mas o `ListView.separated` adiciona um separador entre cada item (via `separatorBuilder`), como uma linha divisória. O `builder` não tem esse separador.

### Observações
Separated é o builder + um divisor entre os itens.

---

## Pergunta 15

### Prompt utilizado
Como posso usar ListTile para criar itens de lista em um ListView?

### Resposta resumida
O `ListTile` é um item de lista pronto, com espaços para título (`title`), subtítulo (`subtitle`), ícone à esquerda (`leading`) e à direita (`trailing`). Basta usá-lo dentro do ListView ou do itemBuilder.

### Observações
O ListTile já vem com um layout padrão de item de lista.

---

## Pergunta 16

### Prompt utilizado
Como posso tornar os itens ListTile interativos (clicáveis)?

### Resposta resumida
Usando o parâmetro `onTap`, que recebe uma função executada quando o item é tocado. Também existe o `onLongPress` para toque longo.

### Observações
Só de adicionar o onTap o item já fica clicável.

---

## Pergunta 17

### Prompt utilizado
Quais as vantagens de usar ListTile em vez de widgets de texto simples?

### Resposta resumida
O ListTile já traz layout padronizado, espaçamento correto, suporte a ícones, toque (onTap) e visual alinhado ao Material Design — tudo isso sem precisar montar na mão com Row e Column.

### Observações
Economiza tempo e deixa a lista com aparência profissional.

---

## Pergunta 18

### Prompt utilizado
Como os widgets são organizados dentro de um Stack?

### Resposta resumida
São empilhados na ordem da lista: o primeiro fica na camada de baixo e os próximos vão sobre ele. O tamanho do Stack costuma se ajustar ao maior filho, e o alinhamento padrão pode ser mudado com a propriedade `alignment`.

### Observações
A ordem da lista define quem fica na frente.

---

## Pergunta 19

### Prompt utilizado
Como posso exibir uma imagem da internet em Flutter?

### Resposta resumida
Usa-se `Image.network('url_da_imagem')`. O Flutter baixa e exibe a imagem automaticamente, sem precisar registrar nada no pubspec.yaml.

### Observações
Diferente da imagem local, a da internet não precisa de configuração.

---

## Pergunta 20

### Prompt utilizado
Como posso adicionar um efeito de desvanecimento a uma imagem?

### Resposta resumida
Usa-se o `FadeInImage`, que mostra uma imagem temporária (placeholder) enquanto a principal carrega, fazendo uma transição suave. É comum usar com imagens da internet.

### Observações
Melhora a experiência
