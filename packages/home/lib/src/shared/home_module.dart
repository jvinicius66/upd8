import 'package:dependencies/dependencies.dart';

import '../presenter/presenter.dart';

///
/// Home module
///
class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<HomeCubit>(
          (i) => HomeCubit(),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const HomePage(),
        ),
      ];
}
