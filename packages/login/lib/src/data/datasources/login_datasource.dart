import '../../domain/params/params.dart';
import '../exceptions/exceptions.dart';

///
///
///
abstract class ILoginDatasource {
  ///
  Future<bool> login(LoginParam param);
}

///
///
///
class LoginDatasource implements ILoginDatasource {
  @override
  Future<bool> login(LoginParam param) async {
    await Future.delayed(const Duration(seconds: 3));

    if (param.user != 'test' || param.password != 'test') {
      throw AccessDeniedException(message: 'Access Denied');
    }

    return true;
  }
}
