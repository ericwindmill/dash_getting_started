/*
 * // Copyright 2025 The Dart and Flutter teams. All rights reserved.
 * // Use of this source code is governed by a BSD-style license that can be
 * // found in the LICENSE file.
 */

import 'command_runner/command_runner.dart';

class HelpCommand extends Command<String?> {
  @override
  final String name = 'help';

  @override
  final String description = 'Print this usage information.';

  @override
  List<String> get aliases => ['h'];

  @override
  String run() {
    final buffer = StringBuffer();
    for (var command in runner.commands) {
      buffer.writeln(command.usage);
    }

    return buffer.toString();
  }
}

class ExitCommand extends Command<String?> {
  @override
  final String name = 'quit';

  @override
  final String description = 'Exit the program';

  @override
  List<String> get aliases => ['q'];

  @override
  String? run() {
    runner.quit();
  }
}
