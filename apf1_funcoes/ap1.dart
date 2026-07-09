import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const Ap1App());
}

class Ap1App extends StatelessWidget {
  const Ap1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP1 - Cores aleatórias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: const Ap1Page(),
    );
  }
}

class Ap1Page extends StatefulWidget {
  const Ap1Page({super.key});

  @override
  State<Ap1Page> createState() => _Ap1PageState();
}

class _Ap1PageState extends State<Ap1Page> {
  final random = Random();

  Color cor = Colors.white;

  void sortearCor() {
    setState(() {
      cor = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AP1 - Cores aleatórias')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Text(
              'Cores aleatórias',
              style: TextStyle(
                color: cor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: sortearCor,
              child: const Text('Sortear cor'),
            ),
          ],
        ),
      ),
    );
  }
}
