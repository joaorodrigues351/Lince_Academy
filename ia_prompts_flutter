# IA como apoio - Introdução ao Flutter e Widgets

Aluno: João Eduardo Pereira Rodrigues
Disciplina: Lince Tech Academy

---

## Pergunta 1

### Prompt utilizado
Explique o MaterialApp e seus parâmetros?

### Resposta resumida
O MaterialApp é o widget raiz que configura o app seguindo o Material Design. Ele cuida de tema, navegação, título e idioma. Principais parâmetros: `home` (tela inicial), `theme` (cores e fontes), `title` (nome do app), `routes` e `initialRoute` (navegação) e `debugShowCheckedModeBanner` (remove a faixa de debug).

### Observações
Entendi que o MaterialApp é o "esqueleto" de configuração geral do app.

---

## Pergunta 2

### Prompt utilizado
Quais parâmetros são importantes no MaterialApp?

### Resposta resumida
Os mais usados no dia a dia são: `home`, para definir a primeira tela; `theme`, para padronizar cores e fontes; `title`, para nomear o app; `routes`/`initialRoute`, para navegação entre telas; e `debugShowCheckedModeBanner: false`, para tirar a faixa vermelha de DEBUG.

### Observações
Nem todos os parâmetros são obrigatórios; o `home` já é suficiente para começar.

---

## Pergunta 3

### Prompt utilizado
Como funcionam os "import's" no Flutter?

### Resposta resumida
O `import` traz código de outros arquivos ou pacotes para o arquivo atual. Existem três tipos: `package:` (pacotes externos, como `package:flutter/material.dart`), `dart:` (bibliotecas nativas do Dart, como `dart:math`) e caminhos relativos (`'meu_arquivo.dart'`, para arquivos do próprio projeto).

### Observações
Aprendi que sem o import do material.dart não consigo usar os widgets prontos do Flutter.

---

## Pergunta 4

### Prompt utilizado
Explique o que é o Material Design e como ele é utilizado no Flutter.

### Resposta resumida
O Material Design é o sistema de design criado pelo Google, com regras de cores, espaçamento, sombras e componentes. No Flutter, ele é aplicado por meio dos widgets Material (dentro do MaterialApp), que já seguem esse padrão visual automaticamente.

### Observações
Entendi que o Flutter também tem o Cupertino, que segue o design da Apple.

---

## Pergunta 5

### Prompt utilizado
Quais são os principais widgets do Material Design disponíveis no Flutter?

### Resposta resumida
Os principais são: `Scaffold`, `AppBar`, `ElevatedButton`, `TextButton`, `FloatingActionButton`, `Card`, `ListTile`, `Drawer`, `SnackBar`, `BottomNavigationBar` e `TextField`. Cada um representa um componente visual comum das interfaces Material.

### Observações
Percebi que quase toda tela usa Scaffold e AppBar como base.

---

## Pergunta 6

### Prompt utilizado
O que são widgets Stateless e quando devemos utilizá-los?

### Resposta resumida
Stateless são widgets que não mudam ao longo do tempo — sua aparência depende só das informações recebidas na criação. Devem ser usados para partes fixas da interface, como textos estáticos, ícones e logos.

### Observações
Aprendi que Stateless é mais simples e leve por não guardar estado.

---

## Pergunta 7

### Prompt utilizado
Explique o ciclo de vida de um widget Stateless.

### Resposta resumida
O ciclo é simples: o construtor é chamado e em seguida o método `build()` desenha o widget na tela. Ele só é reconstruído se o widget pai mudar ou se os dados recebidos mudarem — nunca por conta própria.

### Observações
Como não tem estado, o ciclo de vida dele é bem curto comparado ao Stateful.

---

## Pergunta 8

### Prompt utilizado
Quais são as limitações dos widgets Stateless?

### Resposta resumida
A principal limitação é não conseguir guardar nem alterar estado interno. Ele não pode se atualizar sozinho: se algo precisa mudar após a construção (por interação do usuário, por exemplo), o Stateless não dá conta.

### Observações
Entendi que quando algo precisa mudar na tela, preciso partir para o Stateful.

---

## Pergunta 9

### Prompt utilizado
O que são widgets Stateful e quando devemos utilizá-los?

### Resposta resumida
Stateful são widgets que podem mudar de estado durante a execução. Devem ser usados quando a interface precisa reagir a algo — como um contador, um formulário, um checkbox ou uma animação.

