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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("+"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("7"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("8"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("9"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("-"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("4"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("5"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("6"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("*"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("1"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("2"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("3"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("/"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("Enter"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("0"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("Clear"),
              ),
            ],
          )
        ]));
  }

  void _placeHolder() {}

  void _subtract() {}

  void _addition() {}

  void _division() {}

  void _multiply() {}
}
