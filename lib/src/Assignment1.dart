import 'dart:io';

import 'Assignment2_adaptions.dart';
import 'commands.dart';

Iterable<String> readLines() sync* {
  while (true) {
    yield stdin.readLineSync()!;
  }
}

/// Transform current state to next by executing the first command that accepts given input
StateCommands transform(State state, String input) => commands
    .map((commandFactory) => commandFactory(input))
    .firstWhere((command) => command.accept(state.registry))
    .execute(state as StateCommands);

void main() {
  // For each line read - apply transform function to get new state for the next iteration.
  readLines().fold(
    State.empty(),
    transform as Function(dynamic previousValue, String element),
  );
}
