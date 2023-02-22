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
        _calculatorInput(),
        _numPad()
      ]),
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

  Column _numPad() {
    return Column(
      children: [
        Row(
          children: [
            FloatingActionButton(
              onPressed: _subtract,
              tooltip: 'Subtract',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '7',
              child: const Text('7'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '8',
              child: const Text('8'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '9',
              child: const Text('9'),
            ),
          ],
        ),
        Row(
          children: [
            FloatingActionButton(
              onPressed: _subtract,
              tooltip: 'Subtract',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '4',
              child: const Text('4'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '5',
              child: const Text('5'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '6',
              child: const Text('6'),
            ),
          ],
        ),
        Row(
          children: [
            FloatingActionButton(
              onPressed: _subtract,
              tooltip: 'Subtract',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '7',
              child: const Text('1'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '8',
              child: const Text('2'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '9',
              child: const Text('3'),
            ),
          ],
        ),
        Row(
          children: [
            FloatingActionButton(
              onPressed: _subtract,
              tooltip: 'Subtract',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '7',
              child: const Text('7'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '8',
              child: const Text('8'),
            ),
            FloatingActionButton(
              onPressed: inputSeven,
              tooltip: '9',
              child: const Text('9'),
            ),
          ],
        ),
      ],
    );
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

  void inputSeven() {}
}

void _subtract() {}
