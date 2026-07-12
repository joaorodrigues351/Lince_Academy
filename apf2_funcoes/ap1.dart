import 'package:flutter/material.dart';

const Color _kFundo = Color(0xFF16213A);

void main() {
  runApp(const Ap1App());
}

class Ap1App extends StatelessWidget {
  const Ap1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP1 - Retângulos coloridos',
      debugShowCheckedModeBanner: false,
      home: const RetangulosColoridosPage(),
    );
  }
}

class RetangulosColoridosPage extends StatelessWidget {
  const RetangulosColoridosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kFundo,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _linhaDeQuadrados(),
            _blocoAmarelo(),
            _blocoCinza(),
          ],
        ),
      ),
    );
  }

  Widget _linhaDeQuadrados() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _Bloco(cor: Colors.red),
        _Bloco(cor: Colors.green),
        _Bloco(cor: Colors.blue),
      ],
    );
  }

  Widget _blocoAmarelo() {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.yellow,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _Bloco(cor: Colors.purple, altura: 100),
          _Bloco(cor: Colors.cyan, altura: 100),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Bloco(cor: Colors.purple),
              _Bloco(cor: Colors.cyan),
            ],
          ),
        ],
      ),
    );
  }

  Widget _blocoCinza() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.grey,
      child: const _Bloco(cor: Colors.black, margem: 0),
    );
  }
}

class _Bloco extends StatelessWidget {
  const _Bloco({
    required this.cor,
    this.altura = 50,
    this.margem = 8,
  });

  final Color cor;
  final double altura;
  final double margem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: altura,
      margin: EdgeInsets.all(margem),
      color: cor,
    );
  }
}
