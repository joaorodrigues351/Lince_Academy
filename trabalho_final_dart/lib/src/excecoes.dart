/// Excecao base das falhas previstas pelo programa
abstract class FalhaDoPrograma implements Exception {
  const FalhaDoPrograma(this.mensagem);

  final String mensagem;

  @override
  String toString() => mensagem;
}

/// Nenhum arquivo de sensor foi encontrado no diretorio configurado
class NenhumArquivoEncontrado extends FalhaDoPrograma {
  const NenhumArquivoEncontrado(String diretorio)
      : super(
          'Falha ao extrair informações, nenhum arquivo encontrado '
          'no diretório "$diretorio"',
        );
}

/// O arquivo existe, mas nao pode ser lido do disco
class FalhaNaLeituraDeArquivo extends FalhaDoPrograma {
  const FalhaNaLeituraDeArquivo(String arquivo, Object causa)
      : super('Falha na leitura de um arquivo: "$arquivo" ($causa)');
}

/// O arquivo foi lido, mas o conteudo nao esta no formato esperado
class FalhaAoExtrairInformacoes extends FalhaDoPrograma {
  const FalhaAoExtrairInformacoes(String arquivo, int linha, Object causa)
      : super(
          'Falha ao extrair informações do arquivo "$arquivo", '
          'linha $linha ($causa)',
        );
}
