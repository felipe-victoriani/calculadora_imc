import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String resultado = '';
  String classificacao = '';
  Color resultadoCor = Colors.black;

  void calcularIMC() {
    final String pesoText = pesoController.text.replaceAll(',', '.').trim();
    final String alturaText = alturaController.text.replaceAll(',', '.').trim();

    final double? peso = double.tryParse(pesoText);
    final double? altura = double.tryParse(alturaText);

    if (peso == null || altura == null || peso <= 0 || altura <= 0) {
      setState(() {
        resultado = 'Informe valores válidos!';
        classificacao = '';
        resultadoCor = Colors.red;
      });
      return;
    }

    final double imc = peso / (altura * altura);

    String classif;
    Color cor;
    if (imc < 18.5) {
      classif =
          'Você está abaixo do peso ideal. É importante procurar orientação nutricional e médica para avaliar sua saúde e garantir uma alimentação adequada.';
      cor = Colors.orange;
    } else if (imc < 24.9) {
      classif =
          'Parabéns! Seu peso está dentro da faixa considerada saudável. Continue mantendo bons hábitos alimentares e praticando atividades físicas regularmente.';
      cor = Colors.green;
    } else if (imc < 29.9) {
      classif =
          'Você está com sobrepeso. Procure ajustar sua alimentação, praticar exercícios e, se possível, consultar um nutricionista para evitar riscos futuros.';
      cor = Colors.yellow[800]!;
    } else if (imc < 34.9) {
      classif =
          'Atenção! Você está em obesidade grau I. É recomendável acompanhamento médico e nutricional para prevenir complicações de saúde.';
      cor = Colors.orange[900]!;
    } else if (imc < 39.9) {
      classif =
          'Você está em obesidade grau II. Esse nível já apresenta riscos maiores à saúde. Busque apoio médico especializado e siga um plano de reeducação alimentar.';
      cor = Colors.red[700]!;
    } else {
      classif =
          'Cuidado! Você está em obesidade grau III, considerada grave. É fundamental procurar atendimento médico o quanto antes para avaliação e tratamento adequado.';
      cor = Colors.red[900]!;
    }

    setState(() {
      resultado = 'Seu IMC é ${imc.toStringAsFixed(2)}';
      classificacao = 'Classificação: $classif';
      resultadoCor = cor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Calculadora de IMC',
            style: TextStyle(color: Color.fromARGB(255, 247, 246, 246)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Text(
                            'Dicas para calcular o IMC',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '• Digite o peso em quilos (ex: 70)\n'
                            '• Digite a altura em metros, usando ponto ou vírgula (ex: 1.75 ou 1,75)\n'
                            '• Não deixe campos vazios ou com zero',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Peso (kg)',
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.monitor_weight),
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Altura (m)',
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.height),
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: calcularIMC,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text('Calcular IMC'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    resultado,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: resultadoCor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    classificacao,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Dev:Carlos Felipe Lima Victoriani',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
