import 'package:flutter/material.dart';
import 'tela_login.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
  builder: (context) => MyApp()
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );

  }
}