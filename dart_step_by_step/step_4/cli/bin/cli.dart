/*
 * // Copyright 2025 The Dart and Flutter teams. All rights reserved.
 * // Use of this source code is governed by a BSD-style license that can be
 * // found in the LICENSE file.
 */

import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  var runner = CommandRunner();
  runner.run(arguments);
}
