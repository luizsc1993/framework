import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController = TextEditingController();

  String _mensagem = '';
  Color _corMensagem = Colors.red;

  void _validarCadastro() {
    setState(() {
      String nome = _nomeController.text;
      String email = _emailController.text;
      String senha = _senhaController.text;
      String confirmaSenha = _confirmaSenhaController.text;

      if (nome.isEmpty) {
        _mensagem = 'Digite seu nome';
        _corMensagem = Colors.red;
      } else if (email.isEmpty) {
        _mensagem = 'Digite seu email';
        _corMensagem = Colors.red;
      } else if (!email.contains('@')) {
        _mensagem = 'Digite um email válido';
        _corMensagem = Colors.red;
      } else if (senha.isEmpty) {
        _mensagem = 'Digite sua senha';
        _corMensagem = Colors.red;
      } else if (senha.length < 6) {
        _mensagem = 'A senha precisa ter pelo menos 6 caracteres';
        _corMensagem = Colors.red;
      } else if (senha != confirmaSenha) {
        _mensagem = 'As senhas não são iguais';
        _corMensagem = Colors.red;
      } else {
        _mensagem = 'Cadastro realizado com sucesso!';
        _corMensagem = Colors.green;
        
        // Limpa os campos após o sucesso
        _nomeController.clear();
        _emailController.clear();
        _senhaController.clear();
        _confirmaSenhaController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_add_alt_1, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Criar Conta',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        hintText: 'Nome completo',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _confirmaSenhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirmar Senha',
                        prefixIcon: const Icon(Icons.lock_clock),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              if (_mensagem.isNotEmpty)
                Text(
                  _mensagem,
                  style: TextStyle(color: _corMensagem, fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _validarCadastro,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Cadastrar', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: const Text('Voltar para Login', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}