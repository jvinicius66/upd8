///
///
///
abstract class HttpAdapter {
  ///
  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Duration timeout = const Duration(seconds: 30),
    String? apiVersion,
  });
}
