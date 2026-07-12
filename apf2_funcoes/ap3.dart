import 'dart:math';

import 'package:flutter/material.dart';

const Color _kFundo = Color(0xFF16213A);

void main() {
  runApp(const Ap3App());
}

class Ap3App extends StatelessWidget {
  const Ap3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP3 - Formatos dinâmicos',
      debugShowCheckedModeBanner: false,
      home: const FormatosDinamicosPage(),
    );
  }
}

class FormatosDinamicosPage extends StatefulWidget {
  const FormatosDinamicosPage({super.key});

  @override
  State<FormatosDinamicosPage> createState() => _FormatosDinamicosPageState();
}

class _FormatosDinamicosPageState extends State<FormatosDinamicosPage> {
  final Random _random = Random();

  bool _ehCirculo = true;
  Color _cor = Colors.yellow;

  void _alternarForma() {
    setState(() => _ehCirculo = !_ehCirculo);
  }

  void _sortearCor() {
    setState(() {
      _cor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kFundo,
      body: SafeArea(
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: _alternarForma,
                  child: Text(
                    _ehCirculo ? 'Mudar para quadrado' : 'Mudar para círculo',
                  ),
                ),
                ElevatedButton(
                  onPressed: _sortearCor,
                  child: const Text('Cor aleatoria'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: _cor,
                  shape: _ehCirculo ? BoxShape.circle : BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
