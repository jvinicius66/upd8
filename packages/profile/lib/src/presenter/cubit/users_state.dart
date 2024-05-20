part of 'users_cubit.dart';

///
///
///
sealed class UsersState {}

///
///
///
class LoadingState extends UsersState {}

///
///
///
class EmptyState extends UsersState {}

///
///
///
class SuccessState extends UsersState {
  ///
  SuccessState({required this.users});

  ///
  final List<User> users;
}

///
///
///
class FailureState extends UsersState {
  ///
  FailureState({required this.message});

  ///
  final String message;
}
