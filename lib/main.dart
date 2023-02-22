import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _calculatorScreen();
}

class _calculatorScreen extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(children: [
        _inputfield(Colors.yellow),
        _calculatorInput()]),
    );
  }

  Row _inputfield(Color color) {
    return Row(children: [
      Flexible(
        child: Container(
          height: 100,
          color: color,
        ),
      ),
    ]);
  }

  Column _calculatorInput() {
    return Column(
      children: [
        Container(
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Field'),
          ),
          height: 50,
          color: Colors.red,
        )
      ],
    );
  }

  Column _stackfield() {
    return Column(
      children: [
        TextField(
          decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: 'Stack'),
        )
      ],
    );
  }
}