import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

/// App Widget
class AppWidget extends StatefulWidget {
  /// App Widget constructor
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    return MaterialApp.router(
      theme: ThemeData(useMaterial3: false),
      title: 'UPD8',
      routeInformationParser: Modular.routeInformationParser,
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
