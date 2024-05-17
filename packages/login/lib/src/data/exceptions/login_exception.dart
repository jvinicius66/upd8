///
///
///
abstract class LoginException implements Exception {
  ///
  LoginException({
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
class AccessDeniedException extends LoginException {
  ///
  AccessDeniedException({required super.message});
}

///
///
///
class UnknowException extends LoginException {
  ///
  UnknowException({required super.message});
}
