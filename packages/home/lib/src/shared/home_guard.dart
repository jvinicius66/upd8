import 'dart:async';

import 'package:dependencies/dependencies.dart';

///
/// Home guardian
///
class HomeGuard extends RouteGuard {
  /// Creates [HomeGuard]
  HomeGuard() : super(redirectTo: '/login/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final cubit = Modular.get<HomeCubit>();

    return switch (cubit.state) {
      LoggedState() => true,
      LoggedOutState() => false,
    };
  }
}
