import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  
  String _mensagemFeedback = '';
  Color _corMensagem = Colors.black;

  void _fazerLogin() {
    setState(() {
      if (_emailController.text.contains('@') && _emailController.text.contains('.')) {
        _mensagemFeedback = 'Logado com sucesso!';
        _corMensagem = Colors.green;
      } else {
        _mensagemFeedback = 'E-mail inválido, tente de novo.';
        _corMensagem = Colors.red;
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Digite seu e-mail',
              ),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: _fazerLogin,
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 20),

            Text(
              _mensagemFeedback,
              style: TextStyle(
                color: _corMensagem, 
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}