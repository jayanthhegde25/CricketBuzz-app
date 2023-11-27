import 'package:flutter/cupertino.dart';

import 'match_api.dart';
import 'package:http/http.dart' as http;

class BaseClient{

  final String baseUrl = MatchApis.baseUrl;
  final Duration timeoutDuration = const Duration(minutes: 1);
  final client = http.Client();

  var headers = {
  'X-RapidAPI-Key': '2037793b75msh89ca555ea657e82p106018jsn6aa05f9cc2f0',
  'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
  };

  Future<http.Response?> getData(String endpoint) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    debugPrint('URL: $url');

    try {
      http.Response response =
      await client.get(url, headers: headers).timeout(timeoutDuration);

      debugPrint('response (${response.statusCode}): ${response.body}');

      if (_isValidResponse(response)) {
        return response;
      } else {
        return null;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
 
  }

  bool _isValidResponse(http.Response response) {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}