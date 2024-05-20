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

///
///
///
class MapperFailure extends UsersFailure {
  ///
  MapperFailure({
    required super.message,
  });
}
