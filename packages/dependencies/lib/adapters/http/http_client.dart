import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_adapter.dart';

///
class HttpClient implements HttpAdapter {
  ///
  HttpClient(this._urlBase);

  ///
  final String _urlBase;

  @override
  Future<dynamic> get(String endpoint,
      {Map<String, String>? headers,
      Map<String, dynamic>? query,
      Duration timeout = const Duration(seconds: 30),
      String? apiVersion}) async {
    final response = await http.get(Uri.parse('$_urlBase$endpoint'));
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final responseData = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseData;
    } else {
      throw Exception('Error: ${responseData['message'] ?? 'Unknown error'}');
    }
  }
}
