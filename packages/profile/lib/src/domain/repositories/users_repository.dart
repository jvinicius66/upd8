import 'package:dependencies/dependencies.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';

///
///
///
abstract class IUsersRepository {
  ///
  AsyncResult<List<User>, UsersFailure> getList();
}
