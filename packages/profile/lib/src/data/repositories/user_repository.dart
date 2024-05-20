import 'package:dependencies/dependencies.dart';

import '../../domain/entities/entities.dart';
import '../../domain/failures/users_failure.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../exceptions/exceptions.dart';

///
///
///
class UsersRepository implements IUsersRepository {
  ///
  UsersRepository(this._datasource);

  final IUsersDatasource _datasource;

  @override
  AsyncResult<List<User>, UsersFailure> getList() async {
    try {
      final result = await _datasource.getList();
      return Success(result.map((e) => e.toEntity).toList());
    } on UnknowException catch (e) {
      return Failure(UnknowFailure(message: e.message));
    } on MapperException catch (e) {
      return Failure(MapperFailure(message: e.message));
    }
  }
}
