import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const Ap3App());
}

class Ap3App extends StatelessWidget {
  const Ap3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP3 - Refatoração',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: const Ap3Page(),
    );
  }
}

enum EstadoJogo { jogando, ganhou, perdeu }

class Ap3Page extends StatefulWidget {
  const Ap3Page({super.key});

  @override
  State<Ap3Page> createState() => _Ap3PageState();
}

class _Ap3PageState extends State<Ap3Page> {
  static const tentativasMaximas = 2;

  final random = Random();

  var estado = EstadoJogo.jogando;
  var botaoCorreto = 0;
  var clicks = 0;
  var vitorias = 0;
  var derrotas = 0;

  @override
  void initState() {
    super.initState();
    sortearBotaoCorreto();
  }

  void sortearBotaoCorreto() {
    botaoCorreto = random.nextInt(3);
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        estado = EstadoJogo.ganhou;
        vitorias++;
        return;
      }

      clicks++;

      if (clicks >= tentativasMaximas) {
        estado = EstadoJogo.perdeu;
        derrotas++;
      }
    });
  }

  void reiniciar() {
    setState(() {
      estado = EstadoJogo.jogando;
      clicks = 0;
      sortearBotaoCorreto();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(title: const Text('AP3 - Refatoração')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          _Placar(vitorias: vitorias, derrotas: derrotas),
          Expanded(
            child: switch (estado) {
              EstadoJogo.jogando => _JogandoView(onTentativa: tentativa),
              EstadoJogo.ganhou => _GanhouView(onReiniciar: reiniciar),
              EstadoJogo.perdeu => _PerdeuView(onReiniciar: reiniciar),
            },
          ),
        ],
      ),
    );
  }
}

class _Placar extends StatelessWidget {
  const _Placar({required this.vitorias, required this.derrotas});

  final int vitorias;
  final int derrotas;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Vitórias: $vitorias   |   Derrotas: $derrotas',
      style: const TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}

class _JogandoView extends StatelessWidget {
  const _JogandoView({required this.onTentativa});

  final void Function(int opcao) onTentativa;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        for (final (indice, rotulo) in const ['A', 'B', 'C'].indexed)
          ElevatedButton(
            onPressed: () => onTentativa(indice),
            child: Text(rotulo),
          ),
      ],
    );
  }
}

class _GanhouView extends StatelessWidget {
  const _GanhouView({required this.onReiniciar});

  final VoidCallback onReiniciar;

  @override
  Widget build(BuildContext context) {
    return _FimDeJogo(
      cor: Colors.green,
      mensagem: 'Você ganhou',
      onReiniciar: onReiniciar,
    );
  }
}

class _PerdeuView extends StatelessWidget {
  const _PerdeuView({required this.onReiniciar});

  final VoidCallback onReiniciar;

  @override
  Widget build(BuildContext context) {
    return _FimDeJogo(
      cor: Colors.red,
      mensagem: 'Você perdeu',
      onReiniciar: onReiniciar,
    );
  }
}

class _FimDeJogo extends StatelessWidget {
  const _FimDeJogo({
    required this.cor,
    required this.mensagem,
    required this.onReiniciar,
  });

  final Color cor;
  final String mensagem;
  final VoidCallback onReiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text(
            mensagem,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: onReiniciar,
            child: const Text('Jogar novamente'),
          ),
        ],
      ),
    );
  }
}
