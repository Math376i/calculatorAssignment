import 'dart:io';

import 'stack.dart';

abstract class Command {
  bool accept(InputStack<num> stack, String input);
  execute(InputStack<num> stack, String input);
}

class Enter extends Command {
  accept(stack, input) {
    return num.tryParse(input) != null;
  }

  execute(stack, input) {
    final value = num.tryParse(input);
    if (value != null) stack.push(value);
  }
}

class Clear extends Command {
  accept(stack, input) => input == 'clear';
  execute(stack, input) {
    stack.clear();
  }
}

class Print extends Command {
  accept(stack, input) => input == 'print';
  execute(stack, input) {
    print(stack);
  }
}

class Exit extends Command {
  accept(stack, input) => input == 'exit' || input == 'quit';
  execute(stack, input) {
    exit(1);
  }
}

abstract class Operator extends Command {
  String get name;
  apply(num val1, num val2);

  accept(stack, input) => stack.length > 1 && input == name;
  execute(stack, input) {
    final val1 = stack.pop();
    final val2 = stack.pop();
    if (val1 == null || val2 == null) return null;
    stack.push(apply(val1, val2));
    print(stack.peek());
  }
}

class Add extends Operator {
  get name => '+';
  apply(val1, val2) => val1 + val2;
}

class Subtract extends Operator {
  get name => '-';
  apply(val1, val2) => val1 - val2;
}

class Multiply extends Operator {
  get name => '*';
  apply(val1, val2) => val1 * val2;
}

class Noop extends Command {
  accept(stack, input) => true;
  execute(stack, input) {}
}
