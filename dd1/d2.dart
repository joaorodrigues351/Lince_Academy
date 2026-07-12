void main() {
  List<double> temperaturas = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];

  for (final celcius in temperaturas) {
    final fahrenheit = celcius * 9 / 5 + 32;
    final kelvin = celcius + 273.15;

    print(
      'Celcius: ${celcius.toStringAsFixed(2)}, '
      'fahrenheit: ${fahrenheit.toStringAsFixed(2)}, '
      'kelvin: ${kelvin.toStringAsFixed(2)}',
    );
  }
}