### Observações
A ideia central é: se muda com o tempo ou com o toque do usuário, é Stateful.

---

## Pergunta 10

### Prompt utilizado
Explique o ciclo de vida de um widget Stateful.

### Resposta resumida
O ciclo passa por: `createState()` (cria o estado), `initState()` (inicialização única), `build()` (desenha a tela), `didUpdateWidget()` (quando o widget é recriado), `setState()` (dispara redesenhos) e `dispose()` (limpa recursos quando o widget é removido).

### Observações
Aprendi que o initState é ótimo para configurar coisas no início e o dispose para evitar vazamentos.

---

## Pergunta 11

### Prompt utilizado
Como o gerenciamento de estado é feito em widgets Stateful?

### Resposta resumida
O estado fica guardado em um objeto `State` separado do widget. Para alterar esse estado e refletir na tela, usa-se o método `setState()`, que avisa o Flutter que algo mudou e precisa ser redesenhado.

### Observações
Entendi que os dados que mudam ficam na classe State, não no widget em si.

---

## Pergunta 12

### Prompt utilizado
Como funciona o "setState" em Flutter?

### Resposta resumida
O `setState()` avisa o Flutter de que uma variável de estado mudou, fazendo com que o método `build()` seja chamado de novo para redesenhar a tela com os novos valores. Na prática, é como dizer: "mudei algo aqui, dá uma repintada na tela".

### Observações
Percebi que se eu mudar a variável sem o setState, a tela não atualiza.

---

## Pergunta 13

### Prompt utilizado
Quais cuidados tomar no gerenciamento de estado?

### Resposta resumida
Evitar chamar `setState()` sem necessidade (afeta performance), não chamá-lo depois do `dispose()`, manter o `build()` "limpo" sem lógica pesada, e colocar tarefas demoradas fora do build. Em apps maiores, vale usar soluções como Provider ou Riverpod.

### Observações
Aprendi que abusar do setState pode deixar o app lento.

---

## Pergunta 14

### Prompt utilizado
Quais as principais diferenças entre widgets Stateless e Stateful?

### Resposta resumida
O Stateless não guarda estado e não muda sozinho, tendo um ciclo de vida simples. O Stateful guarda estado mutável, pode se atualizar com o `setState()` e tem um ciclo de vida mais completo (initState, dispose, etc.). Stateless é mais leve; Stateful é mais flexível.

### Observações
A regra prática: use Stateless até precisar mudar algo, aí troque para Stateful.

---

## Pergunta 15

### Prompt utilizado
Como o Flutter lida com a renderização de widgets na tela?

### Resposta resumida
O Flutter usa três árvores conectadas: a árvore de Widgets (a descrição da interface), a de Elements (a ligação entre widget e o que está na tela) e a de RenderObjects (responsável por medir, posicionar e desenhar). Isso permite reconstruir widgets de forma rápida e eficiente.

### Observações
Entendi que reconstruir widgets é barato porque o desenho pesado fica na árvore de RenderObjects.

---

## Pergunta 16

### Prompt utilizado
Forneça exemplos de cenários onde cada tipo de widget seria mais adequado.

### Resposta resumida
Stateless: um logo, um texto fixo, um ícone, um cabeçalho que não muda. Stateful: um contador, um formulário com validação, um checkbox, um botão de curtir e qualquer animação — ou seja, tudo que reage à interação do usuário.

### Observações
Ficou claro que a escolha depende de a interface mudar ou não durante o uso.

---

## Pergunta 17

### Prompt utilizado
Preciso de um exemplo do igual, porém usando os 2 tipos de widgets Stateless e Stateful.

### Resposta resumida
Uma tela que mostra um título fixo (Stateless) e um contador que aumenta ao apertar um botão (Stateful). O título nunca muda, então é Stateless; o número muda a cada toque, então é Stateful e usa setState() para atualizar. O mesmo resultado visual, com responsabilidades separadas por tipo de widget.

### Observações
Vi na prática que dá para combinar os dois tipos na mesma tela, cada um no seu papel.

---

## Conclusão
Durante a atividade entendi melhor a estrutura básica de um app Flutter e o papel do MaterialApp e do Material Design. Aprendi a diferença entre widgets Stateless e Stateful, seus ciclos de vida e quando usar cada um. Também compreendi como o setState atualiza a tela, quais cuidados tomar no gerenciamento de estado e como o Flutter renderiza widgets usando suas três árvores.
