import 'package:dependencies/dependencies.dart';

import '../../domain/failures/failures.dart';
import '../../domain/params/params.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../exceptions/exceptions.dart';

///
///
///
class LoginRepository implements ILoginRepository {
  ///
  LoginRepository(this._datasource);

  final ILoginDatasource _datasource;

  @override
  AsyncResult<bool, LoginFailure> login(LoginParam param) async {
    try {
      final result = await _datasource.login(param);
      return Success(result);
    } on AccessDeniedException catch (_) {
      return Failure(AccessDeniedFailure());
    } on UnknowException catch (e) {
      return Failure(UnknowFailure(message: e.message));
    }
  }
}
