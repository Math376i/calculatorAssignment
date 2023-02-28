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
                child: const Text("Hopefully works"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("?"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("Hopefully works"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("?"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("Hopefully works"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("?"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("Hopefully works"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("?"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
              FilledButton(
                onPressed: _placeHolder,
                child: Text("Off course"),
              ),
            ],
          )
        ]));
  }

  void _placeHolder() {}
}
