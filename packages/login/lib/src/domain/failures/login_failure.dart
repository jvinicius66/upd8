///
///
///
sealed class LoginFailure {
  ///
  LoginFailure({
    required this.message,
  });

  ///
  final String message;
}

///
///
///
class AccessDeniedFailure extends LoginFailure {
  ///
  AccessDeniedFailure() : super(message: 'Acesso negado');
}

///
///
///
class UnknowFailure extends LoginFailure {
  ///
  UnknowFailure({
    required super.message,
  });
}
