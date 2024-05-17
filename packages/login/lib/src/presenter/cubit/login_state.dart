part of 'login_cubit.dart';

///
///
///
sealed class LoginState {}

///
///
///
class IdleState extends LoginState {}

////
///
///
class LoadingState extends LoginState {}

///
///
///
class SuccessState extends LoginState {}

///
///
///
class FailureState extends LoginState {
  ///
  FailureState({required this.message});

  ///
  final String message;
}
