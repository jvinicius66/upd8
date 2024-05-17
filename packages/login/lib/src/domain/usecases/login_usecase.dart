import 'package:dependencies/dependencies.dart';

import '../failures/failures.dart';
import '../params/params.dart';
import '../repositories/repositories.dart';

///
/// Login usecase interface
///
abstract class ILoginUsecase {
  /// Method to login
  AsyncResult<bool, LoginFailure> call(LoginParam param);
}

///
/// Login usecase implementation
///
class LoginUsecase implements ILoginUsecase {
  /// Creates [LoginUsecase]
  LoginUsecase(this._repository);

  final ILoginRepository _repository;

  @override
  AsyncResult<bool, LoginFailure> call(LoginParam param) =>
      _repository.login(param);
}
