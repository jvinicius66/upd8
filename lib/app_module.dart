import 'package:dependencies/adapters/http/http.dart';
import 'package:dependencies/dependencies.dart';

///
///
///
class AppModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
        HomeModule(),
        ProfileModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<HttpAdapter>(
          (i) => HttpClient('https://jsonplaceholder.typicode.com/'),
        ),
      ];

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
        ModuleRoute(
          '/profile',
          module: ProfileModule(),
        ),
      ];
}
