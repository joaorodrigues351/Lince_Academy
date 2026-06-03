# 📑 Estudo de Funções em Dart

## 1. Cuidados ao Criar Funções em Dart
* **Responsabilidade Única (SRP):** Uma função deve fazer apenas uma coisa. Se sua função calcula, formata e salva um dado, divida-a em três funções menores.
* **Tipagem Explícita:** Sempre defina o tipo de retorno e o tipo dos parâmetros. Evite deixar o Dart inferir tudo como `dynamic`.
* **Efeitos Colaterais:** Evite que uma função modifique variáveis globais ou estados fora do seu escopo sem necessidade. Priorize funções puras.

## 2. Recursividade: Chamar uma Função Dentro Dela Mesma
Sim, isso se chama **Recursão**. É útil para navegar em estruturas repetitivas ou em árvores de diretórios.
> ⚠️ **Cuidado Vital:** Toda função recursiva precisa de um **caso base** (uma condição de parada). Sem isso, o programa entra em loop infinito e estoura a memória do sistema (**Stack Overflow**).

## 3. Limite de Parâmetros em uma Função
O compilador do Dart suporta centenas de parâmetros. Na prática do desenvolvimento limpo (**Clean Code**), o recomendado é usar no máximo de **3 a 4 parâmetros**. 
* Se uma função precisa de muitos dados, passe um objeto estruturado (uma `class`) ou utilize **parâmetros nomeados** para manter o código legível.

## 4. O Uso de `dynamic` nos Parâmetros
**Não é recomendado.** O uso de `dynamic` desativa a checagem de tipos em tempo de compilação.
* Erros que seriam pegos antes de rodar o código só aparecerão em tempo de execução (quando o app quebrar na mão do usuário).
* Se você precisa aceitar múltiplos tipos específicos, use **Generics** (`<T>`) em vez de `dynamic`.

## 5. Parâmetros Opcionais vs. Requeridos
No Dart, parâmetros por padrão são posicionais e obrigatórios. Podemos mudar isso usando chaves `{}` (nomeados) ou colchetes `[]` (posicionais opcionais):
* **Requeridos (`required`):** Usados dentro de parâmetros nomeados para obrigar o desenvolvedor a passar aquele dado essencial.
* **Opcionais:** Usados quando o dado não é obrigatório. Devem aceitar nulo (ex: `int? idade`) ou possuir um valor padrão (ex: `int idade = 18`).

## 6. Parâmetros Nomeados
São parâmetros envolvidos por chaves `{}`. Eles trazem duas grandes vantagens:
* **Clareza:** Ao chamar a função, você escreve o nome do parâmetro (ex: `configurar(usuario: "Ana", admin: true)`).
* **Ordem independente:** Você pode passar os argumentos em qualquer ordem.

## 7. Métodos e Propriedades de Variáveis do Tipo `Function`
Em Dart, funções são objetos de primeira classe. Variáveis do tipo `Function` possuem recursos como:
* **`call()`:** Executa a função implicitamente ou explicitamente (ex: `minhaFuncao.call()`).
* **`hashCode` e `runtimeType`:** Retornam a identidade do objeto e a assinatura do tipo da função.
* **Closures:** Capacidade de "lembrar" do escopo onde foram criadas, retendo variáveis locais.

## 8. Diferença entre `olaMundo` e `olaMundo()`
* **`olaMundo` (Sem parênteses):** Você está se referindo à **referência da função**. Você não a executa, apenas a passa adiante como um objeto (útil para passar funções como argumentos/callbacks).
* **`olaMundo()` (Com parênteses):** Você está **invocando/executando** a função naquele exato momento. O resultado gerado ali será o valor de retorno dela.

## 9. Prática: Manipulação de Strings dentro de Funções
Exemplo de função que limpa, padroniza e valida uma string utilizando métodos nativos de `String`:

```dart
bool validarEmail(String email) {
  final emailFormatado = email.trim().toLowerCase();
  
  if (emailFormatado.isEmpty) return false;
  return emailFormatado.contains('@') && emailFormatado.endsWith('.com');
}
```

## 10. Exemplos de Mau Uso de Funções (Anti-padrões)

### Código Ruim ❌ (Função Monolítica e Sem Tipos)
```dart
processar(p1, p2) {
  print(p1.toString());
  var res = p1 + p2;
  saveToDatabase(res); // Misturando lógica de persistência com cálculo
  return res;
}
```

### Código Bom  (Funções Especializadas e Tipadas)
```dart
int somarValores(int a, int b) => a + b;

void registrarResultado(int resultado) {
  print("Log: \$resultado");
  saveToDatabase(resultado);
}
```

## 11. Como Organizar Funções no Código
* **Funções Globais de Top-Level:** Use apenas se a função for utilitária e puramente matemática (não depender de nenhum estado do app).
* **Métodos de Classe:** Se a função manipula dados de um objeto, ela deve ser um método dentro da classe correspondente.
* **Funções Locais (Aninhadas):** Se uma função só faz sentido existir dentro de outra função maior, declare-a escopada lá dentro para não poluir o código.

---

## 📝 Minhas Observações de Estudo
*(Utilize este espaço para descrever o que você aprendeu analisando a estrutura de callbacks e a sintaxe das funções anônimas vistas nos exercícios anteriores).*
