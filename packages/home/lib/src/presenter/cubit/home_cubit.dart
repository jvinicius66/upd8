import 'package:dependencies/dependencies.dart';

part 'home_state.dart';

///
///
///
class HomeCubit extends Cubit<HomeState> {
  ///
  HomeCubit() : super(LoggedOutState());

  ///
  void logged() => emit(LoggedState());

  ///
  void loggedOut() => emit(LoggedOutState());
}
