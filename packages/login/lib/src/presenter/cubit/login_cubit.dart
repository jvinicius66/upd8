import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';

part 'login_state.dart';

///
///
///
class LoginCubit extends Cubit<LoginState> {
  ///
  LoginCubit(
    this._loginUsecase,
  ) : super(IdleState());

  final ILoginUsecase _loginUsecase;

  ///
  void login({
    required final String user,
    required final String password,
  }) async {
    emit(LoadingState());

    final result = await _loginUsecase(
      LoginParam(
        user: user,
        password: password,
      ),
    );

    emit(result.fold(
      (success) => SuccessState(),
      (failure) => FailureState(message: failure.message),
    ));
  }
}
