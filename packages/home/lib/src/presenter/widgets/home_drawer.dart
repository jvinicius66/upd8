import 'package:flutter/material.dart';

///
///
///
class HomeDrawer extends StatelessWidget {
  ///
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.5,
      child: const SafeArea(
        child: Column(
          children: [
            ListTile(title: Text('Editar profile')),
            ListTile(title: Text('Visualizar profile')),
          ],
        ),
      ),
    );
  }
}
