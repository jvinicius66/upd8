import 'package:dependencies/dependencies.dart';
import 'package:dependencies/extensions/extensions.dart';
import 'package:dependencies/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

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
      appBar: AppBar(
        title: const _Title(),
      ),
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
                    onProfile: _redirectToProfile,
                    onLogout: _onLogOut,
                  ).addCenter(),
                LoggedOutState() => _AccessDeniedContent(),
              };
            }),
      ),
      endDrawer: const HomeDrawer(),
    );
  }

  void _redirectToLogin() => Modular.to.pushReplacementNamed('/login/');

  void _onLogOut() => cubit.loggedOut();

  void _redirectToProfile() => Modular.to.pushNamed('/profile/');
}

class _Title extends Text {
  const _Title() : super('Home');
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
    required VoidCallback onProfile,
  }) : super(
          child: Column(
            children: [
              ButtonWidget(onPressed: () {}, text: 'Editar Perfil'),
              ButtonWidget(onPressed: onProfile, text: 'Visualizar Perfil'),
              ButtonWidget(onPressed: onLogout, text: 'Sair'),
            ],
          ),
        );
}
