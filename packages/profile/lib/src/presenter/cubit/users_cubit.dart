import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';

part 'users_state.dart';

///
///
///
class UsersCubit extends Cubit<UsersState> {
  ///
  UsersCubit(
    this._getUsersListUsecase,
  ) : super(LoadingState()) {
    getUsersList();
  }

  final IGetUsersListUsecase _getUsersListUsecase;

  ///
  void getUsersList() async {
    emit(LoadingState());

    final result = await _getUsersListUsecase();

    emit(result.fold(
      (users) => users.isEmpty ? EmptyState() : SuccessState(users: users),
      (failure) => FailureState(message: failure.message),
    ));
  }
}
