import 'dart:io';

import 'package:flutter/material.dart';

import 'commands.dart';
import 'stack.dart';

void main() {
  runApp(const MyApp());
}

final commands = [
  Enter(),
  Print(),
  Exit(),
  Clear(),
  Add(),
  Subtract(),
  Multiply(),
  Noop()
];

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
  var currentNumberInString =
      ""; // Nuvaerene String som bruges til input af nummer til vidderfoersel til stack,
  var currentStack =
      InputStack<int>(); // Den nuvaerende stack med alle tilfoejede numre
  var currentWorkingInt = 0; // Bruges til vidersendlse af int til stack

  // TODO: Taenker vi skal have lavet TextField's til disabled saa man ikke som bruger kan redigere dem direkte.
  // Alternativt skal vi bruge noget andet end TextField,
  //eventuelt bare en container med text i sig eller hvad end vi kan finde paa

  void _stackAdd(int number) {}

  void _enter(int number) {
    setState(() {
      currentStack.push(number);
    });
  }

  void _numPress(String number) {
    currentNumberInString = currentNumberInString + number;
    var num = int.parse(currentNumberInString);
    setState(() {
      currentWorkingInt = num;
    });
  }

  void _command(String input) {
    if (currentStack == null) {
      commands
          .firstWhere((element) => element.accept(currentStack, input))
          .execute(currentStack, input);
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calculator')),
        body: Column(children: [
          Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "$currentStack"),
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: "$currentNumberInString"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: _placeHolder,
                child: const Text("+"),
              ),
              FilledButton(
                onPressed: () => _numPress(
                    "7"), // <== Denne er lavet som jeg var i gang med, og resten taenker jeg skal foelge
                child: const Text("7"),
              ),
              FilledButton(
                onPressed: () => _numPress("8"),
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
                onPressed: () => _enter(currentWorkingInt),
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
}
