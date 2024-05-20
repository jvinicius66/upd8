///
///
///
abstract class UsersException implements Exception {
  ///
  UsersException({
    required this.message,
    this.cause,
    this.data,
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.current;

  /// default error message
  final String message;

  /// optional original error message
  final String? cause;

  /// optional custom data
  final dynamic data;

  /// stack trace
  final StackTrace? stackTrace;
}

///
///
///
class UnknowException extends UsersException {
  ///
  UnknowException({
    required super.message,
    super.stackTrace,
  });
}

///
///
///
class MapperException extends UsersException {
  ///
  MapperException({
    required super.message,
    super.stackTrace,
  });
}
