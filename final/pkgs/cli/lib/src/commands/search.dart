/*
 * // Copyright 2025 The Dart and Flutter teams. All rights reserved.
 * // Use of this source code is governed by a BSD-style license that can be
 * // found in the LICENSE file.
 */

import 'dart:async';
import 'dart:io';

import 'package:command_runner/command_runner.dart';
import 'package:wikipedia/wikipedia.dart';

class SearchCommand extends Command<String> {
  SearchCommand() {
    addFlag(
      'im-feeling-lucky',
      help:
          'If true, prints the summary of the top article that the search returns.',
    );
  }

  @override
  String get description => 'Search for Wikipedia articles.';

  @override
  String get name => 'search';

  @override
  String get valueHelp => 'STRING';

  @override
  String get help =>
      'Prints a list of links to Wikipedia articles that match the given term.';

  @override
  FutureOr<String> run(ArgResults args) async {
    if (requiresArgument &&
        (args.commandArg == null || args.commandArg!.isEmpty)) {
      return 'Please include a search term';
    }

    final buffer = StringBuffer('Search results:');
    try {
      final SearchResults results = await search(args.commandArg!);

      if (args.flag('im-feeling-lucky')) {
        final title = results.results.first.title;
        final Summary article = await getArticleSummaryByTitle(title);
        buffer.writeln('Lucky you!');
        buffer.writeln(article.titles.normalized.titleText);
        if (article.description != null) {
          buffer.writeln(article.description);
        }
        buffer.writeln(article.extract);
        buffer.writeln();
        buffer.writeln('All results:');
      }

      for (var result in results.results) {
        buffer.writeln('${result.title} - ${result.url}');
      }
      return buffer.toString();
    } on HttpException catch (e) {
      // todo log
      rethrow;
    } on FormatException catch (e) {
      // todo log
      rethrow;
    }
  }
}
