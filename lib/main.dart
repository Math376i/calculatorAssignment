import 'dart:io';
import 'package:flutter/material.dart';
import 'src/commands.dart';

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
      home: const StateChanger(),
    );
  }
}

class StateChanger extends StatefulWidget {
  const StateChanger({super.key});

  static StateChangerState of(BuildContext context) {
    return context.findAncestorStateOfType<StateChangerState>()!;
  }

  @override
  State<StateChanger> createState() => StateChangerState();
}

class StateChangerState extends State<StateChanger> {
  StateCommands state = StateCommands.empty();
  String number = "";

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      state: state,
      number: number,
      child: const CalculatorScreen(title: "Calculator Screen"),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key, required this.title});
  final String title;

  @override
  State<CalculatorScreen> createState() => _calculatorScreen();
}

class _calculatorScreen extends State<CalculatorScreen> {
  var currentNumberInString = "";

  Registry viewRegistry = [];
  var stateCommand = const StateCommands(
    registry: [],
    history: [],
  );

  StateCommands transform(StateCommands stateCommand, String input) => commands
      .map((commandFactory) => commandFactory(input))
      .firstWhere((command) => command.accept(stateCommand.registry))
      .execute(stateCommand);

  void doMath(String command) {
    stateCommand = transform(stateCommand, command);
    setState(() {
      viewRegistry = stateCommand.registry;
    });
  }

  void _enter() {
    setState(() {
      stateCommand = transform(stateCommand, currentNumberInString);
      viewRegistry = stateCommand.registry;
      currentNumberInString = "";
    });
  }

  void _numPress(String number) {
    currentNumberInString = currentNumberInString + number;
    setState(() {});
  }

  void clearStack() {
    setState(() {
      if (currentNumberInString == "") {
        stateCommand.registry.clear();
      }
      currentNumberInString = "";
      viewRegistry = stateCommand.registry;
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calculator')),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "$viewRegistry"),
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
                onPressed: () => doMath("+"),
                child: const Text("+"),
              ),
              FilledButton(
                onPressed: () => _numPress("7"),
                child: const Text("7"),
              ),
              FilledButton(
                onPressed: () => _numPress("8"),
                child: const Text("8"),
              ),
              FilledButton(
                onPressed: () => _numPress("9"),
                child: const Text("9"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: () => doMath("-"),
                child: const Text("-"),
              ),
              FilledButton(
                onPressed: () => _numPress('4'),
                child: const Text("4"),
              ),
              FilledButton(
                onPressed: () => _numPress('5'),
                child: const Text("5"),
              ),
              FilledButton(
                onPressed: () => _numPress('6'),
                child: const Text("6"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: () => doMath("*"),
                child: const Text("*"),
              ),
              FilledButton(
                onPressed: () => _numPress('1'),
                child: const Text("1"),
              ),
              FilledButton(
                onPressed: () => _numPress('2'),
                child: const Text("2"),
              ),
              FilledButton(
                onPressed: () => _numPress('3'),
                child: const Text("3"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: () => doMath("/"),
                child: const Text("/"),
              ),
              FilledButton(
                onPressed: () => _enter(),
                child: const Text("Enter"),
              ),
              FilledButton(
                onPressed: () => _numPress('0'),
                child: const Text("0"),
              ),
              FilledButton(
                onPressed: () => clearStack(),
                child: const Text("Clear"),
              ),
            ],
          )
        ]));
  }

  void _placeHolder() {}
}

class StateProvider extends InheritedWidget {
  final StateCommands state;
  final String number;

  const StateProvider({
    required this.state,
    required this.number,
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static StateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateProvider>()!;
  }
}
