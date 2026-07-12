import 'package:flutter/material.dart';

void main() {
  runApp(const Ap1App());
}

class Ap1App extends StatelessWidget {
  const Ap1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP1 - Formulário básico',
      debugShowCheckedModeBanner: false,
      home: const FormularioBasicoPage(),
    );
  }
}

class Cadastro {
  const Cadastro({
    required this.nome,
    required this.idade,
    required this.inativo,
  });

  final String nome;
  final int idade;
  final bool inativo;
}

class FormularioBasicoPage extends StatefulWidget {
  const FormularioBasicoPage({super.key});

  @override
  State<FormularioBasicoPage> createState() => _FormularioBasicoPageState();
}

class _FormularioBasicoPageState extends State<FormularioBasicoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();

  bool _inativo = false;
  Cadastro? _cadastroSalvo;

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  String? _validarNome(String? valor) {
    final nome = (valor ?? '').trim();

    if (nome.isEmpty) {
      return 'O nome não pode ser vazio';
    }
    if (nome.length < 3) {
      return 'O nome não pode ter menos de 3 letras';
    }
    if (!RegExp(r'^[A-ZÀ-Ý]').hasMatch(nome)) {
      return 'O nome precisa começar com uma letra maiúscula';
    }
    return null;
  }

  String? _validarIdade(String? valor) {
    final idade = int.tryParse((valor ?? '').trim());

    if (idade == null) {
      return 'A idade precisa ser um número válido';
    }
    if (idade < 18) {
      return 'A idade precisa ser maior ou igual a 18';
    }
    return null;
  }

  void _salvar() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _cadastroSalvo = Cadastro(
        nome: _nomeController.text.trim(),
        idade: int.parse(_idadeController.text.trim()),
        inativo: _inativo,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário básico')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    textCapitalization: TextCapitalization.words,
                    validator: _validarNome,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _idadeController,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: _validarIdade,
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Inativo'),
                    contentPadding: EdgeInsets.zero,
                    value: _inativo,
                    onChanged: (valor) => setState(() => _inativo = valor),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _salvar,
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (_cadastroSalvo != null) _DadosSalvos(cadastro: _cadastroSalvo!),
          ],
        ),
      ),
    );
  }
}

class _DadosSalvos extends StatelessWidget {
  const _DadosSalvos({required this.cadastro});

  final Cadastro cadastro;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: cadastro.inativo ? Colors.grey : Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dados salvos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Nome: ${cadastro.nome}',
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            'Idade: ${cadastro.idade}',
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            'Situação: ${cadastro.inativo ? 'Inativo' : 'Ativo'}',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
