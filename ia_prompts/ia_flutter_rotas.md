# IA como apoio - Flutter: Rotas

Aluno: João Eduardo Pereira Rodrigues
Disciplina: Lince Tech Academy

---

## Pergunta 1

### Prompt utilizado
O que são rotas anônimas em Flutter e como elas funcionam?

### Resposta resumida
Rotas anônimas são telas criadas na hora da navegação, sem um nome definido. Usa-se o `Navigator.push()` junto com o `MaterialPageRoute`, indicando diretamente qual widget/tela deve abrir.

### Observações
São chamadas "anônimas" porque não têm um nome registrado.

---

## Pergunta 2

### Prompt utilizado
Quais métodos do Navigator são comumente utilizados e por quê?

### Resposta resumida
Os mais usados são: `push` (abre uma nova tela), `pop` (volta para a anterior), `pushNamed` (abre uma rota nomeada), `pushReplacement` (troca a tela atual por outra) e `popUntil` (volta várias telas de uma vez).

### Observações
push e pop são a base de toda navegação.

---

## Pergunta 3

### Prompt utilizado
Qual a função do Navigator.push() na navegação com rotas anônimas?

### Resposta resumida
O `push` empilha uma nova tela por cima da atual, tornando-a visível. Recebe o contexto e um `MaterialPageRoute` que define qual widget será exibido.

### Observações
É como colocar uma tela nova em cima da pilha.

---

## Pergunta 4

### Prompt utilizado
Quais as vantagens e desvantagens de usar rotas anônimas?

### Resposta resumida
Vantagem: são simples e rápidas de usar para navegações pontuais, sem configuração prévia. Desvantagem: em apps grandes ficam difíceis de organizar e manter, já que a tela de destino é escrita direto no push, espalhando o código.

### Observações
Boas para apps pequenos; ruins para apps grandes.

---

## Pergunta 5

### Prompt utilizado
O que são rotas nomeadas em Flutter e como elas funcionam?

### Resposta resumida
Rotas nomeadas são telas registradas com um nome (uma String, como '/home'). São definidas em um só lugar no MaterialApp e chamadas pelo nome com `Navigator.pushNamed()`.

### Observações
Cada tela ganha um "endereço" fixo.

---

## Pergunta 6

### Prompt utilizado
Como posso navegar para uma rota nomeada específica?

### Resposta resumida
Usando `Navigator.pushNamed(context, '/nomeDaRota')`, passando o nome exato que foi registrado no MaterialApp.

### Observações
O nome tem que ser igual ao registrado, senão dá erro.

---

## Pergunta 7

### Prompt utilizado
Quais as vantagens de usar rotas nomeadas em relação às rotas anônimas?

### Resposta resumida
As rotas nomeadas centralizam a navegação em um só lugar, deixam o código mais organizado, evitam repetição e facilitam a manutenção em apps com muitas telas.

### Observações
São mais organizadas e escaláveis que as anônimas.

---

## Pergunta 8

### Prompt utilizado
Como posso definir rotas nomeadas em meu aplicativo Flutter?

### Resposta resumida
No MaterialApp, usando o parâmetro `routes`, que é um mapa (nome → tela). Também dá para definir a tela inicial com `initialRoute`.

### Observações
Todas as rotas ficam registradas dentro do MaterialApp.

---

## Pergunta 9

### Prompt utilizado
Como posso acessar os parâmetros passados em uma rota nomeada?

### Resposta resumida
Passa-se o valor no `arguments` do pushNamed, e na tela de destino recupera-se com `ModalRoute.of(context)!.settings.arguments`.

### Observações
Os dados viajam pelo parâmetro arguments.

---

## Pergunta 10

### Prompt utilizado
Como posso tornar os parâmetros opcionais em uma rota nomeada?

### Resposta resumida
Tratando o caso em que `arguments` vem nulo, usando verificação de null ou valores padrão. Assim a tela funciona mesmo se nenhum parâmetro for passado.

### Observações
É preciso prever quando o argumento não é enviado.

---

## Pergunta 11

### Prompt utilizado
Quais cuidados devo ter ao usar as rotas?

### Resposta resumida
Evitar nomes de rota digitados errado, cuidar com o tipo dos argumentos (fazer cast correto), tratar parâmetros nulos e não empilhar telas demais sem necessidade (o que consome memória).

### Observações
Erro de digitação no nome da rota é um problema comum.

---

## Pergunta 12

### Prompt utilizado
Quais as boas práticas ao usar rotas em Flutter?

### Resposta resumida
Guardar os nomes das rotas em constantes (evitando digitar a String toda vez), centralizar as rotas em um arquivo separado e, em apps maiores, considerar pacotes como o go_router para navegação mais organizada.

### Observações
Usar constantes para os nomes evita erros de digitação.

---

## Pergunta 13

### Prompt utilizado
Traga um exemplo de galeria navegando entre imagens usando rotas anônimas.

### Resposta resumida
O exemplo mostrava uma tela com miniaturas que, ao serem tocadas, usavam `Navigator.push` com MaterialPageRoute para abrir uma segunda tela exibindo a imagem ampliada. Cada toque criava a rota na hora, passando a imagem escolhida.

### Observações
Entendi o conceito e vou implementar a galeria do meu jeito.

---

## Pergunta 14

### Prompt utilizado
Crie um fluxo com várias telas, passando pelos times brasileiros usando rotas nomeadas e parâmetros.

### Resposta resumida
O exemplo usava rotas nomeadas registradas no MaterialApp, com uma lista de times na primeira tela. Ao tocar em um time, usava `pushNamed` passando o nome do time no `arguments`, e a tela de detalhes recuperava esse dado para exibir as informações do time escolhido.

### Observações
Entendi como combinar rotas nomeadas com passagem de parâmetros e vou montar meu próprio fluxo.

---

## Conclusão
Nesta atividade aprendi as duas formas de navegação no Flutter: rotas anônimas, criadas na hora com Navigator.push e MaterialPageRoute, e rotas nomeadas, registradas no MaterialApp e chamadas por um nome com pushNamed. Entendi como passar e recuperar parâmetros entre telas usando o arguments, como tratar parâmetros opcionais e quais os cuidados e boas práticas, como usar constantes para os nomes das rotas. Ficou claro que rotas anônimas servem para apps pequenos e rotas nomeadas são melhores para projetos maiores e mais organizados.
