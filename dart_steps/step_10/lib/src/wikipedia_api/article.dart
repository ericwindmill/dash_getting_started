/*
 * // Copyright 2025 The Dart and Flutter teams. All rights reserved.
 * // Use of this source code is governed by a BSD-style license that can be
 * // found in the LICENSE file.
 */

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/summary.dart';

// ADDED step_8
Future<Summary> getArticleSummary(String articleTitle) async {
  final http.Client client = http.Client();
  // ADDED step_10 (try/catch)
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/summary/$articleTitle',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
      // ADDED step_10 (rest of file)
    } else {
      // Indicates a runtime error, but not a bug in the code.
      throw HttpException(
        '[WikipediaDart.getArticleSummary] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
    // A FormatException is thrown when the response body isn't valid JSON.
    // This would come from the Wikipedia API. It should be indicated to the
    // end user, but it shouldn't terminate the program.
  } on FormatException {
    // TODO: log exception
    rethrow;
  } finally {
    client.close();
  }
}
