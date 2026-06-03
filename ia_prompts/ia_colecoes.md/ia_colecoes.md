# 📑 Relatório de Estudos: Coleções em Dart
**Curso:** Lince Tech Academy  
**Módulo:** Trabalhando com listas, conjuntos e mapas  
**Ferramenta de IA:** Apoio conceitual e teórico  

---

## 1. Listas (`List`)

### Boas Práticas e Performance
* **Tipagem explícita:** Sempre declarar tipos como `List<String>`. Evita erros em tempo de execução.
* **Imutabilidade:** Usar `List.unmodifiable()` ou `const` quando a lista for estática. Poupa memória.
* **Tamanho fixo:** Inicializar com `List.filled(tamanho, valor)` se o tamanho for conhecido. Evita realocações.
* **Operadores de coleção:** Utilizar *collection if* e *collection for* para criar listas condicionais limpas.

### O que NÃO fazer (Contraindicado)
* **Modificação concorrente:** Não adicionar/remover itens dentro de loops `forEach` ou `for-in`. Causa erro.
* **Async no forEach:** Não usar funções assíncronas dentro de `.forEach()`. Prefira o loop `for-in`.

---

## 2. Escolha de Estruturas: List vs Set vs Map

### Cenários Favoráveis
* **`List`:** Ordem importa. Permite duplicados. Exemplo: Histórico de transações.
* **`Set`:** Elementos únicos. Busca rápida. Exemplo: Lista de IDs de usuários online.
* **`Map`:** Par chave-valor. Chaves únicas. Exemplo: Respostas de API (JSON).

### Cuidados com `Set`
* **Objetos Customizados:** Exige a sobrescrita de `==` e `hashCode` na classe correspondente. Caso contrário, o Dart não identificará itens duplicados.

---

## 3. Métodos Utilitários e Iteração Eficiente

### Métodos de Filtro e Busca
* **`.where()`:** Filtra elementos gerando um novo `Iterable`.
* **`.any()`:** Retorna `true` se ao menos um item atender à condição.
* **`.every()`:** Retorna `true` apenas se todos os itens atenderem à condição.

### Método `Map.map()`
* Transforma chaves e valores gerando um novo mapa.
* Exige o retorno de um objeto do tipo `MapEntry(chave, valor)`.

### Iteração Eficiente
1. **`for-in`:** Mais limpo e rápido para leitura simples.
2. **`for` tradicional:** Usar apenas quando o índice numérico for estritamente necessário.
3. **`.map()` / `.where()`:** Operações *lazy* (preguiçosas). Só processam os dados ao chamar `.toList()`.

---

## 4. Documentação: `elementAtOrNull`

### Conceito
* Extensão segura para buscar elementos por índice em um `Iterable`.

### Vantagem
* Substitui o erro de quebra de app (`IndexOutOfBoundsException`) por um retorno seguro de valor `null`.

---

## 5. Minhas Observações Pessoais

*Escreva aqui com suas palavras as suas principais conclusões sobre os impactos de performance e quando você pretende aplicar cada estrutura no seu projeto prático.*
