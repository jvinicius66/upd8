import 'package:dependencies/dependencies.dart';
import 'package:dependencies/extensions/extensions.dart';
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
  late final cubit = context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
          bloc: cubit,
          listenWhen: (previous, current) => previous != current,
          listener: (_, state) {
            // switch (state) {
            //   case LoggedOutState():
            //     // Modu
            //     break;
            //   case SuccessState():
            //     _showMessage('Sucesso!!!\nIr para a home');
            //   default:
            // }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (_, state) {
            return switch (state) {
              LoggedState() => _LoggedContent(),
              LoggedOutState() => _LoggedOutContent(),
            };
          }),
    );
  }
}

class _LoggedContent extends Container {
  _LoggedContent()
      : super(
          child: const Text('Logado').addCenter(),
        );
}

class _LoggedOutContent extends Container {
  _LoggedOutContent()
      : super(
          child: const Text('Deslogado').addCenter(),
        );
}
