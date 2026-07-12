import 'package:flutter/material.dart';

void main() {
  runApp(const Ap1App());
}

class Ap1App extends StatelessWidget {
  const Ap1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP1 - Lista de cores',
      debugShowCheckedModeBanner: false,
      home: const ListaDeCoresPage(),
    );
  }
}

class CorItem {
  const CorItem({required this.nome, required this.cor});

  final String nome;
  final Color cor;
}

const cores = <CorItem>[
  CorItem(nome: 'Vermelho', cor: Colors.red),
  CorItem(nome: 'Rosa', cor: Colors.pink),
  CorItem(nome: 'Roxo', cor: Colors.purple),
  CorItem(nome: 'Índigo', cor: Colors.indigo),
  CorItem(nome: 'Azul', cor: Colors.blue),
  CorItem(nome: 'Ciano', cor: Colors.cyan),
  CorItem(nome: 'Verde-água', cor: Colors.teal),
  CorItem(nome: 'Verde', cor: Colors.green),
  CorItem(nome: 'Lima', cor: Colors.lime),
  CorItem(nome: 'Amarelo', cor: Colors.yellow),
  CorItem(nome: 'Âmbar', cor: Colors.amber),
  CorItem(nome: 'Laranja', cor: Colors.orange),
  CorItem(nome: 'Marrom', cor: Colors.brown),
  CorItem(nome: 'Cinza', cor: Colors.grey),
];

class ListaDeCoresPage extends StatelessWidget {
  const ListaDeCoresPage({super.key});

  void _abrirCor(BuildContext context, CorItem item) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => DetalheDaCorPage(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de cores')),
      body: ListView.separated(
        itemCount: cores.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = cores[index];

          return ListTile(
            leading: CircleAvatar(backgroundColor: item.cor),
            title: Text(item.nome),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _abrirCor(context, item),
          );
        },
      ),
    );
  }
}

class DetalheDaCorPage extends StatelessWidget {
  const DetalheDaCorPage({super.key, required this.item});

  final CorItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.cor,
      appBar: AppBar(
        title: Text(item.nome),
        backgroundColor: item.cor,
      ),
      body: Center(
        child: Text(
          item.nome,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
