import 'package:dependencies/dependencies.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

///
/// Get users list usecase interface
///
abstract class IGetUsersListUsecase {
  /// Method to get list
  AsyncResult<List<User>, UsersFailure> call();
}

///
/// Get users list usecase implementation
///
class GetUsersListUsecase implements IGetUsersListUsecase {
  /// Creates [GetUsersListUsecase]
  GetUsersListUsecase(this._repository);

  final IUsersRepository _repository;

  @override
  AsyncResult<List<User>, UsersFailure> call() => _repository.getList();
}
