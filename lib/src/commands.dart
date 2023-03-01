import 'dart:io';

/// "stack" for numbers entered and result of operations
typedef Registry = List<num>;

/// Function to undo a command
typedef UndoFunction = Registry Function(Registry);

/// Application state is a stack of numbers (registry) and stack of undo functions (history)
class StateCommands {
  final Registry registry;
  final List<UndoFunction> history;
  const StateCommands({required this.registry, required this.history});
  StateCommands.empty() : this(registry: [], history: []);
  copy({required Registry registry, required UndoFunction undo}) =>
      StateCommands(registry: registry, history: [...history, undo]);
}

/// Factory functions for commands
const commands = [
  Enter.new,
  Print.new,
  Exit.new,
  Clear.new,
  Add.new,
  Subtract.new,
  Multiply.new,
  Divide.new,
  Undo.new,
  Help.new,
  Invalid.new
];

/// "interface" for all commands
abstract class Command {
  final String input;
  const Command(String this.input);

  /// Names/aliases for the command
  List<String> get names => [];

  /// Description of command
  String get description;

  /// Whether the input is valid for the command on given registry
  bool accept(List<num> registry) => names.contains(input);

  /// Executing the command returns the next application state
  StateCommands execute(StateCommands stateCommands);
}

class Enter extends Command {
  final names = ['<number>'];
  final description = 'Insert/push a number to the registry';
  final num? number;
  Enter(input)
      : number = num.tryParse(input),
        super(input);
  accept(registry) => number != null;
  execute(stateCommands) => stateCommands.copy(
        registry: [...stateCommands.registry, number!],
        undo: (registry) => [...registry.take(registry.length - 1)],
      );
}

class Clear extends Command {
  Clear(super.input);
  final names = ['clear', 'c'];
  final description = 'Clear the registry';
  execute(state) => state.copy(registry: [], undo: (_) => state.registry);
}

class Print extends Command {
  final names = ['print', 'p', ''];
  final description = 'Print registry';
  Print(super.input);
  execute(state) {
    print(state.registry);
    return state;
  }
}

class Exit extends Command {
  Exit(super.input);
  final names = ['exit', 'quit', 'q'];
  final description = 'Exit process';
  execute(state) => exit(1);
}

class Undo extends Command {
  final names = ['undo', 'u'];
  final description =
      'Undo previously executed command using the undo function in history stack';
  Undo(super.input);
  execute(state) => StateCommands(
        registry: state.history.last(state.registry),
        history: [...state.history.take(state.history.length - 1)],
      );
}

class Help extends Command {
  final names = ['help', 'h', '?'];
  final description = 'Print help message';
  Help(super.input);
  execute(StateCommands state) {
    print('Available commands are:\n');
    commands.map((factory) => factory('')).forEach((command) {
      print(command.names.join(', '));
      print('\t\t${command.description}\n');
    });
    return state;
  }
}

/// Base class for arithmetic operation consuming two operants from registry
abstract class Operator extends Command {
  Operator(super.input);
  apply(num val1, num val2);
  accept(registry) => super.accept(registry) && registry.length > 1;
  execute(state) {
    final arg1 = state.registry.elementAt(state.registry.length - 2);
    final arg2 = state.registry.last;
    final result = apply(arg1, arg2);
    print(result);
    return state.copy(
      registry: [...state.registry.take(state.registry.length - 2), result],
      undo: (registry) => [...registry.take(registry.length - 1), arg1, arg2],
    );
  }
}

class Add extends Operator {
  final names = ['+', 'add'];
  final description = 'Addition';
  Add(super.input);
  apply(val1, val2) => val1 + val2;
}

class Subtract extends Operator {
  final names = ['-', 'sub', 'subtract'];
  final description = 'Subtraction';
  Subtract(super.input);
  apply(val1, val2) => val1 - val2;
}

class Multiply extends Operator {
  final names = ['*', 'mul', 'multiply'];
  final description = 'Multiplication';
  Multiply(super.input);
  apply(val1, val2) => val1 * val2;
}

class Divide extends Operator {
  final names = ['/', 'div', 'divide'];
  final description = 'Division';
  Divide(super.input);
  apply(val1, val2) => val1 / val2;
}

/// Fallback command for when no other accepts the input
class Invalid extends Command {
  final description = '';
  Invalid(super.input);
  accept(List<num> registry) => true;
  execute(StateCommands state) {
    print('Invalid command "$input"');
    return state;
  }
}
