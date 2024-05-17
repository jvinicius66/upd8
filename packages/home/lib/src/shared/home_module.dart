import 'package:dependencies/dependencies.dart';

import '../presenter/presenter.dart';

///
/// Home module
///
class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => BlocProvider(
            create: (_) => HomeCubit(),
            child: const HomePage(),
          ),
        ),
      ];
}
