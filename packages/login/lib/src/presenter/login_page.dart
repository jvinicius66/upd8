import 'package:dependencies/dependencies.dart';
import 'package:dependencies/extensions/extensions.dart';
import 'package:dependencies/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'cubit/login_cubit.dart';

///
///
///
class LoginPage extends StatefulWidget {
  ///
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final loginFormKey = GlobalKey<FormState>();
  late final userController = TextEditingController();
  late final passController = TextEditingController();
  late final cubit = context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _Title(),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
          bloc: cubit,
          listenWhen: (previous, current) => previous != current,
          listener: (_, state) {
            switch (state) {
              case FailureState():
                _showMessage(state.message);
                break;
              case SuccessState():
                _loginAndRedirectToHome();
              default:
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (_, state) {
            return switch (state) {
              LoadingState() => _Loading(),
              _ => _Body(
                  formKey: loginFormKey,
                  userController: userController,
                  passController: passController,
                  onLogin: _onLogin,
                ).addPadding(30.edgeHorizontal),
            };
          }),
    );
  }

  void _onLogin() => cubit.login(
        user: userController.text,
        password: passController.text,
      );

  void _showMessage(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[700],
        ),
      );

  void _loginAndRedirectToHome() {
    Modular.get<HomeCubit>().logged();
    Modular.to.pushReplacementNamed('/home/');
  }
}

class _Title extends Text {
  const _Title() : super('Login');
}

class _Loading extends Container {
  _Loading()
      : super(
          width: double.maxFinite,
          height: double.maxFinite,
          child: const CircularProgressIndicator().addCenter(),
        );
}

class _Body extends SingleChildScrollView {
  _Body({
    required GlobalKey<FormState> formKey,
    required TextEditingController userController,
    required TextEditingController passController,
    required VoidCallback onLogin,
  }) : super(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                30.spaceVertical,
                _LoginInput(
                  hintText: 'Nome do usuário ou e-mail (test)',
                  controller: userController,
                ),
                10.spaceVertical,
                _LoginInput(
                  hintText: 'Senha (test)',
                  controller: passController,
                ),
                30.spaceVertical,
                ButtonWidget(
                  onPressed: onLogin,
                  text: 'ENTRAR',
                ),
              ],
            ),
          ),
        );
}

class _LoginInput extends TextFormField {
  _LoginInput({
    required TextEditingController controller,
    String? hintText,
    String? helperText,
  }) : super(
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 3,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: hintText,
            helperText: helperText,
            counterText: '',
          ),
        );
}
