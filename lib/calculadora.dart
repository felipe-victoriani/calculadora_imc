import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculadora de IMC')),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(child: Text('Conteúdo da calculadora')),
    );
  }
}
