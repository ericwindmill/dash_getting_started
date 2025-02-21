import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:wikipedia_cli/src/console/console.dart';
import 'package:wikipedia_cli/src/model/command.dart';

/// [InteractiveCommandRunner] establishes a protocol for the
/// app to communicate with a continuously with an I/O source.
/// [T] represents the output of [InteractiveCommandRunner],
/// and enforces proper return type of [Command.run].
///
/// ```dart
/// main_flow.dart() {
///   var app = InteractiveCommandRunner<String>()
///     ..addCommand(MyCommand())
///     ..addCommand(AnotherCommand());
///   app.run();
/// }
/// ```
///
/// When [run] is called, the app will start waiting for input from stdin.
/// On new input from stdin, the input will be parsed into a [Command],
/// and [Command.run] will be called.
/// The return value of [Command.run] is written to stdout.
///
/// Input can also be added via the [onInput] method.
class InteractiveCommandRunner<T> {
  final Map<String, Command<T>> _commands = <String, Command<T>>{};

  UnmodifiableSetView<Command<T>> get commands =>
      UnmodifiableSetView<Command<T>>(<Command<T>>{..._commands.values});

  Future<void> run() async {
    await onInput('help');
    await for (final List<int> data in stdin) {
      // When control is released back to main_flow.dart input,
      // toggle rawMode off
      console.rawMode = false;
      final String input = String.fromCharCodes(data).trim();
      await onInput(input);
    }
  }

  Future<void> onInput(String input) async {
    final List<String> allArgs = input.split(' ');
    final Command<T>? cmd = parse(allArgs.first);

    if (cmd == null) {
      await console.write('Invalid input $input');
      return;
    }

    // ignore: prefer_foreach
    await for (final T message in cmd.run(args: allArgs.sublist(1))) {
      await console.write(message.toString());
    }
  }

  void addCommand(Command<T> command) {
    for (final String name in <String>[command.name, ...command.aliases]) {
      if (_commands.containsKey(name)) {
        throw ArgumentError('[addCommand] - Input $name already exists.');
      } else {
        _commands[name] = command;
        command.runner = this;
      }
    }
  }

  Command<T>? parse(String input) {
    if (_commands.containsKey(input)) {
      return _commands[input]!;
    }
    return null;
  }

  void quit([int code = 0]) => _quit(code);

  void _quit(int code) {
    exit(code);
  }
}
