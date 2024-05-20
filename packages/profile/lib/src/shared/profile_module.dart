import 'package:dependencies/adapters/http/http.dart';
import 'package:dependencies/dependencies.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../presenter/presenter.dart';

///
/// Profile module
///
class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // datasources
        Bind.factory<IUsersDatasource>(
          (i) => UsersDatasource(Modular.get<HttpAdapter>()),
          export: true,
        ),
        // repositories
        Bind.factory<IUsersRepository>(
          (i) => UsersRepository(i()),
          export: true,
        ),
        // usecases
        Bind.factory<IGetUsersListUsecase>(
          (i) => GetUsersListUsecase(i()),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => BlocProvider(
              create: (_) => UsersCubit(Modular.get<IGetUsersListUsecase>()),
              child: const UsersPage()),
        ),
      ];
}
