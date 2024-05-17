import 'package:dependencies/dependencies.dart';

///
///
///
class AppModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
        HomeModule(),
      ];

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
          guards: [HomeGuard()],
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
        ),
      ];
}
