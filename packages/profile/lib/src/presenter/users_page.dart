import 'package:dependencies/dependencies.dart';
import 'package:dependencies/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../domain/entities/entities.dart';
import 'cubit/users_cubit.dart';
import 'presenter.dart';

///
///
///
class UsersPage extends StatefulWidget {
  ///
  const UsersPage({
    super.key,
  });

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late final cubit = context.read<UsersCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Request'),
      ),
      body: BlocConsumer<UsersCubit, UsersState>(
          bloc: cubit,
          listenWhen: (previous, current) => previous != current,
          listener: (_, state) {
            switch (state) {
              case FailureState():
                _showMessage(state.message);
                break;
              default:
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (_, state) {
            return switch (state) {
              LoadingState() => _Loading(),
              EmptyState() => _Empty(),
              SuccessState() => _Body(
                  users: state.users,
                ).addPadding(30.edgeHorizontal),
              FailureState(message: final failure) => Text(failure).addCenter(),
            };
          }),
    );
  }

  void _showMessage(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[700],
        ),
      );
}

class _Loading extends Container {
  _Loading()
      : super(
          width: double.maxFinite,
          height: double.maxFinite,
          child: const CircularProgressIndicator().addCenter(),
        );
}

class _Empty extends Container {
  _Empty()
      : super(
          width: double.maxFinite,
          height: double.maxFinite,
          child: const Text('Lista vazia').addCenter(),
        );
}

class _Body extends SizedBox {
  _Body({
    required List<User> users,
  }) : super(
          width: double.maxFinite,
          height: double.maxFinite,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(users[index].userName),
              subtitle: Text(users[index].email),
            ),
          ),
        );
}
