import 'package:dependencies/dependencies.dart';

import '../failures/failures.dart';
import '../params/params.dart';

///
///
///
abstract class ILoginRepository {
  ///
  AsyncResult<bool, LoginFailure> login(LoginParam param);
}
