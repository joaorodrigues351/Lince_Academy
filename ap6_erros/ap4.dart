void main(){
  try {

    final nomeArquivo = 'bloco.txt';

    ArquivoTexto arquivoTexto = ArquivoTexto(nomeArquivo);
    arquivoTexto.abrir();
  } catch (e) {
    print('Fim do programa');
  }
}

 abstract class Arquivo {
   void abrir();
 }

  class ArquivoTexto implements Arquivo {
     ArquivoTexto(this.nome);

     final String nome;

     @override 
     void abrir() {
      try {
        throw Exception('Erro ao abrir arquivo $nome');
      } catch (e) {
        print('Relançar a exxeption');
        rethrow;

      }
     }
  } 