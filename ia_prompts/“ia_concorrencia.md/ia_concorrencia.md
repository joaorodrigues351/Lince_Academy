# Relatório de Estudos Avançado: Concorrência e Assincronismo em Dart

Este relatório documenta a exploração aprofundada dos conceitos de programação assíncrona com `Future` no ecossistema Dart, detalhando a teoria, boas práticas de controle de fluxo, tratamento de exceções e a resolução de cenários reais de erros de compilação e execução.

---

## 1. Fundamentos de Concorrência e Assincronismo

### O que significam os termos 'assíncrono' e 'síncrono'?
* **Síncrono (Synchronous):** A execução do código ocorre de forma linear e bloqueante. O fluxo do programa segue uma única linha de execução (Single Thread) onde a linha $N+1$ não pode iniciar até que a linha $N$ termine. Se a linha $N$ envolver uma operação pesada ou lenta, o programa inteiro sofrerá um congelamento (*freeze*).
* **Assíncrono (Asynchronous):** Permite o agendamento de tarefas de longa duração na *Event Loop* (fila de eventos do Dart). A execução principal do programa continua fluindo normalmente, e o resultado da tarefa assíncrona é injetado de volta no fluxo quando estiver concluído.

### O que é um Future em Dart e como ele ajuda a lidar com tarefas que levam tempo?
Um `Future` é um objeto genérico (`Future<T>`) que representa um valor ou um erro que será resolvido no futuro. Ele possui três estados principais:
1. **Uncompleted (Não concluído):** A operação assíncrona foi disparada, mas ainda está processando.
2. **Completed with a value (Concluído com sucesso):** A operação terminou e retornou o tipo esperado `T`.
3. **Completed with an error (Concluído com erro):** A operação falhou e retornou uma exceção.

### Em quais situações devo usar Futures em meu código Dart?
Sempre que o tempo de resposta não depender puramente do poder de processamento da CPU local:
* **Operações de I/O de arquivos:** Ler arquivos de texto, JSON ou CSV localmente (`File('caminho').readAsString()`).
* **Comunicação em Rede:** Requisições HTTP para APIsREST (usando pacotes como `http` ou `dio`).
* **Persistência de Dados:** Operações em bancos de dados locais (como SQLite, Hive ou Isar).

---

## 2. Controle de Fluxo, Sincronização e Sintaxe

### De quais formas posso esperar que um Future seja concluído e obter o resultado?

#### Abordagem Declarativa com `async` / `await`
É o padrão moderno do Dart. Transforma a leitura de um código assíncrono em algo muito parecido com o código síncrono.

```dart
// Função simulando a busca de uma API
Future<String> buscarUsuario() async {
  return Future.delayed(Duration(seconds: 2), () => "Usuário: Gabriel Silveira");
}

void main() async {
  print("Iniciando requisição...");
  // O fluxo do main pausa aqui até a string ser resolvida, mas a Event Loop continua livre
  String usuario = await buscarUsuario(); 
  print(usuario);
  print("Processo finalizado.");
}