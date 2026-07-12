# IA como apoio - Flutter: Formulários

Aluno: João Eduardo Pereira Rodrigues
Disciplina: Lince Tech Academy

---

## Pergunta 1

### Prompt utilizado
O que é um widget TextField em Flutter e para que ele serve?

### Resposta resumida
O TextField é o campo onde o usuário digita texto. Serve para capturar entradas como nome, e-mail, senha ou qualquer informação escrita.

### Observações
É o widget básico de entrada de texto no Flutter.

---

## Pergunta 2

### Prompt utilizado
Como posso obter o valor digitado pelo usuário em um TextField?

### Resposta resumida
Usando um `TextEditingController` ligado ao campo pelo parâmetro `controller`. O valor fica acessível em `controller.text`. Também dá para usar o callback `onChanged`, que dispara a cada tecla digitada.

### Observações
O controller é a forma mais comum de pegar o texto digitado.

---

## Pergunta 3

### Prompt utilizado
Qual a diferença entre um TextField e um TextFormField?

### Resposta resumida
O TextFormField é uma versão do TextField pensada para uso dentro de um `Form`, com suporte a validação (`validator`) e integração com o estado do formulário. O TextField sozinho não tem validação embutida.

### Observações
Para formulários com validação, usa-se o TextFormField.

---

## Pergunta 4

### Prompt utilizado
Quais parâmetros importantes do TextField?

### Resposta resumida
Os principais são: `controller` (captura o texto), `decoration` (aparência, com label, ícone, borda), `keyboardType` (tipo de teclado), `obscureText` (esconde o texto, para senhas), `maxLength` (limite de caracteres) e `onChanged` (reage à digitação).

### Observações
O decoration é onde fica quase toda a customização visual.

---

## Pergunta 5

### Prompt utilizado
O que significa validar um campo de texto em Flutter?

### Resposta resumida
Validar é verificar se o que o usuário digitou está correto antes de aceitar (por exemplo, se o campo não está vazio ou se o e-mail tem formato válido). Usa-se o `validator` no TextFormField, que retorna uma mensagem de erro quando o valor é inválido.

### Observações
A validação evita que dados errados sejam enviados.

---

## Pergunta 6

### Prompt utilizado
Qual a diferença entre validação síncrona e assíncrona?

### Resposta resumida
A validação síncrona é imediata, feita na hora com o que já se tem (ex: checar se o campo está vazio). A assíncrona precisa esperar uma resposta externa, como consultar um servidor para ver se um e-mail já está cadastrado.

### Observações
Assíncrona é usada quando depende de algo de fora, como uma API.

---

## Pergunta 7

### Prompt utilizado
O que é um widget CheckBox em Flutter e para que ele serve?

### Resposta resumida
O CheckBox é uma caixa que pode ser marcada ou desmarcada, representando um valor verdadeiro/falso. Serve para opções do tipo "sim ou não", como aceitar termos.

### Observações
É usado para escolhas booleanas (marcado ou não).

---

## Pergunta 8

### Prompt utilizado
Como posso alterar a cor e a forma de um CheckBox?

### Resposta resumida
A cor de quando está marcado é controlada por `activeColor`, e a cor do "check" por `checkColor`. A forma pode ser mudada com `shape` (ex: bordas arredondadas com RoundedRectangleBorder).

### Observações
activeColor muda a cor de fundo quando marcado.

---

## Pergunta 9

### Prompt utilizado
O que é um widget Radio em Flutter e qual sua aplicabilidade?

### Resposta resumida
O Radio é um botão de seleção única dentro de um grupo — só uma opção pode ficar marcada por vez. É usado quando o usuário deve escolher apenas uma alternativa entre várias.

### Observações
Diferente do CheckBox, no Radio só uma opção fica ativa.

---

## Pergunta 10

### Prompt utilizado
Como posso alterar a cor e a forma de um Radio?

### Resposta resumida
A cor quando selecionado é definida por `activeColor`, e dá para controlar cores de estados diferentes com `fillColor`. A área de toque pode ser ajustada com `materialTapTargetSize`.

### Observações
O activeColor também vale para o Radio.

---

## Pergunta 11

### Prompt utilizado
Como posso limitar o número de caracteres que o usuário pode digitar em um TextField?

### Resposta resumida
Com o parâmetro `maxLength`, que define o máximo de caracteres e ainda mostra um contador no canto do campo.

### Observações
O maxLength já exibe a contagem automaticamente.

---

## Pergunta 12

### Prompt utilizado
Como posso alterar o tipo de teclado exibido para um TextField (numérico, email etc.)?

### Resposta resumida
Usando o `keyboardType`, com valores como `TextInputType.number` (numérico), `TextInputType.emailAddress` (e-mail) ou `TextInputType.phone` (telefone).

### Observações
Isso melhora a experiência, mostrando o teclado certo para cada campo.

---

## Pergunta 13

### Prompt utilizado
Como posso adicionar um ícone ao lado do texto em um TextField?

### Resposta resumida
Dentro do `decoration` (InputDecoration), usando `prefixIcon` (ícone antes do texto) ou `suffixIcon` (ícone depois do texto).

### Observações
prefixIcon fica na frente; suffixIcon no final do campo.

---

## Pergunta 14

### Prompt utilizado
Como posso exibir mensagens de erro para o usuário se a validação falhar?

### Resposta resumida
No `validator` do TextFormField, retornando uma String com a mensagem quando o valor é inválido (ou `null` quando está correto). A mensagem aparece automaticamente abaixo do campo.

### Observações
Retornar null significa que passou na validação.

---

## Pergunta 15

### Prompt utilizado
Crie um formulário com um CheckBox para 'Aceitar termos e condições'.

### Resposta resumida
O exemplo mostrado usava um StatefulWidget com uma variável booleana (ex: `aceitou`) controlada por um CheckBox, e o `onChanged` atualizava esse valor com setState. O botão de enviar só era liberado se a caixa estivesse marcada.

### Observações
Entendi o conceito e vou implementar do meu jeito no meu formulário.

---

## Pergunta 16

### Prompt utilizado
Crie um grupo de Radios para permitir que o usuário selecione sua preferência (Aceita ketchup: Não, Sim).

### Resposta resumida
O exemplo usava dois Radios compartilhando a mesma variável de `groupValue`, cada um com um `value` diferente (Sim/Não). O `onChanged` atualizava a variável com setState, marcando só a opção escolhida.

### Observações
O segredo é os Radios do grupo dividirem o mesmo groupValue.

---

## Pergunta 17
