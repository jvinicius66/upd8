import 'package:dependencies/dependencies.dart';
import 'package:dependencies/extensions/extensions.dart';
import 'package:dependencies/widgets/widgets.dart';
import 'package:flutter/material.dart';

///
///
///
class HomePage extends StatefulWidget {
  ///
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit cubit = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
            bloc: cubit,
            listenWhen: (previous, current) => previous != current,
            listener: (_, state) {
              switch (state) {
                case LoggedOutState():
                  _redirectToLogin();
                  break;
                default:
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (_, state) {
              return switch (state) {
                LoggedState() => _LoggedContent(
                    onLogout: _onLogOut,
                  ).addCenter(),
                LoggedOutState() => _AccessDeniedContent(),
              };
            }),
      ),
    );
  }

  void _redirectToLogin() => Modular.to.pushReplacementNamed('/login/');

  void _onLogOut() => cubit.loggedOut();
}

class _AccessDeniedContent extends Container {
  _AccessDeniedContent()
      : super(
          child: const Text('Deslogado').addCenter(),
        );
}

class _LoggedContent extends Container {
  _LoggedContent({
    required VoidCallback onLogout,
  }) : super(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ButtonWidget(onPressed: onLogout, text: 'Sair'),
                ...List.generate(
                  20,
                  (index) => ListTile(
                    title: Text('Usuário $index'),
                    subtitle: Text('email $index'),
                  ),
                ),
              ],
            ),
          ),
        );
}
