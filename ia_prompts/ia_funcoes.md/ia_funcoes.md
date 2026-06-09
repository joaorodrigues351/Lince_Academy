# Relatório de Estudos: Funções em Dart
**Atividade:** Interação com IA para suporte em Funções e Sintaxe  
**Curso:** Lince Tech Academy  
**Arquivo:** ia_funcoes.md  

---

## 1. Introdução
Este documento registra o estudo e a exploração teórica sobre o comportamento de funções na linguagem Dart. O objetivo foi compreender as boas práticas de desenvolvimento, os diferentes tipos de parâmetros (posicionais, nomeados, opcionais e requeridos), o conceito de recursividade e o comportamento de funções tratadas como objetos de primeira classe.

---

## 2. Conceitos Explorados e Interações

### 2.1. Cuidados e Organização ao Criar Funções
* **Princípio da Responsabilidade Única (SRP):** Uma função deve fazer apenas uma coisa e fazê-la bem. Se uma função valida um dado, calcula um valor e salva no banco de dados, ela deve ser dividida em três funções menores.
* **Organização de Código:** Funções que pertencem à lógica de uma classe devem ser métodos internos dela. Funções utilitárias globais devem ser organizadas em arquivos separados (ex: `utils/validators.dart`) ou dentro de classes utilitárias com métodos estáticos.

### 2.2. Recursividade (Função chamando ela mesma)
* **É possível?** Sim, o Dart permite que uma função invoque a si mesma (recursão).
* **Cuidados:** Toda função recursiva precisa obrigatoriamente de uma **condição de parada (caso base)**. Sem isso, ela entrará em loop infinito e causará um estouro de memória conhecido como *Stack Overflow*.

### 2.3. Parâmetros: Limites, `dynamic` e Tipagem
* **Existe limite de parâmetros?** Tecnicamente não há um limite rígido imposto pelo Dart, mas por boa prática de Clean Code, funções com mais de 3 ou 4 parâmetros tornam-se difíceis de ler e manter.
* **O perigo do `dynamic`:**