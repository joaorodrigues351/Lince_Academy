import 'package:flutter/material.dart';

const Color _kFundo = Color(0xFF16213A);

void main() {
  runApp(const Ap2App());
}

class Ap2App extends StatelessWidget {
  const Ap2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP2 - Quadrados empilhados',
      debugShowCheckedModeBanner: false,
      home: const QuadradosEmpilhadosPage(),
    );
  }
}

class QuadradosEmpilhadosPage extends StatelessWidget {
  const QuadradosEmpilhadosPage({super.key});

  static const List<_Grupo> _grupos = [
    _Grupo(
      fundo: Colors.grey,
      cores: [Colors.red, Colors.green, Colors.blue],
    ),
    _Grupo(
      fundo: Colors.black,
      cores: [Colors.cyan, Colors.purple, Colors.yellow],
    ),
    _Grupo(
      fundo: null,
      cores: [Colors.red, Colors.amber, Colors.blue],
    ),
    _Grupo(
      fundo: Colors.white,
      cores: [
        Color(0xFF6A1B9A),
        Color(0xFFE65100),
        Colors.yellow,
        Color(0xFFCDDC39),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kFundo,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: _grupos.map((grupo) => _PilhaDeQuadrados(grupo)).toList(),
          ),
        ),
      ),
    );
  }
}

class _Grupo {
  const _Grupo({required this.fundo, required this.cores});

  final Color? fundo;
  final List<Color> cores;
}

class _PilhaDeQuadrados extends StatelessWidget {
  const _PilhaDeQuadrados(this.grupo);

  final _Grupo grupo;

  static const double _passo = 15;
  static const double _lado = 50;
  static const double _ladoExterno = 100;

  @override
  Widget build(BuildContext context) {
    final double ocupado = _lado + (grupo.cores.length - 1) * _passo;
    final double inicio = (_ladoExterno - ocupado) / 2;

    return Container(
      width: _ladoExterno,
      height: _ladoExterno,
      margin: const EdgeInsets.all(8),
      color: grupo.fundo,
      child: Stack(
        children: [
          for (var i = 0; i < grupo.cores.length; i++)
            Positioned(
              left: inicio + i * _passo,
              top: inicio + i * _passo,
              child: Container(
                width: 50,
                height: 50,
                color: grupo.cores[i],
              ),
            ),
        ],
      ),
    );
  }
}
