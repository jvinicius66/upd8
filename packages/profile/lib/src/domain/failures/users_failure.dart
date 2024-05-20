///
///
///
sealed class UsersFailure {
  ///
  UsersFailure({
    required this.message,
  });

  ///
  final String message;
}

///
///
///
class UnknowFailure extends UsersFailure {
  ///
  UnknowFailure({
    required super.message,
  });
}
