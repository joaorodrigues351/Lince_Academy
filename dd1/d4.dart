void main() {
  final dataAtual = DateTime.now();
  final dataCalculada = somarDiasUteis(dataAtual, 18);

  print('Data atual: ${formatar(dataAtual)}');
  print('Data calculada: ${formatar(dataCalculada)}');
}

DateTime somarDiasUteis(DateTime data, int dias) {
  var resultado = data;
  var somados = 0;

  while (somados < dias) {
    resultado = resultado.add(Duration(days: 1));

    if (resultado.weekday != DateTime.saturday &&
        resultado.weekday != DateTime.sunday) {
      somados++;
    }
  }

  return resultado;
}

String formatar(DateTime data) {
  final dia = data.day.toString().padLeft(2, '0');
  final mes = data.month.toString().padLeft(2, '0');

  return '$dia/$mes/${data.year}';
}
