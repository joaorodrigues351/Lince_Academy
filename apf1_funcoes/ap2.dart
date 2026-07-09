import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const Ap2App());
}

class Ap2App extends StatelessWidget {
  const Ap2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP2 - Opção aleatória',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: const Ap2Page(),
    );
  }
}

class Ap2Page extends StatefulWidget {
  const Ap2Page({super.key});

  @override
  State<Ap2Page> createState() => _Ap2PageState();
}

class _Ap2PageState extends State<Ap2Page> {
  final random = Random();

  var botaoCorreto = 0;
  var clicks = 0;
  var ganhou = false;
  var perdeu = false;

  @override
  void initState() {
    super.initState();

    botaoCorreto = random.nextInt(3);
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        ganhou = true;
      } else {
        clicks++;
      }

      if (clicks >= 2 && !ganhou) {
        perdeu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AP2 - Opção aleatória')),
      body: conteudo(),
    );
  }

  Widget conteudo() {
    if (ganhou) {
      return Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('Você ganhou'),
      );
    }

    if (perdeu) {
      return Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('Você perdeu'),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            tentativa(0);
          },
          child: const Text('A'),
        ),
        ElevatedButton(
          onPressed: () {
            tentativa(1);
          },
          child: const Text('B'),
        ),
        ElevatedButton(
          onPressed: () {
            tentativa(2);
          },
          child: const Text('C'),
        ),
      ],
    );
  }
}
