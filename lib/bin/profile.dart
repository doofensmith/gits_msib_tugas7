import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
      body: ListView(
        children: <Widget>[
          Consumer<AuthProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title: Text(value.loginData!.userDisplayName),
                subtitle: Text(
                  'token : ${value.loginData!.token}',
                ),
              );
            },
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Log out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
