import 'package:dependencies/dependencies.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../presenter/presenter.dart';

///
/// Login module
///
class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // datasources
        Bind.factory<ILoginDatasource>(
          (i) => LoginDatasource(),
          export: true,
        ),
        // repositories
        Bind.factory<ILoginRepository>(
          (i) => LoginRepository(i()),
          export: true,
        ),
        // usecases
        Bind.factory<ILoginUsecase>(
          (i) => LoginUsecase(i()),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => BlocProvider(
              create: (_) => LoginCubit(Modular.get<ILoginUsecase>()),
              child: const LoginPage()),
        ),
      ];
}
